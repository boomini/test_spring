<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>LCY 정보시스템 : 사업장 검색 팝업</title>
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
	$(function() {
	  $("#pAreaCode1").change(function(){
	    setAreaList('pAreaCode');
	  });
	  setAreaList('pAreaCode','', '${param.pAreaCode2}');
	});
	
	//지역 첫번째 선택시 이벤트
	//id:지역 첫번째,두번째 공통id(pAreaCode), gu:1:코드:2코드명으로 값 세팅, pa1:로딩후 초기 파라미티 세팅용
	function setAreaList(id,gu,pa1) {
	  var code = pa1;
	  if($("#"+id+"1").val() ==''){
	    $("#"+id+"2").empty();
	    AddOptionSelectBox($("#"+id+"2"), '', false, '-전체-');//초기세팅용(전체)
	    return;
	  }
	  var url = "/cms/codeUtil/orgListAjax";
	  var params = {
	      pInCode : '0104',
	      pSehighInsttCode : $("#"+id+"1").val(),
	  };
	  var sucessFunc = function(data) {
	    var list = data.list;
	    $("#"+id+"2").empty();
	    AddOptionSelectBox($("#"+id+"2"), '', false, '-전체-');
	    for (var i = 0; i < list.length; i++) {
	      var ck = false;
	      if(list[i].CODE == code) ck = true;
	      if(gu == '2'){
	        AddOptionSelectBox($("#"+id+"2"), list[i].CODE_NM, ck, list[i].CODE_NM);
	      }else{
	        AddOptionSelectBox($("#"+id+"2"), list[i].CODE, ck, list[i].CODE_NM);  
	      }
	      
	    }
	  };
	  ajaxCall(url, params, sucessFunc);
	}	
function setBplcCode(pa1,pa2,pa3,pa4){
  var gu = parent.gu;
  if(gu == '2'){
    parent.setBplcCode2(pa1,pa2,pa3,pa4);
  }else{
    parent.setBplcCode(pa1,pa2,pa3,pa4);  
  }
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
    <p class="tit">사업장 선택</p>
    <div id="pop_cont">  
    <form id="frm" name="frm" method="post" action="/cms/codeUtil/bplcPop/">
      <input type="hidden" id="pInClCode" name="pInClCode" value="${param.pInClCode}" />
      <input type="hidden" id="bplcNo" name="bplcNo" value="${param.bplcNo}" />
      <div class="condition MgT10">
        <table summary="사업장을 검색조건으로 선택하여 조회할 수 있습니다. 사업장유형, 사업장명, 사업자 등록번호순으로 보여줍니다.">
          <caption>사업장 검색조건</caption>
          <colgroup>
            <col width="110" />
            <col width="219" />
            <col width="110" />
            <col />
          </colgroup>
          <tbody>
	 		<tr>
		        <th>사업장 지역</th>
		        <td colspan="3">
		        <html:selectList script="class='W200 orgCk'" optionNames="-전체-" optionValues="" name='pAreaCode1' title="사업장 지역" list='orgList' listValue='CODE' listName='CODE_NM' selectedValue='${param.pAreaCode1}'/>
		        <select name="pAreaCode2" id="pAreaCode2" title="관리기관" class="W200 orgCk"><option value="">-전체-</option> </select>
		        </td>
	      	</tr>
            <tr>
              <th>사업장 유형</th>
              <td colspan="3">
              <html:selectList name='pBlcSeCode' optionNames="전체|폐수처리업체|폐수배출업체" optionValues="|0105|0106" selectedValue='${param.pBlcSeCode}'  title="사업장유형" script="class='W200'" />
              </td>
            </tr>
            <tr>
              <th>사업자명</th>
              <td><input name="pBplcNm" type="text" class="W190 entrKey" id="" title="사업장명" value="${param.pBplcNm}"/></td>
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
      <h6 class="MgT10 MgB5">검색결과<span id="tot_page">( 총 <c:out value="${pager.totalCount }"/> 건 )</span></h6>
      <table summary="검색조건에 해당하는 사업장 검색결과 표 입니다. 사업장유형, 사업장명, 사업자등록번호 순으로 보여줍니다." class="board-st-01 W100p">
        <caption>게시판 리스트</caption>
        <colgroup>
          <col width="15%" />
          <col width="20%" />
          <col width="15%" />
          <col width="15%" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>사업장유형</th>
            <th>사업장명</th>
            <th>사업자등록번호</th>
            <th>대표자명</th>
            <th>주소</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${bplcList}" var="EO" varStatus="stat">
            <tr>
              <td><a href="#" onclick="setBplcCode('<c:out value='${EO.BPLC_NO}'/>','<c:out value='${EO.BPLC_NM}'/>','<c:out value='${EO.BIZRNO}'/>','<c:out value='${EO.BPLC_SE_CODE}'/>');"><c:out value='${EO.BPLC_SE_CODE_NM}' /></a></td>
              <td><a href="#" onclick="setBplcCode('<c:out value='${EO.BPLC_NO}'/>','<c:out value='${EO.BPLC_NM}'/>','<c:out value='${EO.BIZRNO}'/>','<c:out value='${EO.BPLC_SE_CODE}'/>');"><c:out value='${EO.BPLC_NM}' /></a></td>
              <td><a href="#" onclick="setBplcCode('<c:out value='${EO.BPLC_NO}'/>','<c:out value='${EO.BPLC_NM}'/>','<c:out value='${EO.BIZRNO}'/>','<c:out value='${EO.BPLC_SE_CODE}'/>');"><c:out value='${EO.BIZRNO}' /></a></td>
              <td><a href="#" onclick="setBplcCode('<c:out value='${EO.BPLC_NO}'/>','<c:out value='${EO.BPLC_NM}'/>','<c:out value='${EO.BIZRNO}'/>','<c:out value='${EO.BPLC_SE_CODE}'/>');"><c:out value='${EO.RPRSNTV_NM}' /></a></td>
              <td><a href="#" onclick="setBplcCode('<c:out value='${EO.BPLC_NO}'/>','<c:out value='${EO.BPLC_NM}'/>','<c:out value='${EO.BIZRNO}'/>','<c:out value='${EO.BPLC_SE_CODE}'/>');"><c:out value="${EO.OFFM_ADRES}" /> <c:out value="${EO.OFFM_DETAIL_ADRES}" /></a></td>
            </tr>
          </c:forEach>
          <c:if test='${empty bplcList}'>
            <tr>
              <td colspan="5" class="AC borR0">검색결과가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
      <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
    </div>
  </div>
</body>
</html>