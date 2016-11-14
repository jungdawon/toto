<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<title>회원삭제</title>
	<c:if test="${userCheck == 1}">
	<form method="post" action="list.to" name="delete" >
		<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
			<tr><td height="39" align="center"><font size="+1" ><b>회원정보가 삭제되었습니다.</b></font></td></tr>
			<tr>
				<td align="center">
				<p>회원삭제 완료</p>
					<meta http-equiv="Refresh" content="1;url=/toto/top/main.to" />
				</td>
			</tr>
			<tr><td align="center"><input type="submit" value="확인"></td></tr>
		</table>
	</form>
	</c:if>
	<c:if test="${userCheck == 0}">
	<script language="javascript">
	alert("비밀번호가 맞지 않습니다")
	 history.go(-1);
	</script>
</c:if>
