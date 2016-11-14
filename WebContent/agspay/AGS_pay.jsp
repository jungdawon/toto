<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/agspay/payMenu.jsp" %>

<br />
<br />
<br />
<%@ page import="java.security.MessageDigest" %>
<%
	/* 해쉬 암호화 적용( StoreId + OrdNo + Amt)
	 * StoreId          : 상점아이디		form.StoreId.value
	 * OrdNo          : 주문번호			form.OrdNo.value
	 * Amt      		 : 금액					form.Amt.value
	 * MD5 해쉬데이터 암호화 검증을 위해
	 */
	 
	 /*
	 String StoreId = request.getParameter("StoreId");
	 String OrdNo = request.getParameter("OrdNo");
	 String Amt = request.getParameter("Amt");
	*/
	 String StoreId = "aegis";
	 String OrdNo = "1000000001";
	 String Amt = "1000";
	 
	 StringBuffer sb = new StringBuffer();
	 sb.append(StoreId);
	 sb.append(OrdNo);
	 sb.append(Amt);
	 
	 byte[] bNoti = sb.toString().getBytes();
	 MessageDigest md = MessageDigest.getInstance("MD5");
	 byte[] digest = md.digest(bNoti);

	 StringBuffer strBuf = new StringBuffer();
	 for (int i=0 ; i < digest.length ; i++) {
		 int c = digest[i] & 0xff;
		 if (c <= 15){
			 strBuf.append("0");
		 }
		 strBuf.append(Integer.toHexString(c));
	 }

	 String AGS_HASHDATA = strBuf.toString();
 
%>

