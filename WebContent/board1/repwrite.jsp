<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<form method="post"  action="/toto/board1/repwritepro.to">
<table width="950" border="2" cellspacing="0" cellpadding="0"  bgcolor="white" align="center">  
	
		<input type="hidden" name="num" value="${num}" />
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<input type="hidden" name="keynum" value="${keynum}" />
		<tr>
	<td  width="70"align="center">아이디</td>
	<td  width="330">
		<input type="text" size="40" maxlength="50" name="writer" ></td>
	</tr> 
    <tr>
		<tr>
		<td width="900">
		
		 리플달기<textarea rows="2" cols="100" name="content" ></textarea>
		</td>	
	   <td  width="70">비밀번호

       <input type="password" size="5" maxlength="5" name="pw">
       <input type="submit" value="글쓰기" />
		
	</td>
	
		</tr>	

 </table>
</form>
