<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
	function goClear() {
		jQuery("#searchType").val('ALL');
		jQuery("#searchWord").val('');
		jQuery("#searchForm").submit();
	}
</script>
<style>
.gallery_news {
	overflow: hidden;
	margin-top: 10px;
}

.gallery_news ul li {
	border: 1px solid #ddd;
	box-sizing: border-box;
	width: 32%;
	float: left;
	margin-right: 2%;
	margin-bottom: 20px;
	padding-bottom: 10px;
}

.gallery_news ul li:nth-child(3), .gallery_news ul li:nth-child(6) {
	margin-right: 0;
}

.gallery_news ul li a {
	display: block;
	box-sizing: border-box;
}

.gallery_news ul li img {
	width: 100%;
	height: 180px;
}

.gallery_news ul li span.thum_title a {
	display: block;
	text-overflow: ellipsis;
	color: #222;
	font-size: 16px;
	font-weight: 500;
	padding: 15px 10px 6px;
	line-height: 20px;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
}

.gallery_news ul li span.thum_title a:hover {
	text-decoration: underline;
}

.gallery_news ul li span.thum_name {
	font-size: 13px;
	color: #888;
	padding: 0 0 0 10px;
}
</style>
<!-- Search -->

<form name="searchForm" id="searchForm" action="/cms/board/${boardCfg.BBS_NO}/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
        <table class="table02" summary="게판 조회 조건- 구분, 검색조건입력창">
            <caption>게시판 조회 조건</caption>
            <colgroup>
                <col width="110" />
                <col />
            </colgroup>
            <tbody>
                <tr>
                    <td class="AC btn">
                    	<c:if test='${boardCfg.BBS_TY=="M"}'>
                            <html:selectList name='S_ANSWER_STTUS' optionNames="전체" optionValues="" list='repStat' listValue='CODE' listName='CODE_NM' selectedValue='${param.S_ANSWER_STTUS}' id="S_ANSWER_STTUS" title="답변 처리 상태" />
                        </c:if>
                        <html:selectList name='searchType' optionValues='ALL|BBSCTT_SJ|REGISTER_NM|BBSCTT_CN' optionNames='전체|제목|작성자|내용' selectedValue='${param.searchType}' title="검색조건구분" script='class="W100"' />
                        <input type="text" name="searchWord" id="searchWord" value="<c:out value='${param.searchWord}'/>" class="W200" title="검색조건입력창" /> 
                     </td>
                </tr>
            </tbody>
        </table>
        <div class="t_right">
		    <a href="" onclick="searchForm.submit();return false;" class="btn_1">조회</a>
		    <c:if test="${not empty param.searchWord }">
        		<a href="" onclick="goClear();return false;" class="btn_2">초기화</a>
            </c:if>
		</div>
</form>
<!--// Search -->
<form name="listForm" action="/cms/board/${boardCfg.BBS_NO}/form/" method="post">
    
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="BBS_NO" id="BBS_NO" value="<c:out value='${boardCfg.BBS_NO}'/>"> 
    <input type="hidden" name="MODE" value="write">
    
    <div class="gallery_news">
        <ul>
            <c:forEach var='EO' items='${dataList}' varStatus='status'>
                <li>
                    <a href="/web/board/${boardCfg.BBS_NO}/<c:out value='${EO.BBSCTT_NO}'/>/<c:out value='${parameters}'/>"> 
                    <span class="thum_image">
                    <img title="${EO.BBSCTT_SJ}" class="photo"  alt="${EO.BBSCTT_SJ}" src="/jfile/preview.do?fileId=${EO.FILE_ID}&fileSeq=1&fileThumbnailYn=Y">
                    </span>
                    </a> 
                    <span class="thum_title">
                    <a href="/web/board/${boardCfg.BBS_NO}/<c:out value='${EO.BBSCTT_NO}'/>/<c:out value='${parameters}'/>"><c:out value='${EO.BBSCTT_SJ}' /></a>
                    </span> 
                    <span class="thum_name">${EO.REGISTER_NM}(<fmt:formatDate value="${EO.REGIST_DT}" pattern="yyyy-MM-dd" />)</span></li>
            </c:forEach>
        </ul>
    </div>
    <!--// 갤러리 목록 -->
    <c:if test="${memberVO.isAdmin == 'true'}">
        <div class="t_right">
		    <a href="" onclick="listForm.submit();return false;" class="btn_1">등록</a>
		</div>
    </c:if>
    <%@include file="/WEB-INF/jsp/common/pager.jsp"%>
</form>
