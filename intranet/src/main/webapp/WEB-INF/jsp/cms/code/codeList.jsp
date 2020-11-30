<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>	
//사용/미사용 조회
function search(){
	$("#frmgo input:hidden[name=USE_AT]").val($("#USE_AT").val());
	$("#frmgo").submit();
}
//사용/미사용 업데이트
function goUseYn(yn){
	if($('input:checkbox[name=chkbox]:checked').length == 0){
    	alert('선택된 게시물이 없습니다.');
    	return;
	}
	$("#USEAT").val(yn);
	$("#mode2").val("proc");
	$("#form2").attr("method","post");
	$("#form2").attr("action","/cms/code/cud/");
	$("#form2").submit();
}
//신규등록
function goAction(){
	if (!gfnValidate($("#form"))) {
  		return;
	}
	$("#mode").val("write");
	$("#form").attr("method","post");
	$("#form").attr("action","/cms/code/cud/");
	$("#form").submit();
}
//수 정
function updateProc(id){
	$("#SORT_ORDR").val($('#lr_ord_'+id).val());
	$("#CODE_NM").val($('#lr_nm_'+id).val());
	$("#CODE").val($('#lr_cd_'+id).val());
	$("#CODE_NO").val($('#lr_cdNo_'+id).val());
	if (!gfnValidate($("#form2"))) {
		return;
	}
	$("#mode").val("modify");
	$("#form").attr("method","post");
	$("#form").attr("action","/cms/code/cud/");
	$("#form").submit();
}
//수 정 폼전환
function updateForm(seq){
	$('#tru_'+seq).show();
	$('#trl_'+seq).hide();
}
//수 정폼 취수
function goCancel(seq){
	$('#tru_'+seq).hide();
	$('#trl_'+seq).show();
}
//다음 단계이동
function goNextPage(cl,cl2){
	$("#frmgo input:hidden[name=UPPER_CODE_NO]").val(cl);
	//$("#frmgo input:hidden[name=PRE_UPPER_CODE_NO]").val(cl2);
	var codLvl = parseInt($("#CODE_LEVEL").val())+1;
	$("#CODE_LEVEL").val(codLvl);
	$("#frmgo input:hidden[name=USE_AT]").val('');
	$("#frmgo").submit();
}
//전 단계이동
function goPrePage(){
	if($("#CODE_LEVEL").val()==2) $("#frmgo input:hidden[name=PRE_UPPER_CODE_NO]").val("0000");
	$("#frmgo input:hidden[name=UPPER_CODE_NO]").val($("#frmgo input:hidden[name=PRE_UPPER_CODE_NO]").val());
	var codLvl = $("#CODE_LEVEL").val()-1;
	$("#CODE_LEVEL").val(codLvl);
	$("#frmgo input:hidden[name=USE_AT]").val('');
	$("#frmgo").submit();
}
</script>
<form id="frmgo" name="frmgo" action="/cms/code/?pMENU_NO=<c:out value="${param.pMENU_NO}"/>" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" />
    <input type="hidden" name="UPPER_CODE_NO" value="<c:out value='${UPPER_CODE_NO}'/>" /> 
    <input type="hidden" name="PRE_UPPER_CODE_NO" value="<c:out value='${PRE_UPPER_CODE_NO}'/>" /> 
    <input type="hidden" name="CODE_LEVEL" id="CODE_LEVEL" value="<c:out value='${CODE_LEVEL}'/>" /> 
    <input type="hidden" name="USE_AT" value="<c:out value='${param.USE_AT}'/>" />
