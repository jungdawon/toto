<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/agspay/payMenu.jsp" %>

<br />
<br />
<br />
<%@ page import="java.security.MessageDigest" %>
<%
	/* �ؽ� ��ȣȭ ����( StoreId + OrdNo + Amt)
	 * StoreId          : �������̵�		form.StoreId.value
	 * OrdNo          : �ֹ���ȣ			form.OrdNo.value
	 * Amt      		 : �ݾ�					form.Amt.value
	 * MD5 �ؽ������� ��ȣȭ ������ ����
	 */
	 
	 /*
	 String StoreId = request.getParameter("StoreId");
	 String OrdNo = request.getParameter("OrdNo");
	 String Amt = request.getParameter("Amt");
	*/
	 String StoreId = "aegis";
	 String OrdNo = "1000000001";
	 String Amt = "1000";
	 
	 StringBuffer sb = new StringBuffer();
	 sb.append(StoreId);
	 sb.append(OrdNo);
	 sb.append(Amt);
	 
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

	 String AGS_HASHDATA = strBuf.toString();
 
%>

<html>
<head>
<title>�ô�����Ʈ</title>
<style type="text/css">
<!--
body { font-family:"����"; font-size:9pt; color:#333333; font-weight:normal; letter-spacing:0pt; line-height:180%; }
td { font-family:"����"; font-size:9pt; color:#333333; font-weight:normal; letter-spacing:0pt; line-height:180%; }
.clsright { padding-right:10px; text-align:right; }
.clsleft { padding-left:10px; text-align:left; }
-->
</style>
<script language=javascript src="http://www.allthegate.com/plugin/AGSWallet.js"></script>
<!-- �� UTF8 ��� �������� ������ ���۽� �Ʒ� ����� js ������ ����� ��!! -->
<!-- script language=javascript src="http://www.allthegate.com/plugin/AGSWallet_utf8.js"></script -->
<!-- Euc-kr �� �ƴ� �ٸ� charset �� �̿��� ��쿡�� AGS_pay_ing(����ó��������) ����� 
	[ AGS_pay.html �� ���� �Ѱܹ��� �������Ķ���� ] ����ο��� �Ķ���� ������ euc-kr��
	���ڵ� ��ȯ�� ���ֽñ� �ٶ��ϴ�.
<!-- �� SSL ������ �̿��� ��� �Ʒ� ����� js ������ ����� ��!! -->
<!-- script language=javascript src="https://www.allthegate.com/plugin/AGSWallet_ssl.js"></script -->
<script language=javascript>
<!--
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// �ô�����Ʈ �÷����� ��ġ�� Ȯ���մϴ�.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

StartSmartUpdate();  

function Pay(form){
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// MakePayMessage() �� ȣ��Ǹ� �ô�����Ʈ �÷������� ȭ�鿡 ��Ÿ���� Hidden �ʵ�
	// �� ���ϰ����� ä������ �˴ϴ�.
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if(form.Flag.value == "enable"){
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// �Էµ� ����Ÿ�� ��ȿ���� �˻��մϴ�.
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		if(Check_Common(form) == true){
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// �ô�����Ʈ �÷����� ��ġ�� �ùٸ��� �Ǿ����� Ȯ���մϴ�.
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			if(document.AGSPay == null || document.AGSPay.object == null){
				alert("�÷����� ��ġ �� �ٽ� �õ� �Ͻʽÿ�.");
			}else{
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// �ô�����Ʈ �÷����� �������� �������� �����ϱ� JavaScript �ڵ带 ����ϰ� �ֽ��ϴ�.
				// ���������� �°� JavaScript �ڵ带 �����Ͽ� ����Ͻʽÿ�.
				//
				// [1] �Ϲ�/������ ��������
				// [2] �Ϲݰ����� �Һΰ�����
				// [3] �����ڰ����� �Һΰ����� ����
				// [4] ��������
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// [1] �Ϲ�/������ �������θ� �����մϴ�.
				//
				// �Һ��Ǹ��� ��� �����ڰ� ���ڼ����Ḧ �δ��ϴ� ���� �⺻�Դϴ�. �׷���,
				// ������ �ô�����Ʈ���� ���� ����� ���ؼ� �Һ����ڸ� ���������� �δ��� �� �ֽ��ϴ�.
				// �̰�� �����ڴ� ������ �Һΰŷ��� �����մϴ�.
				//
				// ����)
				// 	(1) �Ϲݰ����� ����� ���
				// 	form.DeviId.value = "9000400001";
				//
				// 	(2) �����ڰ����� ����� ���
				// 	form.DeviId.value = "9000400002";
				//
				// 	(3) ���� ���� �ݾ��� 100,000�� �̸��� ��� �Ϲ��Һη� 100,000�� �̻��� ��� �������Һη� ����� ���
				// 	if(parseInt(form.Amt.value) < 100000)
				//		form.DeviId.value = "9000400001";
				// 	else
				//		form.DeviId.value = "9000400002";
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				form.DeviId.value = "9000400001";
				
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// [2] �Ϲ� �ҺαⰣ�� �����մϴ�.
				// 
				// �Ϲ� �ҺαⰣ�� 2 ~ 12�������� �����մϴ�.
				// 0:�Ͻú�, 2:2����, 3:3����, ... , 12:12����
				// 
				// ����)
				// 	(1) �ҺαⰣ�� �ϽúҸ� �����ϵ��� ����� ���
				// 	form.QuotaInf.value = "0";
				//
				// 	(2) �ҺαⰣ�� �Ͻú� ~ 12�������� ����� ���
				//		form.QuotaInf.value = "0:3:4:5:6:7:8:9:10:11:12";
				//
				// 	(3) �����ݾ��� ���������ȿ� ���� ��쿡�� �Һΰ� �����ϰ� �� ���
				// 	if((parseInt(form.Amt.value) >= 100000) || (parseInt(form.Amt.value) <= 200000))
				// 		form.QuotaInf.value = "0:2:3:4:5:6:7:8:9:10:11:12";
				// 	else
				// 		form.QuotaInf.value = "0";
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				//�����ݾ��� 5���� �̸����� �Һΰ����� ��û�Ұ�� ��������
				if(parseInt(form.Amt.value) < 50000)
					form.QuotaInf.value = "0";
				else
					form.QuotaInf.value = "0:2:3:4:5:6:7:8:9:10:11:12";
				
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// [3] ������ �ҺαⰣ�� �����մϴ�.
				// (�Ϲݰ����� ��쿡�� �� ������ ������� �ʽ��ϴ�.)
				// 
				// ������ �ҺαⰣ�� 2 ~ 12�������� �����ϸ�, 
				// �ô�����Ʈ���� ������ �Һ� ������������ �����ؾ� �մϴ�.
				// 
				// 100:BC
				// 200:����
				// 201:NH
				// 300:��ȯ
				// 310:�ϳ�SK
				// 400:�Ｚ
				// 500:����
				// 800:����
				// 900:�Ե�
				// 
				// ����)
				// 	(1) ��� �Һΰŷ��� �����ڷ� �ϰ� ���������� ALL�� ����
				// 	form.NointInf.value = "ALL";
				//
				// 	(2) ����ī�� Ư���������� �����ڸ� �ϰ� ������� ����(2:3:4:5:6����)
				// 	form.NointInf.value = "200-2:3:4:5:6";
				//
				// 	(3) ��ȯī�� Ư���������� �����ڸ� �ϰ� ������� ����(2:3:4:5:6����)
				// 	form.NointInf.value = "300-2:3:4:5:6";
				//
				// 	(4) ����,��ȯī�� Ư���������� �����ڸ� �ϰ� ������� ����(2:3:4:5:6����)
				// 	form.NointInf.value = "200-2:3:4:5:6,300-2:3:4:5:6";
				//	
				//	(5) ������ �ҺαⰣ ������ ���� ���� ��쿡�� NONE�� ����
				//	form.NointInf.value = "NONE";
				//
				//	(6) ��ī��� Ư���������� �����ڸ� �ϰ� �������(2:3:6����)
				//	form.NointInf.value = "100-2:3:6,200-2:3:6,201-2:3:6,300-2:3:6,310-2:3:6,400-2:3:6,500-2:3:6,800-2:3:6,900-2:3:6";
				//
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////

				if(form.DeviId.value == "9000400002")
					form.NointInf.value = "ALL";
				   
				if(MakePayMessage(form) == true){
					Disable_Flag(form);
					
					var openwin = window.open("AGS_progress.html","popup","width=300,height=160"); //"����ó����"�̶�� �˾�â���� �κ�
					
					form.submit();
				}else{
					alert("���ҿ� �����Ͽ����ϴ�.");// ��ҽ� �̵������� �����κ�
				}
			}
		}
	}
}

function Enable_Flag(form){
        form.Flag.value = "enable"
}

function Disable_Flag(form){
        form.Flag.value = "disable"
}

function Check_Common(form){
	if(form.StoreId.value == ""){
		alert("�������̵� �Է��Ͻʽÿ�.");
		return false;
	}
	else if(form.StoreNm.value == ""){
		alert("�������� �Է��Ͻʽÿ�.");
		return false;
	}
	else if(form.OrdNo.value == ""){
		alert("�ֹ���ȣ�� �Է��Ͻʽÿ�.");
		return false;
	}
	else if(form.ProdNm.value == ""){
		alert("��ǰ���� �Է��Ͻʽÿ�.");
		return false;
	}
	else if(form.Amt.value == ""){
		alert("�ݾ��� �Է��Ͻʽÿ�.");
		return false;
	}
	else if(form.MallUrl.value == ""){
		alert("����URL�� �Է��Ͻʽÿ�.");
		return false;
	}
	return true;
}

function Display(form){
	if(form.Job.value == "onlycard" || form.TempJob.value == "onlycard"){
		document.all.card_hp.style.display= "";
		document.all.card.style.display= "";
		document.all.hp.style.display= "none";
		document.all.virtual.style.display= "none";
	}else if(form.Job.value == "onlyhp" || form.TempJob.value == "onlyhp"){
		document.all.card_hp.style.display= "";
		document.all.card.style.display= "none";
		document.all.hp.style.display= "";
		document.all.virtual.style.display= "none";
	}else if(form.Job.value == "onlyvirtual" || form.TempJob.value == "onlyvirtual" ){
		document.all.card_hp.style.display= "none";
		document.all.card.style.display= "";
		document.all.hp.style.display= "none";
		document.all.virtual.style.display= "";
	}else if(form.Job.value == "onlyiche" || form.TempJob.value == "onlyiche"  ){
		document.all.card_hp.style.display= "none";
		document.all.card.style.display= "none";
		document.all.hp.style.display= "none";
		document.all.virtual.style.display= "none";
	}else{
		document.all.card_hp.style.display= "";
		document.all.card.style.display= "";
		document.all.hp.style.display= "";
		document.all.virtual.style.display= "";
	}
}
function chk(){
	var Amt = document.getElementById("Amt");
	if(Amt.value < 10000 && Amt.value != ''){
		alert("1���� �̻� ���Ű����մϴ�.");
		Amt.value = '';
		return false;
	}
}
-->
</script>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
</head>
<!-- ����) onload �̺�Ʈ���� �Ʒ��� ���� javascript �Լ��� ȣ������ ���ʽÿ�. -->
<!-- onload="javascript:Enable_Flag(frmAGS_pay);Pay(frmAGS_pay);" -->
<body topmargin=0 leftmargin=0 rightmargin=0 bottommargin=0 onload="javascript:Enable_Flag(frmAGS_pay);">

<div id="text" >
<form name=frmAGS_pay method=post action=AGS_pay_ing.to>
<table border=0 width=100% height=100% cellpadding=0 cellspacing=0>
		<input type=hidden style=width:100px name=StoreId maxlength=20 value="aegis"><!-- �������̵� -->
		<input type=hidden style=width:100px name=OrdNo maxlength=40 value="1000000001"><!-- �ֹ���ȣ -->
		<input type=hidden style=width:100px name=OrdNm maxlength=40 value="${my.name}"><!--  -->
		<input type=hidden style=width:100px name=OrdPhone maxlength=21 value="02-111-1111"><!-- �ֹ��ڿ���ó -->
		<input type=hidden style=width:300px name=OrdAddr maxlength=100 value="����� ������ û�㵿"><!-- �ֹ����ּ� -->
		<input type=hidden style=width:100px name=RcpNm maxlength=40 value="��浿"><!-- �����ڸ� -->
		<input type=hidden style=width:100px name=RcpPhone maxlength=21 value="02-111-1111"><!-- �����ڿ���ó -->
		<input type=hidden style=width:300px name=DlvAddr maxlength=100 value="����� ������ û�㵿"><!-- ������ּ� -->
		<input type=hidden style=width:300px name=Remark maxlength=350 value="���Ŀ� ��ۿ��"><!-- ��Ÿ�䱸���� -->
		<input type=hidden style=width:300px name=CardSelect value=""></td><!-- ī��缱�� -->
		<input type=hidden style=width:300px name=StoreNm value="ToTo"><!-- ������ -->
		<input type=hidden style=width:300px name=ProdNm maxlength=300 value="���� ����"><!-- ��ǰ�� -->
		<input type=hidden style=width:300px name=MallUrl value="http://www.allthegate.com"><!-- ����URL -->
		<input type=hidden style=width:300px name=UserEmail maxlength=50 value="test@test.com"><!-- �ֹ����̸��� -->
		<input type=hidden style=width:400px name=ags_logoimg_url maxlength=200 value="http://www.allthegate.com/hyosung/images/aegis_logo.gif"><!-- �����ΰ��̹��� URL -->
		<!-- ������ 1�������� 5�� �̳��̸�, ������;��ǰ��;�����ݾ�;�����Ⱓ; ������ �Է��� �ּž� �մϴ�. -->
		<!-- �Է� ��)��ü��;�ǸŻ�ǰ;���ݾ�;�����Ⱓ; -->
		<input type=hidden style=width:300px name=SubjectData value="��ü��;�ǸŻ�ǰ;���ݾ�;2012.09.01 ~ 2012.09.30;"><!-- ����â ���� -->
		<!--<td width=170 class=clsleft>��)��ü��;�ǸŻ�ǰ;���ݾ�;�����Ⱓ;</td> -->
		<input type=hidden style=width:100px name=UserId maxlength=20 value="${sessionScope.memId}"><!-- ȸ��ID -->
		<input type=hidden style=width:100px name=HP_ID maxlength=10 value=""><!-- CP���̵� -->
		<input type=hidden style=width:100px name=HP_PWD maxlength=10 value=""><!-- CP��й�ȣ -->
		<input type=hidden style=width:100px name=HP_SUBID maxlength=10 value=""><!-- SUB_CP���̵� -->
		<input type=hidden style=width:100px name=ProdCode maxlength=10 value=""><!-- ��ǰ�ڵ� -->
		<input type=hidden style=width:300px name=MallPage value="/mall/AGS_VirAcctResult.jsp"><!-- �뺸������ -->
		<input type=hidden style=width:300px name=VIRTUAL_DEPODT value=""><!-- ��������Ա��� -->
	<tr>
		<td align=center>
		<table width=650 border=0 cellpadding=0 cellspacing=0>
			<tr><td>&nbsp;</td></tr>
			<tr><td><hr></td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/1.gif"/>
				<img border="0" src="/toto/agspay/image/2.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/3.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/4.gif"/>
			</td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/5.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td class=clsleft><b>���� ������</b></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class=clsleft>
				1) 1�������� ������ �����մϴ�. (�Ա��ѵ�: 1ȸ 100����)<br />
				2) �ǽð� ������ü(���������� ����)���� �����Ϸ��� ������������ �ʿ��ϸ�, ������������ �ŷ� ���࿡�� <br />
				3) ���ͳݹ�ŷ ��û �� �߱޹����� �� �ֽ��ϴ�. <br />
				4) ���������� '�̴Ͻý�' �Ǵ� '�ѱ����̹�����'�� �̿��մϴ�. <br />
				5) �������� ������� ��Ʈ�ǿ��� �δ��մϴ�. <br />
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td><hr></td></tr>
			<tr>
				<td>
				<table width=650 border=0 cellpadding=0 cellspacing=0>

					<tr>
						<td width=170 class=clsleft><img src="/toto/agspay/image/step1.gif" /></td>
						<td width=300>
						<!-- ������ü,�ڵ��������� ������� �ʴ� ������ ���ҹ���� �� �ſ�ī��(����)���� �����Ͻñ� �ٶ��ϴ�. -->
						<!-- �ſ�ī�常 ����ϵ��� ���� <input type=hidden name=Job value="onlycard"> -->
						<!-- ������ü�� ����ϵ��� ���� <input type=hidden name=Job value="onlyiche"> -->
						<!-- �ڵ��������� ����ϵ��� ���� <input type=hidden name=Job value="onlyhp"> -->
						<select name=Job style=width:150px onchange="javascript:Display(frmAGS_pay);">
							<option value="�ſ�ī��">�ſ�ī��
							<option value="������ü">������ü
							<option value="�������">�������
							<option value="�ڵ�������">�ڵ�������
							<option value="ARS">ARS
						</select>
						</td>
						<td width=180></td>
					</tr>
						
					<tr>
						<td class=clsleft><img src="/toto/agspay/image/step2.gif" /></td>
						<td><input type=text style=width:100px id=Amt name=Amt maxlength=12 value="1000" onBlur="chk();"><img src="/toto/agspay/image/text_won.gif" /></td>
					</tr>
				</table>
			<tr><td><hr></td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/6.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td align=center>
				<a href="javascript:Pay(frmAGS_pay);"><img border="0" src="/toto/agspay/image/7.gif"/></a>
				<!--
				<a href="javascript:Pay(frmAGS_pay);"><img src="button.gif" border="0"></a>
				-->
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
		</table>
		</td>
	</tr>
