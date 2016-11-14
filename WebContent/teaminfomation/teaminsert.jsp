<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@include file="/teaminfomation/teamMenu.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<script>
function check(){
	if(!document.insertform.hometown.value){
		alert("�������� �ۼ����ּ���.");
		document.insertform.hometown.focus();
		return false;
	}else if(!document.insertform.homeground.value){
		alert("Ȩ������ �Է����ּ���.");
		document.insertform.homeground.focus();
		return false;
	}else if(!document.insertform.coach.value){
		alert("������ �Է����ּ���.");
		document.insertform.coach.focus();
		return false;
	}else if(!document.insertform.homepage.value){
		alert("Ȩ�������� �Է����ּ���.");
		document.insertform.homepage.focus();
		return false;
	}else if(!document.insertform.logo.value){
		alert("�ΰ� �Է����ּ���.");
		document.insertform.logo.focus();
		return false;
	}
}
function chk(arg){
	var f = document.insertform;
	var opt = $("#ctg_nm option").length;
	if(arg == "K����"){
		num = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
		vnum = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
	}else if(arg == "KBO"){
		num = new Array("��ȭ","�Ե�","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
		vnum = new Array("��ȭ","�Ե�","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
	}else if(arg == "KBL"){
		num = new Array("�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
		vnum = new Array("�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
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
	
	num = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
	vnum = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
	
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
			<font size="4">������</font>	&nbsp;&nbsp;
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
					<option value="K����">K����</option>
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
				������<input type="text"  size="25" maxlength="40" name="hometown" id="hometown"><br /><br />
				Ȩ����<input type="text"  size="25" maxlength="40" name="homeground" id="homeground"><br /><br />
				�� ��&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="25" maxlength="40"name="coach"	id="coach"><br /><br />
				�� ��&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="25" maxlength="40"name="grade" id="grade"><br /><br />
				Ȩ������<input type="text" size="23" maxlength="40"name="homepage" id="homepage"><br /><br />
				�� ��<input type="file" name="logo" id="logo">
			</td>
		<tr align="center">
		 	<td colspan="2">
		 		<input type="submit" value="���">
			</td>
		</tr>
		</tr>
	</table>
</form>
</div> 