<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="top2">
<br />
<script type="text/javascript">
function clearId(){
	id = document.getElementById("id");
	id.value="";
}

function returnid(){
	id = document.getElementById("id");
	if(id.value==""){
		id.value="ID";
	}
}

</script>
<c:if test="${id==null}">
<form name="login" method="post" action="/toto/member/loginPro.to">
<table align="right">
<tr><td>
<img border="0" src="/toto/top/img/txt_loginTit.gif">
<input style="height: 24px;font-size: 8pt;" type="text" id="id" name="id" value="ID" onclick="clearId();" onblur="returnid();">&nbsp;&nbsp;
<input style="height: 24px;font-size: 8pt;" type="password" name="pw">
<a href="javascript:document.login.submit();"><img border="0" src="/toto/top/img/btn_loginTop.gif"></a>
&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<td>
<a href="/toto/member/inputForm.to"><img border="0" src="/toto/top/img/txt_join.gif"></a>&nbsp;
<a href="/toto/member/findForm.to"><img border="0" src="/toto/top/img/txt_idsearch.gif"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td>
</tr>
</table>
</form>
<br>
<br>
</c:if>
<c:if test="${id!=null}">
<table align="right">
<tr><td>
${id }´Ô ¾È³çÇÏ¼¼¿ä <a href="/toto/member/logout.to"><img border="0" src="/toto/top/img/btn_logoutTop.gif"></a>
&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<td>¿¹Ä¡±Ý : <fmt:formatNumber value="${cash}" type="number" />¿ø
 <a href="/toto/agspay/AGS_pay.to"><img border="0" src="/toto/top/img/btn_charge4.gif"></a>&nbsp;
 <a href="/toto/member/payCancel.to"><img border="0" src="/toto/top/img/btn_payout.gif"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td></tr>
</table>
<br>
<br>
</c:if>
</div>