</table>



<!-- ��ũ��Ʈ �� �÷����ο��� ���� �����ϴ� Hidden �ʵ�  !!������ �Ͻðų� �������� ���ʽÿ�-->
<!-- �� ���� ���� ��� ���� -->
<input type=hidden name=Flag value="">				<!-- ��ũ��Ʈ������뱸���÷��� -->
<input type=hidden name=AuthTy value="">			<!-- �������� -->
<input type=hidden name=SubTy value="">				<!-- ����������� -->
<input type="hidden" name="AGS_HASHDATA" value="<%=AGS_HASHDATA%>">		<!-- ���� �ؽ� ���� -->

<!-- �ſ�ī�� ���� ��� ���� -->
<input type=hidden name=DeviId value="">			<!-- (�ſ�ī�����)		�ܸ�����̵� -->
<input type=hidden name=QuotaInf value="0">			<!-- (�ſ�ī�����)		�Ϲ��Һΰ����������� -->
<input type=hidden name=NointInf value="NONE">		<!-- (�ſ�ī�����)		�������Һΰ����������� -->
<input type=hidden name=AuthYn value="">			<!-- (�ſ�ī�����)		�������� -->
<input type=hidden name=Instmt value="">			<!-- (�ſ�ī�����)		�Һΰ����� -->
<input type=hidden name=partial_mm value="">		<!-- (ISP���)			�Ϲ��ҺαⰣ -->
<input type=hidden name=noIntMonth value="">		<!-- (ISP���)			�������ҺαⰣ -->
<input type=hidden name=KVP_RESERVED1 value="">		<!-- (ISP���)			RESERVED1 -->
<input type=hidden name=KVP_RESERVED2 value="">		<!-- (ISP���)			RESERVED2 -->
<input type=hidden name=KVP_RESERVED3 value="">		<!-- (ISP���)			RESERVED3 -->
<input type=hidden name=KVP_CURRENCY value="">		<!-- (ISP���)			��ȭ�ڵ� -->
<input type=hidden name=KVP_CARDCODE value="">		<!-- (ISP���)			ī����ڵ� -->
<input type=hidden name=KVP_SESSIONKEY value="">	<!-- (ISP���)			��ȣȭ�ڵ� -->
<input type=hidden name=KVP_ENCDATA value="">		<!-- (ISP���)			��ȣȭ�ڵ� -->
<input type=hidden name=KVP_CONAME value="">		<!-- (ISP���)			ī��� -->
<input type=hidden name=KVP_NOINT value="">			<!-- (ISP���)			������/�Ϲݿ���(������=1, �Ϲ�=0) -->
<input type=hidden name=KVP_QUOTA value="">			<!-- (ISP���)			�Һΰ��� -->
<input type=hidden name=CardNo value="">			<!-- (�Ƚ�Ŭ��,�Ϲݻ��)	ī���ȣ -->
<input type=hidden name=MPI_CAVV value="">			<!-- (�Ƚ�Ŭ��,�Ϲݻ��)	��ȣȭ�ڵ� -->
<input type=hidden name=MPI_ECI value="">			<!-- (�Ƚ�Ŭ��,�Ϲݻ��)	��ȣȭ�ڵ� -->
<input type=hidden name=MPI_MD64 value="">			<!-- (�Ƚ�Ŭ��,�Ϲݻ��)	��ȣȭ�ڵ� -->
<input type=hidden name=ExpMon value="">			<!-- (�Ϲݻ��)			��ȿ�Ⱓ(��) -->
<input type=hidden name=ExpYear value="">			<!-- (�Ϲݻ��)			��ȿ�Ⱓ(��) -->
<input type=hidden name=Passwd value="">			<!-- (�Ϲݻ��)			��й�ȣ -->
<input type=hidden name=SocId value="">				<!-- (�Ϲݻ��)			�ֹε�Ϲ�ȣ/����ڵ�Ϲ�ȣ -->

