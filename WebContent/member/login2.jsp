<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>
<body>
<body>

	<form name="inform" action = "/toto/member/login2Pro.to" method = "post" onSubmit="return checkIt()">
	
	<center><h1>회원 로그인</h1></center>
	
	<table width="350" align="center" border="0">
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="30"><td width="100" >회원아이디</td><td colspan="2"><input type="text" maxlength="13" name="id" size="22" /></td>
		<td rowspan="3" align="center">
		<input style="background-color: '#C2E2E8'; height: 40pt;" type="submit" value="로그인" onmouseout="this.style.backgroundColor='#C2E2E8';" onmouseover="this.style.backgroundColor='#E6FFFF';"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="3"></td></tr>
	<tr height="30">
		<td>비밀번호</td>
		<td colspan="2"><input type="password" maxlength="13" name="pw" size="22" /></td>
	</tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="40">
		<td /><td colspan="3" align="center">
		<input style="background-color: '#C2E2E8';" type="button" onclick="javascript:window.opener.location='/toto/member/findForm.to'; self.close();" value="ID/PW찾기">&nbsp;&nbsp;&nbsp;&nbsp;
		<input style="background-color: '#C2E2E8';" type="button" onclick="javascript:window.opener.location='/toto/member/inputForm.to'; self.close();" value="회원가입"></td>
	</tr>
	</table>
	</form>

</body>
</html>

<script language="javascript">
<!--
function focusIt()
{      
   document.inform.id.focus();
}	
 
 function checkIt()
 {
   inputForm=eval("document.inform");
   if(!inputForm.id.value){
     alert("아이디를 입력하세요.");
	 inputForm.id.focus();
	 return false;
   }
   if(!inputForm.pw.value){
     alert("패스워드를 입력하세요.");
	 inputForm.pw.focus();
	 return false;
   }
 }
//-->
</script>