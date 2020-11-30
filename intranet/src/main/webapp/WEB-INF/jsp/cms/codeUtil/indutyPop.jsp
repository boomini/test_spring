<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>LCY 정보시스템 : 업종 검색 팝업</title>
<!--[if lt ie 9]>
<script src="/cms/_js/html5shiv.js"></script>
<![endif]-->
<link href="/cms/_css/BasicSet.css" rel="stylesheet" type="text/css" />
<link href="/cms/_css/subcomm.css" rel="stylesheet" type="text/css" />
<link href="/cms/_css/pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/cms/_js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/frm.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script>
function setIndutyCode(pa1,pa2){
  parent.setIndutyCode(pa1,pa2);
  parent.$.smartPop.close();
}
</script>
</head>
<body>
  <div id="pop">
    <p class="tit">업종 선택</p>
    <div id="pop_cont">
      <!--검색조건-->
      <form id="frm" name="frm" method="post" action="/cms/codeUtil/indutyPop/">
      <div class="condition">
        <table summary="테이블 설명">
          <caption>업종검색조건</caption>
          <colgroup>
            <col width="120" />
            <col />
          </colgroup>
          <tbody>
            <tr>
              <th>업종명</th>
              <td><input name="pCode" type="text" class="W190" id="pCode" title="업종명" value="${param.pCode}" checkNull /> <a href=""  class="pop_btn1" onclick="frm.submit();return false;">조 회</a></td>
            </tr>
          </tbody>
        </table>
      </div>
      </form>
      <h6 class="MgT10 MgB5">검색결과</h6>
      <table summary="검색조건에 해당하는 업종 검색결과 표 입니다. 업종코드, 업종명 순으로 보여줍니다." class="board-st-01 W100p">
        <caption>게시판 리스트</caption>
        <colgroup>
          <col width="40%" />
          <col width="60%" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>업종코드</th>
            <th>업종명</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="EO" varStatus="stat">
            <tr>
              <td><a href="#" onclick="setIndutyCode('<c:out value='${EO.CODE}'/>','<c:out value='${EO.CODE_NM}'/>');"><c:out value='${EO.CODE}' /></a></td>
              <td><a href="#" onclick="setIndutyCode('<c:out value='${EO.CODE}'/>','<c:out value='${EO.CODE_NM}'/>');"><c:out value='${EO.CODE_NM}' /></a></td>
            </tr>
          </c:forEach>
          <c:if test='${empty list}'>
            <tr>
              <td colspan="2" class="AC borR0">검색결과가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
      <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
    </div>
  </div>
</body>
</html>