<!-- ������ü ���� ��� ���� -->
<input type=hidden name=ICHE_OUTBANKNAME value="">	<!-- ��ü��������� -->
<input type=hidden name=ICHE_OUTACCTNO value="">	<!-- ��ü���¿������ֹι�ȣ -->
<input type=hidden name=ICHE_OUTBANKMASTER value=""><!-- ��ü���¿����� -->
<input type=hidden name=ICHE_AMOUNT value="">		<!-- ��ü�ݾ� -->

<!-- �ڵ��� ���� ��� ���� -->
<input type=hidden name=HP_SERVERINFO value="">		<!-- �������� -->
<input type=hidden name=HP_HANDPHONE value="">		<!-- �ڵ�����ȣ -->
<input type=hidden name=HP_COMPANY value="">		<!-- ��Ż��(SKT,KTF,LGT) -->
<input type=hidden name=HP_IDEN value="">			<!-- �����û�� -->
<input type=hidden name=HP_IPADDR value="">			<!-- ���������� -->

<!-- ������� ���� ��� ���� -->
<input type=hidden name=ZuminCode value="">			<!-- ��������Ա����ֹι�ȣ -->
<input type=hidden name=VIRTUAL_CENTERCD value="">	<!-- ������������ڵ� -->
<input type=hidden name=VIRTUAL_NO value="">		<!-- ������¹�ȣ -->