</form>
<form id="form" name="form" action="/cms/code/cud/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="mode" id="mode" value="" /> 
    <input type="hidden" name="CODE_NO" id="CODE_NO" value="" /> 
    <input type="hidden" name="UPPER_CODE_NO" value="<c:out value='${param.UPPER_CODE_NO}'/>" /> 
    <input type="hidden" name="CODE_LEVEL" value="<c:out value='${CODE_LEVEL}'/>" />
    <input type="hidden" name="PRE_UPPER_CODE_NO" value="<c:out value='${PRE_UPPER_CODE_NO}'/>" />
    
    <c:set var="bTit" value="${CODE_LEVEL} Level" />
     
    <div class="tit">${bTit}</div>
    <table summary="${bTit} 코드명,코드,코드설명" class="table_basic table01">
        <caption>${bTit} </caption>
        <colgroup>
            <col />
            <col style="width: 15%;" />
            <col style="width: 10%;" />
            <col style="width: 10%;" />
        </colgroup>
        <thead>
            <tr>
                <th>코드 명</th>
                <th>코드</th>
                <th>순서</th>
                <th>등 록</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" name="CODE_NM" id="CODE_NM" class="W90p checkNull" maxlength="100" title="코드명"></td>
                <td><input type="text" name="CODE" id="CODE" class="W90p checkNull" maxlength="4" title="코드"></td>
                <td><input type="text" name="SORT_ORDR" id="SORT_ORDR" size="3" class="intCheck" maxlength="3" title="순서"></td>
                <td><c:if test="${menuMap.REGISTE_AUTHOR_AT == 'Y'}"><a href="#" onClick="goAction();" class="btn_3">등 록</a></c:if></td>
            </tr>
        </tbody>
    </table>
