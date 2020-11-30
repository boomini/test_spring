<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>프린트 </title>

<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/BasicSet.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/com/css/print.css" />" />

<script type="text/javascript" src="<c:url value="/js/jquery-1.11.3.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.11.4.custom/jquery-ui.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>

</head>

<script type="text/javascript">
//팝업 종료
function closePop(){
	window.close();
};
</script>
<a id="target" style="display: none"></a>
<body>
	<div class="W100p H20 printBtn">
		<button class="Tbtn W80 AC" type="button" onclick="fnReportPrint();return false">프린트</button>
	</div>
	<div class="W100p subpage MgT10">
	   <!-- 프린트 영역 start -->
			<h2 class="W100p MgT50 AC VM H50" style="font-size:30px;">지출 결의서</h2>
			
			<div class="fr MgB50">
				<table>
					<tbody>
						<tr>
							<c:forEach items="${signList}" var="list" varStatus="stat">
								<th><c:out value="${list.USER_NM}"/><c:out value="${list.AUTO_NM}"/></th>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${signList}" var="list" varStatus="stat">
								<td rowspan="3"><c:out value="${list.SIGN_STEP}"/></td>
							</c:forEach>
						</tr>
						
					</tbody>
				</table>
			</div>
			
			<table class="pr_content">
				<colgroup>
		            <col style="width: 15%;" />
		            <col style="width: 35%;" />
		            <col style="width: 15%;" />
		            <col style="width: 35%;" />
		        </colgroup>
				<tbody>
					<tr>
						<th colspan="4" style="background:#f7f7f7;">신 청 내 용</th>
					</tr>
					<tr>
						<th>부 서</th>
						<td><c:out value="${sign.ORG}"/></td>
						<th>직 급</th>
						<td><c:out value="${sign.AUTH}"/></td>
					</tr>
					<tr>
						<th>일자</th>
						<td><c:out value="${sign.EXPENSE_DATE}"/></td>
						<th>성 명</th>
						<td><c:out value="${sign.USER_NM}"/></td>
					</tr>
					<tr>
						<th>은행-계좌번호</th>
						<td colspan="3"><c:out value="${sign.BANK}"/></td>
					</tr>
					
					<tr>
						<th style="background:#f7f7f7;">내 역</th>
						<th style="background:#f7f7f7;">금 액</th>
						<th colspan="2" style="background:#f7f7f7;">비 고 </th>
					</tr>
					<c:forEach items="${expenseList}" var="list" varStatus="stat">
						<tr>
							<td><c:out value="${list.COASTNM}"/></td>
							<td><c:out value="${list.COAST}"/></td>
							<td colspan="2"><c:out value="${list.NOTE}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="AC" style="font-size: 20px;">
				<p class="MgT100">위 금액을 청구 하오니 결재 바랍니다.</p>
				<p class="MgT100">&nbsp;&nbsp;년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</p>
				<p class="MgT100">신청자 성명 : <c:out value="${sign.USER_NM}"/>   (인)</p>
			</div>		
	   <!-- 프린트 영역 end -->
	</div>
</body>
</html>