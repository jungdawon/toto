<%@ page import="java.util.*,java.text.*,java.net.*" contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<%@ page import="java.security.MessageDigest" %>
<%
/**********************************************************************************************
*
* ���ϸ� : AGS_pay_result.jsp
* �ۼ����� : 2009/1/16
*
* ���ϰ�������� ó���մϴ�.
*
* Copyright AEGIS ENTERPRISE.Co.,Ltd. All rights reserved.
*
**********************************************************************************************/

//������
String AuthTy 		= request.getParameter("AuthTy");												//��������
String SubTy 		= request.getParameter("SubTy");												//�����������
String rStoreId 	= request.getParameter("rStoreId");												//��üID
String rOrdNo 		= request.getParameter("rOrdNo");												//�ֹ���ȣ
String rAmt 		= request.getParameter("rAmt");													//�ŷ��ݾ�
String rProdNm 		= request.getParameter("rProdNm");	//��ǰ��
String rOrdNm 		= request.getParameter("rOrdNm");	//�ֹ��ڸ�

String AGS_HASHDATA = request.getParameter("AGS_HASHDATA");	// �ֹ� �ؽ���

//������Ű���(�ſ�ī��,�ڵ���,�Ϲݰ������)�� ���
String rSuccYn 		= request.getParameter("rSuccYn");												//��������
String rApprTm 		= request.getParameter("rApprTm");												//���νð�
String rResMsg 		= request.getParameter("rResMsg");	//���л���

//�ſ�ī�����
String rBusiCd 		= request.getParameter("rBusiCd");				//�����ڵ�
String rApprNo 		= request.getParameter("rApprNo");				//���ι�ȣ
String rCardCd 		= request.getParameter("rCardCd");				//ī����ڵ�

//�ſ�ī��(�Ƚ�,�Ϲ�)
String rMembNo 		= request.getParameter("rMembNo");												//��������ȣ
String rAquiCd 		= request.getParameter("rAquiCd");												//���Ի��ڵ�
String rBillNo 		= request.getParameter("rBillNo");												//��ǥ��ȣ
String rCardNm 		= request.getParameter("rCardNm");	//ī����
String rAquiNm 		= request.getParameter("rAquiNm");	//���Ի��

//�ſ�ī��(ISP)
String rDealNo 		= request.getParameter("rDealNo");				//�ŷ�������ȣ

//������ü
String ICHE_AMOUNT 	= request.getParameter("ICHE_AMOUNT");															//��ü�ݾ�
String ICHE_OUTBANKNAME = request.getParameter("ICHE_OUTBANKNAME");		//��ü���������
String ICHE_OUTBANKMASTER = request.getParameter("ICHE_OUTBANKMASTER");	//��ü���¼�����

//�ڵ���
String rHP_TID 		= request.getParameter("rHP_TID");				//�ڵ�������TID
String rHP_DATE 		= request.getParameter("rHP_DATE");			//�ڵ���������¥
String rHP_HANDPHONE 	= request.getParameter("rHP_HANDPHONE");	//�ڵ��������ڵ�����ȣ
String rHP_COMPANY 	= request.getParameter("rHP_COMPANY");			//�ڵ���������Ż��(SKT,KTF,LGT)

//ARS
String rARS_PHONE = request.getParameter("rARS_PHONE");		//ARS������ȭ��ȣ

//�������
String rVirNo 		= request.getParameter("rVirNo");				//������¹�ȣ
String VIRTUAL_CENTERCD = request.getParameter("VIRTUAL_CENTERCD" );//�Աݰ�����������ڵ�

String mTId 		= request.getParameter("mTId" );				

//����������ũ��
String ES_SENDNO	= request.getParameter("ES_SENDNO" );			//����������ũ��(������ȣ)

//*******************************************************************************
//* MD5 ���� ������ ���󿩺� Ȯ��
//* ������ AGS_HASHDATA ���� ���� �� rAGS_HASHDATA�� ��ġ ���� Ȯ��
//* ���� : �������̵�(StoreId) + �ֹ���ȣ(OrdNo) + �����ݾ�(Amt)
//*******************************************************************************

int rAmt_hash = Integer.parseInt(rAmt);

StringBuffer sb = new StringBuffer();
sb.append(rStoreId);
sb.append(rOrdNo);
sb.append(rAmt_hash);

byte[] bNoti = sb.toString().getBytes();
MessageDigest md = MessageDigest.getInstance("MD5");
byte[] digest = md.digest(bNoti);

StringBuffer strBuf = new StringBuffer();
for (int i=0 ; i < digest.length ; i++) {
    int c = digest[i] & 0xff;
    if (c <= 15){
        strBuf.append("0");
    }
    strBuf.append(Integer.toHexString(c));
}

