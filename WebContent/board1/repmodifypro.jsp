<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${count eq 1}">
	<c:redirect url="/board1/content.to?num=${num}&pageNum=${pageNum}"></c:redirect>
</c:if>
<c:if test="${count eq 0}">

      <script language="JavaScript">      
     
        alert("��й�ȣ�� ���� �ʽ��ϴ�");
        history.go(-1);
 
     </script>

</c:if>
 