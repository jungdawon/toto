<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />

<html>
<head>
<title>������ �ºν�</title>
</head>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>

<body>
<div id="text">
<form id="proto" name="proto" method="post" action="/toto/proto/protoComplete.to">
<input type="hidden" id="listcnt" value="${listcnt }">
<input type="hidden" id="idchk" value="${idchk }">
<c:if test="${sessionScope.memId!=null}">
	<input type="hidden" name="id" value="${sessionScope.memId}">
</c:if>
<table align="center" border="0">
<tr>
<td>
	<div style="height:315px; overflow:auto">
	<table align="center" border="1">
		<tr align="center">	
			<td width="60">����ȣ</td>
			<td width="130">�����Ͻ�</td>
			<td width="50">��ȸ��</td>
			<td width="190">Ȩ�� vs ������</td>
			<td width="150" colspan="3">����</td>
		</tr>
		<c:if test="${listcnt == 0 }">
		<tr>
		<td colspan="5" align="center">�� �ش� ȸ���� �ش��ϴ� ��Ⱑ �����ϴ�.</td>
		</tr>
		</c:if>
		<c:forEach items="${pro}" var="pro" varStatus="varStatus">
		<tr align="center" data-group="rate${varStatus.count}" id="${varStatus.count }" onmouseover='this.style.backgroundColor="#FAED7D";' onmouseout='this.style.backgroundColor="white";'>	
			<td>${pro.num}</td>
			<td><fmt:formatDate value="${pro.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
			<td>${pro.league}</td>
			<td>${pro.home} vs ${pro.away}</td>
			<td width="50" align="right">${pro.win_rate} 
				<input type="checkbox" name="rate${varStatus.count}" value="${pro.num}_${pro.win_rate}_��_${pro.home}_${varStatus.count}"></td>
			<td width="50" align="right">${pro.draw_rate} 
				<input type="checkbox" name="rate${varStatus.count}" value="${pro.num}_${pro.draw_rate}_��_${pro.home}_${varStatus.count}"></td>
			<td width="50" align="right">${pro.lose_rate} 
				<input type="checkbox" name="rate${varStatus.count}" value="${pro.num}_${pro.lose_rate}_��_${pro.home}_${varStatus.count}"></td>
		</tr>
		</c:forEach>
	</table>
	</div>
</td>
<td>
	<table border="1">
	<tr>
	<td></td><td></td><td></td><td></td>
	</tr>
	<tr height="210">
	<td colspan="4">
	<div style="height: 200px;" id="contents"></div>
	</td>
	</tr>
	<tr>
	<td colspan="4">���� : ���� <input type="text" style="border: 0;font-size: 15pt;color: orange;text-align: center;" id="mcount" name="mcount" readonly="readonly" size="1">���� ��⸦ �����ϼ̽��ϴ�.</td>
	</tr>
	<tr>
	<td colspan="2">���������߹���</td>
	<td colspan="2" align="right">
	<input style="border: 0;" type="text" readonly="readonly" id="exrate" name="exrate" size="5">��</td>
	</tr>
	<tr>
	<td colspan="2">�����ñݾ�</td>
	<td  colspan="2" align="right">
	<input style="ime-mode:disabled;text-align: right;" onkeyPress="if((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" type="text"  id="bet" name="bet" maxlength="6" size="6" onkeyup="on();" onblur="on();">��</td>
	</tr>
	<tr>
	<td colspan="2">���������߱�</td>
	<td colspan="2" align="right">
	<input style="text-align: right;border: 0;" type="text" id="exprofits" name="exprofits" size="11" readonly="readonly" required="required">��</td>
	</tr>
	</table>
</td>
</tr>
<tr>
	<td align="right">
	<select id="choice" name="choice">
		<c:if test="${gameData.league != null}">
		<option value="${gameData.league}">${gameData.league}</option>
		</c:if>
		<c:if test="${gameData.league == null}">
		<option value="��ü">��ü</option>
		</c:if>
		<option value="K����">K����</option>
		<option value="KBO">KBO</option>
		<option value="KBL">KBL</option>
		<option value="��ü">��ü</option>
	</select>
	<input type="button" value="�� ��" onclick="selectLeague(this.form);">&nbsp;&nbsp;
	</td>
	<td align="right">
	<input type="submit" value="�� ��" onclick="return chk();">&nbsp;&nbsp;
	</td>
