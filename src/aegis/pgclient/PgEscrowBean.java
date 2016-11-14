/*
javac -classpath /usr/local/resin/lib/resin.jar PgClientBean.java
*/
 
package aegis.pgclient;

import java.io.*;
import java.util.*;
import java.net.*;

import javax.servlet.jsp.JspWriter;

/******************************************************************************
	pgŬ���̾�Ʈ ��� ���
******************************************************************************/
public class PgEscrowBean
{
	private Socket		socket;
	private DataInputStream   	in;
  	private DataOutputStream  	out;
	
	private String IPAddr;
	private int	   Port;
	
	private String ErrMsg;
	private int    ErrCd;

	private String SplitData[]     = new String[14];	// ���� ������ ����
	private String ESCROW_SplitData[]  = new String[5];

	
	/****************************************************************
		������( �����ּ�, ��Ʈ )
	****************************************************************/
	public PgEscrowBean(String IPAddr, int Port)
	{
		this.IPAddr = IPAddr;
		this.Port   = Port;
	}

	/****************************************************************
		���ڿ��� �ѱ��� �ִ��� üũ
	****************************************************************/
	public boolean checkHangul( String OrgData )
	{
		char oneChar;

		for( int i = 0; i < OrgData.length(); i++ )
		{
			oneChar = OrgData.charAt( i );
			
			if( oneChar >= '\uAC00' && oneChar <= '\uD7A3' )
			{
				return true;
			}
		}

		return false;
	}

	/****************************************************************
		��Ʈ���� �������� üũ
	****************************************************************/
	public boolean checkNumber( String OrgData )
	{
		long iNum;
		
		try 
		{
			iNum = Long.parseLong( OrgData );
		}
		catch( NumberFormatException nfe )
		{
			return false;
		}

		return true;
	}

	/****************************************************************
		����,null�� üũ
	****************************************************************/
	public boolean checkNull( String OrgData )
	{
		if( OrgData == null || OrgData.equals( "null" ) || OrgData.equals( "NULL" ) || OrgData.equals( "" ) )
		{
			return true;
		}

		return false;
	}
	
	public String null2Space( String OrgData )
	{

		if( checkNull( OrgData ) ) return "";
		
		return OrgData.trim();

	}

	/****************************************************************
		���â�� ���� �ɼǿ����� ������ �̵�
	****************************************************************/
	public void alertMsg( JspWriter out, String ErrMsg, String Go )
	{
		try
		{
			out.println( "<script language='javascript'>" );
			out.println( "alert( '" + ErrMsg + "' );" );

			if( Go != null )
			{
				out.println( "history.go( " + Go + " );" );
			}

			out.println( "</script>" );
		}
		catch( IOException ie )
		{
			System.out.println( ie.toString() );
		}

	}

	public void alertGoBack( JspWriter out, String ErrMsg )
	{
		alertMsg( out, ErrMsg, "-1" );
	}
	
	/****************************************************************
		������PG���� ����ϴ� ī�� ������ Encrypt�޼ҵ�
	****************************************************************/
	private String encryptAegis( String OrgData ) throws NumberFormatException 
	{
		int    iDataLen, iOneEnc;
		String ReverseData = "", EncData = "";

		if( OrgData == null || OrgData.equals("") )
			return "";
		

		//ReverseData = new String();
		iDataLen = OrgData.length();

		for( int i = 0; i < iDataLen ; i++ )
		{
			ReverseData += OrgData.substring( ( iDataLen - 1 ) - i , ( iDataLen  ) - i );
		}

		//System.out.println( "Reverse Data : " + ReverseData );

		try
		{
			//EncData = new String();
			iDataLen = ReverseData.length();

			for( int i = 0; i < iDataLen; i++ )
			{
				iOneEnc = ( Integer.parseInt( ReverseData.substring( i, i + 1 ) ) + i * 77 ) % 10;
				EncData += Integer.toString( iOneEnc );
			}
		}
		catch ( NumberFormatException nfe )
		{
			throw new NumberFormatException( "������(" + OrgData + ") Encrypt ����" );			
			//throw NumberFormatException( nfe.toString() );
		}

		return EncData;
	}
	
