<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<html>
<head>
<title>ȸ����������</title>
<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
      
        if(!userinput.pw.value ) {
            alert("��й�ȣ�� �Է��ϼ���");
            return false;
        }
        if(userinput.pw.value != userinput.pwcheck.value)
        {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
            return false;
        }
       
        if(!userinput.name.value) {
            alert("����� �̸��� �Է��ϼ���");
            return false;
        }
    }

    </script>
</head>
<body>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>

<div id="text" >
<center><h1>ȸ����������</h1></center>

<form method="post" name="userinput" action="/toto/member/myInforPro.to" onSubmit="return checkIt()">
<input type="hidden" name="id" value="${my.id }"/>
<table align="center" width="550" border="0">
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="30">
<td width="150" >���̵�</td>
<td>
${my.id }
<!-- <input type="button" style="background-color: '#C2E2E8'; " name="confirm_id" value="�ߺ�Ȯ��" OnClick="openConfirmid(this.form)"> -->
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>��й�ȣ</td>
<td><input type="password" align="center" name="pw"/>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>��й�ȣ Ȯ��</td>
<td><input type="password" align="center" name="pwcheck"/>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>�̸�</td>
<td><input type="text" align="center" name="name"  value="${my.name }"/>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>

<tr height="30">
<td>�޴���ȭ</td>
<td><input type="text" size="4" maxlength="3" name="phone1"  value="${my.phone1 }"/>-
<input type="text" size="5" maxlength="4" name="phone2"  value="${my.phone2 }"/>-
<input type="text" size="5" maxlength="4" name="phone3"  value="${my.phone3 }"/>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>E-mail</td>
<td><input type=text size="16" maxlength="15" name="mail1" value="${my.mail1 }">@
<input type=text size="12" maxlength="15" name="mail2" value="${my.mail2 }">
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
    <tr height="30"> 
      <td width="200">�ּ�</td>
      <td width="400"> 
<input type="text" id="sample4_postcode1" name="zip1" size = "3" maxlength="3" value="${my.zip1 }"> -
<input type="text" id="sample4_postcode2" name="zip2" size = "3"  maxlength="3" value="${my.zip2 }">
<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
���θ� :
<input type="text" id="sample4_roadAddress" name="address1" placeholder="���θ��ּ�" size = 40 value="${my.address1 }"><br>
������ :
<input type="text" id="sample4_jibunAddress" name="address2" placeholder="�����ּ�" size = 40 value="${my.address2 }">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

                // ���������� ���� ��� �߰��Ѵ�.
                if(data.bname !== ''){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� ���� ��� �߰��Ѵ�.
                if(data.buildingName !== ''){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("sample4_postcode1").value = data.postcode1;
                document.getElementById("sample4_postcode2").value = data.postcode2;
                document.getElementById("sample4_roadAddress").value = fullRoadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById("guide").innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById("guide").innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';

                } else {
                    document.getElementById("guide").innerHTML = '';
                }
            }
        }).open();
    }   
</script>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>�����</td>
<td>
	<select name="bank">		
		<option value="${my.bank }">${my.bank }</option>
		<option value="">����</option>
		<option value="SC��������">SC��������</option>
		<option value="�泲����">�泲����</option>
		<option value="��������">��������</option>
		<option value="��������">��������</option>
		<option value="�������">�������</option>
		<option value="����">����</option>
		<option value="�뱸����">�뱸����</option>
		<option value="�λ�����">�λ�����</option>
		<option value="�������">�������</option>
		<option value="�������ݰ�">�������ݰ�</option>
		<option value="����">����</option>
		<option value="��������">��������</option>
		<option value="����">����</option>
		<option value="��Ƽ����">��Ƽ����</option>
		<option value="��ȯ����">��ȯ����</option>
		<option value="�츮����">�츮����</option>
		<option value="��ü��">��ü��</option>
		<option value="��������">��������</option>
		<option value="��������">��������</option>
		<option value="�ϳ�����">�ϳ�����</option>
	</select>
</td>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<td>���¹�ȣ</td><td><input type=text size="12" maxlength="15" name="account" value="${my.account }"></td>
</tr>

<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
</table>

<br>


<center>
<input style="background-color: '#C2E2E8'; width: '50pt';" type="submit" value="�� ��"/>&nbsp;&nbsp;
<input style="background-color: '#C2E2E8'; " type="button" value="��������" onclick="location.href='/toto/top/main.to'">
</center>
</form>


 </div> 
</body>
</html>