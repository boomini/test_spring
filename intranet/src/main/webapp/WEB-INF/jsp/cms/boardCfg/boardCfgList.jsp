<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
    <c:if test="${param.useYn=='N'}">
    $('.onOffImg1').attr("src",$('.onOffImg1').attr("src").replace("on.gif","off.gif"));
    $('.onOffImg2').attr("src",$('.onOffImg2').attr("src").replace("off.gif","on.gif"));
    </c:if>
  });

function goSave(){
	var sf = document.listForm;
    sf.BBS_NO_REF.value=gfnCheckBoxCheckedToString("BBS_NO","|");
    if(sf.BBS_NO_REF.value ==""){
        alert("게시판을 선택해주세요"); return;
    }
    if(!confirm("저장 하시겠습니까?")) return;
    $("#listForm").submit();
}

function goSearch(){
    $("#searchForm").submit();
}
//초기화
function goClear(){
    $("#pBBS_TY").val('');
    $("#pUSE_AT").val('');
    $("#pSCH_VALUE").val('');
    $("#searchForm").submit();
}
function goForm(){
	location.href="/cms/boardCfg/form/<c:out value='${parameters}'/>";
}
</script>
<noscript></noscript>
<%--
	<div class="depth">
	   <h6 class="title_s1">게시판 관리 - 게시판 리스트</h6>
	</div>
    --%>
<!-- 키워드 검색 기능 -->
<form name="searchForm" id="searchForm" action="/cms/boardCfg/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
    <div class="search_box">
        <html:selectList name='pBBS_TY' list='blbdTypeList' listValue='CODE' listName='CODE_NM' optionValues='' optionNames='전체' selectedValue='${param.pBBS_TY}' script=" onchange='this.form.submit()' class='W100'" /> 
        <html:selectList name='pUSE_AT' optionValues='Y|N' optionNames='운영중|운영중단' selectedValue='${param.pUSE_AT}' defaultValue="Y" script="class=\"W90\" onchange='this.form.submit()'" /> 
        <html:selectList name='pSCH_KEY' optionValues='0' optionNames='게시판명' selectedValue='${param.pSCH_KEY}' script="class=\"W90\"" /> 
        <input type="text" class="W150" name="pSCH_VALUE" id="pSCH_VALUE" value="<c:out value="${param.pSCH_VALUE}" />" title="검색키워드" /> 
        <a href="#" onclick="goSearch();return false;" class="btn_2">검색</a> 
        <c:if test="${not empty param.pSCH_VALUE }">
            <a href="#" onclick="goClear();return false;" class="btn_4">초기화</a>
        </c:if>
    </div>
</form>
<div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${pager.totalCount }" /></em>건)</span></div>
<form name="listForm" id="listForm" action="/cms/boardCfg/cud" method="post" >
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="MENU_SE" value="<c:out value='${param.MENU_SE }'/>"> 
    <input type="hidden" name="BBS_NO_REF" value=""> <input type="hidden" name="mode" value="delete">
    <table class="table_basic table01" summary="번호, 게시판명, 게시판종류, 게시판권한, 에디터, 댓글, 공지글">
        <colgroup>
            <col style="width: 6%;" />
            <col style="width: 6%;" />
            <col />
            <col style="width: 15%;" />
            <col style="width: 10%;" />
            <col style="width: 10%;" />
            <col style="width: 10%;" />
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" onclick="gfnToggleMultiChk(this.checked, 'BBS_NO')" title="전체선택"></th>
                <th>번호</th>
                <th>게시판명</th>
                <th>게시판 종류</th>
                <th>에디터</th>
                <th>댓글</th>
                <th>공지글</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var='EO' items='${dataList}' varStatus='status'>
                <tr>
                    <td><input type="checkbox" name="BBS_NO" value="<c:out value='${EO.BBS_NO}' />" title="행선택"></td>
                    <td><c:out value="${pager.totalCount - ((pager.currentPage - 1) * pager.pageSize) - status.index}" /></td>
                    <td class="AL"><a href="/cms/boardCfg/form/<c:out value='${parameters}' default="?"/>&amp;BBS_NO=<c:out value='${EO.BBS_NO}'/>"><c:out value='${EO.BBS_NM}' /></a></td>
                    <td><c:out value='${EO.BBS_TY_NM}' /></td>
                    <td><c:out value='${EO.WBDETR_USE_AT}' /></td>
                    <td><c:out value='${EO.ANSWER_USE_AT}' /></td>
                    <td><c:out value='${EO.NTCSNT_USE_AT}' /></td>
                </tr>
            </c:forEach>
            <c:if test="${empty dataList}">
                <tr>
                    <td colspan="8" class="AC borR0">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <div class="btn AR MgT10">
        <c:if test='${param.pUSE_AT == "N"}'>
            <html:buttonAuth gubun="add" script="goSave();return false;" title="운영시작"/>
            <input type="hidden" name="USE_AT" value="Y">
        </c:if>
        <c:if test='${param.pUSE_AT != "N"}'>
            <html:buttonAuth gubun="add" script="goSave();return false;" title="운영중단"/>
            <input type="hidden" name="USE_AT" value="N">
        </c:if>
        <html:buttonAuth gubun="add" script="goForm();return false;" title="게시판 등록"/>
    </div>
    <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
</form>
