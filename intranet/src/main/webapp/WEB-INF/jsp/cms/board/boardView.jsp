<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
function modifyChk(){
    var fm=document.form;
    fm.MODE.value = "modify";
    fm.action = "/web/board/${boardCfg.BBS_NO}/form/";
    fm.submit();
}       
function deleteChk(){
    if(confirm('삭제하시겠습니까?')){
        var fm=document.form;
        fm.MODE.value = "delete";
        fm.action = "/web/board/${boardCfg.BBS_NO}/cud/";
        fm.submit();
    }
}
function goReply(){
	location.href='/web/board/${boardCfg.BBS_NO}/form/<c:out value='${parameters}'/>&amp;MODE=reply&amp;BBSCTT_NO=<c:out value='${dataMap.BBSCTT_NO}'/>&amp;BBS_NO=<c:out value='${dataMap.BBS_NO}'/>';
}
function goAnswer(){
    var fm=document.form;
    fm.MODE.value = "answer";
    fm.action ='/web/board/${boardCfg.BBS_NO}/form/<c:out value='${parameters}'/>';
    fm.submit();
}
</script>
<c:if test='${boardCfg.BBS_TY=="M"}'>
    <div class="tit"><%-- <c:out value='${boardCfg.BBS_NM}' /> --%>질문</div>
