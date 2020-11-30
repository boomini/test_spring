<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script src="/js/jquery.bxslider/jquery.bxslider.min.js"></script>
<link href="/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
<script>
	$(function(){
		$('.bxslider').bxSlider({
			  auto: true,
			  autoControls: true,
			  stopAutoOnClick: true,
			  pager: true/* ,
			  slideWidth: 100% */ 
			});
		replySearch();
	});
	function openImageView(src) {
		var parameter = src.split('?')[1];
		window.open("/ComPageLink.do?link=/common/popup/openView&" + parameter,	'_blank');
	}
	
	function list() {
		$("#frm").submit();
	}

	function modifyChk() {
		var fm = document.form;
		fm.MODE.value = "modify";
		fm.action = "/cms/board/${boardCfg.BBS_NO}/form/";
		fm.submit();
	}
	function deleteChk() {
		if (confirm('삭제하시겠습니까?')) {
			var fm = document.form;
			fm.MODE.value = "delete";
			fm.action = "/cms/board/${boardCfg.BBS_NO}/cud/";
			fm.submit();
		}
	}
	function cmntDeleteChk(cmntId) {
		if (confirm('삭제하시겠습니까?')) {
			var fm = document.form;
			fm.CMNT_ID.value = cmntId;
			fm.MODE.value = "cmntDelete";
			fm.action = "/cms/board/${boardCfg.BBS_NO}/cud/";
			fm.submit();
		}
	}
	/*검색*/
	function replySearch() {
		if( '${boardCfg.ANSWER_USE_AT}' != 'Y' ){
			return false;
		}
		var url = "/web/photo/replyAjax";
		var params = {
				UPPER_BBSCTT_NO  : '${dataMap.BBSCTT_NO}'
		}
		var sucessFunc = function(data) {
			$("#replyDiv").html(""); 
			$("#replyDiv").html(data);
			$("#r_UPPER_BBSCTT_NO").val(  '${dataMap.BBSCTT_NO}' );
			$("#r_BBS_NO").val(  '${boardCfg.BBS_NO}' );
		};
		ajaxCallHtml(url, params, sucessFunc);
	};
	
</script>
<form name="form" action="" method="post">

    <input type="hidden" name="BBS_NO" value="${boardCfg.BBS_NO}" /> 
    <input type="hidden" name="BBSCTT_NO" value="${dataMap.BBSCTT_NO}" /> 
    <input type="hidden" name="CMNT_ID" value="" /> 
    <input type="hidden" name="pMENU_NO" value="${param.pMENU_NO }" /> 
    <input type="hidden" name="MODE" />
    
    <table class="table02" summary="제목,작성자,작성일,전화번호,이메일,공개여부,분류,첨부파일">
        <caption>${boardCfg.MENU_NM}보기제목</caption>
        <colgroup>
            <col style="width: 15%;" />
            <col style="width: 35%" />
            <col style="width: 15%;" />
            <col style="width: 35%" />
        </colgroup>
        <tbody>
            <tr>
                <th>제목</th>
                <td colspan="3" class="AL borR0"><c:out value="${dataMap.BBSCTT_SJ}" /></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td class="AL"><c:out value='${dataMap.REGISTER_NM}' /></td>
                <th>작성일</th>
                <td><fmt:formatDate value="${dataMap.REGIST_DT}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
            	<th>
            	</th>
                <td colspan="4" class="AL borR0">
                		<c:if test='${boardCfg.WBDETR_USE_AT == "Y"}'>
	                        <html:xss>
	                            <c:out value='${dataMap.BBSCTT_CN}' escapeXml="false" />
	                        </html:xss>
                    	</c:if> 
	                    <c:if test='${boardCfg.WBDETR_USE_AT != "Y"}'>
	                        <html:xss>
	                            <html:text tag='<br />'>
	                                <c:out value='${dataMap.BBSCTT_CN}' escapeXml="false" />
	                            </html:text>
	                        </html:xss>
	                    </c:if>
	           </td>
            </tr>
    </table>
    <div style="text-align: center; margin-top: 10px;">
        <div class="bxslider">
            <c:forEach items="${fileList}" var="file">
                <div>
                	<img id="/jfile/readDownloadFile.do?fileId=${file.fileId}&fileSeq=${file.fileSeq}&useSecurity=${file.useSecurity}&uploadMode=${file.uploadMode}"
                	 src="/jfile/preview.do?fileId=${file.fileId}&fileSeq=${file.fileSeq}" alt="${file.fileName}"  onclick="openImageView(this.src);return false;"/>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="t_right">
        <!--  
        <c:if test='${boardCfg.BLBD_TYP=="M"}'>
            <a href="/cms/board/${boardCfg.BBS_NO}/form/<c:out value='${parameters}'/>&amp;MODE=reply&amp;BBSCTT_NO=<c:out value='${dataMap.BBSCTT_NO}'/>&amp;BBS_NO=<c:out value='${dataMap.BBS_NO}'/>" class="btn_1">답변</a>
        </c:if>
        <c:if test='${boardCfg.ANSWER_USE_AT=="Y"}'>
            <a href="/cms/board/${boardCfg.BBS_NO}/form/<c:out value='${parameters}'/>&amp;MODE=answer&amp;BBSCTT_NO=<c:out value='${dataMap.BBSCTT_NO}'/>&amp;BBS_NO=<c:out value='${dataMap.BBS_NO}'/>" class="btn_1">댓글답변</a>
        </c:if> 
         -->
        <c:if test="${dataMap.SELFYN eq '_Y'}">
	        <html:buttonAuth gubun="mod" script="modifyChk();return false;"/>
	        <html:buttonAuth gubun="del" script="deleteChk();return false;"/>  
        </c:if>
        <a href="javascript:history.back();" class="btn_2">목 록</a>
    </div>
	    <div id="replyDiv"></div>
    
    
</form>