<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%@include file="/agspay/payMenu.jsp" %>
<br />
<br />
<br />
<script>
	function checkIt(){
		var price = document.getElementById("cancelprice");
		var cash = document.getElementById("cash");
		var id = document.getElementById("id");
		
		var a = price.value;
		var b = cash.value;

		if(price.value == '' || price.value == null || price.value == 0){
			alert("��� �ݾ��� ��Ȯ�� �Է��ϼ���.");
			return false;
		}
		if(a > b){
			alert("��ġ�� �ܾ��� �����մϴ�.");
			return false;
		}
		

	}
</script>
<style>
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;
}
</style>



<div id="text">
<table  align="center" width="700">
	<tr align="left">
		<td>
			<img src="/toto/member/image/title1.gif" />&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/toto/member/image/title2.gif" />
		</td>
	</tr>
</table>

<br />
<br />

<table  align="center" width="700" margin="20px" >
	<tr bgcolor="#E7E7E7" >
		<td>
			<span style="color:#005b7f;">�� ���� ������ ������·�</span> ����� �����մϴ�.	
		<td>
	<tr>
	<tr bgcolor="#E7E7E7" >
		<td>
			�� ��ġ�� ��� �ÿ��� �������� �����ᰡ �ΰ��Ǹ� ��ġ�� ���� ����� ���� �ٸ��� �ΰ��˴ϴ�.<br />
			(�ǽð� ������ü : ��ݱݾ��� 1.8%, �������Ա� : �����Ǻ��� 250��)<br />
			��, ���߱ݰ� ������ �� ���ſ����� ���� ȯ�ұ��� ������ ���� ��� �����մϴ�.
		</td>
	</tr>
</table>	

<br />
<form name="infopro" action="/toto/member/payCancelPro.to" method="post" onSubmit="return checkIt()">
<table border="1" bordercolor="#CEFBC9" align="center" width="700" height="50" >
	<input type="hidden" name="id" value="${mdto.id}" />
	<input type="hidden" name="bank" value="${mdto.bank}" />
	<input type="hidden" id="cash" value="${mdto.cash}" />
	<tr align="left">
		<td width="300">
			<img src="/toto/member/image/money1.gif" />&nbsp;&nbsp;&nbsp;
			<img src="/toto/member/image/money2.gif" />&nbsp;&nbsp; | &nbsp;&nbsp;
			<font color="#FF8224" >
				<fmt:formatNumber value="${mdto.cash}" type="number" />��
			</font>
			
		</td>
		<td width="400" ><input type="text" id="cancelprice" name="cancelprice" />��&nbsp;&nbsp;&nbsp;
		<input type="image" src="/toto/member/image/money.gif" border="0">
		</td>
	</tr>
</table>
</form>
<br />
<table  align="center" width="700">
	<tr align="left">
		<td>
			-��ݽ�û�� �Ͻø� ��û�� ������(���� ���࿵����)�� ȸ������ ���·� �Ա��ص帳�ϴ�.<br /> 
			 &nbsp;(��,�Ͽ��� �� �������� ���� �޹��� ��ġ�� ����� ���� ������, ���࿵���Ͽ� ��ݰ����մϴ�.)<br />
			-��ݽ�û ��Ҵ� ��ݿ����� ���� 08�ñ��� �����մϴ�.
		</td>
	</tr>
</table>
</div>