</c:if>
<form name="form" action="" method="post">
  <input type="hidden" name="BBS_NO" value="${boardCfg.BBS_NO}" /> 
  <input type="hidden" name="BBSCTT_NO" value="${dataMap.BBSCTT_NO}" /> 
  <input type="hidden" name="CMNT_ID" value="" /> 
  <input type="hidden" name="pMENU_NO" value="${param.pMENU_NO }" /> 
  <input type="hidden" name="MODE" />
  <table class="table02" summary="제목,작성자,작성일,전화번호,이메일,공개여부,분류,첨부파일">
    <caption>
      <c:out value='${boardCfg.BBS_NM}' />
      게시판 상세 정보
    </caption>
    <colgroup>
      <col style="width: 15%;" />
      <col style="width: 35%" />
      <col style="width: 15%;" />
      <col style="width: 35%" />
    </colgroup>
    <tbody>
      <tr>
        <th>제목</th>
        <td colspan="3" class="AL"><c:out value="${dataMap.BBSCTT_SJ}" /></td>
      </tr>
      <tr>
        <th>작성자</th>
        <td class="AL"><c:out value='${dataMap.REGISTER_NM}' /></td>
        <th>작성일</th>
        <td><fmt:formatDate value="${dataMap.REGIST_DT}" pattern="yyyy-MM-dd" /></td>
      </tr>
      <%-- <tr>
		        <th>전화번호</th>
		        <td><c:out value='${dataMap.REGISTER_TELNO}'/></td>
		        <th>이메일</th>
		        <td><c:out value='${dataMap.REGISTER_EMAIL}'/></td>
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
      <c:if test='${boardCfg.SCRSNT_USE_AT=="Y"}'>
        <tr>
          <th>공개여부</th>
          <td colspan="3" class="AL"><c:out value="${dataMap.OTHBC_AT=='Y'?'공개':'비공개'}" /></td>
        </tr>
      </c:if>
      <%--추가 카테고리 목록 정의 --%>
      <%--  <c:forEach begin="1" end="6" var="EO" step="1" varStatus="stat">
		    <c:set  var="tempDate" value="SMLCLS${EO}_NM"/>
		    <c:set  var="tempCfg" value="MI${EO}"/>
		    <c:if test="${boardCfg[tempCfg] != '8'}">
		    <tr>
		        <th>분류${stat.count}</th>
		        <td colspan="3" ><c:out value="${dataMap[tempDate]}"/></td>
		    </tr>
		    </c:if>
		    </c:forEach> --%>
      <%--//추가 카테고리 목록 정의 --%>
      <%--추가 컬럼 목록 정의 --%>
      <%-- <c:forEach var='optEO' items='${optionList}' varStatus='status'>
		    <tr>
		        <th><c:out value='${optEO.OPT_BBSCTT_SJ}'/></th>
		        <td colspan="3"><c:out value='${optEO.OPT_VALUE}'/></td>
		    </tr>
		    </c:forEach> --%>
      <%--//추가 컬럼 목록 정의 --%>
      <c:if test="${boardCfg.UPLOAD_POSBL_AT == 'Y'}">
        <tr>
          <th>첨부파일</th>
          <td colspan="3" class="AL">
            <c:forEach var='file' items='${fileList}' varStatus='status'>
              <a href="/jfile/readDownloadFile.do?fileId=${file.fileId}&fileSeq=${file.fileSeq}&useSecurity=${file.useSecurity}&uploadMode=${file.uploadMode}" style="color: blue;"><c:out value='${file.fileName}' /></a>
              <br />
            </c:forEach>
          </td>
        </tr>
      </c:if>
      <tr>
        <td colspan="4" class="AL" style="min-height: 250px;"><c:if test='${boardCfg.WBDETR_USE_AT == "Y"}'>
            <html:xss>
              <c:out value='${dataMap.BBSCTT_CN}' escapeXml="false" />
            </html:xss>
          </c:if> <c:if test='${boardCfg.WBDETR_USE_AT != "Y"}'>
            <html:xss>
              <html:text tag='<br />'>
                <c:out value='${dataMap.BBSCTT_CN}' escapeXml="false" />
              </html:text>
            </html:xss>
          </c:if></td>
      </tr>
    </tbody>
  </table>
  <c:if test='${boardCfg.BBS_TY=="M"}'>
      <div class="tit MgT20"><%-- <c:out value='${boardCfg.BBS_NM}' /> --%>답변</div>
    <table class="table02" summary="담당자,답변일,처리현황,담당부서,연락처,답변내용">
      <caption>
        <c:out value='${boardCfg.BBS_NM}' />
        답변 상세 정보
      </caption>
      <colgroup>
        <col style="width: 15%;" />
        <col style="width: 35%" />
        <col style="width: 15%;" />
        <col style="width: 35%" />
      </colgroup>
      <tbody>
        <tr>
          <th>담당자</th>
          <td><c:out value="${dataMap.ANSWER_REGISTER_NM}" /></td>
          <th>답변일</th>
          <td><fmt:formatDate value="${dataMap.ANSWER_REGIST_DT}" pattern="yyyy-MM-dd" /></td>
        </tr>
        <tr>
          <th>연락처</th>
          <td><c:out value="${dataMap.ANSWER_REGISTER_TELNO}" /></td>
          <th>처리현황</th>
          <td><c:out value="${dataMap.ANSWER_STTUS_NM}" /></td>
        </tr>
        <tr>
          <td colspan="4" class="AL" style="min-height: 250px;"><c:if test='${boardCfg.WBDETR_USE_AT == "Y"}'>
              <html:xss>
                <c:out value='${dataMap.ANSWER_CN}' escapeXml="false" />
              </html:xss>
            </c:if> <c:if test='${boardCfg.WBDETR_USE_AT != "Y"}'>
              <html:xss>
                <html:text tag='<br />'>
                  <c:out value='${dataMap.ANSWER_CN}' escapeXml="false" />
                </html:text>
              </html:xss>
            </c:if></td>
        </tr>
      </tbody>
    </table>
  </c:if>
  <div class="btn AR MgT10">
  	
    <c:if test='${boardCfg.BBS_TY=="M"}'>
      <html:buttonAuth gubun="add" script="goReply();return false;" title="답 변"/>
    </c:if>
    <c:if test='${boardCfg.ANSWER_USE_AT=="Y"}'>
      <html:buttonAuth gubun="add" script="goAnswer();return false;" title="댓글 답변"/>
    </c:if>
    <c:if test="${dataMap.SELFYN eq '_Y'}">
	    <html:buttonAuth gubun="mod" script="modifyChk();return false;"/><!-- 수정 -->
	    <html:buttonAuth gubun="del" script="deleteChk();return false;"/><!-- 삭제 -->
    </c:if>
    <a href="/web/board/${boardCfg.BBS_NO}/<c:out value='${parameters}'/>"  class="btn_2">목 록</a>
  </div>
</form>
<%--
<!-- 이전, 다음 게시물 링크 :: -->
<ul class="bx_list_prev_next mt50">
  <li><span class="tx_nanumG tx_bold">이전글</span> <c:if test='${empty pre}'>
      <a href="#viewList">이전글이 없습니다.</a>
    </c:if> <c:if test='${!empty pre}'>
      <a href="/web/board/${pre.BBS_NO}/<c:out value='${pre.BBSCTT_NO}'/>/<c:out value='${parameters}'/>"><c:out value="${pre.BBSCTT_SJ}" /></a>
    </c:if></li>
  <li><span class="tx_nanumG tx_bold">다음글</span> <c:if test='${empty next}'>
      <a href="#viewList">다음글이 없습니다.</a>
    </c:if> <c:if test='${!empty next}'>
      <a href="/web/board/${next.BBS_NO}/<c:out value='${next.BBSCTT_NO}'/>/<c:out value='${parameters}'/>"><c:out value="${next.BBSCTT_SJ}" /></a>
    </c:if></li>
</ul>
<!-- //이전, 다음 게시물 링크 :: -->
 --%>