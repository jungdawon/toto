<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">


function back(){
	history.go(-1);
}

</script>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> 
<br />
<br />

<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>


<body>  
<center><b>�ۼ���</b>
<br>
<form method="post" name="writeform" action="/toto/board1/modifypro.to?pageNum=${pageNum}" onsubmit="return writeSave()">
<table width="700" border="1" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td  width="70" align="center">�� ��</td>
    <td align="left" width="330">${modifycontent.writer}
    <!-- ����κ� �� ������ -->
       <input type="hidden" size="10" maxlength="10" name="writer" value="${modifycontent.writer}">
	   <input type="hidden" name="num" value="${num}">
	    
	</td>
  </tr>
  
  <tr>
    <td  width="70"  align="center" >�� ��</td>
    <td align="left" width="330">
       <input type="text" size="80" maxlength="50" name="subject" value="${modifycontent.subject}">
    </td>
  </tr>

  <tr>
    <td  width="70"  align="center" >�� ��</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="80">${modifycontent.content}</textarea></td>
  </tr>
  <tr>
    <td  width="70"  align="center" >��й�ȣ</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="pw">
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2 align="center"> 
     <input type="submit" value="�����Ϸ�" >
     <input type="button" value="�ڷΰ���" onclick="back();">
     <input type="button" value="��Ϻ���" onclick="document.location.href='/toto/board1/list.to?pageNum=1&local=free'">
   </td>
 </tr>
 </table>
</form>
      
      
</body>
</html>      
