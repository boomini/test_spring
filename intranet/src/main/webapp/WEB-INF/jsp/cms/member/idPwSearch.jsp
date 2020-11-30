<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<link href="/cms/_css/login.css" rel="stylesheet" type="text/css" />
<script>
//id/pw 찾기
function idPwSearch(gu) {
  
  if(gu == '1'){
    var frm = document.idSearchForm;
    if (!gfnValidate(frm)) {
      return;
    } 
  }else{
    var frm = document.pwSearchForm;
    if (!gfnValidate(frm)) {
      return;
    }
  }
  
  findeIdPw(gu);
}
function findeIdPw(gu) {
  
  var url ='';
  var params = {
      
  };
  if(gu =='1'){
    url = '/web/member/idSearch';
    params = {
        userNm : $("#userNm").val(), mbtlnum1 : $("#idSearchForm #mbtlnum1").val(), mbtlnum2 : $("#idSearchForm #mbtlnum2").val(), mbtlnum3 : $("#idSearchForm #mbtlnum3").val()
    };
  }else{
    url = '/web/member/pwSearch';
    params = {
        userId : $("#userId").val(), userNm : $("#userNm2").val(), mbtlnum1 : $("#pwSearchForm #mbtlnum1").val(), mbtlnum2 : $("#pwSearchForm #mbtlnum2").val(), mbtlnum3 : $("#pwSearchForm #mbtlnum3").val()
    };
  }
  var sucessFunc = function(data) {
    var msg = data.resultMsg;
    var code = data.resultCode;
    if(code == "0"){
      if(gu =="1"){
        $("#idText").html(msg);
        $("#idDiv").show();
        $("#idNonDiv").hide();
      }else{
        $("#pwText").html(msg);
        $("#pwDiv").show();
        $("#pwNonDiv").hide();
      }
    }else{
      alert(msg);  
    }
    
  };
  ajaxCall(url, params, sucessFunc);
}
</script>
<div class="loginForm">
  <span class="box_tip">ID/PW</span>
  <p>아이디 또는 비밀번호를 찾으시려면 해당 정보를 입력바랍니다.</p>
  <div class="form_box PdB20">
    <h6 class="lowtitle" style="left: 35px; top: 20px; position: absolute;">아이디 찾기</h6>
    <div id="idDiv" class="dis_no">
      <div class="object" style="padding: 22px;">
        <p>
          <label class="id">아이디 : </label> <span style="font-weight: bold;" id="idText"></span>
        </p>
      </div>
    </div>
    <form name="idSearchForm" id="idSearchForm" method="post">
    <div id="idNonDiv">
      <div class="object">
        <p>
          <label class="name">이름</label> <input name="userNm" id="userNm" type="text" title="이름 입력" checkNull/>
        </p>
        <p>
          <label class="pw">휴대폰 번호</label>
          <html:selectList script="class='W60'" name='mbtlnum1' title="핸드폰 번호 첫번째 자리 입력" list='phoneCode' listValue='CODE' listName='CODE' /> -
           <input name="mbtlnum2" id="mbtlnum2" type="text" class="W40 intCheck" title="휴대폰 번호 두번째자리 입력" checkNull maxlength="4"/> - <input name="mbtlnum3" id="mbtlnum3" type="text" class="W40 intCheck" title="휴대폰 번호 세번째자리 입력" checkNull maxlength="4"/>
        </p>
      </div>
      <a class="btn_lg" href="" onclick="idPwSearch(1);return false;">확인</a>
    </div>
    </form>
    <hr class="MgT30" style="clear: both;" />
    <h6 class="lowtitle" style="left: 35px; top: 190px; position: absolute;">비밀번호 찾기</h6>
    <div id="pwDiv" class="dis_no MgT70">
      <div class="object" style="padding: 22px;">
        <p>
          <label class="id" style="width: 75px;">임시 비밀번호 : </label> <span style="font-weight: bold;" id="pwText"></span>
        </p>
      </div>
    </div>
    <form name="pwSearchForm" id="pwSearchForm" method="post">
    <div class="MgT70" id="pwNonDiv">
      <div class="object">
        <p>
          <label class="id">아이디</label> <input name="userId" id="userId" type="text" title="아이디 입력" checkNull/>
        </p>
        <p>
          <label class="name">이름</label> <input name="userNm2" id="userNm2" type="text" title="이름 입력" checkNull/>
        </p>
        <p>
          <label class="pw">휴대폰 번호</label>
          <html:selectList script="class='W60'" name='mbtlnum1' title="핸드폰 번호 첫번째 자리 입력" list='phoneCode' listValue='CODE' listName='CODE' /> -
           <input name="mbtlnum2" id="mbtlnum2" type="text" class="W40 intCheck" title="휴대폰 번호 두번째자리 입력" checkNull maxlength="4"/> - <input name="mbtlnum3" id="mbtlnum3" type="text" class="W40 intCheck" title="휴대폰 번호 세번째자리 입력" checkNull maxlength="4"/>
        </p>
      </div>
      <a class="btn_lg2" href="" onclick="idPwSearch(2);return false;">확인</a>
    </div>
    </form>
  </div>
</div>