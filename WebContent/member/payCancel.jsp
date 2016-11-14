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
			alert("출금 금액을 정확히 입력하세요.");
			return false;
		}
		if(a > b){
			alert("예치금 잔액이 부족합니다.");
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
			<span style="color:#005b7f;">＊ 본인 명의의 은행계좌로</span> 출금이 가능합니다.	
		<td>
	<tr>
	<tr bgcolor="#E7E7E7" >
		<td>
			＊ 예치금 출금 시에는 결제대행 수수료가 부과되며 예치금 충전 방법에 따라 다르게 부과됩니다.<br />
			(실시간 계좌이체 : 출금금액의 1.8%, 무통장입금 : 충전건별로 250원)<br />
			단, 적중금과 경기취소 및 구매오류로 인한 환불금은 수수료 없이 출금 가능합니다.
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
				<fmt:formatNumber value="${mdto.cash}" type="number" />원
			</font>
			
		</td>
		<td width="400" ><input type="text" id="cancelprice" name="cancelprice" />원&nbsp;&nbsp;&nbsp;
		<input type="image" src="/toto/member/image/money.gif" border="0">
		</td>
	</tr>
</table>
</form>
<br />
<table  align="center" width="700">
	<tr align="left">
		<td>
			-출금신청을 하시면 신청일 다음날(다음 은행영업일)에 회원님의 계좌로 입금해드립니다.<br /> 
			 &nbsp;(토,일요일 및 공휴일은 은행 휴무로 예치금 출금이 되지 않으며, 은행영업일에 출금가능합니다.)<br />
			-출금신청 취소는 출금예정일 오전 08시까지 가능합니다.
		</td>
	</tr>
</table>
</div>