	/****************************************************************
		���� ������ Delimeter�� �����Ѵ�.
	****************************************************************/
	private String[] splitRecvMsg( String RecvMsg, int RegexNum, String Regex)
	{
		String SplitData[];
		int    iRegexNum   = 0;
		int    iRegexPosOld = 0;
		int    iRegexPosNew = 0;

		//
		//	���ڿ��� Regex���� �������� ����
		//	Regex ������ ī��Ʈ�ؼ� RegexNum�� ���� ������ �޼��� ���� ������ ���� false ����
		//
	
		SplitData = new String[RegexNum];

		while( ( iRegexPosNew = RecvMsg.indexOf( Regex, iRegexPosOld ) ) != -1 )
		{
			SplitData[iRegexNum] = RecvMsg.substring( iRegexPosOld, iRegexPosNew );

			if( checkNull( SplitData[iRegexNum] ) )
			{
				SplitData[iRegexNum] = "";
			}
			if( checkNumber( SplitData[iRegexNum] ) )
			{
				if( Long.parseLong( SplitData[iRegexNum] ) == 0 )
				{
					SplitData[iRegexNum] = "";
				}
			}

			//System.out.println( "SplitData " + Integer.toString(iRegexNum) + 
			//					  " : " + SplitData[iRegexNum] );

			iRegexPosOld = iRegexPosNew + 1;		
			iRegexNum++;
		}

		if( iRegexNum != RegexNum ) return null;
		
		return SplitData;
	}

	/****************************************************************
		����ũ�ο�û ������ �����ϰ� ��ȣȭ ���� ���μ����� �����͸� �����ϰ� ������ �����Ѵ�.

		< ����ũ�ο�û ������ ���� >
		 �ŷ��ڵ�(10)	| ��������(2)	| ��üID(20)	| ȸ��ID(17)	| �ֹε�Ϲ�ȣ(13) | 
		 ��������(8)	| �ŷ�������ȣ(6)	| 
		< ����ũ������ ������ ���� >
		 �ŷ��ڵ�(10)	|��������(2)	| ��üID(20)	| ����ڵ�(2)	| ��� �޽���(100)	| 
	****************************************************************/
	public boolean EscrowRequest(String EncType, String TrCode, String PayKind,
		String RetailerId, String IdNo, String DealTime, String SendNo )
	{
		String DataMsg = "";
		int    DataLen = 0;
		String SendMsg = "";
		String RecvMsg = "";
		
		try
		{

			// ����ũ�� ��û ���� ����.
			DataMsg = EncType + TrCode + "|" + PayKind + "|" + RetailerId + "|" + IdNo + "|" + DealTime + "|" + SendNo + "|";

			SendMsg = formatMsg( Integer.toString( DataMsg.getBytes().length ), 6, '9' ) + DataMsg;
			
			// ������ ����|����.
			RecvMsg = ProcessRequest( IPAddr, Port, SendMsg );

			// ������ �Ľ�.
			ESCROW_SplitData = splitRecvMsg( RecvMsg, 5, "|" );

		}
		catch( IOException ie )
		{
			ErrMsg = "��ſ����� ���� ���ο�û ����";
			ErrCd  = -1;

			System.out.println( ie.toString() );
			System.out.println( "���ο�û ����" );

			return false;
		}
		catch( NumberFormatException nfe )
		{
			ErrMsg = "�����Ϳ����� ���� ���ο�û ����";
			ErrCd  = -2;

			System.out.println( nfe.toString() );
			System.out.println( "���ο�û ����" );

			return false;
		}
		catch( Exception e )
		{
			ErrMsg = "������ ���� ���ο�û ����";
			ErrCd  = -99;

			System.out.println( e.toString() );
			System.out.println( "���ο�û ����" );

			return false;
		}
		
		return true;
	}
	
