<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>회차입력</title>
</head>
<body>
프로토 회차
<form method="post" action="/toto/round/roundPro1.to">
<input type="text" name="turn1">회차
<input type="text" name="s_date">시작날짜
<input type="text" name="e_date">종료날짜
<input type="hidden" name="round1" value="승부식">
<input type="submit" value="확인">
</form>
토토 회차
<form method="post" action="/toto/round/roundPro2.to">
<input type="text" name="turn2">회차
<input type="text" name="s_date">시작날짜
<input type="text" name="e_date">종료날짜
<input type="hidden" name="round2" value="승무패">
<input type="submit" value="확인">
</form>
</body>
</html>