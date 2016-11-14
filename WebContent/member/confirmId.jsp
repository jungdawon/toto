<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>아이디 중복확인</title>

<body>
<c:if test="${check ==1 }">
	<table width="470" align="center" border="0">
	<tr height="30">
	<td align="center"><h3><b>다른 아이디를 입력하세요.</b></h3></td>
	</tr>
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr><td height="30"><b>[${id}]</b>는 이미 사용중인 아이디 입니다.</td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	</table>
	<form name="checkForm" method="post" action="/toto/member/confirmId.to">
	<table width="470" align="center" border="0">
	<tr height="30"><td align="center">
	<input type="text" name="id">&nbsp;&nbsp;<input style="background-color: '#C2E2E8';" type="submit" value="중복확인">
	</td></tr>
	</table>
	</form>
	</c:if>
<c:if test="${check != 1 }">
<table width="470" align="center" border="0">
	<tr height="30">
	<td align="center"><h3><b>알 림</b></h3></td>
	</tr>
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	
<tr><td height="30"><b>[${id}]</b>는 사용가능한 아이디입니다.</td></tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="30"><td align="center"><br/>
	<input style="background-color: '#C2E2E8'; width: '50pt';" type="button" value="닫 기" onclick="setid()" /></td></tr>
</table>
</c:if>
</body>

<script language="javascript">
function setid(){
	opener.document.userinput.id.value="${id}";
	self.close();
}

</script>