	/****************************************************************
		��ȣȭ �������� ���� ��û/��� ������ �����ϰ� ����� �����ؼ� ���������� �����Ѵ�..
	****************************************************************/
	private String ProcessRequest(String addr, int port, String SendMsg) 
		throws IOException, NumberFormatException
	{
		int    iRecvLen = 0;
		String RecvLen = "", RecvMsg = "";
		

		// ��ȣȭ ���� ���� ������ ����/����
		this.connectSocket(addr, port);	
		
		System.out.println( "���� �ּ� : "+ addr + " ��Ʈ : " + port );
		

		// Server�� ����/��ҿ�û ����Ÿ�� ������.
		this.writeMsg(SendMsg.getBytes());	
		
		try
		{
			RecvLen = new String( readMsg(6) );
			
			iRecvLen = Integer.parseInt( RecvLen );

			RecvMsg = new String( readMsg( iRecvLen ) );


			// ���� ������ üũ
			System.out.println( "���ŵ����� ���� : " + RecvLen );
			System.out.println( "���ŵ����� : "   + RecvMsg );

		}
		catch( NumberFormatException nfe )
		{
			throw new NumberFormatException( "���� �������� ��ȯ ����!!" );
		}
		finally
		{
			closeSocket();
		}


		closeSocket();

		return RecvMsg;
	}

	/****************************************************************
		���� ����
	****************************************************************/
	private void connectSocket(String addr, int port) throws IOException 
	{
		try
		{

			socket = new Socket(addr, port);
			
			in     = new DataInputStream(socket.getInputStream());
			
			out    = new DataOutputStream(socket.getOutputStream());

		}
		catch( IOException e )
		{
			throw new IOException("Cannot connect the server : " + addr + ":" + port + "!!");
		}
	}

	/****************************************************************
		������ ����
	****************************************************************/
	private void writeMsg(byte[] msg) throws IOException
	{
		try
		{
			out.write(msg);
			out.flush();
		}
		catch( IOException e )
		{
			throw new IOException("Cannot write to socket!!");
		}
	}

	/****************************************************************
		������ ����
	****************************************************************/
	private byte[] readMsg(int size) throws IOException
	{
		try
		{
			byte[] msg = new byte[size];
			in.read(msg);
			return msg;
		}
		catch( IOException e )
		{
			throw new IOException("Cannot read from socket!!");
		}
	}

	/****************************************************************
		���� Close
	****************************************************************/
	private void closeSocket() throws IOException
	{
		try
		{
			socket.close();
		}
		catch( IOException e )
		{
			throw new IOException("Cannot close socket!!");
		}
	}

	/****************************************************************
		���ڿ��� ������ ���̷� ������ ���ڷ� ä���� ������ �Ѵ�.
	****************************************************************/
	private String formatMsg(String str, int len, char ctype)
	{
		String formattedstr = new String();
		byte[] buff;
		int filllen = 0;

		buff = str.getBytes();

		filllen = len - buff.length;
		formattedstr = "";
		if(ctype == '9')
		{
			// ���ڿ��� ���
			for(int i = 0; i<filllen;i++)
			{
					formattedstr += "0";
			}

			formattedstr = formattedstr + str;
		}
		else 
		{
			// ���ڿ��� ���
			for(int i = 0; i<filllen;i++)
			{
					formattedstr += " ";
			}

			formattedstr = str + formattedstr;
		}

		return formattedstr;
	}

	private String setTrim(String str, int len)
	{
		byte[] subbytes;
		String tmpStr;
		
		subbytes = new byte[len];
		
		System.arraycopy(str.getBytes(), 0, subbytes, 0, len);
		
		tmpStr = new String(subbytes);
		
		if(tmpStr.length() == 0) 
		{
			subbytes = new byte[len-1];
			System.arraycopy(str.getBytes(), 0, subbytes, 0, len-1);
			tmpStr = new String(subbytes);
		}

		return tmpStr;
	}

	/****************************************************************
		������ ���� ������� ����� �����͸� ����
	****************************************************************/
	public String[] getEscrowRecvData( )
	{
		return ESCROW_SplitData;
	}

	public String getErrMsg()
	{
		return ErrMsg;
	}

	public int getErrCd()
	{
		return ErrCd;
	}
}
