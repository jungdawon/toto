<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">      

  function deleteSave(){	
	if(document.delForm.pw.value==''){
		alert("��й�ȣ�� �Է��Ͻʽÿ�.");
		document.delForm.pw.focus();
		return false;
 	}
  }
	function back(){

		history.go(-1);
	}

   
</script>
</head>

<body>
<center><b>�ۻ���</b>
<br>
<form method="POST" name="delForm"  action="/toto/board1/deletepro.to?pageNum=${pageNum}" onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	   <input type="hidden" name="num" value="${num}">
	   <input type="hidden" name="local" value="${local}">
  <tr height="30">
     <td align=center >
       <b>��й�ȣ�� �Է��� �ּ���.</b></td>
  </tr>
  <tr height="30">
     <td align=center >��й�ȣ :  
     
	
	   	<input type="password" name="pw" size="8" maxlength="12">

 </tr>
 <tr height="30">
    <td align=center>
      <input type="submit" value="�ۻ���" >
      <input type="button" value="�ڷΰ���" onclick="back();">
    
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 
