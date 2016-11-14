<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/gamebuy/victoryMenu.jsp" %>

<br />
<br />
<br />

<style type="text/css">
	#vi1 {
		position: relative;
		left: 15%;
		
	}
	#vi2 {
		position: relative;
		left: 15%;
		
	}

</style>


<script type="text/javascript">
	var maxChecked = 22;   //선택가능 갯수
	var totalChecked = 0; // 설정 끝
function chk(arg){
	var f = document.victory2;
	var match_1 = document.getElementsByName("match_1");
	var match_2 = document.getElementsByName("match_2");
	var match_3 = document.getElementsByName("match_3");
	var match_4 = document.getElementsByName("match_4");
	var match_5 = document.getElementsByName("match_5");
	var match_6 = document.getElementsByName("match_6");
	var match_7 = document.getElementsByName("match_7");
	var match_8 = document.getElementsByName("match_8");
	var match_9 = document.getElementsByName("match_9");
	var match_10 = document.getElementsByName("match_10");
	var match_11 = document.getElementsByName("match_11");
	var match_12 = document.getElementsByName("match_12");
	var match_13 = document.getElementsByName("match_13");
	var match_14 = document.getElementsByName("match_14");

	var price = document.getElementById("price");

/*
    if (arg.checked){
        totalChecked += 1;
    }else{
        totalChecked -= 1;
    }
    if (totalChecked > maxChecked) {
    	arg.checked = false;
    	alert("22개 이상 선택할수 없습니다.");
    	totalChecked -= 1;
    }
    if(arg.checked){
	    if(price.value > 100000){
	    	alert("10만원을 초과할수없습니다.");
	    	arg.checked = false;
	    }
    }
*/
//	alert("totalChecked : "+totalChecked);
	/*
	alert("테스트");
	var match = ["match_1[]","match_2[]","match_3[]"];
	for(y=0;y<1;y++){
		alert(document.getElementsByName(match[y]).length);
		//alert(document.getElementsByName("match_1"[0].checked));
		//alert(document.getElementsByName(match[y][0].checked));
		if(document.getElementsByName(match[y][0]).checked == true){
			alert("a");
		}
	}
*/
	var m_1 =0;
	var m_2 =0;
	var m_3 =0;
	var m_4 =0;
	var m_5 =0;
	var m_6 =0;
	var m_7 =0;
	var m_8 =0;
	var m_9 =0;
	var m_10=0;
	var m_11=0;
	var m_12=0;
	var m_13=0;
	var m_14=0;

	for(i=0;i<3;i++){
			if(match_1[i].checked == true) {m_1++;}
			if(match_2[i].checked == true) {m_2++}
			if(match_3[i].checked == true) {m_3++}
			if(match_4[i].checked == true) {m_4++}
			if(match_5[i].checked == true) {m_5++}
			if(match_6[i].checked == true) {m_6++}
			if(match_7[i].checked == true) {m_7++}
			if(match_8[i].checked == true) {m_8++}
			if(match_9[i].checked == true) {m_9++}
			if(match_10[i].checked == true){m_10++}
			if(match_11[i].checked == true){m_11++}
			if(match_12[i].checked == true){m_12++}
			if(match_13[i].checked == true){m_13++}
			if(match_14[i].checked == true){m_14++}
	}
	//alert(m_1);
	//체크박스 1개 체크갯수	
	if(m_1 >= 1 && m_2 >= 1 && m_3 >= 1 && m_4 >= 1 && m_5 >= 1 && m_6 >= 1 && m_7 >= 1 && m_8 >= 1 && m_9 >= 1 && m_10 >= 1 && m_11 >= 1 && m_12 >= 1 && m_13 >= 1 && m_14 >= 1){
		price.value = 1000 * m_1 * m_2 * m_3 * m_4 * m_5 * m_6 * m_7 * m_8 * m_9 * m_10 * m_11 * m_12 * m_13 * m_14;
	}else{
		price.value = '';
	}
	
}
function checkIt(){
	var price = document.getElementById("price");
	var cash = document.getElementById("cash");
	var id = document.getElementById("id");
	
	var cash2 = Number(cash.value);
	var price2 = Number(price.value);
	if(id.value == '' || id.value == null){
		alert("로그인후 이용가능합니다.");
		return false;
	}else if(price2 > cash2){
		alert("예치금 잔액이 부족합니다.");
		return false;
	}
	if(price2 > 100000){
		alert("10만원을 초과할수 없습니다.");
		return false;
	}else if(price2 == '' || price2 == null){
		alert("게임을 선택해주세여(승:무:패)");
		return false;
	}
	
}
</script>

