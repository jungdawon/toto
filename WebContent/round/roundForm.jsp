<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>ȸ���Է�</title>
</head>
<body>
������ ȸ��
<form method="post" action="/toto/round/roundPro1.to">
<input type="text" name="turn1">ȸ��
<input type="text" name="s_date">���۳�¥
<input type="text" name="e_date">���ᳯ¥
<input type="hidden" name="round1" value="�ºν�">
<input type="submit" value="Ȯ��">
</form>
���� ȸ��
<form method="post" action="/toto/round/roundPro2.to">
<input type="text" name="turn2">ȸ��
<input type="text" name="s_date">���۳�¥
<input type="text" name="e_date">���ᳯ¥
<input type="hidden" name="round2" value="�¹���">
<input type="submit" value="Ȯ��">
</form>
</body>
</html>