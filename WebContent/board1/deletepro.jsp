<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check eq 1}">
	<c:redirect url="/board1/list.to?pageNum=${pageNum}"></c:redirect>
</c:if>
<c:if test="${check eq 0}">

      <script language="JavaScript">      
     
        alert("��й�ȣ�� ���� �ʽ��ϴ�");
        history.go(-1);
 
     </script>

</c:if>
 