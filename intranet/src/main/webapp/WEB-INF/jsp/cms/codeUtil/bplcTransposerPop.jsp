<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>LCY 정보시스템 : 운반자 검색 팝업</title>
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
function setBplcTransposer(pa1,pa2){
  parent.setBplcTransposer(pa1,pa2);  
  parent.$.smartPop.close();
}
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
    <p class="tit">운반자 선택</p>
    <div id="pop_cont">  
    <form id="frm" name="frm" method="post" action="/cms/codeUtil/bplcTransposerPop/">
      <input type="hidden" id="pBlcNo" name="pBlcNo" value="${param.pBlcNo}" />
      <div class="condition MgT10">
        <table summary="사업장을 검색조건으로 선택하여 조회할 수 있습니다. 사업장명, 사업자 등록번호순으로 보여줍니다.">
          <caption>운반자 검색조건</caption>
          <colgroup>
            <col width="120" />
            <col width="200" />
            <col width="120" />
            <col />
          </colgroup>
          <tbody>
            <tr>
              <th>상호(사업장 명칭)</th>
              <td><input name="pBplcNm" type="text" class="W150 entrKey" id="" title="사업장명" value="${param.pBplcNm}"/></td>
              <th>사업자 등록번호</th>
              <td><input name="pBizrno" type="text" class="W150 entrKey" id="pBizrno" title="사업자 등록번호" value="${param.pBizrno}"/></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btn AR MgT5" id="schBtn">
          <a href="" onclick="goSearch();return false;">조 회</a>
      </div>
    </form>
    
      <h6 class="MgT10 MgB5">검색결과</h6>
      <table summary="검색조건에 해당하는 사업장 검색결과 표 입니다. 사업장유형, 사업장명, 사업자등록번호 순으로 보여줍니다." class="board-st-01 W100p">
        <caption>게시판 리스트</caption>
        <colgroup>
          <col width="25%" />
          <col width="25%" />
          <col width="25%" />
          <col width="25%" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>사업자명</th>
            <th>운반자ID</th>
            <th>운반자명</th>
            <th>사업자등록번호</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${bplcTransposerList}" var="EO" varStatus="stat">
            <tr>
              <td><a href="#" onclick="setBplcTransposer('<c:out value='${EO.USER_ID}'/>','<c:out value='${EO.USER_NM}'/>');"><c:out value='${EO.BPLC_NM}' /></a></td>
              <td><a href="#" onclick="setBplcTransposer('<c:out value='${EO.USER_ID}'/>','<c:out value='${EO.USER_NM}'/>');"><c:out value='${EO.USER_ID}' /></a></td>
              <td><a href="#" onclick="setBplcTransposer('<c:out value='${EO.USER_ID}'/>','<c:out value='${EO.USER_NM}'/>');"><c:out value='${EO.USER_NM}' /></a></td>
              <td><a href="#" onclick="setBplcTransposer('<c:out value='${EO.USER_ID}'/>','<c:out value='${EO.USER_NM}'/>');"><c:out value='${EO.BIZRNO}' /></a></td>
            </tr>
          </c:forEach>
          <c:if test='${empty bplcTransposerList}'>
            <tr>
              <td colspan="4" class="AC borR0">검색결과가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
      <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
    </div>
  </div>
</body>
</html>