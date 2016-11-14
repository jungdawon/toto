<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/admin/resultMenu.jsp" %>

<br />
<br />
<br />
<style type="text/css">
	#vresult_1 {
		position: relative;
		left: 20%;
		
	}

</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<script text="text/javascript">
	function chk(arg,value){
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
		
		
		if("match_1" == arg){
			if(value == "½Â"){
				if(match_1[0].checked == true){		match_1[1].checked = false;	match_1[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_1[1].checked == true){		match_1[0].checked = false;	match_1[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_1[2].checked == true){		match_1[0].checked = false;	match_1[1].checked = false;} 
			}
		}else if("match_2" == arg){
			if(value == "½Â"){
				if(match_2[0].checked == true){		match_2[1].checked = false;	match_2[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_2[1].checked == true){		match_2[0].checked = false;	match_2[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_2[2].checked == true){		match_2[0].checked = false;	match_2[1].checked = false;} 
			}
		}else if("match_3" == arg){
			if(value == "½Â"){
				if(match_3[0].checked == true){		match_3[1].checked = false;	match_3[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_3[1].checked == true){		match_3[0].checked = false;	match_3[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_3[2].checked == true){		match_3[0].checked = false;	match_3[1].checked = false;} 
			}
		}else if("match_4" == arg){
			if(value == "½Â"){
				if(match_4[0].checked == true){		match_4[1].checked = false;	match_4[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_4[1].checked == true){		match_4[0].checked = false;	match_4[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_4[2].checked == true){		match_4[0].checked = false;	match_4[1].checked = false;} 
			}
		}else if("match_5" == arg){
			if(value == "½Â"){
				if(match_5[0].checked == true){		match_5[1].checked = false;	match_5[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_5[1].checked == true){		match_5[0].checked = false;	match_5[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_5[2].checked == true){		match_5[0].checked = false;	match_5[1].checked = false;} 
			}
		}else if("match_6" == arg){
			if(value == "½Â"){
				if(match_6[0].checked == true){		match_6[1].checked = false;	match_6[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_6[1].checked == true){		match_6[0].checked = false;	match_6[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_6[2].checked == true){		match_6[0].checked = false;	match_6[1].checked = false;} 
			}
		}else if("match_7" == arg){
			if(value == "½Â"){
				if(match_7[0].checked == true){		match_7[1].checked = false;	match_7[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_7[1].checked == true){		match_7[0].checked = false;	match_7[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_7[2].checked == true){		match_7[0].checked = false;	match_7[1].checked = false;} 
			}
		}else if("match_8" == arg){
			if(value == "½Â"){
				if(match_8[0].checked == true){		match_8[1].checked = false;	match_8[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_8[1].checked == true){		match_8[0].checked = false;	match_8[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_8[2].checked == true){		match_8[0].checked = false;	match_8[1].checked = false;} 
			}
		}else if("match_9" == arg){
			if(value == "½Â"){
				if(match_9[0].checked == true){		match_9[1].checked = false;	match_9[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_9[1].checked == true){		match_9[0].checked = false;	match_9[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_9[2].checked == true){		match_9[0].checked = false;	match_9[1].checked = false;} 
			}
		}else if("match_10" == arg){
			if(value == "½Â"){
				if(match_10[0].checked == true){		match_10[1].checked = false;	match_10[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_10[1].checked == true){		match_10[0].checked = false;	match_10[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_10[2].checked == true){		match_10[0].checked = false;	match_10[1].checked = false;} 
			}
		}else if("match_11" == arg){
			if(value == "½Â"){
				if(match_11[0].checked == true){		match_11[1].checked = false;	match_11[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_11[1].checked == true){		match_11[0].checked = false;	match_11[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_11[2].checked == true){		match_11[0].checked = false;	match_11[1].checked = false;} 
			}
		}else if("match_12" == arg){
			if(value == "½Â"){
				if(match_12[0].checked == true){		match_12[1].checked = false;	match_12[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_12[1].checked == true){		match_12[0].checked = false;	match_12[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_12[2].checked == true){		match_12[0].checked = false;	match_12[1].checked = false;} 
			}
		}else if("match_13" == arg){
			if(value == "½Â"){
				if(match_13[0].checked == true){		match_13[1].checked = false;	match_13[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_13[1].checked == true){		match_13[0].checked = false;	match_13[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_13[2].checked == true){		match_13[0].checked = false;	match_13[1].checked = false;} 
			}
		}else if("match_14" == arg){
			if(value == "½Â"){
				if(match_14[0].checked == true){		match_14[1].checked = false;	match_14[2].checked = false;} 
			}else if(value == "¹«"){
				if(match_14[1].checked == true){		match_14[0].checked = false;	match_14[2].checked = false;} 
			}else if(value == "ÆÐ"){
				if(match_14[2].checked == true){		match_14[0].checked = false;	match_14[1].checked = false;} 
			}
		}
		
		
		
		/*		
		var tmparray = Array("match_1","match_2","match_3","match_4","match_5","match_6","match_7","match_8","match_9","match_10","match_11","match_12","match_13","match_14"); 
		
		//alert(arg+"aa"+value);
 		for(var i=0;i<tmparray.length;i++){
			if(tmparray[i] == arg){
				var test = tmparray[i];
				alert(test[0]);
				if(test[0].checked == true){
					alert("Æ®·ç");
				}
			}
		} */
	}
</script>


<div id="text" >
<form name="victory2" action="/toto/admin/VictoryResultPro.to" method="post" >
<table border="1" align="left" width="50%" id="vresult_1">
	
	<tr align="center" style="background:black; color:#F6F6F6;">
		<td width="200" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="100">°æ±â</td>
		<td width="200" style="border: 1px solid black;">È¨ÆÀ vs ¿øÁ¤ÆÀ</td>
		<td width="50" style="border-top: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="200" style="border: 1px solid black; background:black; color:#F6F6F6;">°æ±â °á°ú µî·Ï</td>
		<td width="50" style="border-top: 1px solid white;border-right: 1px solid white; background:white; color:#F6F6F6;"></td>
	</tr>
	<c:set var="number" value="${1}" />
	<c:set var="i" value="${1}" />
	<c:set var="x" value="," />
	<c:forEach var="victoryList" items="${victoryList}" >
		<tr align="center">
			<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-left: 1px solid white;"></td>
			<td>${number}°æ±â</td>
			<td>${victoryList.home} vs ${victoryList.away}</td>
			<td style="border-top: 1px solid white;border-bottom: 1px solid white;"></td>
			<td>
				<input type="checkbox" id="match_${i}" name="match_${i}" value="½Â" onClick="chk(this.id,this.value);"/>½Â
				<input type="checkbox" id="match_${i}" name="match_${i}" value="¹«" onClick="chk(this.id,this.value);"/>¹«
				<input type="checkbox" id="match_${i}" name="match_${i}" value="ÆÐ" onClick="chk(this.id,this.value);"/>ÆÐ
			</td>
			<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-right: 1px solid white;"></td>
			<c:set var="number" value="${number + 1}" />
			<c:set var="i" value="${i + 1}" />
			<c:set var="turn2" value="${victoryList.turn2}" />
		</tr>
	</c:forEach>
	
	<tr>
		<td height="35" style="border-top: 1px solid white;border-bottom: 1px solid white;border-right: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
	</tr>
	<tr align="center">
		<td colspan="1" style="border-top: 1px solid white;border-bottom: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td colspan="4" style="border-top: 1px solid white;border-bottom: 1px solid white;border-left: 1px solid white; border-right: 1px solid white; background:white; color:#F6F6F6; ">
		<a href="javascript:document.victory2.submit();"><img border="0" src="/toto/admin/image/register.gif"/></a>
	<input type="hidden" value="½Â¹«ÆÐ" name="round2" />
	<input type="hidden" value="${turn2}" name="turn2" />
	<input type="hidden" value="${league}" name="league" /></td>
	</tr>
</table>
</form>
</div>