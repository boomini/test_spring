<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
$(function(){
    if('${vo.UPLOAD_POSBL_AT}' == 'Y'){
    	$('.fileOpt').attr("disabled",false);
    }else{
    	$('.fileOpt').attr("disabled",true);
    }
    
    $("#BBS_TY").change(function(){
    	var blbdTyp = $(this).val();
    	if(blbdTyp == 'P'){
    		$("input[name='WBDETR_USE_AT']:radio[value='Y']").attr('checked',true);
    		$("input[name='UPLOAD_POSBL_AT']:radio[value='Y']").attr('checked',true).trigger('click');
    	}
    });
});

function changeFileOpt(obj){
    if(obj.value=="Y"){
        $('.fileOpt').attr("disabled",false);
    }else{
        $('.fileOpt').attr("disabled",true);
        
    }
}

function goSave()
{
   var frm = document.frmModify;
    try
    {
        if(!gfnValidate(frm)){
            return;
        }
    }
    catch(e)
    {
        //alert("전송처리 중 에러가 발생했습니다");
    	return;
    }
    frm.submit();
}
</script>
<noscript></noscript>
<form name="frmModify" action="/cms/boardCfg/cud/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="mode" value="<c:out value='${mode}'/>" /> 
    <input type="hidden" name="BBS_NO" value="<c:out value='${param.BBS_NO}'/>" />
    <table class="table02" summary="게시판명, 설명, 에디터, 댓글, 비밀글, 한줄댓글, 파일첨부, 첨부개수/용량, 종류, 권한, 공지글, 메일수신, 추가컬럼, 추가분류, 머리글, 꼬리글">
        <colgroup>
            <col style="width: 18%;" />
            <col style="width: 32%" />
            <col style="width: 18%;" />
            <col style="width: 32%;" />
        </colgroup>
        <tbody>
            <tr>
                <th><span class="iCheck">게시판 명</span></th>
                <td colspan="3" class="AL"><input type="text" name="BBS_NM" size="30" value="<c:out value="${vo.BBS_NM}"/>" class="checkNull W700" title="게시판명" maxlength="100" /></td>
            </tr>
            <tr>
                <th>게시판 설명</th>
                <td colspan="3" class="AL"><input type="text" name="BBS_DC" value="${vo.BBS_DC }" class="W700" maxlength="50" title="게시판 설명" /></td>
            </tr>
            <tr>
                <th>에디터</th>
                <td class="AL"><html:radio name='WBDETR_USE_AT' value='Y|N' text='사용|미사용' checkedValue='${vo.WBDETR_USE_AT}' defaultValue='N' space='&nbsp;' id="cmsy|cmsn" /></td>
                <th>댓글</th>
                <td class="AL"><html:radio name='ANSWER_USE_AT' value='Y|N' text='사용|미사용' checkedValue='${vo.ANSWER_USE_AT}' defaultValue='N' space='&nbsp;' id="repy|repn" /></td>
            </tr>
            <tr>
                <th>비밀글</th>
                <td colspan="3" class="AL"><html:radio name='SCRSNT_USE_AT' value='Y|N' text='사용|미사용' checkedValue='${vo.SCRSNT_USE_AT}' defaultValue='N' space='&nbsp;' id="openy|openn" /></td>
            </tr>
            <tr>
                <th>파일첨부</th>
                <td class="AL"><html:radio name='UPLOAD_POSBL_AT' value='Y|N' text='사용|미사용' checkedValue='${vo.UPLOAD_POSBL_AT}' defaultValue='N' space='&nbsp;' id="filey|filen" script="onclick='changeFileOpt(this)'" /></td>
                <th>첨부개수/용량</th>
                <td class="AL"><input type="text" name="UPLOAD_LMTT_CO" size="4" value="<c:out value='${vo.UPLOAD_LMTT_CO }'/>" class="fileOpt intCheck W60" maxlength="2" title="첨부파일개수" /> 개 / <input type="text" name="UPLOAD_POSBL_SIZE" size="4" value="<c:out value='${vo.UPLOAD_POSBL_SIZE }'/>" class="fileOpt intCheck W60" maxlength="4" title="첨부파일용량" /> M</td>
            </tr>
            <tr>
                <th>게시판 종류</th>
                <td class="AL"><html:selectList name='BBS_TY' list='blbdTypeList' listValue='CODE' listName='CODE_NM' title="게시판 종류" selectedValue='${vo.BBS_TY}'  script="class='W100'"/></td>
                <th>공지글</th>
                <td class="AL"><html:radio name='NTCSNT_USE_AT' value='Y|N' text='사용|미사용' checkedValue='${vo.NTCSNT_USE_AT}' defaultValue='N' space='&nbsp;' id="noticey|noticen" /></td>
            </tr>
        </tbody>
    </table>
    <div class="AR MgT10">
        <c:if test="${mode == 'write' }"><html:buttonAuth gubun="add" script="goSave();return false;"/><!-- 등록 --></c:if> 
        <c:if test="${mode == 'modify' }"><html:buttonAuth gubun="mod" script="goSave();return false;"/><!-- 수정 --></c:if> 
        <a href="/cms/boardCfg/<c:out value='${parameters}'/>" class="btn_2">목 록</a>
    </div>
</form>