<html>
<head>
<title>올더게이트</title>
<style type="text/css">
<!--
body { font-family:"돋움"; font-size:9pt; color:#333333; font-weight:normal; letter-spacing:0pt; line-height:180%; }
td { font-family:"돋움"; font-size:9pt; color:#333333; font-weight:normal; letter-spacing:0pt; line-height:180%; }
.clsright { padding-right:10px; text-align:right; }
.clsleft { padding-left:10px; text-align:left; }
-->
</style>
<script language=javascript src="http://www.allthegate.com/plugin/AGSWallet.js"></script>
<!-- ※ UTF8 언어 형식으로 페이지 제작시 아래 경로의 js 파일을 사용할 것!! -->
<!-- script language=javascript src="http://www.allthegate.com/plugin/AGSWallet_utf8.js"></script -->
<!-- Euc-kr 이 아닌 다른 charset 을 이용할 경우에는 AGS_pay_ing(결제처리페이지) 상단의 
	[ AGS_pay.html 로 부터 넘겨받을 데이터파라미터 ] 선언부에서 파라미터 값들을 euc-kr로
	인코딩 변환을 해주시기 바랍니다.
<!-- ※ SSL 보안을 이용할 경우 아래 경로의 js 파일을 사용할 것!! -->
<!-- script language=javascript src="https://www.allthegate.com/plugin/AGSWallet_ssl.js"></script -->
<script language=javascript>
<!--
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 올더게이트 플러그인 설치를 확인합니다.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

StartSmartUpdate();  

function Pay(form){
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// MakePayMessage() 가 호출되면 올더게이트 플러그인이 화면에 나타나며 Hidden 필드
	// 에 리턴값들이 채워지게 됩니다.
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if(form.Flag.value == "enable"){
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 입력된 데이타의 유효성을 검사합니다.
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		if(Check_Common(form) == true){
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// 올더게이트 플러그인 설치가 올바르게 되었는지 확인합니다.
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			if(document.AGSPay == null || document.AGSPay.object == null){
				alert("플러그인 설치 후 다시 시도 하십시오.");
			}else{
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// 올더게이트 플러그인 설정값을 동적으로 적용하기 JavaScript 코드를 사용하고 있습니다.
				// 상점설정에 맞게 JavaScript 코드를 수정하여 사용하십시오.
				//
				// [1] 일반/무이자 결제여부
				// [2] 일반결제시 할부개월수
				// [3] 무이자결제시 할부개월수 설정
				// [4] 인증여부
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// [1] 일반/무이자 결제여부를 설정합니다.
				//
				// 할부판매의 경우 구매자가 이자수수료를 부담하는 것이 기본입니다. 그러나,
				// 상점과 올더게이트간의 별도 계약을 통해서 할부이자를 상점측에서 부담할 수 있습니다.
				// 이경우 구매자는 무이자 할부거래가 가능합니다.
				//
				// 예제)
				// 	(1) 일반결제로 사용할 경우
				// 	form.DeviId.value = "9000400001";
				//
				// 	(2) 무이자결제로 사용할 경우
				// 	form.DeviId.value = "9000400002";
				//
				// 	(3) 만약 결제 금액이 100,000원 미만일 경우 일반할부로 100,000원 이상일 경우 무이자할부로 사용할 경우
				// 	if(parseInt(form.Amt.value) < 100000)
				//		form.DeviId.value = "9000400001";
				// 	else
				//		form.DeviId.value = "9000400002";
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				form.DeviId.value = "9000400001";
				
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// [2] 일반 할부기간을 설정합니다.
				// 
				// 일반 할부기간은 2 ~ 12개월까지 가능합니다.
				// 0:일시불, 2:2개월, 3:3개월, ... , 12:12개월
				// 
				// 예제)
				// 	(1) 할부기간을 일시불만 가능하도록 사용할 경우
				// 	form.QuotaInf.value = "0";
				//
				// 	(2) 할부기간을 일시불 ~ 12개월까지 사용할 경우
				//		form.QuotaInf.value = "0:3:4:5:6:7:8:9:10:11:12";
				//
				// 	(3) 결제금액이 일정범위안에 있을 경우에만 할부가 가능하게 할 경우
				// 	if((parseInt(form.Amt.value) >= 100000) || (parseInt(form.Amt.value) <= 200000))
				// 		form.QuotaInf.value = "0:2:3:4:5:6:7:8:9:10:11:12";
				// 	else
				// 		form.QuotaInf.value = "0";
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				//결제금액이 5만원 미만건을 할부결제로 요청할경우 결제실패
				if(parseInt(form.Amt.value) < 50000)
					form.QuotaInf.value = "0";
				else
					form.QuotaInf.value = "0:2:3:4:5:6:7:8:9:10:11:12";
				
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// [3] 무이자 할부기간을 설정합니다.
				// (일반결제인 경우에는 본 설정은 적용되지 않습니다.)
				// 
				// 무이자 할부기간은 2 ~ 12개월까지 가능하며, 
				// 올더게이트에서 제한한 할부 개월수까지만 설정해야 합니다.
				// 
				// 100:BC
				// 200:국민
				// 201:NH
				// 300:외환
				// 310:하나SK
				// 400:삼성
				// 500:신한
				// 800:현대
				// 900:롯데
				// 
				// 예제)
				// 	(1) 모든 할부거래를 무이자로 하고 싶을때에는 ALL로 설정
				// 	form.NointInf.value = "ALL";
				//
				// 	(2) 국민카드 특정개월수만 무이자를 하고 싶을경우 샘플(2:3:4:5:6개월)
				// 	form.NointInf.value = "200-2:3:4:5:6";
				//
				// 	(3) 외환카드 특정개월수만 무이자를 하고 싶을경우 샘플(2:3:4:5:6개월)
				// 	form.NointInf.value = "300-2:3:4:5:6";
				//
				// 	(4) 국민,외환카드 특정개월수만 무이자를 하고 싶을경우 샘플(2:3:4:5:6개월)
				// 	form.NointInf.value = "200-2:3:4:5:6,300-2:3:4:5:6";
				//	
				//	(5) 무이자 할부기간 설정을 하지 않을 경우에는 NONE로 설정
				//	form.NointInf.value = "NONE";
				//
				//	(6) 전카드사 특정개월수만 무이자를 하고 싶은경우(2:3:6개월)
				//	form.NointInf.value = "100-2:3:6,200-2:3:6,201-2:3:6,300-2:3:6,310-2:3:6,400-2:3:6,500-2:3:6,800-2:3:6,900-2:3:6";
				//
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////

				if(form.DeviId.value == "9000400002")
					form.NointInf.value = "ALL";
				   
				if(MakePayMessage(form) == true){
					Disable_Flag(form);
					
					var openwin = window.open("AGS_progress.html","popup","width=300,height=160"); //"지불처리중"이라는 팝업창연결 부분
					
					form.submit();
				}else{
					alert("지불에 실패하였습니다.");// 취소시 이동페이지 설정부분
				}
			}
		}
	}
}

function Enable_Flag(form){
        form.Flag.value = "enable"
}

function Disable_Flag(form){
        form.Flag.value = "disable"
}

function Check_Common(form){
	if(form.StoreId.value == ""){
		alert("상점아이디를 입력하십시오.");
		return false;
	}
	else if(form.StoreNm.value == ""){
		alert("상점명을 입력하십시오.");
		return false;
	}
	else if(form.OrdNo.value == ""){
		alert("주문번호를 입력하십시오.");
		return false;
	}
	else if(form.ProdNm.value == ""){
		alert("상품명을 입력하십시오.");
		return false;
	}
	else if(form.Amt.value == ""){
		alert("금액을 입력하십시오.");
		return false;
	}
	else if(form.MallUrl.value == ""){
		alert("상점URL을 입력하십시오.");
		return false;
	}
	return true;
}

function Display(form){
	if(form.Job.value == "onlycard" || form.TempJob.value == "onlycard"){
		document.all.card_hp.style.display= "";
		document.all.card.style.display= "";
		document.all.hp.style.display= "none";
		document.all.virtual.style.display= "none";
	}else if(form.Job.value == "onlyhp" || form.TempJob.value == "onlyhp"){
		document.all.card_hp.style.display= "";
		document.all.card.style.display= "none";
		document.all.hp.style.display= "";
		document.all.virtual.style.display= "none";
	}else if(form.Job.value == "onlyvirtual" || form.TempJob.value == "onlyvirtual" ){
		document.all.card_hp.style.display= "none";
		document.all.card.style.display= "";
		document.all.hp.style.display= "none";
		document.all.virtual.style.display= "";
	}else if(form.Job.value == "onlyiche" || form.TempJob.value == "onlyiche"  ){
		document.all.card_hp.style.display= "none";
		document.all.card.style.display= "none";
		document.all.hp.style.display= "none";
		document.all.virtual.style.display= "none";
	}else{
		document.all.card_hp.style.display= "";
		document.all.card.style.display= "";
		document.all.hp.style.display= "";
		document.all.virtual.style.display= "";
	}
}
function chk(){
	var Amt = document.getElementById("Amt");
	if(Amt.value < 10000 && Amt.value != ''){
		alert("1만원 이상 구매가능합니다.");
		Amt.value = '';
		return false;
	}
}
-->
</script>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
</head>
<!-- 주의) onload 이벤트에서 아래와 같이 javascript 함수를 호출하지 마십시오. -->
<!-- onload="javascript:Enable_Flag(frmAGS_pay);Pay(frmAGS_pay);" -->
<body topmargin=0 leftmargin=0 rightmargin=0 bottommargin=0 onload="javascript:Enable_Flag(frmAGS_pay);">

<div id="text" >
<form name=frmAGS_pay method=post action=AGS_pay_ing.to>
<table border=0 width=100% height=100% cellpadding=0 cellspacing=0>
		<input type=hidden style=width:100px name=StoreId maxlength=20 value="aegis"><!-- 상점아이디 -->
		<input type=hidden style=width:100px name=OrdNo maxlength=40 value="1000000001"><!-- 주문번호 -->
		<input type=hidden style=width:100px name=OrdNm maxlength=40 value="${my.name}"><!--  -->
		<input type=hidden style=width:100px name=OrdPhone maxlength=21 value="02-111-1111"><!-- 주문자연락처 -->
		<input type=hidden style=width:300px name=OrdAddr maxlength=100 value="서울시 강남구 청담동"><!-- 주문자주소 -->
		<input type=hidden style=width:100px name=RcpNm maxlength=40 value="김길동"><!-- 수신자명 -->
		<input type=hidden style=width:100px name=RcpPhone maxlength=21 value="02-111-1111"><!-- 수신자연락처 -->
		<input type=hidden style=width:300px name=DlvAddr maxlength=100 value="서울시 강남구 청담동"><!-- 배송지주소 -->
		<input type=hidden style=width:300px name=Remark maxlength=350 value="오후에 배송요망"><!-- 기타요구사항 -->
		<input type=hidden style=width:300px name=CardSelect value=""></td><!-- 카드사선택 -->
		<input type=hidden style=width:300px name=StoreNm value="ToTo"><!-- 상점명 -->
		<input type=hidden style=width:300px name=ProdNm maxlength=300 value="토토 충전"><!-- 상품명 -->
		<input type=hidden style=width:300px name=MallUrl value="http://www.allthegate.com"><!-- 상점URL -->
		<input type=hidden style=width:300px name=UserEmail maxlength=50 value="test@test.com"><!-- 주문자이메일 -->
		<input type=hidden style=width:400px name=ags_logoimg_url maxlength=200 value="http://www.allthegate.com/hyosung/images/aegis_logo.gif"><!-- 상점로고이미지 URL -->
		<!-- 제목은 1컨텐츠당 5자 이내이며, 상점명;상품명;결제금액;제공기간; 순으로 입력해 주셔야 합니다. -->
		<!-- 입력 예)업체명;판매상품;계산금액;제공기간; -->
		<input type=hidden style=width:300px name=SubjectData value="업체명;판매상품;계산금액;2012.09.01 ~ 2012.09.30;"><!-- 결제창 제목 -->
		<!--<td width=170 class=clsleft>예)업체명;판매상품;계산금액;제공기간;</td> -->
		<input type=hidden style=width:100px name=UserId maxlength=20 value="${sessionScope.memId}"><!-- 회원ID -->
		<input type=hidden style=width:100px name=HP_ID maxlength=10 value=""><!-- CP아이디 -->
		<input type=hidden style=width:100px name=HP_PWD maxlength=10 value=""><!-- CP비밀번호 -->
		<input type=hidden style=width:100px name=HP_SUBID maxlength=10 value=""><!-- SUB_CP아이디 -->
		<input type=hidden style=width:100px name=ProdCode maxlength=10 value=""><!-- 상품코드 -->
		<input type=hidden style=width:300px name=MallPage value="/mall/AGS_VirAcctResult.jsp"><!-- 통보페이지 -->
		<input type=hidden style=width:300px name=VIRTUAL_DEPODT value=""><!-- 가상계좌입금일 -->
	<tr>
		<td align=center>
		<table width=650 border=0 cellpadding=0 cellspacing=0>
			<tr><td>&nbsp;</td></tr>
			<tr><td><hr></td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/1.gif"/>
				<img border="0" src="/toto/agspay/image/2.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/3.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/4.gif"/>
			</td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/5.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td class=clsleft><b>충전 페이지</b></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class=clsleft>
				1) 1만원부터 충전이 가능합니다. (입금한도: 1회 100만원)<br />
				2) 실시간 계좌이체(공인인증서 인증)으로 충전하려면 공인인증서가 필요하며, 공인인증서는 거래 은행에서 <br />
				3) 인터넷뱅킹 신청 후 발급받으실 수 있습니다. <br />
				4) 결제대행사는 '이니시스' 또는 '한국사이버결제'를 이용합니다. <br />
				5) 결제대행 수수료는 베트맨에서 부담합니다. <br />
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td><hr></td></tr>
			<tr>
				<td>
				<table width=650 border=0 cellpadding=0 cellspacing=0>

					<tr>
						<td width=170 class=clsleft><img src="/toto/agspay/image/step1.gif" /></td>
						<td width=300>
						<!-- 계좌이체,핸드폰결제를 사용하지 않는 상점은 지불방법을 꼭 신용카드(전용)으로 설정하시기 바랍니다. -->
						<!-- 신용카드만 사용하도록 연동 <input type=hidden name=Job value="onlycard"> -->
						<!-- 계좌이체만 사용하도록 연동 <input type=hidden name=Job value="onlyiche"> -->
						<!-- 핸드폰결제만 사용하도록 연동 <input type=hidden name=Job value="onlyhp"> -->
						<select name=Job style=width:150px onchange="javascript:Display(frmAGS_pay);">
							<option value="신용카드">신용카드
							<option value="계좌이체">계좌이체
							<option value="가상계좌">가상계좌
							<option value="핸드폰결제">핸드폰결제
							<option value="ARS">ARS
						</select>
						</td>
						<td width=180></td>
					</tr>
						
					<tr>
						<td class=clsleft><img src="/toto/agspay/image/step2.gif" /></td>
						<td><input type=text style=width:100px id=Amt name=Amt maxlength=12 value="1000" onBlur="chk();"><img src="/toto/agspay/image/text_won.gif" /></td>
					</tr>
				</table>
			<tr><td><hr></td></tr>
			<tr><td class=clsleft>
				<img border="0" src="/toto/agspay/image/6.gif"/>
			</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td align=center>
				<a href="javascript:Pay(frmAGS_pay);"><img border="0" src="/toto/agspay/image/7.gif"/></a>
				<!--
				<a href="javascript:Pay(frmAGS_pay);"><img src="button.gif" border="0"></a>
				-->
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
		</table>
		</td>
	</tr>