<!--  
	<form name="victory" action="/toto/gamebuy/VictoryPro.to" method="post">
	<table>
		<tr>
			<td>
				<select name="turn2">
					<option value="1">1회</option>
					<option value="2">2회</option>
					<option value="3">3회</option>
					<option value="4">4회</option>
					<option value="5">5회</option>
				</select>
			</td>
		</tr>
		<tr><td><input type="submit" value="전송" /></td></tr>
	</table>
	</form>
	<br />
	<br />
-->

<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<div id="text">
	<form name="victory2" action="/toto/gamebuy/Victory_14.to" method="post" onSubmit="return checkIt()">
	<!-- 구매 테이블 삽입할거  
	<input type="text" value="${game}" name="game" />
	<input type="text" value="${gamename}" name="gamename" />
	-->
	<table border="1" align="left" width="50%" id="vi1">
		<tr align="center" style="background:black; color:#F6F6F6;">
			<td width="200" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
			<td width="100">경기</td>
			<td width="350" style="border: 1px solid black;">홈팀 <img border="0" src="/toto/game/image/vs.gif"/> 원정팀</td>
			<td width="50" style="border-top: 1px solid white; background:white; color:#F6F6F6;"></td>
			<td width="200" style="border: 1px solid black; background:black; color:#F6F6F6;">복식</td>
			<td width="50" style="border-top: 1px solid white; background:white; color:#F6F6F6;"></td>
		</tr>
		<c:set var="number" value="${1}" />
		<c:set var="i" value="${1}" />
		<c:forEach var="victoryList" items="${victoryList}" >
			<tr align="center">
				<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-left: 1px solid white;"></td>
				<td>${number}경기</td>
				<td>${victoryList.home} <img border="0" src="/toto/game/image/vs.gif"/> ${victoryList.away}</td>
				<td style="border-top: 1px solid white;border-bottom: 1px solid white;"></td>
				<td>
					<input type="checkbox" id="match_${i}" name="match_${i}" value="승" onClick='chk(this);'/>승
					<input type="checkbox" id="match_${i}" name="match_${i}" value="무" onClick='chk(this);'/>무
					<input type="checkbox" id="match_${i}" name="match_${i}" value="패" onClick='chk(this);'/>패
				</td>
				<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-right: 1px solid white;"></td>
				<c:set var="number" value="${number + 1}" />
				<c:set var="i" value="${i + 1}" />
				<c:set var="turn2" value="${victoryList.turn2}" />
			</tr>
		</c:forEach>
		<input type="hidden" value="${turn2}" name="turn2" />
		<input type="hidden" id="id" name="id" value="${sessionScope.memId}" />
		<input type="hidden" name="productnum" value="${str}T${turn2}" />
		<input type="hidden" name="round2" value="승무패" />
		
	</table>
	<table border="1" width="20%" id="vi2">
		
		<tr align="center" style="background:black; color:#F6F6F6;">
			<td colspan="2" width="40%">구매하기</td>
		</tr>
		<tr align="center">
			<td >예치금 잔액 :<input type="text" id="cash" value="${my.cash}" disabled="disabled"/>원</td>
		</tr>
		<tr align="center">
			<td >총구매 금액 :<input type="text" id="price" name="price" readonly="readonly"/>원 </td>
		</tr>
		<tr align="center"><td>※총 구매가능 금액은 10만원입니다.</td></tr>
		<tr align="center"><td><input type="submit" value="구매" /></td></tr>
	</table>
	<input type="hidden" name="league" value="${league}" />
	</form>
</div>
