<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>LCY 정보시스템 : 운반차량번호 검색 팝업</title>
<!--[if lt ie 9]>
<script src="/cms/_js/html5shiv.js"></script>
<![endif]-->
<link href="/cms/_css/BasicSet.css" rel="stylesheet" type="text/css" />
<link href="/cms/_css/subcomm.css" rel="stylesheet" type="text/css" />
<link href="/cms/_css/pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/cms/_js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/frm.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/cmnReady.js"></script>
<script>
$( document ).ready(function() {
  /* 검색어 제한일경우 풀고, 조회의 onclick삭제
  var frm = document.frm;
  $( "#frm" ).submit(function( event ) {
    if (!gfnValidate(frm)) {
      event.preventDefault();
    }
  });
  
  $( "#schBtn" ).click(function( event ) {
    if (!gfnValidate(frm)) {
      event.preventDefault();
    } else {
      $( "#frm" ).submit();
    }
  });
  */
});
//조회
function goSearch(){
	document.frm.submit()
}
//엔터키 조회
function fn_enter(){
	goSearch();
}
</script>
</head>
<body>
  <div id="pop">
    <p class="tit">운반차량번호 선택</p>
    <form id="frm" name="frm" method="post" action="/cms/codeUtil/operVhclePop/">
      <input type="hidden" id="pInClCode" name="pInClCode" value="${param.pInClCode}" />
      <div class="pop_condition MgT10">
        <table summary="사업장을 검색조건으로 선택하여 조회할 수 있습니다. 사업장명, 운반차량번호 순으로 보여줍니다.">
          <caption>사업장 검색조건</caption>
          <colgroup>
            <col width="110" />
            <col width="219" />
            <col width="110" />
            <col />
          </colgroup>
          <tbody>
            <tr>
              <th>사업장 유형</th>
              <td colspan="3">
              <html:selectList name='pBlcSeCode' optionNames="전체|폐수처리업체|폐수배출업체" optionValues="|0105|0106" selectedValue='${param.pBlcSeCode}'  title="사업장유형" script="class='W200'" />
              </td>
            </tr>
            <tr>
              <th>상호(사업장 명칭)</th>
              <td><input name="pBplcNm" type="text" class="W190 entrKey" id="" title="사업장명" value="${param.pBplcNm}"/><a href="#" class="find"></a></td>
              <th>사업자 등록번호</th>
              <td><input name="pBizrno" type="text" class="W190 entrKey" id="pBizrno" title="사업자 등록번호" value="${param.pBizrno}"/></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btn AR MgT5" id="schBtn">
          <a href="" onclick="goSearch();return false;">조 회</a>
      </div>
    </form>
    <div id="pop_cont">
      <h6 class="MgT10 MgB5">검색결과</h6>
      <table summary="검색조건에 해당하는 운반차량 검색결과 표 입니다. 사업장명, 운반차량번호 순으로 보여줍니다." class="board-st-01 W650">
        <caption>게시판 리스트</caption>
        <colgroup>
          <col width="40%" />
          <col width="60%" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>사업장명</th>
            <th>운반차량번호</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${operVhcleList}" var="EO" varStatus="stat">
            <tr>
              <td><a href="#" onclick="opener.setOperVhcle('<c:out value='${EO.VHCLE_NO}'/>');self.close();"><c:out value='${EO.BPLC_NM}' /></a></td>
              <td><a href="#" onclick="opener.setOperVhcle('<c:out value='${EO.VHCLE_NO}'/>');self.close();"><c:out value='${EO.VHCLE_NO}' /></a></td>
            </tr>
          </c:forEach>
          <c:if test='${empty operVhcleList}'>
            <tr>
              <td colspan="2" class="AC borR0">검색결과가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>