</table>



<!-- 스크립트 및 플러그인에서 값을 설정하는 Hidden 필드  !!수정을 하시거나 삭제하지 마십시오-->
<!-- 각 결제 공통 사용 변수 -->
<input type=hidden name=Flag value="">				<!-- 스크립트결제사용구분플래그 -->
<input type=hidden name=AuthTy value="">			<!-- 결제형태 -->
<input type=hidden name=SubTy value="">				<!-- 서브결제형태 -->
<input type="hidden" name="AGS_HASHDATA" value="<%=AGS_HASHDATA%>">		<!-- 전역 해쉬 변수 -->

<!-- 신용카드 결제 사용 변수 -->
<input type=hidden name=DeviId value="">			<!-- (신용카드공통)		단말기아이디 -->
<input type=hidden name=QuotaInf value="0">			<!-- (신용카드공통)		일반할부개월설정변수 -->
<input type=hidden name=NointInf value="NONE">		<!-- (신용카드공통)		무이자할부개월설정변수 -->
<input type=hidden name=AuthYn value="">			<!-- (신용카드공통)		인증여부 -->
<input type=hidden name=Instmt value="">			<!-- (신용카드공통)		할부개월수 -->
<input type=hidden name=partial_mm value="">		<!-- (ISP사용)			일반할부기간 -->
<input type=hidden name=noIntMonth value="">		<!-- (ISP사용)			무이자할부기간 -->
<input type=hidden name=KVP_RESERVED1 value="">		<!-- (ISP사용)			RESERVED1 -->
<input type=hidden name=KVP_RESERVED2 value="">		<!-- (ISP사용)			RESERVED2 -->
<input type=hidden name=KVP_RESERVED3 value="">		<!-- (ISP사용)			RESERVED3 -->
<input type=hidden name=KVP_CURRENCY value="">		<!-- (ISP사용)			통화코드 -->
<input type=hidden name=KVP_CARDCODE value="">		<!-- (ISP사용)			카드사코드 -->
<input type=hidden name=KVP_SESSIONKEY value="">	<!-- (ISP사용)			암호화코드 -->
<input type=hidden name=KVP_ENCDATA value="">		<!-- (ISP사용)			암호화코드 -->
<input type=hidden name=KVP_CONAME value="">		<!-- (ISP사용)			카드명 -->
<input type=hidden name=KVP_NOINT value="">			<!-- (ISP사용)			무이자/일반여부(무이자=1, 일반=0) -->
<input type=hidden name=KVP_QUOTA value="">			<!-- (ISP사용)			할부개월 -->
<input type=hidden name=CardNo value="">			<!-- (안심클릭,일반사용)	카드번호 -->
<input type=hidden name=MPI_CAVV value="">			<!-- (안심클릭,일반사용)	암호화코드 -->
<input type=hidden name=MPI_ECI value="">			<!-- (안심클릭,일반사용)	암호화코드 -->
<input type=hidden name=MPI_MD64 value="">			<!-- (안심클릭,일반사용)	암호화코드 -->
<input type=hidden name=ExpMon value="">			<!-- (일반사용)			유효기간(월) -->
<input type=hidden name=ExpYear value="">			<!-- (일반사용)			유효기간(년) -->
<input type=hidden name=Passwd value="">			<!-- (일반사용)			비밀번호 -->
<input type=hidden name=SocId value="">				<!-- (일반사용)			주민등록번호/사업자등록번호 -->

