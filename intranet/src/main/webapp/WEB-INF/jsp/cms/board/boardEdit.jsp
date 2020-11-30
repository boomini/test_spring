<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = sdf.format(new java.util.Date());
    request.setAttribute("today",today);
    
    Boolean brCheck = egovframework.common.util.EgovWebUtil.getBrowserCheckFileUi(request);//IE7,8,9 : jFILE 사용,  그외 Jquery 업로드 사용
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

function goSave()
{
	var form = document.frm;
	
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

function setZipCode(code,val){
    document.frm.REGISTER_ZIP.value=code;
    document.frm.ADDR.value=val;
}
</script>

        <form name="frm" action="/cms/board/${boardCfg.BBS_NO}/cud/" method="post" onsubmit="return goSave(this)"  enctype="multipart/form-data">
            <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
            <input type="hidden" name="MODE" value="<c:out value='${param.MODE}'/>"/>
            <input type="hidden" name="BBS_NO" value="<c:out value='${boardCfg.BBS_NO}'/>"/>
            <input type="hidden" name="BBSCTT_NO" value="<c:out value='${param.BBSCTT_NO}'/>"/>
            <input type="hidden" name="MENU_NO" value="<c:out value='${param.MENU_NO}'/>"/>
            <input type="hidden" name="searchType" value="<c:out value='${param.searchType}'/>"/>
            <input type="hidden" name="searchWord" value="<c:out value='${searchWord}'/>"/>
            <input type="hidden" name="DEL_FILE_REF" value=""/>
            <input type="hidden" name="FILE_ID" id="FILE_ID" value="<c:out value="${dataMap.FILE_ID}"/>"/>
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
                    <th><span class="iCheck">제목</span></th>
                    <td colspan="3" class="AL borR0">
                        <input type="text" name="BBSCTT_SJ"  value="<c:out value="${dataMap.BBSCTT_SJ}"/>" class="W90p checkNull" title="제목"  maxlength="200"/>
                    </td>
                </tr>
                <tr>
                    <th><span class="iCheck">작성자</span></th>
                    <td class="AL">
                        <input type="text" title="작성자" class="W150 checkNull" name="REGISTER_NM" id="REGISTER_NM" value="<c:if test='${mode == "modify"}'><c:out value='${dataMap.REGISTER_NM}'/></c:if><c:if test='${mode != "modify"}'><c:out value='${memberVO.user_nm}'/></c:if>" maxlength="50"/>
                    </td>
                    <th>작성일</th>
                    <td>
                        <fmt:formatDate value="${dataMap.REGIST_DT}" pattern="yyyy-MM-dd"/>
                        <c:if test='${mode != "modify"}'><c:out value='${today}'/></c:if>
                    </td>
                </tr>
                <c:if test="${boardCfg.SCRSNT_USE_AT =='Y'}">
                <tr>
                    <th>비밀글</th>
                    <td colspan="3" class="AL borR0">
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
                        <input name='telNo2' value="${tempTelNo[1]}" maxlength="4" type="text" title="전화번호 중간자리" class="typeText_st01 intCheck" value="" style="ime-mode:disabled;width: 40px;"  dataType="telephone"/>
                        -
                        <input name='telNo3' value="${tempTelNo[2]}" maxlength="4" type="text" title="전화번호 뒷자리" class="typeText_st01 intCheck" value="" style="ime-mode:disabled;width: 40px;" dataType="telephone">
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
                <c:if test="${boardCfg.NTCSNT_USE_AT =='Y'}">
                <tr>
                    <th>공지글</th>
                    <td colspan="3" class="AL borR0">
                        <html:radio name="NOTICE_AT" value='Y|N' text='사용|미사용' checkedValue='${dataMap.NOTICE_AT}' defaultValue='N' space="&nbsp;" id='Yes2|No2'/>
                    </td>
                </tr>
                </c:if>
                <tr>
                    <th><span class="iCheck">내용</span></th>
                    <td colspan="3" class="AL W150">
                    <textarea name="BBSCTT_CN" id="BBSCTT_CN" rows="10" cols="80" title="내용" class="W100p checkNull"><c:if test='${boardCfg.WBDETR_USE_AT == "Y"}'><html:xss><c:out value='${dataMap.BBSCTT_CN}' escapeXml="false" /></html:xss></c:if><c:if test='${boardCfg.WBDETR_USE_AT != "Y"}'><html:xss><c:out value='${dataMap.BBSCTT_CN}' /></html:xss></c:if></textarea>
                </td>
                </tr>
    
                </tbody>
            </table>
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
            
            <!-- 파일첨부 -->
        </form>
            <c:if test="${boardCfg.UPLOAD_POSBL_AT == 'Y'}">
            <%if(brCheck){ %>
            	<jwork:fileuploader 
                   objectId="fileUploadObj1"  
                   fileId ="${dataMap.FILE_ID}"
                   uploadCompletedEvent="uploadCompleted1"
                   fileType="${boardCfg.BBS_TY == 'P'?'image':'all' }" 
                   fileThumbnailYn = "${boardCfg.BBS_TY == 'P'?'Y':'N' }"
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
            <c:if test="${mode == 'write' }"><html:buttonAuth gubun="add" script="goSave();return false;"/><!-- 등록 --></c:if> 
            <c:if test="${mode == 'modify' }"><html:buttonAuth gubun="mod" script="goSave();return false;"/><!-- 수정 --></c:if> 
            <a href="/cms/board/${boardCfg.BBS_NO}/<c:out value='${parameters}'/>"  class="btn_2">목 록</a>
        </div>