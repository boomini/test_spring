<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script type="text/javascript" src="<c:url value="/js/jQuery-Mask-Plugin-master/dist/jquery.mask.min.js" />"></script>
<script>	

$(function(){
	$('.ipMask').mask('0ZZ.0ZZ.0ZZ.0ZZ', {
		    translation: {
		      'Z': {
		        pattern: /[0-9]/, optional: true
		      }
		    }
		  });
	 /* $('#MNGR_IP').mask('099.099.099.099'); */
	
});
	//사용/미사용 업데이트
function goUSEAT(yn){
    if($('input:checkbox[name=chkbox]:checked').length == 0){
      alert('선택된 게시물이 없습니다.');
      return;
    }
    $("#USEAT").val(yn);
    $("#mode2").val("proc");
    $("#form2").attr("method","post");
    $("#form2").attr("action","/cms/useIpMn/cud/");
    $("#form2").submit();
}

//사용/미사용 조회
function search(){
	$("#frmgo input:hidden[name=USE_AT]").val($("#USE_AT").val());
	$("#frmgo").submit();
}
//신규등록
function goAction(){
	if (!gfnValidate($("#form"))) {
  		return;
	}
  	$("#mode").val("write");
  	$("#form").attr("method","post");
  	$("#form").attr("action","/cms/useIpMn/cud/");
  	$("#form").submit();
  	return false;
}
//수정
function updateProc(id){
	$("#MNGR_IP").val($('#lr_nm_'+id).val());
	$("#SN").val($('#lr_id_'+id).val());
	if (!gfnValidate($("#form2"))) {
		return;
	}
	$("#mode").val("modify");
	$("#form").attr("method","post");
  	$("#form").attr("action","/cms/useIpMn/cud/");
	$("#form").submit();
}

//수정 폼전환
function updateForm(seq){
	$('#tru_'+seq).show();
	$('#trl_'+seq).hide();
	$('#ORG_CODE').val($('#lr_cd_'+seq).val());
}

//수정폼 취수
function goCancel(seq){
	$('#tru_'+seq).hide();
	$('#trl_'+seq).show();
	$('#ORG_CODE').val();
}
</script>
<!-- 사용/미사용 조회용 form -->
<form id="frmgo" name="frmgo" action="/cms/useIpMn/?pMENU_NO=<c:out value="${param.pMENU_NO}"/>" method="post" >
    <input type="hidden" name="USE_AT" value="${param.USE_AT}" />
</form>
<!-- 등록 form -->
<form id="form" name="form" action="/cms/useIpMn/cud/" method="post" >
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="mode" id="mode" value="" /> 
    <input type="hidden" name="SN" id="SN" value="" />
    <div class="tit MgT20">IP 등록</div>
    <table summary="IP, 등록"class="table_basic table01">
        <caption>IP 등록</caption>
        <colgroup>
            <col />
            <col width="30%;" />
        </colgroup>
        <thead>
            <tr>
                <th>IP</th>
                <th>등록</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" name="MNGR_IP" id="MNGR_IP" class="W90p AC ipMask checkNull" maxlength="15"  title="IP" ></td>
                <td><a href="#" onClick="goAction();" class="btn_3">등록</a></td>
            </tr>
        </tbody>
    </table>
</form>
<!-- 수정/사용여부 form -->
<form id="form2" name="form2" action="/cms/useIpMn/cud/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="mode" id="mode2" value="" /> <input type="hidden" name="USEAT" id="USEAT" value="" />
    <div class="tit MgT20">IP 목록</div>
    <div class="MgT10" style="position: absolute; top: 285px; right: 34px;">
	    <html:selectList name='USE_AT' optionValues='|Y|N' optionNames='전체|사용|미사용' selectedValue='${param.USE_AT}' title="사용여부" script="onchange='search();return false;' class='selectBoxS'" />
    </div>
    <table summary="IP,등록자,사용여부,수정" class="table_basic table01">
        <caption>${bTit}목록</caption>
        <colgroup>
            <col width="8%;" />
            <col />
            <col width="15%;" />
            <col width="10%;" />
            <col width="10%;" />
        </colgroup>
        <thead>
            <tr>
                <th><input type="checkbox" onclick="gfnToggleMultiChk(this.checked, 'chkbox')" title="전체선택"></th>
                <th>IP</th>
                <th>등록자</th>
                <th>사용여부</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${useIpMnList}" var="useIpMnList" varStatus="stat">
                <tr id="trl_<c:out value="${stat.count }"/>" <c:if test="${useIpMnList.MNGR_IP == 'ALL'}">bgcolor="A4C6EB"</c:if>>
                    <td><input type="checkbox" name="chkbox" value="<c:out value="${useIpMnList.SN}"/>" title="행선택" /></td>
                    <td><c:out value="${useIpMnList.MNGR_IP}" /></td>
                    <td><c:out value="${useIpMnList.REGISTER_ID}" /></td>
                    <td><c:if test="${useIpMnList.USE_AT eq 'Y'}">
                            <font color=#46649B>사용</font>
                        </c:if> <c:if test="${useIpMnList.USE_AT eq 'N'}">
                            <font color=B93C3C>미사용</font>
                        </c:if></td>
                    <td><c:if test="${useIpMnList.MNGR_IP != 'ALL'}">
                            <a href="" onClick="updateForm(<c:out value="${stat.count }"/>);return false" class="btn_3">수정</a>
                        </c:if></td>
                </tr>
                <tr id="tru_<c:out value="${stat.count }"/>" style="display: none">
                    <td><a href="" onClick="goCancel(<c:out value="${stat.count }"/>);return false" class="btn_3">취소</a></td>
                    <td>
                        <c:if test="${useIpMnList.MNGR_IP != 'ALL'}">
                            <input type="text" name="lr_nm_<c:out value="${stat.count }"/>" id="lr_nm_<c:out value="${stat.count }"/>" value="<c:out value="${useIpMnList.MNGR_IP}"/>" class="W90p AC ipMask checkNull" maxlength="100" title="IP" > 
                            <input type="hidden" name="lr_id_<c:out value="${stat.count }"/>" id="lr_id_<c:out value="${stat.count }"/>" value="<c:out value="${useIpMnList.SN}"/>" />
                        </c:if>
                    </td>
                    <td><c:out value="${useIpMnList.REGISTER_ID}" /></td>
                    <td><c:if test="${useIpMnList.USE_AT eq 'Y'}">
                            <font color=#46649B>사용</font>
                        </c:if> <c:if test="${useIpMnList.USE_AT eq 'N'}">
                            <font color=B93C3C>미사용</font>
                        </c:if></td>
                    <td><a href="" onClick="updateProc(<c:out value="${stat.count }"/>);return false" class="btn_3">저장</a></td>
                </tr>
            </c:forEach>
            <c:if test="${empty useIpMnList }">
                <tr>
                    <td colspan="5" class="AC borR0">자료가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <div class="btn AR MgT10">
        <html:buttonAuth gubun="add" script="goUSEAT('Y');return false;" title="사용"/>
        <html:buttonAuth gubun="add" script="goUSEAT('N');return false;" title="미사용"/>
    </div>
</form>
