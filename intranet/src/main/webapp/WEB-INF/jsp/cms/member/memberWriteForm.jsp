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
    //메일선택변경 이벤트
    $('#mailGbn').change(function() {
        if ($(this).val() == '') {
        	$("#EMAIL").val("");
        } else {
        	var email = $("#EMAIL").val().split("@")[0] + "@" + $(this).val();
        	$("#EMAIL").val(email);
        }
	});
	$("#USER_ID").keyup(function(){
		$("#dupChk").val('');
    });
	
	setComboBoxList("S","ORG_CODE" ,{ATTR_1:'206'},true,'<c:out value='${member.ORG_CODE}' />');
	setComboBoxList("S","AUTHOR_CODE" ,{ATTR_1:'50'},true,'<c:out value='${member.AUTHOR_CODE}' />');
	
});

/*등록,수정*/
function goSave() {
	if ($("#dupChk").val() != '1') {
		alert("아이디 중복체크를 해야 합니다.");
		$("#USER_ID").focus();
		return;
	}
	if (!gfnValidate($("#regForm"))) {
		return;
	}
	
	$("#regForm").submit();
}

//아이디 중복 체크
function fn_idDupCk() {
	if ($("#USER_ID").val() == '') {
		alert("아이디를 입력하세요");
		$("#USER_ID").focus();
		return;
	}
	var url = "/cms/member/idDupCk";
	var params = {
		user_id : $("#USER_ID").val()
	};
	var sucessFunc = function(data) {
		var cnt = parseInt(data.resultInt);
		if (cnt > 0) {
			alert('이미 회원 가입이 되어 있습니다.');
			$("#dupChk").val('');
			$("#USER_ID").focus();
		} else {
			$("#dupChk").val('1');
			alert("가입 가능한 ID 입니다.");
		}

	};
	ajaxCall(url, params, sucessFunc);
}
</script>
<form name="regForm" action="/cms/member/cud" method="post" id="regForm">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="mode" value="<c:out value='${mode}'/>" /> 
    <input type="hidden" name="userEdit" id='userEdit' value="<c:out value='${userEdit}' />" />
    
    <!-- 검색 조건 유지 -->
    <input type="hidden" name="pAuth" value="<c:out value='${param.pAuth}'/>" /> 
    <input type="hidden" name="pUseAt" value="<c:out value='${param.pUseAt}'/>" /> 
    <input type="hidden" name="pUserId" value="<c:out value='${param.pUserId}'/>" /> 
    <input type="hidden" name="pUserNm" value="<c:out value='${param.pUserNm}'/>" /> 
    <input type="hidden" name="dupChk" id="dupChk">
    <div style="margin-bottom : 6px;color: #666;text-align: right;" ><span class="iCheck"> 필수 입력</span></div>
    <table class="table02">
        <colgroup>
            <col width="10%" />
            <col width="30%" />
            <col width="30%" />
            <col width="30%" />
        </colgroup>
        <tr>
            <th><span class="iCheck">회원 ID</span></th>
            <td colspan="3"><input type="text" name="USER_ID" class="W190 checkNull" value="<c:out value='${member.USER_ID }'/>" title="회원ID" id="USER_ID" maxlength="20" /> <a href="" class="btn_3" onclick="fn_idDupCk();return false;">아이디 중복확인</a></td>
        </tr>
        <tr>
            <th><span class="iCheck">비밀번호</span></th>
            <td colspan="3"><input type="password" name="PASSWORD" class="W190 checkNull" value="<c:out value='${member.PASSWORD }'/>" title="비밀번호" id="PASSWORD" maxlength="50" /></td>
        </tr>
        <tr>
            <th><span class="iCheck">비밀번호 확인</span></th>
            <td colspan="3"><input type="password" name="PASSWORD2" class="W190 checkNull" value="" title="비빌번호 확인" id="PASSWORD2" maxlength="50"  /></td>
        </tr>
        <tr>
            <th><span class="iCheck">이름</span></th>
            <td colspan="3"><input type="text" name="USER_NM" value="<c:out value='${member.USER_NM }'/>" title="이름" id="USER_NM" maxlength="100" class="W190 checkNull" /></td>
        </tr>
        <tr>
            <th><span class="iCheck">전화번호</span></th>
            <td colspan="3"><html:selectList script="class='W60 checkNull'" optionValues="" optionNames="선택" name='TELNO1' title="전화번호 첫번째 자리 입력" list='telCode' listValue='CODE' listName='CODE' selectedValue='${member.TELNO1}' /> - <input type="text" class="intCheck W50 checkNull" name="TELNO2" id="TELNO2" value="<c:out value='${member.TELNO2}' />" title="전화번호 두번째 자리 입력" maxlength="4" /> - <input type="text" class="intCheck W50 checkNull" name="TELNO3" id="TELNO3" value="<c:out value='${member.TELNO3}' />" title="전화번호 세번째 자리 입력" maxlength="4" /></td>
        </tr>
        <tr>
            <th>핸드폰번호</th>
            <td colspan="3"><html:selectList script="class='W60'" optionValues="" optionNames="선택" name='MBTLNUM1' title="핸드폰 번호 첫번째 자리 입력" list='phoneCode' listValue='CODE' listName='CODE' selectedValue='${member.MBTLNUM1}' /> - <input type="text" class="intCheck W50" name="MBTLNUM2" id="MBTLNUM2" value="<c:out value='${member.MBTLNUM2}' />" title="핸드폰 번호 두번째 자리 입력" maxlength="4" /> - <input type="text" class="intCheck W50" name="MBTLNUM3" id="MBTLNUM3" value="<c:out value='${member.MBTLNUM3}' />" title="핸드폰 번호 세번째 자리 입력" maxlength="4" /></td>
        </tr>
        <tr>
            <th><span class="iCheck">이메일</span></th>
            <td colspan="3"><input type="text" name="EMAIL" id="EMAIL" value="<c:out value='${member.EMAIL}' />" title="이메일" maxlength="100" class="W190 checkNull emailck"/> <html:selectList script="class='W120 '" name='mailGbn' title="이메일 선택" list='mailCode' listValue='CODE_NM' listName='CODE_NM' selectedValue='${member.MBTLNUM1}' optionNames="직접입력" optionValues="" /></td>
        </tr>
        <tr>
            <th><span class="iCheck">부서</span></th>
            <td colspan="3">
            	<select id="ORG_CODE" name="ORG_CODE" class="checkNull W190"></select>
            </td>
        </tr>
        <tr>
            <th><span class="iCheck">권한</span></th>
            <td colspan="3">
            	<select id="AUTHOR_CODE" name="AUTHOR_CODE" class="checkNull W190"></select>
            </td>
        </tr>
        <tr>
            <th>IP</th>
            <td colspan="3"><input type="text" name="USER_IP" id="USER_IP" class="W190 ipMask" maxlength="15"  title="IP" >
            ※ 시스템관리자(권한)는 아이피를 입력해야 정상적으로 로그인을 할 수 있습니다.</td>
        </tr>
    </table>
</form>
<div class="AR MgT10">
    <c:if test="${mode == 'write' }"><html:buttonAuth gubun="add" script="goSave();return false;"/><!-- 등록 --></c:if> 
    <c:if test="${mode == 'modify' }"><html:buttonAuth gubun="mod" script="goSave();return false;"/><!-- 수정 --></c:if> 
    <a href="/cms/member/<c:out value='${parameters}'/>" class="btn_2">목 록</a>
</div>
<!--//컨텐츠 영역-->
