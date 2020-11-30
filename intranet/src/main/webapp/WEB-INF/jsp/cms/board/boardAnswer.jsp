<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<%
Boolean brCheck = egovframework.common.util.EgovWebUtil.getBrowserCheckFileUi(request);
%>
<script>
function changeMailOpt(obj){
    if(obj.value==""){
        $('#emailEtc').show();
    }else{
        $('#emailEtc').val("");
        $('#emailEtc').hide();
    }
}

function goSave(form)
{
    
    if($('#email1').val() != "" || $('#email2').val() != "" || $('#emailEtc').val() != ""){
        $('#email').val($('#email1').val()+"@"+$('#email2').val()+$('#emailEtc').val());
    }
    
    if(!gfnValidate(form)){
        return ;
    }
    <c:if test="${boardCfg.WBDETR_USE_AT =='Y'}">
    if(CKEDITOR.instances.BBSCTT_CN.getData() == ''){
        alert('내용을 입력해 주세요.');
        CKEDITOR.instances.BBSCTT_CN.focus();
        return ;
    }
    </c:if>
    
    form.submit();
}
</script>
		<table class="table02"  summary="제목,작성자,작성일,비빌글,전화번호,이메일,공지글,분류,내용,첨부파일 등">
            <caption><c:out value='${boardCfg.BBS_NM}'/> 게시판 폼</caption>
		<colgroup>
			<col style="width: 15%"/>
            <col style="width: 35%"/>
			<col style="width: 15%"/>
            <col style="width: 35%"/>
		</colgroup>
		<tbody>
		<tr>
            <th>제목</th>
            <td colspan="3" class="AL">
                <c:out value="${dataMap.BBSCTT_SJ}"/>
            </td>
        </tr>
		<tr>
			<th>작성자</th>
			<td class="AL">
				<c:out value='${dataMap.REGISTER_NM}'/>
			</td>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${dataMap.REGIST_DT}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<%-- <tr>
			<th>전화번호</th>
			<td>
				<c:out value='${dataMap.REGISTER_TELNO}'/>
			</td>
			<th>이메일</th>
			<td>
				<c:out value='${dataMap.REGISTER_EMAIL}'/>
			</td>
		</tr> --%>
		<!-- 일단 주석 필요할때 풀자 -->
		<!-- 
		<tr>
			<th>우편번호</th>
			<td colspan="3">
				<c:out value='${dataMap.REGISTER_ZIP}'/>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3">
				<c:out value='${dataMap.ADDR}'/> <c:out value='${dataMap.REGISTER_ADRES_DETAIL}'/>
			</td>
		</tr>
		 -->
		<!--// 일단 주석 필요할때 풀자 -->
		<%-- <c:forEach var='optEO' items='${optionList}' varStatus='status'>
		<tr>
			<th><c:out value='${optEO.OPT_BBSCTT_SJ}'/></th>
			<td colspan="3"><c:out value='${optEO.OPT_VALUE}'/></td>
		</tr>
		</c:forEach> --%>
		<c:if test="${boardCfg.UPLOAD_POSBL_AT == 'Y'}">
		<tr>
			<th>첨부파일</th>
			<td colspan="3" class="AL">&nbsp;
                <c:forEach var='file' items='${fileList}' varStatus='status'>
                    <a href="/jfile/readDownloadFile.do?fileId=${file.fileId}&fileSeq=${file.fileSeq}&useSecurity=${file.useSecurity}&uploadMode=${file.uploadMode}"><c:out value='${file.fileName}'/></a><br/>       
                </c:forEach>
			</td>
		</tr>
		</c:if>

		<tr>
			<td colspan="4" class="AL" style="min-height: 250px;">
			<c:if test='${boardCfg.WBDETR_USE_AT == "Y"}'>
                <html:xss><c:out value='${dataMap.BBSCTT_CN}' escapeXml="false" /></html:xss>
            </c:if>
            <c:if test='${boardCfg.WBDETR_USE_AT != "Y"}'>
                <html:xss><html:text tag='<br />'><c:out value='${dataMap.BBSCTT_CN}' escapeXml="false" /></html:text></html:xss>
            </c:if>
			</td>
		</tr>
		</tbody>
		</table>
        <div class="tit MgT20"><c:out value='${boardCfg.BBS_NM}'/> - 댓글</div>