</tr>
</table>
<input type="hidden" name="roundtype" value="${gameData.round}">
<input type="hidden" name="turnnum" value="${gameData.turn}">
</form>
</div>
</body>
</html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script>
//����
var listcnt = document.getElementById("listcnt");
var arr = new Array(listcnt);
for(i=0; i<listcnt.value+1;i++){
	arr[i]=1;
}
var exrate = document.getElementById("exrate");
var bet = document.getElementById("bet");
var exprofits = document.getElementById("exprofits");
var mcount = document.getElementById("mcount");
var idchk = document.getElementById("idchk");
//�غ�
$(document).ready(function() {
	//���ٴ� �ϳ� ����
	onlyOneChk('rate1');
    onlyOneChk('rate2');
    onlyOneChk('rate3');
    onlyOneChk('rate4');
    onlyOneChk('rate5');
    onlyOneChk('rate6');
    onlyOneChk('rate7');
    onlyOneChk('rate8');
    onlyOneChk('rate9');
    onlyOneChk('rate10');
    onlyOneChk('rate11');
    onlyOneChk('rate12');
    onlyOneChk('rate13');
    onlyOneChk('rate14');
    onlyOneChk('rate15');
    onlyOneChk('rate16');
    onlyOneChk('rate17');
    onlyOneChk('rate18');
    onlyOneChk('rate19');
    onlyOneChk('rate20');
    //10����������
    $(":checkbox").change(function() {
		var checkedCount = $(":checkbox:checked").length; // üũ�� ����
		mcount.value = checkedCount;
		if(checkedCount == 10){
			$(":checkbox:not(:checked)").prop("disabled", "disabled");
		} else{
			$(":checkbox").removeProp("disabled");
		}	
	});
});
//���ٴ� �ϳ����� ���
function onlyOneChk(name){ 
    	var chk = $('[data-group="'+ name +'"]').find('input[type="checkbox"]');	
    	chk.change(function(){
        	if($(this).is(':checked')){
    			var thisValue = $(this).val();
    			var val = thisValue.split("_");
    			var num = val[0];
    			var rate = val[1];
    			var betr = val[2];
    			var home = val[3];
    			var cnt = val[4];
    			$('#contents').append($('<div id='+num+betr+' name='+rate+'>'+'&nbsp;&nbsp;'+num+'&nbsp;&nbsp;&nbsp;&nbsp;'+home+
    				'&nbsp;&nbsp;&nbsp;&nbsp;'
    									+betr+'&nbsp;&nbsp;('+rate+')'+'</div>'));
    			if(betr == "��"){
    				$('#'+num+"��").remove();
    				$('#'+num+"��").remove();
    			} else if(betr == "��"){
    				$('#'+num+"��").remove();
    				$('#'+num+"��").remove();
    			} else{
    				$('#'+num+"��").remove();
    				$('#'+num+"��").remove();
    			}
    			chk.not(this).prop('checked', false);
    			arr[cnt]=$('#'+num+betr).attr("name");
        	} else if($(this).prop('checked', false)){
    			var thisValue = $(this).val();
    			var val = thisValue.split("_");
    			var num = val[0];
    			var rate = val[1];
    			var betr = val[2];
    			var home = val[3];
    			var cnt = val[4];
    			$('#'+num+betr).remove();
    			arr[cnt]=1;
    		}
        	var mul=1;
        	for(i=1; i<listcnt.value+1;i++){
				mul = mul*arr[i]
			}
        	exrate.value = Math.ceil(mul * 10) /10;
        	exprofits.value="";
        	if(bet.value != ""){
        		exprofits.value = Math.round(bet.value * exrate.value);	
        	}
	});
};

function on(){
	exprofits.value = Math.round(bet.value * exrate.value);	
}
function chk(){
	var leng = bet.value.substring(bet.value.length-2,bet.value.length);
	if(mcount.value < 2){
		alert("���� �ּ� 2��� �̻� �����ؾ��մϴ�.");
		return false;
	} else{
		if(bet.value < 100){
			alert("100�� �̻� ���Ű� �����մϴ�.");	
			bet.value="";
			exprofits.value="";
			return false;
		}
		if(bet.value > 100000){
			alert("10���� ���ϸ� ���Ű� �����մϴ�.");	
			bet.value="";
			exprofits.value="";
			return false;
		} else{
			if(leng != "00"){
				alert("100�������� ���Ű� �����մϴ�.");
				bet.value="";
				exprofits.value="";
				return false;
			}
		}
		if(idchk.value == 0){
			alert("�α����� �ʿ��մϴ�.");
			window.open('../member/login2.to','','location=no scrollbars=0, toolbar=0, resizable=0, width=420, height=240');
			return false;
		}
	}
}
function selectLeague(input){
	var choice = document.getElementById("choice");
	location.href='/toto/proto/gameBuy.to?roundtype='+input.roundtype.value+'&turnnum='+input.turnnum.value+'&league='+choice.value;
}
</script>