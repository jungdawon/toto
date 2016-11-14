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
<title>회원정보수정</title>
<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
      
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pwcheck.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.name.value) {
            alert("사용자 이름을 입력하세요");
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
<center><h1>회원정보수정</h1></center>

<form method="post" name="userinput" action="/toto/member/myInforPro.to" onSubmit="return checkIt()">
<input type="hidden" name="id" value="${my.id }"/>
<table align="center" width="550" border="0">
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="30">
<td width="150" >아이디</td>
<td>
${my.id }
<!-- <input type="button" style="background-color: '#C2E2E8'; " name="confirm_id" value="중복확인" OnClick="openConfirmid(this.form)"> -->
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>비밀번호</td>
<td><input type="password" align="center" name="pw"/>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>비밀번호 확인</td>
<td><input type="password" align="center" name="pwcheck"/>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>이름</td>
<td><input type="text" align="center" name="name"  value="${my.name }"/>
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>

<tr height="30">
<td>휴대전화</td>
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
      <td width="200">주소</td>
      <td width="400"> 
<input type="text" id="sample4_postcode1" name="zip1" size = "3" maxlength="3" value="${my.zip1 }"> -
<input type="text" id="sample4_postcode2" name="zip2" size = "3"  maxlength="3" value="${my.zip2 }">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
도로명 :
<input type="text" id="sample4_roadAddress" name="address1" placeholder="도로명주소" size = 40 value="${my.address1 }"><br>
지번명 :
<input type="text" id="sample4_jibunAddress" name="address2" placeholder="지번주소" size = 40 value="${my.address2 }">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample4_postcode1").value = data.postcode1;
                document.getElementById("sample4_postcode2").value = data.postcode2;
                document.getElementById("sample4_roadAddress").value = fullRoadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById("guide").innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById("guide").innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

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
<td>은행명</td>
<td>
	<select name="bank">		
		<option value="${my.bank }">${my.bank }</option>
		<option value="">없음</option>
		<option value="SC제일은행">SC제일은행</option>
		<option value="경남은행">경남은행</option>
		<option value="광주은행">광주은행</option>
		<option value="국민은행">국민은행</option>
		<option value="기업은행">기업은행</option>
		<option value="농협">농협</option>
		<option value="대구은행">대구은행</option>
		<option value="부산은행">부산은행</option>
		<option value="산업은행">산업은행</option>
		<option value="새마을금고">새마을금고</option>
		<option value="수협">수협</option>
		<option value="신한은행">신한은행</option>
		<option value="신협">신협</option>
		<option value="씨티은행">씨티은행</option>
		<option value="외환은행">외환은행</option>
		<option value="우리은행">우리은행</option>
		<option value="우체국">우체국</option>
		<option value="전북은행">전북은행</option>
		<option value="제주은행">제주은행</option>
		<option value="하나은행">하나은행</option>
	</select>
</td>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<td>계좌번호</td><td><input type=text size="12" maxlength="15" name="account" value="${my.account }"></td>
</tr>

<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
</table>

<br>


<center>
<input style="background-color: '#C2E2E8'; width: '50pt';" type="submit" value="완 료"/>&nbsp;&nbsp;
<input style="background-color: '#C2E2E8'; " type="button" value="메인으로" onclick="location.href='/toto/top/main.to'">
</center>
</form>


 </div> 
</body>
</html>