<!-- 계좌이체 결제 사용 변수 -->
<input type=hidden name=ICHE_OUTBANKNAME value="">	<!-- 이체계좌은행명 -->
<input type=hidden name=ICHE_OUTACCTNO value="">	<!-- 이체계좌예금주주민번호 -->
<input type=hidden name=ICHE_OUTBANKMASTER value=""><!-- 이체계좌예금주 -->
<input type=hidden name=ICHE_AMOUNT value="">		<!-- 이체금액 -->

<!-- 핸드폰 결제 사용 변수 -->
<input type=hidden name=HP_SERVERINFO value="">		<!-- 서버정보 -->
<input type=hidden name=HP_HANDPHONE value="">		<!-- 핸드폰번호 -->
<input type=hidden name=HP_COMPANY value="">		<!-- 통신사명(SKT,KTF,LGT) -->
<input type=hidden name=HP_IDEN value="">			<!-- 인증시사용 -->
<input type=hidden name=HP_IPADDR value="">			<!-- 아이피정보 -->

<!-- 가상계좌 결제 사용 변수 -->
<input type=hidden name=ZuminCode value="">			<!-- 가상계좌입금자주민번호 -->
<input type=hidden name=VIRTUAL_CENTERCD value="">	<!-- 가상계좌은행코드 -->
<input type=hidden name=VIRTUAL_NO value="">		<!-- 가상계좌번호 -->

