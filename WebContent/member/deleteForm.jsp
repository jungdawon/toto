<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />


   <script language="javascript">
     <!--
       function begin(){
         document.myform.pw.focus();
       }

       function checkIt(){
		  if(!document.myform.pw.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.pw.focus();
           return false;
         }
	   }   
     -->
   </script>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>

<BODY onload="begin()">
<div id="text" >
<form name="myform" action="/toto/member/deletePro.to" method="post" onSubmit="return checkIt()">
<table width="470" align="center" border="0">
	<tr height="30">
	<td colspan="2" align="center"><h1><b>ȸ��Ż��</b></h1></td>
	</tr>
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
  <TR height="30">
    <TD width="150" align="center">��й�ȣ</TD>
    <TD width="320" align="">
      <input style="height: 19pt;" type=password name="pw" size="27" maxlength="12"></TD>
  </TR>
  
  	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<TR height="30">
	<TD colspan="2" align="center">
      <INPUT type=submit style="background-color: '#C2E2E8'; width: '50pt';" value="Ż ��">&nbsp;&nbsp;
      <input type="button" style="background-color: '#C2E2E8';" value="���ư���" onclick="javascript:window.location='/toto/top/main.to'">
	</TD>
	</TR>
</TABLE>
</form>
</div>
</BODY>
</HTML>
