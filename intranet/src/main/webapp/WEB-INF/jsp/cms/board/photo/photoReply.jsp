<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>

function addReply(MODE ,_ID , _Index) {
	var fm = document.replyForm;
	if(MODE == 'write'){
		if (!gfnValidate(fm)){
			return;
		};	
	};
	fm.MODE.value = MODE;
	fm.REPLY_ID.value=_ID;
	fm.C_Index.value=_Index;
	
	var url = "/web/board/reply/cud";
	var params = $("#replyForm").serialize();
	var sucessFunc = function(data) {
		replySearch();
	};
	ajaxCall(url, params, sucessFunc ,'',false);
};

</script>
<div class="t_right">
	<form id="replyForm" name="replyForm" method="post">
		
		<input type="hidden" name="UPPER_BBSCTT_NO" id="r_UPPER_BBSCTT_NO"/>
		<input type="hidden" name="BBS_NO" id="r_BBS_NO"/>
		<input type="hidden" name="MODE"/>
		<input type="hidden" name="REPLY_ID"/>
		<input type="hidden" name="C_Index"/>
		
		<table class="table02">
			<colgroup>
				<col style="width:10%">
				<col style="width:70%">
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th colspan="3">
						댓글 ${userYn}---
					</th>
				</tr>
				
				<c:if test="${userYn ne null }">
					<tr>
						<td>
							<input type="text" name="REGISTER_NM" class="checkNull" title="작성자" placeholder="작성자">
						</td>
						<td>
							<input type="text" name="BBSCTT_CN" class="checkNull" title="댓글" placeholder="내용">
						</td>
						<td>
							<a href="" onclick="addReply('write');return false;" class="btn_1">등록</a>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${resultList}" var="list" varStatus="stat">
					<tr>
						<td colspan="2">
							<c:choose>
								<c:when test="${list.SELF_YN eq 'SELF' }">
									<input type="text" name="Edit_BBSCTT_CN" value="<c:out value="${list.BBSCTT_CN}"/>" title="댓글" class="checkNull"/>								
								</c:when>
								<c:otherwise>
									<c:out value="${list.REGISTER_NM}"/> - <c:out value="${list.BBSCTT_CN}"/>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							
							<c:if test="${list.SELF_YN eq 'SELF' }">
								<a href="" onclick="addReply('modify' , '<c:out value="${list.BBSCTT_NO}"/>' , '${stat.index}');return false;" class="btn_1">수정</a>
								<a href="" onclick="addReply('delete' , '<c:out value="${list.BBSCTT_NO}"/>' , '${stat.index}');return false;" class="btn_2">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>