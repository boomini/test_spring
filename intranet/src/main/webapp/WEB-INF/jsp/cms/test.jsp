<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>LCY 정보시스템 : 사업장 검색 팝업</title>
<%--CSS--%>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.css" />"/>
<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/frm.js"></script>
<script type="text/javascript" src="/js/cmnReady.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<style>
#loading { width: 1168px; height: 675px; border: 1px solid #bcd0e8; background: url(/web/images/main_2018/loading_bg.png); position: absolute; left: 0px; top: 0px; z-index: 30000; text-align: center; letter-spacing: -1px; }
#loading div { margin-top: 260px; font-family: 'notokr-bold'; font-size: 20px; color: #0054a6; }
#loading p { margin-top: 5px; margin-bottom: 20px; }
#loading img {  display: block; margin: 0px auto; }
</style>
<script>

$(function(){
	setComboBoxList("S","yyyy" ,{pType:1});//년도 디폴트
	setComboBoxList("S","yyyy2" ,{pType:1, pStartYear:2005, pEndYear:2020, pAdd : 3});//년도 지정 //pAdd:년도 증가분
	setComboBoxList("S","mm" ,{pType:2});//월
	
	
	
	setComboBoxList("S","selManageCode" ,{pType : 4, ATTR_1:'CMC07312'});//운영여부
	setComboBoxList("S","selMainUseCode" ,{pType : 4, ATTR_1:'CMC07301'});//주용도
	setComboBoxList("S","selPermissStsCode" ,{pType : 4, ATTR_1:'CMC07304'});//허가형태
	setComboBoxList("S","selOwnerguCode" ,{pType : 4, ATTR_1:'CMC07305'});//소유구분
	setComboBoxList("S","selForDrinkCode" ,{pType : 4, ATTR_1:'CMC07302'});//음용여부
	setComboBoxList("S","selMntnCode" ,{pType : 4, ATTR_1:'CMC07315'});//지번
	setComboBoxList("S","selJunghoStsCode" ,{pType : 4, ATTR_1:'CMC07308'});//정보형태
	setComboBoxList("S","selRockguCode" ,{pType : 4, ATTR_1:'CMC07309'});//충적/암반
	setComboBoxList("S","selCloseReasonCode" ,{pType : 4, ATTR_1:'CMC07310'});//폐쇄원인
	setComboBoxList("S","selCloseStsCode" ,{pType : 4, ATTR_1:'CMC07311'});//폐쇄상태
	setComboBoxList("S","selAddnEvenCode" ,{pType : 4, ATTR_1:'CMC09100'});//입력년도(홀/짝)
	setComboBoxList("S","selGijunCode" ,{pType : 4, ATTR_1:'CMC09200'});//지역구분
	setComboBoxList("S","selGolfStateCode" ,{pType : 4, ATTR_1:'CMC07318'});//골프장 상태
	
	
	
	
	setComboBoxList("S","selGigwanCode" ,{pType : 6, ATTR_1:'1'});//오염
	setComboBoxList("S","selGigwanCode2" ,{pType : 6, ATTR_1:'2'});//일반
	
	
	setComboBoxList("S","selSerialNumCode" ,{pType : 8, ATTR_1:'27230E031301'});//<!-- 시군구+소분류 코드 -->
	
	setComboBoxList("S","selSerialNumCode2" ,{pType : 8, ATTR_1:'27230E031301', ATTR_2 : '001'});//<!-- 일련번호 뒷 3자리 -->
	
	setComboBoxList("S","selPurposeCode" ,{pType : 9});//운영목적
	
	
	
	//지하수 대중소분류 선택 시작
	getTcJobclCodeLarge();
	$("#selLargeCode").change(function(){
		getTcJobclCodeMiddle();
	});
	$("#selMiddleCode").change(function(){
		getTcJobclCodeSmall();
	});
	//지하수 대중소분류 선택 끝
	
	//행정구역 대중소분류 선택 시작
	getTcSidoCode();
	$("#selSidoCode").change(function(){
		getTcSiGunCode();
	});
	$("#selSiGunCode").change(function(){
		getTcSiDongCode();
	});
	//행정구역 대중소분류 선택 끝
	
	//토양 대중소분류 선택 시작
	getTcJobclCodeLarge2();
	$("#selLargeCode2").change(function(){
		getTcJobclCodeMiddle2();
	});
	$("#selMiddleCode2").change(function(){
		getTcJobclCodeSmall2();
	});
	//토양 대중소분류 선택 끝
	
	//지역구분에 따른 지목 변경
	$("#selGijunCode").change(function(){
		setComboBoxList("S","selJimokCode" ,{pType : 10, ATTR_1:$(this).val()});//일반
	});
	
	
	//골프장 대중소분류 선택 시작
	getTcJobclCodeLarge3();
	$("#selLargeCode3").change(function(){
		getTcJobclCodeMiddle3();
	});
	$("#selMiddleCode3").change(function(){
		getTcJobclCodeSmall3();
	});
	//골프장 대중소분류 선택 끝
	
	
});

