<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<style type="text/css">
	<%-- �ٵ�ȿ� ���� 20px���� ������ �ڵ����� ���� / ����200px, ��Ʈ������ 15px--%>

	<%-- ����Ʈ ��Ÿ�Ͼ��ֱ� --%>
	ul.nav1 {
		list-style:none;
		margin:0;
		padding:0;
	}
	
	
	
	ul.sub1 li:hover{
		background:white;
	}
	ul.nav1{
		position: absolute;
		top: 250px;
		left: 5px;
	}
	
	#g1{
		position: absolute;
		top:100px;
		left : 20%;
		
	}
	
	
</style>
</head>
<body>
	<div class="nav1" id="g1" style="width: 1000px;">
		<div align="center">
	<form method="post" action="/toto/deposit/mydeposit.to">

	<select name="datebar">
		<c:if test="${datebar!=null}">
		<option value="${datebar}">${datebar}��</option>
		</c:if>
		<option value="7">7��</option>		
		<option value="15">15��</option>
		<option value="30">1 ��</option>
		<option value="90">3 ��</option>
	</select>

 		<input type="submit" value="Ȯ ��" >
 		
  </form>
		</div>
	</div>
<br />
<br />
</body>
</html>