</form>
<form id="form2" name="form2" action="/cms/code/cud/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="UPPER_CODE_NO" value="${UPPER_CODE_NO}" /> 
    <input type="hidden" name="mode" id="mode2" value="" /> 
    <input type="hidden" name="USEAT" id="USEAT" value="" /> 
    <input type="hidden" name="PRE_UPPER_CODE_NO" value="${PRE_UPPER_CODE_NO}" /> 
    <input type="hidden" name="CODE_LEVEL" value="${CODE_LEVEL}" />
    <div class="tit MgT20">${bTit}
        <c:choose>
            <c:when test="${CODE_LEVEL == 2}">(상위코드명 : <c:out value="${codePath[0].CODE_NM}" />)</c:when>
            <c:when test="${CODE_LEVEL == 3}">(상위코드명 : <c:out value="${codePath[0].CODE_NM}" /> &gt; <c:out value="${codePath[1].CODE_NM}" />)</c:when>
            <c:when test="${CODE_LEVEL == 4}">(상위코드명 : <c:out value="${codePath[0].CODE_NM}" /> &gt; <c:out value="${codePath[1].CODE_NM}" /> &gt; <c:out value="${codePath[2].CODE_NM}" />)</c:when>
            <c:when test="${CODE_LEVEL == 5}">(상위코드명 : <c:out value="${codePath[0].CODE_NM}" /> &gt; <c:out value="${codePath[1].CODE_NM}" /> &gt; <c:out value="${codePath[2].CODE_NM}" /> &gt; <c:out value="${codePath[3].CODE_NM}" />)</c:when>
        </c:choose>
    </div>
    <div class="MgT10" style="position: absolute; top: 267px; right: 34px;">
        <html:selectList name='USE_AT' optionValues='|Y|N' optionNames='전체|사용|미사용' selectedValue='${param.USE_AT}' title="사용여부" script="onchange='search();return false;' class='selectBoxS'" />
    </div>
    <table summary="${bTit} 코드명,코드,코드설명,사용여부" class="table_basic table01">
        <caption>${bTit} 목록</caption>
        <colgroup>
            <col style="width: 10%;" />
            <col />
            <col style="width: 15%;" />
            <col style="width: 10%;" />
            <col style="width: 10%;" />
            <col style="width: 10%;" />
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" onclick="gfnToggleMultiChk(this.checked, 'chkbox')" title="전체선택"></th>
                <th>코드 명</th>
                <th>코드</th>
                <th>사용여부</th>
                <th>순서</th>
                <th>수 정</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${codeList}" var="codeList" varStatus="stat">
                <tr id="trl_<c:out value="${stat.count }"/>">
                    <td><input type="checkbox" name="chkbox" value="<c:out value="${codeList.CODE_NO}"/>" title="행선택" /></td>
                    <td class="AL">
                        <c:choose>
                            <c:when test="${CODE_LEVEL != 4}">
                                <a href="" onclick="goNextPage('<c:out value="${codeList.CODE_NO}" />','<c:out value="${codeList.UPPER_CODE_NO}" />');return false;"> <c:out value="${codeList.CODE_NM}" /> <c:if test="${codeList.SUB_CNT > 0 }"> (<c:out value="${codeList.SUB_CNT}" />)</c:if></a>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${codeList.CODE_NM}" />
                                <c:if test="${codeList.SUB_CNT > 0 }"> (<c:out value="${codeList.SUB_CNT}" />)</c:if>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${codeList.CODE}" /></td>
                    <td><c:if test="${codeList.USE_AT eq 'Y'}">
                            <font color=#46649B>사용</font>
                        </c:if> <c:if test="${codeList.USE_AT eq 'N'}">
                            <font color=B93C3C>미사용</font>
                        </c:if>
                    </td>
                    <td><c:out value="${codeList.SORT_ORDR}" /></td>
                    <td><c:if test="${menuMap.CHANGE_AUTHOR_AT == 'Y'}"><a href="" onClick="updateForm(<c:out value="${stat.count }"/>);return false" class="btn_3">수 정</a></c:if></td>
                </tr>
                <tr id="tru_<c:out value="${stat.count }"/>" style="display: none">
                    <td><a href="" onClick="goCancel(<c:out value="${stat.count }"/>);return false" class="btn_3">취 소</a></td>
                    <td><input type="text" name="lr_nm_<c:out value="${stat.count }"/>" id="lr_nm_<c:out value="${stat.count }"/>" value="<c:out value="${codeList.CODE_NM}"/>" class="W90p checkNull" maxlength="100" title="코드명"></td>
                    <td><input type="text" name="lr_cd_<c:out value="${stat.count }"/>" id="lr_cd_<c:out value="${stat.count }"/>" value="<c:out value="${codeList.CODE}"/>" class="W90p checkNull" maxlength="4" title="코드"></td>
                    <td><c:if test="${codeList.USE_AT eq 'Y'}">
                            <font color=#46649B>사용</font>
                        </c:if> <c:if test="${codeList.USE_AT eq 'N'}">
                            <font color=B93C3C>미사용</font>
                        </c:if>
                    </td>
                    <td>
                    <input type="text" name="lr_ord_<c:out value="${stat.count }"/>" id="lr_ord_<c:out value="${stat.count }"/>" size="3" value="<c:out value="${codeList.SORT_ORDR}"/>" class="intCheck" maxlength="3" title="순서">
                    <input type="hidden" name="lr_cdNo_<c:out value="${stat.count }"/>" id="lr_cdNo_<c:out value="${stat.count }"/>"  value="<c:out value="${codeList.CODE_NO}"/>"  title="코드_번호"/>
                    </td>
                    <td><a href="" onClick="updateProc(<c:out value="${stat.count }"/>);return false" class="btn_3">저 장</a></td>
                </tr>
            </c:forEach>
            <c:if test="${empty codeList }">
                <tr>
                    <td colspan="6" class="AC borR0">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <div class="AR MgT10">
        <c:if test="${CODE_LEVEL != 1 }">
            <a href="" onClick="goPrePage();return false;" class="btn_2">전단계</a>
        </c:if>
        <html:buttonAuth gubun="add" script="goUseYn('Y');return false;" title="사용"/>
        <html:buttonAuth gubun="add" script="goUseYn('N');return false;" title="미사용"/>
    </div>
</form>