//지하수 대분류 
function getTcJobclCodeLarge(){
	setComboBoxList("A","selLargeCode" ,{pType:5, ATTR_1:'E03', pStep:1}, false);//대분류
	getTcJobclCodeMiddle();
	getTcJobclCodeSmall();
}
//지하수 중분류 
function getTcJobclCodeMiddle(){
	setComboBoxList("S","selMiddleCode" ,{pType:5, ATTR_1:$("#selLargeCode").val(), pStep:2}, false);//중분류
	getTcJobclCodeSmall();
}
//지하수 소분류 
function getTcJobclCodeSmall(){
	setComboBoxList("S","selSmallCode" ,{pType:5, ATTR_1:$("#selMiddleCode").val(), pStep:3}, false);//소분류
}
//토양 대분류 
function getTcJobclCodeLarge2(){
	setComboBoxList("A","selLargeCode2" ,{pType:5, ATTR_1:'E07', pStep:1}, false);//대분류
	getTcJobclCodeMiddle2();
	getTcJobclCodeSmall2();
}
//토양 중분류 
function getTcJobclCodeMiddle2(){
	setComboBoxList("S","selMiddleCode2" ,{pType:5, ATTR_1:$("#selLargeCode2").val(), pStep:2}, false);//중분류
	getTcJobclCodeSmall2();
}
//토양 소분류 
function getTcJobclCodeSmall2(){
	setComboBoxList("S","selSmallCode2" ,{pType:5, ATTR_1:$("#selMiddleCode2").val(), pStep:3}, false);//소분류
}
//골프장 대분류 
function getTcJobclCodeLarge3(){
	setComboBoxList("A","selLargeCode3" ,{pType:5, ATTR_1:'G04', pStep:1}, false);//대분류
	getTcJobclCodeMiddle3();
	getTcJobclCodeSmall3();
}
//골프장 중분류 
function getTcJobclCodeMiddle3(){
	setComboBoxList("S","selMiddleCode3" ,{pType:5, ATTR_1:$("#selLargeCode3").val(), pStep:2}, false);//중분류
	getTcJobclCodeSmall3();
}
//골프장 소분류 
function getTcJobclCodeSmall3(){
	setComboBoxList("S","selSmallCode3" ,{pType:5, ATTR_1:$("#selMiddleCode3").val(), pStep:3}, false);//소분류
}


//행정구역 대분류 
function getTcSidoCode(){
	setComboBoxList("A","selSidoCode" ,{pType:7, ATTR_1:'E03', pStep:1}, false);//대분류
	getTcSiGunCode();
	getTcSiDongCode();
}
//행정구역 중분류 
function getTcSiGunCode(){
	setComboBoxList("S","selSiGunCode" ,{pType:7, ATTR_1:$("#selSidoCode").val(), pStep:2}, false);//중분류
	getTcSiDongCode();
}
//행정구역 소분류 
function getTcSiDongCode(){
	setComboBoxList("S","selSiDongCode" ,{pType:7, ATTR_1:$("#selSiGunCode").val(), pStep:3}, false);//소분류
}


