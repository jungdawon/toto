<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/top/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<style type="text/css">
	<%-- �ٵ�ȿ� ���� 20px���� ������ �ڵ����� ���� / ����200px, ��Ʈ������ 15px--%>
	body{		
		font-size:15px;
	}
	<%--���ε鿩���� --%> 
	
	ul.nav1 {
		width:200px;
	}
	<%-- ����Ʈ ��Ÿ�Ͼ��ֱ� --%>
	ul.nav1 {
		list-style:none;
		margin:0;
		padding:0;
	}
	
	div.title{
		color: red;
		background:#3e3f3a;
		cursor:pointer;
	}
	
	ul.sub1 li:hover{
		background:black;
	}
	ul.nav1{
		position: absolute;
		top: 250px;
		left: 5px;
	}
</style>
</head>
<body>
	<ul class="nav1">
		<li class="group">
		<div class="title" align="center" ><B>�������</B></B></div>
		<ul class="sub1">
			<a href="/toto/proto/gameBuy.to?round=${turn2}&type=�¹���&league=${league}"><li>���� ����</a>
			<a href="/toto/gamebuy/VictoryVote.to?round=${turn2}&type=�¹���&league=${league}"><li>��ǥ ��Ȳ</li></a>
		</ul>
		</li>
	</ul>



</body>
</html>