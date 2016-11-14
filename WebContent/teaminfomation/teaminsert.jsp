<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@include file="/teaminfomation/teamMenu.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<script>
function check(){
	if(!document.insertform.hometown.value){
		alert("연고지를 작성해주세요.");
		document.insertform.hometown.focus();
		return false;
	}else if(!document.insertform.homeground.value){
		alert("홈구장을 입력해주세요.");
		document.insertform.homeground.focus();
		return false;
	}else if(!document.insertform.coach.value){
		alert("감독을 입력해주세요.");
		document.insertform.coach.focus();
		return false;
	}else if(!document.insertform.homepage.value){
		alert("홈페이지를 입력해주세요.");
		document.insertform.homepage.focus();
		return false;
	}else if(!document.insertform.logo.value){
		alert("로고를 입력해주세요.");
		document.insertform.logo.focus();
		return false;
	}
}
function chk(arg){
	var f = document.insertform;
	var opt = $("#ctg_nm option").length;
	if(arg == "K리그"){
		num = new Array("전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
		vnum = new Array("전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
	}else if(arg == "KBO"){
		num = new Array("한화","롯데","넥센","NC","두산","SK","KIA","삼성","LG","KT");
		vnum = new Array("한화","롯데","넥센","NC","두산","SK","KIA","삼성","LG","KT");
	}else if(arg == "KBL"){
		num = new Array("고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
		vnum = new Array("고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
	}
	for(var i=0; i<opt; i++){
		f.teamname.options[0] = null;
	}
	for(k=0; k < num.length; k++){
		f.teamname.options[k] = new Option(num[k],vnum[k]);
	}
}

window.onload = function chk2(){
	var f = document.insertform;
	var opt = $("#ctg_nm option").length;
	
	num = new Array("전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
	vnum = new Array("전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
	
	for(var i=0; i<opt; i++){
		f.teamname.options[0] = null;
	}
	for(k=0; k < num.length; k++){
		f.teamname.options[k] = new Option(num[k],vnum[k]);
	}
}

</script>

<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<div id="text">
<br /><br /><br />

<table align="center" width="800" border="0">
	<tr align="left">
		<td>
			<font size="4">팀정보</font>	&nbsp;&nbsp;
			<img src="/toto/game/image/register.gif" />
		</td>
	</tr>
	<tr>
		<td><img src="/toto/admin/image/line.png" width="800"/></td>
	</tr>
</table>
<br />

<form method="post" action="/toto/teaminfomation/teaminsertpro.to" enctype="multipart/form-data" onsubmit="return check()" name="insertform">
	<table align="center">		
		<tr align="center">
			<td>
				<select id="ctg" name="league" onchange="chk(this.value);">
					<option value="K리그">K리그</option>
					<option value="KBO">KBO</option>
					<option value="KBL">KBL</option>
				</select>
				<select name="teamname" id="ctg_nm">
			
				</select>
			</td>
		</tr>
	</table>
	<br />
	<table align="center">
		<tr>
			<td>
				연고지<input type="text"  size="25" maxlength="40" name="hometown" id="hometown"><br /><br />
				홈구장<input type="text"  size="25" maxlength="40" name="homeground" id="homeground"><br /><br />
				감 독&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="25" maxlength="40"name="coach"	id="coach"><br /><br />
				성 적&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="25" maxlength="40"name="grade" id="grade"><br /><br />
				홈페이지<input type="text" size="23" maxlength="40"name="homepage" id="homepage"><br /><br />
				로 고<input type="file" name="logo" id="logo">
			</td>
		<tr align="center">
		 	<td colspan="2">
		 		<input type="submit" value="등록">
			</td>
		</tr>
		</tr>
	</table>
</form>
</div> 