<!-- @:: 테스트  -->
		<form name="editForm" action="/cms/board/${boardCfg.BBS_NO}/cud/" method="post" onsubmit="return goSave(this)"  enctype="multipart/form-data">
		<input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
		<input type="hidden" name="MODE" value="answer"/>
		<input type="hidden" name="BBS_NO" value="<c:out value='${param.BBS_NO}'/>"/>
		<input type="hidden" name="BBSCTT_NO" value="<c:out value='${param.BBSCTT_NO}'/>"/>
		<input type="hidden" name="UPPER_BBSCTT_NO" value="<c:out value='${dataMap.UPPER_BBSCTT_NO}'/>"/>
		<input type="hidden" name="GROUP_BBSCTT_NO" value="<c:out value='${dataMap.GROUP_BBSCTT_NO}'/>"/>
		<input type="hidden" name="BBSCTT_ORDR" value="<c:out value='${dataMap.BBSCTT_ORDR}'/>"/>
		<input type="hidden" name="FILE_ID" id="FILE_ID" value=""/>
	
		<table class="table02"  summary="제목,작성자,작성일,비빌글,전화번호,이메일,공지글,분류,내용,첨부파일 등">
            <caption><c:out value='${boardCfg.BBS_NM}'/> 게시판 폼</caption>
		<colgroup>
            <col style="width: 15%"/>
            <col/>
        </colgroup>
		<tbody>
		<tr>
            <th><span class="iCheck">제목</span></th>
            <td class="AL">
                <input type="text" name="BBSCTT_SJ" style="width: 90%"  value="[Re]<c:out value="${dataMap.BBSCTT_SJ}"/>" class="checkNull W90p" title="제목" />
            </td>
        </tr>
		<tr>
			<th><span class="iCheck">작성자</span></th>
			<td class="AL">
				<input type="text" title="작성자" name="REGISTER_NM" id="REGISTER_NM" value="<c:out value='${user.name}'/>"  class="checkNull W150" />
			</td>
		</tr>
		<c:if test='${boardCfg.SCRSNT_USE_AT=="Y"}'>
		<tr>
			<th>공개여부</th>
			<td class="AL">
				<html:radio name='OTHBC_AT' value='Y|N' text='공개|비공개' checkedValue='${dataMap.OTHBC_AT}'  defaultValue='Y' space='' id="Yes|No" />
			</td>
		</tr>
		</c:if>
		<%-- <tr>
			<th>전화번호</th>
			<td colspan="3">
			    <c:set var="tempTelNo" value="${fn:split(adminView.REGISTER_TELNO, '-')}"/>
			    <html:selectList name='telNo1' list='telList' listValue='SM_NM' listName='SM_NM' selectedValue='${tempTelNo[0]}'  id="telNo1" title="전화번호 앞자리" script="class=\"selectForm\"" />
			    -
			    <input name='telNo2' value="${tempTelNo[1]}" maxlength="4" type="text" title="전화번호 중간자리" class="typeText_st01" value="" style="ime-mode:disabled;width: 40px;"  dataType="telephone"/>
			    -
			    <input name='telNo3' value="${tempTelNo[2]}" maxlength="4" type="text" title="전화번호 뒷자리" class="typeText_st01" value="" style="ime-mode:disabled;width: 40px;" dataType="telephone">
			</td>
        </tr>
        <tr>
			<th>이메일</th>
			<td colspan="3">
			    <c:set var="tempEmail" value="${fn:split(adminView.EMAIL, '@')}"/>
			    <input  name='email1' type="text" id="email1" value="${tempEmail[0]}" class="typeText_st01" maxlength="20" style="ime-mode:disabled;width: 25%;"/>
			    @
			    <html:selectList name='email2' list='emailList'  optionNames='직접입력' optionValues='' listValue='SM_NM' listName='SM_NM' selectedValue='${tempEmail[1]}' id="email2"  title="이메일형식" script="class=\"selectForm\" onchange='changeMailOpt(this)' "/>
			    <input name='emailEtc' id="emailEtc" type="text" size="20"  value="" title="이메일 도메인 직접입력" class="typeText_st01" style="ime-mode:disabled;width: 25%;" />
			    <input type="hidden" name="email" id="email" value="" dataType="email"/>
			    <script>
			    if($("#email2").val() == ""){
			        $('#emailEtc').show();
			        $("#emailEtc").val('${tempEmail[1]}');
			    }else{
			        $('#emailEtc').hide();
			    }
			    </script>
            </td>
        </tr> --%>
		<tr>
			<th><span class="iCheck">내용</span></th>
			<td>
			<!-- innoditor 영역 -->
          		<textarea name="BBSCTT_CN" id="BBSCTT_CN" rows="10" cols="80" title="내용"  style="width: 100%"><c:out value='' escapeXml="false" /></textarea>
          			<c:if test="${boardCfg.WBDETR_USE_AT =='Y'}">
	            		<script>
	                    CKEDITOR.replace( 'BBSCTT_CN',{
	                            'filebrowserUploadUrl':'/editor/upload/'
	                                });
	                    function fnGetEditorHTML(){
	                        return CKEDITOR.currentInstance.getData();
	                    }
	                    </script>
                 </c:if>
			</td>
		</tr>
		</tbody>
		</table>
        </form>
        <!-- 파일첨부 -->
            <c:if test="${boardCfg.UPLOAD_POSBL_AT == 'Y'}">
            <%if(brCheck){ %>
                <jwork:fileuploader 
                       objectId="fileUploadObj1"  
                       fileId =""
                       uploadCompletedEvent="uploadCompleted1"
                       fileType="all" 
                       maxFileSize="${boardCfg.UPLOAD_POSBL_SIZE}" 
                       maxFileCount="${boardCfg.UPLOAD_LMTT_CO}" 
                       usePreview="true"
                       useSecurity="false"
                       uploadMode="db"
                       />
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
                <%@include file="/jQuery-File-Upload/jUpload.jsp" %>    
            <%}%>
            </c:if> 
        <div class="AR MgT10">
            <html:buttonAuth gubun="add" script="goSave(editForm);return false;"/><!-- 등록 --> 
            <a href="/cms/board/<c:out value='${boardCfg.BBS_NO}'/>/<c:out value='${parameters}'/>" class="btn_2">목 록</a>
        </div>			            
		
