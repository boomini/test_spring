<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<%
Boolean brCheck = egovframework.common.util.EgovWebUtil.getBrowserCheckFileUi(request);
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LCY 정보시스템 : 컨텐츠 관리</title>
<%--CSS--%>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.css" />" />
<link href="<c:url value="/jfile/resources/swfupload/css/custom.css" />" rel="stylesheet" type="text/css" />
<%--javascript--%>
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/login.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/cmnReady.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/smartPop/jquery.smartPop.js" />"></script>
<script type="text/javascript" src="<c:url value="/com/js/ui.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jfile/resources/jwork/jwork.fileUploadUser.js" />"></script>
<script type="text/javascript" src="<c:url value="/jfile/resources/jwork/jwork.fileDownload.js" />"></script>
<script type="text/javascript" src="<c:url value="/jfile/resources/swfupload/swfupload/swfupload.js" />"></script>
<script type="text/javascript" src="<c:url value="/jfile/resources/swfupload/js/swfupload.queue.js" />"></script>
<script src="/ckeditor/ckeditor.js"></script>
<script>
CKEDITOR.config.height = 400;
$(function() {
	if ('${param.reload}' == 'Y') {
    	opener.location.href = "/web/link?pMENU_NO=${param.pMENU_NO}";
	}
  
	var msg = $("#resultMessage").val();
	if(msg != null && msg != ""){
      alert(msg);
      $("#resultMessage").val("");
    }
});

function goAction() {
	var fm = document.form;
	if (!gfnValidate(fm)) {
		return;
	}
	if (CKEDITOR.instances.CNTNTS_CN.getData() == '') {
    	alert('내용을 입력해 주세요.');
    	CKEDITOR.instances.CNTNTS_CN.focus();
    	return;
  	}
	fm.submit();
}
</script>
</head>
<body>
    <input type="hidden" name="resultMessage" id="resultMessage" value="${resultMessage}" />
    <div id="wrap" class="sty02">
        <div class="popWarp">
            <p class="popTit">
                컨텐츠 ${empty contentsView?'등록':'수정'}<span class="popClose"><a href="" title="닫기" onclick="self.close();">닫기</a></span>
            </p>
            <div class="popCont">
                <form name="form" action="/cms/contents/cud" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="cntnts_no" id="cntnts_no" value="<c:out value="${contentsView.CNTNTS_NO }" />" /> <input type="hidden" name="cmd" id="cmd" value="<c:if test="${empty contentsView}">write</c:if><c:if test="${not empty contentsView}">update</c:if>" /> <input type="hidden" name="MENU_NO" id="MENU_NO" value="<c:out value="${param.MENU_NO }" />" /> <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> <input type="hidden" name="FILE_ID" id="FILE_ID" value="<c:out value="${contentsView.FILE_ID }"/>" /> <input type="hidden" name="mode" value="${mode}" />
                    <table class="table02" summary="컨텐츠관리 - 제목,내용">
                        <caption>컨텐츠 ${empty contentsView?'등록':'수정'}</caption>
                        <colgroup>
                            <col width="10%" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span class="iCheck">제 목</span></th>
                                <td><input type="text" name="CNTNTS_NM" id="CNTNTS_NM" value="<c:out value="${empty contentsView.CNTNTS_NM?menuMap.MENU_NM:contentsView.CNTNTS_NM }" />" class="W95p checkNull" title="제목" maxlength="200" /></td>
                            </tr>
                            <tr>
                                <th><span class="iCheck">내 용</span></th>
                                <td><textarea cols="80" id="CNTNTS_CN" name="CNTNTS_CN">${contentsView.CNTNTS_CN}</textarea> <script>
                          CKEDITOR.replace('CNTNTS_CN', {
                            'filebrowserUploadUrl' : '/editor/upload/'
                          });
                          function fnGetEditorHTML() {
                            return CKEDITOR.currentInstance.getData();
                          }
        				</script></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <!-- 파일첨부 -->
                <%if(brCheck){ %>
                <jwork:fileuploader objectId="fileUploadObj1" fileId="${contentsView.FILE_ID}" uploadCompletedEvent="uploadCompleted1" fileType="all" fileThumbnailYn="N" maxFileSize="50" maxFileCount="5" usePreview="true" useSecurity="false" uploadMode="db" />
                <script> 
                        function send1(){       
                            fileUploadObj1.startUpload();
                        }
                    
                        function uploadCompleted1(){
                            fileUploadObj1.refresh();
                            var fileId = fileUploadObj1.getFileId();
                            $("#FILE_ID").val(fileId);
                        }
                    </script>
                <%}else{%>
                <%@include file="/jQuery-File-Upload/jUpload.jsp"%>
                <%}%>
                <!--버튼-->
                <div class="pop_bt2 AC MgT20">
                    <a href="" onClick="goAction();return false;" class="btn_1">${empty contentsView?'등 록':'수 정'}</a> 
                    <a href="" onclick="self.close();return false;" class="btn_2">닫 기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
