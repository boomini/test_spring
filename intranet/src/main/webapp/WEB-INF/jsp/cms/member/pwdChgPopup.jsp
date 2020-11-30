<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LCY 정보시스템 : 비밀번호 변경 </title>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/common.css" />"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/sub.css" />" />
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/login.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/cmnReady.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.js" />"></script>
</head>
<script type="text/javascript">

//팝업 종료
function closePop(){
	window.close();
}

//비밀번호 변경
function goSave(){
    var frm = document.editForm;

    if (!gfnValidate(frm)) {
  		return false;
	}

    if(fnPwChk('userId', 'password') == false){
        frm.password.focus();
        return false;
      }; 
    
    if(frm.password.value != frm.password2.value){
        alert("비밀번호와 확인번호가 일치하지 않습니다.");
        frm.password.focus();
        return false;
       };

       
    var url = "/cms/member/passwdChg";
    
    var params = {
    	user_id : $("#userId").val(),
    	pwd : $("#password").val(),
    	oldPwd : $("#oldPwd").val()
    };
    
    var sucessFunc = function(data) {
      var msg = data.resultMsg;
      var code = data.resultCode;
      
      alert(msg);
      
      if(code == '0'){
    	  closePop();
			//변경 성공    	  
      }else if(code == '2'){
    	  $("#oldPwd").focus();
    	   //Pwd 불일치
      }else if(code == '3'){
    	  $("#password").focus();
   	   	  //동일 Pwd
      };
      
    };
    
    ajaxCall(url, params, sucessFunc);
}
</script>

<body>
<div id="wrap" class="sty02">	
    <form name="editForm" id="editForm" method="post" >
        <input type="hidden" id="userId" value="<c:out value="${memberVO.user_id}"/>"/>
        <div class="popWarp">
        	<p class="popTit">비밀번호 변경<span class="popClose">
                <a href="" onclick="closePop();return false;" title="닫기">닫기</a></span>
            </p>
            <div class="popCont">
            	<table class="table02 MgB20">
                    <caption>비밀번호 변경</caption>
                    <colgroup>
                    <col style="width: 35%;"/>
                    <col style="width: 65%;"/>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>ID</th>
                            <td>
                                <c:out value="${memberVO.user_id}"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="iCheck">현재 비밀번호</span></th>
                            <td>
                                <input type="password" id="oldPwd" name="oldPwd" class="checkNull" title="현재 비밀번호" maxlength="15"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="iCheck">변경 비밀번호</span></th>
                            <td>
                                <input type="password" id="password" name="password" class="checkNull" title="변경 비밀번호" maxlength="15"/>
                                <span class="MgT2">※9~12자 영문 대소문자,특수문자,숫자 사용</span>
                            </td>
                            
                        </tr>
                        <tr>
                            <th><span class="iCheck">변경 비밀번호확인</span></th>
                            <td>
                                <input type="password" id="password2" name="password2" class="checkNull" title="변경 비밀번호 확인" maxlength="15"/>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                <div class="AC">
                    <a href=""  onclick="goSave();return false;" class="btn_1">저장</a> 
                    <a href=""  onclick="closePop();return false;" class="btn_1">닫기</a>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>