</script>
</head>
<body>
<div style="padding: 20px;">
<strong>공통</strong>
<br/>
년도디폴트 : <select id="yyyy" name="yyyy"></select>
년도지정 : <select id="yyyy2" name="yyyy2"></select>
월 : <select id="mm" name="mm"></select>
<br/>
<br/>
<br/>
대분류 : <select id="selLargeCode" name="selLargeCode"></select>
중분류 : <select id="selMiddleCode" name="selMiddleCode"></select>
소분류 : <select id="selSmallCode" name="selSmallCode"></select>
<br/>
<br/>
<br/>
운영여부: <select id="selManageCode" name="selManageCode"></select>
주용도: <select id="selMainUseCode" name="selMainUseCode"></select>
허가형태: <select id="selPermissStsCode" name="selPermissStsCode"></select>
소유구분: <select id="selOwnerguCode" name="selOwnerguCode"></select>
음용여부: <select id="selForDrinkCode" name="selForDrinkCode"></select>
지번: <select id="selMntnCode" name="selMntnCode"></select>
정보형태: <select id="selJunghoStsCode" name="selJunghoStsCode"></select>
충적/암반: <select id="selRockguCode" name="selRockguCode"></select>
폐쇄원인: <select id="selCloseReasonCode" name="selCloseReasonCode"></select>
폐쇄상태: <select id="selCloseStsCode" name="selCloseStsCode"></select>
<br/>
<br/>
<br/>
기관코드(오염): <select id="selGigwanCode" name="selGigwanCode"></select>
기관코드(일반): <select id="selGigwanCode2" name="selGigwanCode2"></select>
<br/>
<br/>
<br/>
행정구역 대분류 : <select id="selSidoCode" name="selSidoCode"></select>
행정구역 중분류 : <select id="selSiGunCode" name="selSiGunCode"></select>
행정구역 소분류 : <select id="selSiDongCode" name="selSiDongCode"></select>

<br/>
<br/>
<br/>
일련번호(시군구+소분류 코드) : <select id="selSerialNumCode" name="selSerialNumCode"></select>
일련번호(시군구+소분류 코드+일련번호) : <select id="selSerialNumCode2" name="selSerialNumCode2"></select>
<%-- 
<html:selectList name='ONE_DEPTH_ID' list='oneAllList' optionNames='전체' optionValues='' listValue='MENU_NO' listName='MENU_NM' selectedValue='${param.ONE_DEPTH_ID}' title="1단계 메뉴" script="class=\"selectSrch\" onchange='goSearch();return false;'" />

<html:selectList name='searchType' optionValues='ALL|BBSCTT_SJ|REGISTER_NM|BBSCTT_CN' optionNames='전체|제목|작성자|내용' selectedValue='${param.searchType}' title="검색조건구분" script='class="W100"' />


<html:radio name='CNTNTS_TY' list="conTypeList" listValue="CODE" listName="CODE_NM" checkedValue='${menuView.CNTNTS_TY}' defaultValue='D' space='&nbsp;' script="onclick='setContentType(this.value)'" />

<html:radio name="NOTICE_AT" value='Y|N' text='사용|미사용' checkedValue='${dataMap.NOTICE_AT}' defaultValue='N' space="&nbsp;" id='Yes2|No2'/>

//날짜 추가
    $(function() {
        gfnInitDatePickerTwo();
    });
 --%>
<br/><br/><br/><br/><br/> 
<br/> 
 지역구분 : <html:radio name="radAreaGbn" value='E03|G02|S01' text='오염우려지역|일반지역|농촌지하수' checkedValue='' defaultValue='E03' space="&nbsp;" id='radAreaGbn1|radAreaGbn2|radAreaGbn3'/>
 <br/> 
 분기 : <html:radio name="selGwmod" value='H1|H2' text='상반기|하반기' checkedValue='${param.searchType}' defaultValue='H1' space="&nbsp;" id='selGwmod1|selGwmod2' />
 분기 : <html:selectList name='selGwmod2' optionValues='H1|H2' optionNames='상반기|하반기' defaultValue="H1" selectedValue='${param.searchType}' title="분기 선택" script='class="W100"' />
 
 
 <br/> 
 -------------------------------------------------------토양 측정망 추가 분---------------------------------------------------
 <br/>
 <br/>
