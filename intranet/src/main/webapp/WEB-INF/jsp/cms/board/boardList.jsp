<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
function goClear() {
	$("#searchType").val('ALL');
	$("#searchWord").val('');
	$("#searchForm").submit();
}
function goForm(){
	$("#listForm").submit()
}
</script>
<form name="searchForm" id="searchForm" action="/web/board/${boardCfg.BBS_NO}/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
    <div class="search_box">
        <c:if test='${boardCfg.BBS_TY=="M"}'>
            <html:selectList name='S_ANSWER_STTUS' optionNames="전체" optionValues="" list='repStat' listValue='CODE' listName='CODE_NM' selectedValue='${param.S_ANSWER_STTUS}' id="S_ANSWER_STTUS" title="답변 처리 상태" />
        </c:if> 
        <html:selectList name='searchType' optionValues='ALL|BBSCTT_SJ|REGISTER_NM|BBSCTT_CN' optionNames='전체|제목|작성자|내용' selectedValue='${param.searchType}' title="검색조건구분" script='class="W100"' /> 
        <input type="text" name="searchWord" id="searchWord" value="<c:out value='${param.searchWord}'/>" class="W200" title="검색조건입력창" /> 
        <a href="" onclick="searchForm.submit();return false;" class="btn_2">조 회</a> 
        <c:if test="${not empty param.searchWord }">
        <a href="" onclick="goClear();return false;" class="btn_4">초기화</a>
        </c:if>
    </div>
</form>
<div class="tit MgT10">검색결과 <span class="toCount fr">(총 <em class="txt_orage"><c:out value="${pager.totalCount }" /></em>건)</span></div>
<form name="listForm" id="listForm" action="/web/board/${boardCfg.BBS_NO}/form/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> <input type="hidden" name="BBS_NO" id="BBS_NO" value="<c:out value='${boardCfg.BBS_NO}'/>"> <input type="hidden" name="MODE" value="write">
    <table summary="게시판목록 - 번호,제목,작성자,작성일,첨무,상태,처리일자" class="table_basic table01">
        <colgroup>
            <col width="8%;" />
            <col />
            <c:if test='${boardCfg.UPLOAD_POSBL_AT=="Y"}'>
                <col width="8%;" />
            </c:if>
            <col width="12%;" />
            <col width="15%;" />
            <c:if test='${boardCfg.BBS_TY=="M"}'>
                <col width="10%;" />
                <col width="10%;" />
            </c:if>
            <col width="8%;" />
        </colgroup>
        <thead>
            <c:set var="cRow" value="5" />
            <tr>
                <th>번호</th>
                <th>제목</th>
                <c:if test='${boardCfg.UPLOAD_POSBL_AT == "Y"}'>
                    <c:set var="cRow" value="${cRow+1 }" />
                    <th>첨부</th>
                </c:if>
                <th>작성자</th>
                <th>작성일</th>
                <c:if test='${boardCfg.BBS_TY =="M"}'>
                    <c:set var="cRow" value="${cRow+2 }" />
                    <th>상태</th>
                    <th>처리일자</th>
                </c:if>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var='EO' items='${dataList}' varStatus='status'>
                <tr>
                    <td>
                        <c:if test='${EO.NOTICE_CK=="Y"}'>
                            <img src="/com/images/ico_notice.gif" alt="공지글" />
                        </c:if> <c:if test='${EO.NOTICE_CK=="N" or EO.NOTICE_CK==null}'>
                            <c:out value='${pager.totalCount - ((pager.currentPage - 1) * pager.pageSize) - status.index}' />
                        </c:if>
                    </td>
                    <td class="AL">
                        <c:if test='${boardCfg.ANSWER_USE_AT eq "Y"}'>
                            <c:if test='${EO.GROUP_BBSCTT_NO != 0}'>
                                <c:forEach var='i' begin='1' end='${EO.GROUP_BBSCTT_NO-1}' step='1'>&nbsp;&nbsp;&nbsp;</c:forEach> 
                                &nbsp;&nbsp;<img src="/com/images/re_arrow.png" alt="답변">
                            </c:if>
                        </c:if>
                        <c:if test="${EO.OTHBC_AT eq 'N'}">
                            <img src="/com/images/lock.gif" alt="공개여부" />
                        </c:if>
                        <c:choose>  
                            <c:when test="${EO.OTHBC_AT == 'N'}">
                                <c:if test="${EO.REGISTER_ID == memberVO.user_id}">
                                    <a href="/web/board/${boardCfg.BBS_NO}/<c:out value='${EO.BBSCTT_NO}'/>/<c:out value='${parameters}'/>"><c:out value='${hana:leftKor(EO.BBSCTT_SJ, 47)}' /></a>
                                </c:if>
                                <c:if test="${EO.REGISTER_ID != memberVO.user_id}">
                                    <a href="" onClick="alert('비공개 글입니다.');return false;"><c:out value='${hana:leftKor(EO.BBSCTT_SJ, 47)}' /></a>
                                </c:if>                                                         
                            </c:when>
                            <c:otherwise>
                                <a href="/web/board/${boardCfg.BBS_NO}/<c:out value='${EO.BBSCTT_NO}'/>/<c:out value='${parameters}'/>"><c:out value='${hana:leftKor(EO.BBSCTT_SJ, 47)}' /></a>
                            </c:otherwise>
                        </c:choose>
                        <html:isNew value="EO.REGIST_DT" day="7"><img src="/com/images/new_icon.gif" alt="새글" /></html:isNew>
                    </td>
                    <c:if test='${boardCfg.UPLOAD_POSBL_AT=="Y"}'>
                        <td>
                            <c:if test="${EO.FILE_YN == 'Y'}">
                                <img src="/com/images/btn_file.gif" alt="첨부파일" />
                            </c:if>
                        </td>
                    </c:if>
                    <td><c:out value='${EO.REGISTER_NM}' /></td>
                    <td><fmt:formatDate value="${EO.REGIST_DT}" pattern="yyyy-MM-dd" /></td>
                    <c:if test='${boardCfg.BBS_TY=="M"}'>
                        <td><c:out value='${EO.ANSWER_STTUS_NM}' /></td>
                        <td><fmt:formatDate value="${EO.ANSWER_REGIST_DT}" pattern="yyyy-MM-dd" /></td>
                    </c:if>
                    <td><c:out value='${EO.RDCNT}' /></td>
                </tr>
            </c:forEach>
            <c:if test="${empty dataList }">
                <tr>
                    <td colspan="${cRow }" class="AC borR0">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
      <div class="AR MgT10">
          <html:buttonAuth gubun="add" script="goForm();return false;"/>
      </div>
    <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
</form>