<!-- ARS ���� ��� ���� -->
<input type=hidden name=ARS_PHONE value="">			<!-- ARS��ȣ -->
<input type=hidden name=ARS_NAME value="">			<!-- ��ȭ�����ڸ� -->

<input type=hidden name=mTId value="">				

<!-- ����ũ�� ���� ��� ���� -->
<input type=hidden name=ES_SENDNO value="">			<!-- ����ũ��������ȣ -->

<!-- ������ü(����) ���� ��� ���� -->
<input type=hidden name=ICHE_SOCKETYN value="">		<!-- ������ü(����) ��� ���� -->
<input type=hidden name=ICHE_POSMTID value="">		<!-- ������ü(����) �̿����ֹ���ȣ -->
<input type=hidden name=ICHE_FNBCMTID value="">		<!-- ������ü(����) FNBC�ŷ���ȣ -->
<input type=hidden name=ICHE_APTRTS value="">		<!-- ������ü(����) ��ü �ð� -->
<input type=hidden name=ICHE_REMARK1 value="">		<!-- ������ü(����) ��Ÿ����1 -->
<input type=hidden name=ICHE_REMARK2 value="">		<!-- ������ü(����) ��Ÿ����2 -->
<input type=hidden name=ICHE_ECWYN value="">		<!-- ������ü(����) ����ũ�ο��� -->
<input type=hidden name=ICHE_ECWID value="">		<!-- ������ü(����) ����ũ��ID -->
<input type=hidden name=ICHE_ECWAMT1 value="">		<!-- ������ü(����) ����ũ�ΰ����ݾ�1 -->
<input type=hidden name=ICHE_ECWAMT2 value="">		<!-- ������ü(����) ����ũ�ΰ����ݾ�2 -->
<input type=hidden name=ICHE_CASHYN value="">		<!-- ������ü(����) ���ݿ��������࿩�� -->
<input type=hidden name=ICHE_CASHGUBUN_CD value="">	<!-- ������ü(����) ���ݿ��������� -->
<input type=hidden name=ICHE_CASHID_NO value="">	<!-- ������ü(����) ���ݿ������ź�Ȯ�ι�ȣ -->

<!-- ������ü-�ڷ���ŷ(����) ���� ��� ���� -->
<input type=hidden name=ICHEARS_SOCKETYN value="">	<!-- �ڷ���ŷ������ü(����) ��� ���� -->
<input type=hidden name=ICHEARS_ADMNO value="">		<!-- �ڷ���ŷ������ü ���ι�ȣ -->
<input type=hidden name=ICHEARS_POSMTID value="">	<!-- �ڷ���ŷ������ü �̿����ֹ���ȣ -->
<input type=hidden name=ICHEARS_CENTERCD value="">	<!-- �ڷ���ŷ������ü �����ڵ� -->
<input type=hidden name=ICHEARS_HPNO value="">		<!-- �ڷ���ŷ������ü �޴�����ȣ -->

<!-- ��ũ��Ʈ �� �÷����ο��� ���� �����ϴ� Hidden �ʵ�  !!������ �Ͻðų� �������� ���ʽÿ�-->

</form>
</div>
</body>
</html>   