대분류 : <select id="selLargeCode2" name="selLargeCode2"></select>
중분류 : <select id="selMiddleCode2" name="selMiddleCode2"></select>
소분류 : <select id="selSmallCode2" name="selSmallCode2"></select>
 <br/>
입력년도: <select id="selAddnEvenCode" name="selAddnEvenCode"></select>

<br/>
운영목적: <select id="selPurposeCode" name="selPurposeCode"></select>
<br/><br/>
지역구분: <select id="selGijunCode" name="selGijunCode"> --></select>지목: <select id="selJimokCode" name="selJimokCode"></select>

<br/><br/><br/><br/><br/>
-------------------------------------------------------골프장 추가 분---------------------------------------------------
<br/>
대분류 : <select id="selLargeCode3" name="selLargeCode3"></select>
중분류 : <select id="selMiddleCode3" name="selMiddleCode3"></select>
소분류 : <select id="selSmallCode3" name="selSmallCode3"></select>
<br/>
골프장 상태 : <select id="selGolfStateCode" name="selGolfStateCode"></select>
<br/>
형태 : <html:selectList name='sel1' optionValues='GP020001|GP020002|GP020004|GP020003' optionNames='회원제|대중제|기타|체력단련장' defaultValue="GP020001" selectedValue='${param.searchType}' title="형태 선택" script='class="W100"' />
검색조건 : <html:selectList name='se2' optionValues='golfclub_name|address' optionNames='골프장명|골프장 소재지' defaultValue="golfclub_name" selectedValue='${param.searchType}' title="검색조건" script='class="W100"' />
확정여부 : <html:selectList name='sel3' optionValues='|Y|N' optionNames='전체|확정|미확정' defaultValue="" selectedValue='${param.searchType}' title="확정여부 선택" script='class="W100"' />
<br/><br/><br/><br/><br/>
-------------------------------------------------------가축매몰지 추가 분---------------------------------------------------
<br/>
매몰지구분 : <html:selectList name='sel4' optionValues='|KAHIS|환경부' optionNames='전체|KAHIS|환경부' defaultValue="" selectedValue='${param.searchType}' title="매몰지구분 선택" script='class="W100"' />
매볼방식 : <html:selectList name='sel5' optionValues='|FRP|기타|단순이설|알수없음|액비저장고|일반매몰|철제탱크|호기호열' optionNames='전체|FRP|기타|단순이설|알수없음|액비저장고|일반매몰|철제탱크|호기호열' defaultValue="" selectedValue='${param.searchType}' title="매볼방식 선택" script='class="W100"' />
<br/>
관정신고여부 : <html:selectList name='sel6' optionValues='|01|02' optionNames='전체|신고|미신고' defaultValue="" selectedValue='${param.searchType}' title="관정신고여부 선택" script='class="W100"' />
<br/>
이용인구
<br/>
이용용도

<br/>
수질조사 진행사항 : <html:selectList name='sel7' optionValues='|WAIT|SD|MO|AD' optionNames='전체|시도 제출 대기|환경청 승인 대기|관리자 확정 대기|확정' defaultValue="" selectedValue='${param.searchType}' title="수질조사 진행사항 선택" script='class="W100"' />
<br/>
조사주기: <select title="조사주기 선택" name="selExamCycle" id="selExamCycle" onFocus="" onBlur="" >
                            <option value="">조사주기 선택</option>
                            <option value="1월">1월</option>
                            <option value="2월">2월</option>
                            <option value="3월">3월</option>
                            <option value="4월">4월</option>
                            <option value="5월">5월</option>
                            <option value="6월">6월</option>
                            <option value="7월">7월</option>
                            <option value="8월">8월</option>
                            <option value="9월">9월</option>
                            <option value="10월">10월</option>
                            <option value="11월">11월</option>
                            <option value="12월">12월</option>
                            <option value="1분기">1분기</option>
                            <option value="2분기">2분기</option>
                            <option value="3분기">3분기</option>
                            <option value="4분기">4분기</option>
                            <option value="상반기">상반기</option>
                            <option value="하반기">하반기</option>
                        </select>
                        
</div>
</body>
</html>