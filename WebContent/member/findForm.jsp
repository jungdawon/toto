<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />



<script language="JavaScript">
function checkIt() {
    var userinput = eval("document.userinput");
    if(!userinput.name.value) {
        alert("이름을 입력하세요.");
        return false;
    }
    if(!userinput.phone1.value) {
        alert("휴대폰 번호를 입력하세요.");
        return false;
    } 
    if(!userinput.phone2.value) {
        alert("휴대폰 번호를 입력하세요.");
        return false;
    }
    if(!userinput.phone3.value) {
        alert("휴대폰 번호를 입력하세요.");
        return false;
    } 
}
function checkIt2() {
    var userinput2 = eval("document.userinput2");
    if(!userinput2.id.value) {
        alert("ID를 입력하세요");
        return false;
    }
    if(!userinput2.name.value) {
        alert("이름을 입력하세요.");
        return false;
    }
    if(!userinput2.phone1.value) {
        alert("휴대폰 번호를 입력하세요.");
        return false;
    } 
    if(!userinput2.phone2.value) {
        alert("휴대폰 번호를 입력하세요.");
        return false;
    }
    if(!userinput2.phone3.value) {
        alert("휴대폰 번호를 입력하세요.");
        return false;
    } 
}
    function openfindid(input) {

        url = "/toto/member/findIdPro.to?name=" + input.name.value + "&phone1=" + input.phone1.value + "&phone2=" + input.phone2.value
        		+ "&phone3=" + input.phone3.value ;
        
        open(url, "findid", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=520, height=210");
    }
    
    function openfindpw(input) {

        url = "/toto/member/findPwPro.to?id=" + input.id.value + "&name=" + input.name.value + "&phone1=" + input.phone1.value
        		+ "&phone2=" + input.phone2.value + "&phone3=" + input.phone3.value ;
        
        open(url, "findid", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=520, height=210");
    }
</script>


<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>

<div id="text" >
<center><h1>아이디/비밀번호 찾기</h1></center>




<table width="800" align="center" border="0">
	<tr>
		<td>
		<form method = "post" name="userinput">
		<table width="350" align="center" border="0">	
			<tr height="40">
				<td colspan="3"><h3><b>아이디 찾기</b></h3></td>
			</tr>
			<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
			<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
			<tr height="30">
				<td width="100" >이름</td>
				<td colspan="2"><input type="text" maxlength="13" name="name" size="23" /></td>
			</tr>
			<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>

			<tr height="30">
				<td>휴대폰</td>
				<td colspan="2">
					<input type="text" size="4" maxlength="3" name="phone1">&nbsp;-&nbsp;
					<input type="text" size="5" maxlength="4" name="phone2">&nbsp;-&nbsp;
					<input type="text" size="5" maxlength="4" name="phone3">
				</td>
			</tr>
			<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
			<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
			<tr height="52">
			</tr>
			<tr height="40">
				<td colspan="4" align="right">
					<input style="background-color: '#C2E2E8'; width: '50pt';" type="button" value="확 인" name="findid" Onclick="openfindid(this.form); return checkIt();">
				</td>
			</tr>
		</table>
		</form>
	</td>
	<td>
		<form method = "post" name="userinput2">
		<table width="350" align="center" border="0">	
			<tr height="40">
				<td colspan="3"><h3><b>비밀번호 찾기</b></h3></td>
			</tr>
			<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
			<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
			<tr height="30">
				<td width="100" >아이디</td>
				<td colspan="2"><input type="text" maxlength="13" name="id" size="23" /></td>
			</tr>
			<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
			<tr height="30">
				<td width="100" >이름</td>
				<td colspan="2"><input type="text" maxlength="13" name="name" size="23" /></td>
			</tr>
			<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
			<tr height="30">
				<td>휴대폰</td>
				<td colspan="2">
					<input type="text" size="4" maxlength="3" name="phone1">&nbsp;-&nbsp;
					<input type="text" size="5" maxlength="4" name="phone2">&nbsp;-&nbsp;
					<input type="text" size="5" maxlength="4" name="phone3"></td>
			</tr>
			
			<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
			<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
			<tr height="40">
				<td colspan="4" align="right">
					<input style="background-color: '#C2E2E8'; width: '50pt';" type="button" value="확 인" name="findpw" Onclick="openfindpw(this.form); return checkIt2();">&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
</div>