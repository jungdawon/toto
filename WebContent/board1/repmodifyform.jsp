<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<form method="post" name="writeform" action="/toto/board1/repmodifypro.to?pageNum=${pageNum}">
<table width="950" border="2" cellspacing="0" cellpadding="0"  bgcolor="white" align="center">  

     	<!-- ����κ� �� ������ -->
	   <input type="hidden" name="num" value="${num}">
	   <input type="hidden" name="keynum" value="${keynum}">
	   <input type="hidden" name="repnum" value="${repnum}">
		<tr>
		<td width="900">
			<img src="re.gif" >&nbsp;${rmodifycontent.writer}<br />
		 <textarea name="content" >${rmodifycontent.content}</textarea>
		</td>	
	   <td  width="70">��й�ȣ

       <input type="password" size="5" maxlength="5" name="pw">
       <input type="submit" value="����" />
		
	</td>
	
		</tr>	

 </table>
</form>
