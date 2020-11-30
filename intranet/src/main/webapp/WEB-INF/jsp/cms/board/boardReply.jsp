<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = sdf.format(new java.util.Date());
    request.setAttribute("today",today);
%>
<script>
//날짜 추가
$(function() {
	gfnSetDatePickerOne($("#ANSWER_REGIST_DT"));
});
       
function goSave(form)
{
    if(!gfnValidate(form)){
        return;
    }
    <c:if test="${boardCfg.WBDETR_USE_AT =='Y'}">
    if(CKEDITOR.instances.ANSWER_CN.getData() == ''){
    	alert('내용을 입력해 주세요.');
    	CKEDITOR.instances.ANSWER_CN.focus();
    	return ;
    }
    </c:if>
    
    form.submit();
}


//]]>
</script><noscript></noscript>

    <div class="tit MgT10"><%-- <c:out value='${boardCfg.BBS_NM}'/> --%>질문</div>

        <table class="table02"  summary="제목,작성자,작성일,비빌글,전화번호,이메일,공지글,분류,내용,첨부파일 등">
        <caption><c:out value='${boardCfg.BBS_NM}'/> 게시판 폼</caption>
        <colgroup>
            <col style="width: 80px"/>
            <col style="width: 200px"/>
            <col style="width: 80px"/>
            <col style="width: 200px"/>
        </colgroup>
        <tbody>
        <tr>
            <th >제목</th>
            <td colspan="3" class="AL">
                <c:out value="${dataMap.BBSCTT_SJ}"/>
            </td>
        </tr>
        <tr>
            <th >작성자</th>
            <td class="AL">
                <c:out value='${dataMap.REGISTER_NM}'/>
            </td>
            <th >작성일</th>
            <td>
              <fmt:formatDate value="${dataMap.REGIST_DT}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <%-- <tr>
            <th >전화번호</th>
            <td>
                <c:out value='${dataMap.REGISTER_TELNO}'/>
            </td>
            <th >이메일</th>
            <td>
                <c:out value='${dataMap.REGISTER_EMAIL}'/>
            </td>
        </tr> --%>
        <!-- 일단 주석 필요할때 풀자 -->
        <!-- 
        <tr>
            <th >우편번호</th>
            <td colspan="3">
                <c:out value='${dataMap.REGISTER_ZIP}'/>
            </td>
        </tr>
        <tr>
            <th >주소</th>
            <td colspan="3">
                <c:out value='${dataMap.ADDR}'/> <c:out value='${dataMap.REGISTER_ADRES_DETAIL}'/>
            </td>
        </tr>
         --> 
        <!--// 일단 주석 필요할때 풀자 -->
        <%-- <c:forEach var='optEO' items='${optionList}' varStatus='status'>
        <tr>
            <th ><c:out value='${optEO.OPT_BBSCTT_SJ}'/></th>
            <td colspan="3"><c:out value='${optEO.OPT_VALUE}'/></td>
        </tr>
        </c:forEach> --%>
        
        <%--추가 컬럼 목록 정의 --%>
            <%-- <c:forEach begin="1" end="6" var="EO" step="1" varStatus="stat">
            <c:set  var="tempDate" value="SMLCLS${EO}_NM"/>
            <c:set  var="tempCfg" value="MI${EO}"/>
            <c:if test="${boardCfg[tempCfg] != '8'}">
            <tr>
                <th >분류${stat.count}</th>
                <td colspan="3" ><c:out value="${dataMap[tempDate]}"/></td>
            </tr>
            </c:if>
            </c:forEach> --%>
            <%--//추가 컬럼 목록 정의 --%>
        <tr>
            <th >첨부파일</th>
            <td colspan="3" class="AL">
                <c:forEach var='fileEO' items='${fileList}' varStatus='status'>
                    <a href="/jfile/readDownloadFile.do?fileId=${fileEO.fileId}&fileSeq=${fileEO.fileSeq}&useSecurity=${fileEO.useSecurity}&uploadMode=${fileEO.uploadMode}"><c:out value='${fileEO.fileName}'/></a><br/>       
                </c:forEach>
            </td>
        </tr>

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
        <div class="tit MgT20"><%-- <c:out value='${boardCfg.BBS_NM}'/> --%>답변</div>
            <form name="frm" action="/cms/board/${boardCfg.BBS_NO}/cud/" method="post" onsubmit="return goSave(this)"  enctype="multipart/form-data">
            <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
            <input type="hidden" name="MODE" value="reply"/>
            <input type="hidden" name="BBS_NO" value="<c:out value='${boardCfg.BBS_NO}'/>"/>
            <input type="hidden" name="BBSCTT_NO" value="<c:out value='${dataMap.BBSCTT_NO}'/>"/>
            <table class="table02"  summary="담당자,답변일, 처리현황,담당부서,연락처,답변내용 등">
            <caption><c:out value='${boardCfg.BBS_NM}'/> 답변 폼</caption>
            <colgroup>
                <col style="width: 100px"/>
	            <col style="width: 200px"/>
	            <col style="width: 100px"/>
	            <col style="width: 200px"/>
            </colgroup>
            <tbody>
            <tr>
                <th ><span class="iCheck">담당자</span></th>
                <td class="AL">
                    <input type="text" name="ANSWER_REGISTER_NM"  size="20" value="<c:out value="${dataMap.ANSWER_REGISTER_NM }" default="${memberVO.user_nm }"/>" class="W150 checkNull" title="담당자" maxlength="80"/>
                </td>
                <th ><span class="iCheck">답변일</span></th>
                <td class="AL">
                    <input type="text" name="ANSWER_REGIST_DT" id="ANSWER_REGIST_DT"  size="15" value="<fmt:formatDate value="${dataMap.ANSWER_REGIST_DT}" pattern="yyyy-MM-dd"/><c:if test='${empty dataMap.ANSWER_REGIST_DT}'><c:out value="${today}"/></c:if>" class="W80 checkNull" title="답변일" readonly="readonly"/>
                </td>
            </tr>
            <tr>
                <th ><span class="iCheck">연락처</span></th>
                <td class="AL">
                    <input type="text" name="ANSWER_REGISTER_TELNO" size="20" value="<c:out value="${dataMap.ANSWER_REGISTER_TELNO }"/>" class="W150 checkNull" title="연락처" maxlength="14"/>
                </td>
                <th ><span class="iCheck">처리현황</span></th>
                <td class="AL">
                <html:selectList name='ANSWER_STTUS' list='repStat' listValue='CODE' listName='CODE_NM' selectedValue='${dataMap.ANSWER_STTUS}'  id="ANSWER_STTUS" script="class=\"W100\""  title="답변 처리 상태"/>
                </td>
            </tr>
            <tr>
                <th ><span class="iCheck">답변내용</span></th>
                <td colspan="5">
                    <textarea name="ANSWER_CN" id="ANSWER_CN" rows="10" cols="80" title="내용" class="W100p checkNull"><c:out value='${dataMap.ANSWER_CN}' escapeXml="false" /></textarea>
                        <c:if test="${boardCfg.WBDETR_USE_AT =='Y'}">
                            <script>
                            CKEDITOR.replace( 'ANSWER_CN',{
                                    'filebrowserUploadUrl':'/editor/upload/'
                                        });
                            function fnGetEditorHTML(){
                                return CKEDITOR.instances.ANSWER_CN.getData();
                            }
                            </script>
                        </c:if>
                </td>
            </tr>
            </tbody>
            </table>
            <div class="AR MgT10">
                <html:buttonAuth gubun="save" script="goSave(frm);return false;"/>
	            <a href="/cms/board/<c:out value='${boardCfg.BBS_NO}'/>/<c:out value='${parameters}'/>" class="btn_2" >목 록</a>
            </div>
            </form>
        