String rAGS_HASHDATA = strBuf.toString();
String errResMsg ="";
if (!(rAGS_HASHDATA.equals(AGS_HASHDATA))) errResMsg = "����ݾ� ���� �߻�. Ȯ�� �ٶ�.";

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>�ô�����Ʈ</title>
<style type="text/css">
<!--
body { font-family:"����"; font-size:9pt; color:#000000; font-weight:normal; letter-spacing:0pt; line-height:180%; }
td { font-family:"����"; font-size:9pt; color:#000000; font-weight:normal; letter-spacing:0pt; line-height:180%; }
.clsright { padding-right:10px; text-align:right}
.clsleft { padding-left:10px; text-align:left }
-->
</style>
<script language=javascript>//"����ó����"�˾�â �ݴ� �κ� (AGS_pay.html���� submit ���� ��� �˾� â�� �ݴ� ��ũ��Ʈ)
<!--
var openwin = window.open("AGS_progress.html","popup","width=300,height=160");
openwin.close();
-->
</script>
<script language=javascript>
<!--
/*************************************************************************
* �� ������ ����� ���� �ڹٽ�ũ��Ʈ
*		
*	������ ����� [ī�����]�ÿ��� ����Ͻ� �� �ֽ��ϴ�.
*  
*   �ش��� �����ǿ� ���ؼ� ������ ����� �����մϴ�.
*     ���� ���Ŀ��� �Ʒ��� �ּҸ� �˾����� ��� ���� ��ȸ �� ����Ͻñ� �ٶ��ϴ�.
*	  �� �˾��� ����������ȸ ������ �ּ� : 
*	     	 http://www.allthegate.com/support/card_search.html
*
*************************************************************************/
function show_receipt() 
{
	if("<%=rSuccYn%>"== "y" && "<%=AuthTy%>" =="card")
	{
		var send_dt = appr_tm.value;

		url="http://allthegate.com/customer/receiptLast3.jsp"
		url=url+"?sRetailer_id="+sRetailer_id.value;   
		url=url+"&approve="+approve.value;
		url=url+"&send_no="+send_no.value;
		url=url+"&send_dt="+send_dt.substring(0,8);
		
		window.open(url, "window","toolbar=no,location=no,directories=no,status=,menubar=no,scrollbars=no,resizable=no,width=420,height=700,top=0,left=150");
	}
	else
	{
		alert("�ش��ϴ� ���������� �����ϴ�");
	}
}
-->
</script>
</head>
<body topmargin=0 leftmargin=0 rightmargin=0 bottommargin=0>
<table border=0 width=100% height=100% cellpadding=0 cellspacing=0>
	<tr>
		<td align=center>
		<table width=400 border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td><hr></td>
			</tr>
			<tr>
				<td class=clsleft>���� ���</td>
			</tr>
			<tr>
				<td><hr></td>
			</tr>
			<tr>
				<td>
				<table width=400 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td class=clsright width=150>�������� : </td>
						<td class=clsleft width=250>
							<%

							if(AuthTy.equals("card"))
							{
								if(SubTy.equals("isp"))
								{
									out.println( "�ſ�ī�����-��������(ISP)");
								}	
								else if(SubTy.equals("visa3d"))
								{
									out.println( "�ſ�ī�����-�Ƚ�Ŭ��");
								}
								else if(SubTy.equals("normal"))
								{
									out.println( "�ſ�ī�����-�Ϲݰ���");
								}
								
							}
							else if(AuthTy.equals("iche"))
							{
								out.println( "������ü");
							}
							else if(AuthTy.equals("hp"))
							{
								out.println( "�ڵ�������");
							}
							else if(AuthTy.equals("ars"))
							{
								out.println( "ARS����");
							}
							else if(AuthTy.equals("virtual"))
							{
								out.println( "������°���");
							}
							%>
						</td>
					</tr>
					<tr>
						<td class=clsright>�̸� : </td>
						<td class=clsleft><%=rOrdNm%></td>
					</tr>
					<tr>
						<td class=clsright>�����ݾ� : </td>
						<td class=clsleft><%=rAmt%>��</td>
					</tr>
					<tr>
						<td class=clsright>ó���޼��� : </td>
						<td class=clsleft><%=rResMsg%></td>
					</tr>
<%				if(AuthTy.equals("card") || AuthTy.equals("virtual") ) { %>
					<tr>
						<td class=clsright>���� �ð� : </td>
						<td class=clsleft><%=rApprTm%></td>
					</tr>
<%				}%>
					
<%				
				if(AuthTy.equals("card") && ( SubTy.equals("visa3d") || SubTy.equals("normal") ) && rSuccYn.equals("y") ) {%>
					<tr>
						<td class=clsright>ī���� : </td>
						<td class=clsleft><%=rCardNm%></td>
					</tr>
<%				}
				if(AuthTy.equals("iche") ) {%>
					<tr>
						<td class=clsright>��ü��������� : </td>
						<td class=clsleft><%=ICHE_OUTBANKNAME%><%=getCenter_cd(ICHE_OUTBANKNAME)%></td>
					</tr>
					<tr>
						<td class=clsright>��ü�ݾ� : </td>
						<td class=clsleft><%=ICHE_AMOUNT%></td>
					</tr>
					<tr>
						<td class=clsright>��ü���¼����� : </td>
						<td class=clsleft><%=ICHE_OUTBANKMASTER%></td>
					</tr>
					<tr>
						<td class=clsright>����������ũ��(SEND_NO) : </td>
						<td class=clsleft><%=ES_SENDNO%></td>
					</tr>
<%				}
				if(AuthTy.equals("hp") ) {%>
					<tr>
						<td class=clsright>�ڵ�������TID : </td>
						<td class=clsleft><%=rHP_TID%></td>
					</tr>
					<tr>
						<td class=clsright>�ڵ���������¥ : </td>
						<td class=clsleft><%=rHP_DATE%></td>
					</tr>
					<tr>
						<td class=clsright>�ڵ��������ڵ�����ȣ : </td>
						<td class=clsleft><%=rHP_HANDPHONE%></td>
					</tr>
					<tr>
						<td class=clsright>�ڵ���������Ż�� : </td>
						<td class=clsleft><%=rHP_COMPANY%></td>
					</tr>
<%				}
				if(AuthTy.equals("ars") ) {%>
					<tr>
						<td class=clsright>ARS����TID : </td>
						<td class=clsleft><%=rHP_TID%></td>
					</tr>
					<tr>
						<td class=clsright>ARS������¥ : </td>
						<td class=clsleft><%=rHP_DATE%></td>
					</tr>
					<tr>
						<td class=clsright>ARS������ȭ��ȣ : </td>
						<td class=clsleft><%=rARS_PHONE%></td>
					</tr>
					<tr>
						<td class=clsright>ARS������Ż�� : </td>
						<td class=clsleft><%=rHP_COMPANY%></td>
					</tr>
<%				}
				if(AuthTy.equals("virtual") ) {%>
					<tr>
						<td class=clsright>�Աݰ��¹�ȣ : </td>
						<td class=clsleft><%=rVirNo%></td>
					</tr>
                    <tr><!-- �����ڵ�(20) : �츮���� -->
						<td class=clsright>�Ա����� : </td>
						<td class=clsleft><%=getCenter_cd(VIRTUAL_CENTERCD)%></td>
					</tr>
                    <tr>
					<!--�ô�����Ʈ�� ��ϵ� ���������� ǥ��-------->
						<td class=clsright>�����ָ� : </td>
						<td class=clsleft>(��)������ȿ��</td>
					</tr>
					<tr>
						<td class=clsright>����������ũ��(SEND_NO) : </td>
						<td class=clsleft><%=ES_SENDNO%></td>
					</tr>
<%				}
				if(AuthTy.equals("card") ) {%>
					<tr>
						<td class=clsright>������ :</td>
						<!--��������������ؼ������ִ°�-------------------->
						<input type=hidden name=sRetailer_id value="<%=rStoreId%>" /><!--�������̵�-->
						<input type=hidden name=approve value="<%=rApprNo%>" /><!---���ι�ȣ-->
						<input type=hidden name=send_no value="<%=rDealNo%>" /><!--�ŷ�������ȣ-->
						<input type=hidden name=appr_tm value="<%=rApprTm%>" /><!--���νð�-->
						<!--��������������ؼ������ִ°�-------------------->
						<td class=clsleft><input type="button" value="������" onclick="javascript:show_receipt();"/></td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td align=center colspan=2>ī�� �̿������ ����ó�� <font color=red>������������������(��)</font>�� ǥ��˴ϴ�.</td>
					</tr>
<%				}	%>
					<tr>
						<td colspan="2"><%=errResMsg %></td>
					</tr>
					
				</table>
				</td>
			</tr>
			<tr>
				<td><hr></hr></td>
			</tr>
			<tr>
				<td class=clsleft>Copyright AEGIS ENTERPISE.Co.,Ltd. All rights reserved.</td> 
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
<%!
	public String getCenter_cd(String cd){
		String center_cd = "��������";
		
		if(cd.equals("39")) center_cd = "�泲����";
		if(cd.equals("34")) center_cd = "��������";
		if(cd.equals("04")) center_cd = "��������";
		if(cd.equals("11")) center_cd = "�����߾�ȸ";
		if(cd.equals("31")) center_cd = "�뱸����";
		if(cd.equals("32")) center_cd = "�λ�����";
		if(cd.equals("02")) center_cd = "�������";
		if(cd.equals("45")) center_cd = "�������ݰ�";
		if(cd.equals("07")) center_cd = "�����߾�ȸ";
		if(cd.equals("48")) center_cd = "�ſ���������";
		if(cd.equals("26")) center_cd = "(��)��������";
		if(cd.equals("05")) center_cd = "��ȯ����";
		if(cd.equals("20")) center_cd = "�츮����";
		if(cd.equals("71")) center_cd = "��ü��";
		if(cd.equals("37")) center_cd = "��������";
		if(cd.equals("23")) center_cd = "��������";
		if(cd.equals("35")) center_cd = "��������";
		if(cd.equals("21")) center_cd = "(��)��������";
		if(cd.equals("03")) center_cd = "�߼ұ������";
		if(cd.equals("81")) center_cd = "�ϳ�����";
		if(cd.equals("88")) center_cd = "��������";
		if(cd.equals("27")) center_cd = "�ѹ�����";
		if(cd.equals("99")) center_cd = "��������";

		return center_cd;
	}
%>