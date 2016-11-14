<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	<%-- 바디안에 마진 20px띄우고 나머지 자동으로 설정 / 가로200px, 폰트사이즈 15px--%>

	<%-- 리스트 스타일없애기 --%>
	ul.nav1 {
		list-style:none;
		margin:0;
		padding:0;
	}
	
	div.title{
		color: red;
		background:#EAEAEA;

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
	<div class="nav2" id="g1" style="width: 1000px;">
		<div class="title" align="center">
			<a href="/toto/game/matchguide.to">승부식</a>
			<a href="/toto/game/soccertoto.to">축구토토</a>
		</div>
	</div>





</body>
</html>