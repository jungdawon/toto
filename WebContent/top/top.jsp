<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Proto</title>

<!-- Bootstrap Core CSS -->
<link href="/toto/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/toto/css/landing-page.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/toto/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<div id="top2">
	<jsp:include page="/top/top2.to" flush="false" />
</div>
	<nav class="navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">

				<a href="/toto/top/main.to?local=Notice"><img border="0" src="/toto/top/img/to.png"></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle" role="button"
						aria-expanded="false" href="/toto/buygame/buyableGame.to" data-toggle="dropdown">���� ����<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="/toto/buygame/buyableGame.to">���Ű��� ����</a></li>
							<li class="divider"></li>
							<li><a href="/toto/buygame/endGame.to">��������/���߰��</a></li>
							<li class="divider"></li>
							<li><a href="/toto/buygame/gameListMonth.to">���� ����</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" role="button"
						aria-expanded="false" href="#" data-toggle="dropdown">������� <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="/toto/teaminfomation/teaminformation.to?league=K����">�౸</a></li>
							<li class="divider"></li>
							<li><a href="/toto/teaminfomation/teaminformationbaseball.to?league=KBO">�߱�</a></li>
							<li class="divider"></li>
							<li><a href="/toto/teaminfomation/teaminformationbasketball.to?league=KBL">��</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" role="button"
						aria-expanded="false" href="#" data-toggle="dropdown">Ŀ�´�Ƽ <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="/toto/board1/list.to?local=Notice">��������</a></li>
							<li class="divider"></li>
							<li><a href="/toto/board1/list.to?local=free">�����Խ���</a></li>
							<li class="divider"></li>
							<li><a href="/toto/board1/list.to?local=advice">Q&A�Խ���</a></li>
						</ul>
					</li>


<c:if test="${sessionScope.memId eq null}">
					<li class="dropdown"><a class="dropdown-toggle" role="button"
						aria-expanded="false" href="/toto/member/loginForm.to" data-toggle="dropdown">�α���<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="/toto/member/loginForm.to">�α���</a></li>
							<li class="divider"></li>
							<li><a href="/toto/member/inputForm.to">ȸ������</a></li>
							<li class="divider"></li>
							<li><a href="/toto/member/findForm.to">ID/PWã��</a></li>
						</ul></li>
</c:if>
<c:if test="${sessionScope.memId ne null && sessionScope.memId ne 'admin'}">
						<li class="dropdown"><a class="dropdown-toggle" role="button"
						aria-expanded="false" href="/toto/member/loginForm.to" data-toggle="dropdown">����������<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="/toto/member/logout.to">�α׾ƿ�</a></li>
							<li class="divider"></li>
							<li><a href="/toto/member/myInfor.to">��������</a></li>
							<li class="divider"></li>
							<li><a href="/toto/purchase/listPurchase.to">����/���߳���</a></li>
							<li class="divider"></li>
							<li><a href="/toto/deposit/mydeposit.to?datebar=7">��ġ��</a></li>
							<li class="divider"></li>
							<li><a href="/toto/board1/mylist.to?gubun=all">���ۼ���</a></li>
							<li class="divider"></li>
							<li><a href="/toto/member/deleteForm.to">ȸ��Ż��</a></li>
						</ul></li>
</c:if>
<c:if test="${sessionScope.memId ne null && sessionScope.memId eq 'admin'}">
						<li class="dropdown"><a class="dropdown-toggle" role="button"
						aria-expanded="false" href="/toto/member/loginForm.to" data-toggle="dropdown">������������<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li class="divider"></li>
							<li><a href="/toto/member/logout.to">�α׾ƿ�</a></li>
							<li class="divider"></li>
							<li><a href="/toto/admin/adminMember.to">ȸ������</a></li><!-- ȸ������ -->
							<li class="divider"></li>
							<li><a href="/toto/teaminfomation/teaminsert.to">�� & ��� ��������</a></li><!-- ������,������� -->
							<li class="divider"></li>
							<li><a href="/toto/admin/payList.to">����� ����</a></li><!-- ����,���,���� -->
							<li class="divider"></li>
							<li><a href="/toto/proto/protoAA.to">���Ӱ���</a></li><!-- ����� -->
							<li class="divider"></li>
							<li><a href="/toto/purchase/AdminPurchase.to">���ð���</a></li><!-- ���ó��� & ȯ�� -->
						</ul></li>
</c:if>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle" role="button"
						aria-expanded="false" href="/toto/game/matchguide.to">�����䰡�̵�</a></li>

				</ul>


			</div>
		</div>
	</nav>
	<!-- jQuery -->
	<script src="/springTest/pjt/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/toto/js/bootstrap.min.js"></script>
	<script type='text/javascript'
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script type='text/javascript'
		src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<!-- JavaScript jQuery code from Bootply.com editor  -->
	<script type='text/javascript'>
		$(document).ready(function() {
		});
	</script>


</body>

</html>