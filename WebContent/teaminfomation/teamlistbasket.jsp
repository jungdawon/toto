<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>

<div id="teamlist">
 <form name="teamchoice" method="post" action="/toto/teaminfomation/teamcontentbasket.to">
	<input type="hidden" name="snum" value="6">
	<select name="league">
		
		<option value="KBL">���γ�</option>
	</select>&nbsp;&nbsp;
		
	������
	<select name="teamname">
		<c:if test="${team!=null}">
		<option value="${team}">${team}</option>
		</c:if>
		<option value="�����">�����</option>	
		<option value="���ֵ���">���ֵ���</option>		
		<option value="����SK">����SK</option>
		<option value="â��LG">â��LG</option>
		<option value="�������½�">�������½�</option>
		<option value="��õ���ڷ���">��õ���ڷ���</option>
		<option value="�λ�KT">�λ�KT</option>
		<option value="�Ⱦ�KGC">�Ⱦ�KGC</option>
		<option value="����KCC">����KCC</option>
		<option value="����Ｚ">����Ｚ</option>
	</select>
	<c:if test="${var!=null}">
	<input type="hidden" name="var" value="${var}">
	</c:if>
 	<a href="javascript:document.teamchoice.submit();"><img border="0" src="/toto/game/image/submit.gif"/></a>
 		
 		
</form>
 		
</div>
</center>
 