<!-- ARS 결제 사용 변수 -->
<input type=hidden name=ARS_PHONE value="">			<!-- ARS번호 -->
<input type=hidden name=ARS_NAME value="">			<!-- 전화가입자명 -->

<input type=hidden name=mTId value="">				

<!-- 에스크로 결제 사용 변수 -->
<input type=hidden name=ES_SENDNO value="">			<!-- 에스크로전문번호 -->

<!-- 계좌이체(소켓) 결제 사용 변수 -->
<input type=hidden name=ICHE_SOCKETYN value="">		<!-- 계좌이체(소켓) 사용 여부 -->
<input type=hidden name=ICHE_POSMTID value="">		<!-- 계좌이체(소켓) 이용기관주문번호 -->
<input type=hidden name=ICHE_FNBCMTID value="">		<!-- 계좌이체(소켓) FNBC거래번호 -->
<input type=hidden name=ICHE_APTRTS value="">		<!-- 계좌이체(소켓) 이체 시각 -->
<input type=hidden name=ICHE_REMARK1 value="">		<!-- 계좌이체(소켓) 기타사항1 -->
<input type=hidden name=ICHE_REMARK2 value="">		<!-- 계좌이체(소켓) 기타사항2 -->
<input type=hidden name=ICHE_ECWYN value="">		<!-- 계좌이체(소켓) 에스크로여부 -->
<input type=hidden name=ICHE_ECWID value="">		<!-- 계좌이체(소켓) 에스크로ID -->
<input type=hidden name=ICHE_ECWAMT1 value="">		<!-- 계좌이체(소켓) 에스크로결제금액1 -->
<input type=hidden name=ICHE_ECWAMT2 value="">		<!-- 계좌이체(소켓) 에스크로결제금액2 -->
<input type=hidden name=ICHE_CASHYN value="">		<!-- 계좌이체(소켓) 현금영수증발행여부 -->
<input type=hidden name=ICHE_CASHGUBUN_CD value="">	<!-- 계좌이체(소켓) 현금영수증구분 -->
<input type=hidden name=ICHE_CASHID_NO value="">	<!-- 계좌이체(소켓) 현금영수증신분확인번호 -->

<!-- 계좌이체-텔래뱅킹(소켓) 결제 사용 변수 -->
<input type=hidden name=ICHEARS_SOCKETYN value="">	<!-- 텔레뱅킹계좌이체(소켓) 사용 여부 -->
<input type=hidden name=ICHEARS_ADMNO value="">		<!-- 텔레뱅킹계좌이체 승인번호 -->
<input type=hidden name=ICHEARS_POSMTID value="">	<!-- 텔레뱅킹계좌이체 이용기관주문번호 -->
<input type=hidden name=ICHEARS_CENTERCD value="">	<!-- 텔레뱅킹계좌이체 은행코드 -->
<input type=hidden name=ICHEARS_HPNO value="">		<!-- 텔레뱅킹계좌이체 휴대폰번호 -->

<!-- 스크립트 및 플러그인에서 값을 설정하는 Hidden 필드  !!수정을 하시거나 삭제하지 마십시오-->

</form>
</div>
</body>
</html>   