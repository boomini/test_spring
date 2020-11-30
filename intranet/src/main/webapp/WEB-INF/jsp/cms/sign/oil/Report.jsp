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
			<h2 class="W100p MgT50 AC VM H50" style="font-size:30px;"><c:out value="${sign.OIL_MONTH}"/> 유루비 청구서</h2>
			
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
						<th>청구자</th>
						<td><c:out value="${sign.USER_NM}"/></td>
						<th>차번호/차종</th>
						<td><c:out value="${sign.CAR_NUM}"/>/<c:out value="${sign.CAR_NM}"/></td>
					</tr>
					<tr>
						<th>배기량</th>
						<td><c:out value="${sign.CAR_ENGINE}"/></td>
						<th>유종</th>
						<td><c:out value="${sign.CAR_OIL_NM}"/></td>
					</tr>
					<tr>
						<th>연비</th>
						<td><c:out value="${tot.CAR_KM}"/></td>
						<th>리터당 유루비</th>
						<td><c:out value="${tot.OIL_PRI}"/></td>
					</tr>
				</tbody>
			</table>
			<table class="pr_content">
				<colgroup>
		            <col style="width: 14%;" />
		            <col style="width: 14%;" />
		            <col style="width: 14%;" />
		            <col style="width: 14%;" />
		            <col style="width: 14%;" />
		            <col style="width: 14%;" />
		            <col />
		        </colgroup>
		        <tbody>
		        	<tr>
		        		<th style="background:#f7f7f7;">일 별</th>
			        	<th style="background:#f7f7f7;">출발지</th>
			        	<th style="background:#f7f7f7;">경유지</th>
			        	<th style="background:#f7f7f7;">도착지</th>
			        	<th style="background:#f7f7f7;">주행거리</th>
			        	<th style="background:#f7f7f7;">통행료</th>
			        	<th style="background:#f7f7f7;">주차료</th>
		        	</tr>
		        	<c:forEach items="${oilList}" var="list" varStatus="stat">
						<tr>
							<td><c:out value="${list.D_DT}"/></td>
							<td><c:out value="${list.D_FROM}"/></td>
							<td><c:out value="${list.D_MID}"/></td>
							<td><c:out value="${list.D_TO}"/></td>
							<td><c:out value="${list.DISTANCE}"/></td>
							<td><c:out value="${list.COST}"/></td>
							<td><c:out value="${list.PARK_C}"/></td>
						</tr>
					</c:forEach>
					<tr>
						<th style="background:#f7f7f7;">주행거리</th>
						<th style="background:#f7f7f7;">주행거리보정</th>
						<th style="background:#f7f7f7;">유류비</th>
						<th style="background:#f7f7f7;">통행료</th>
						<th style="background:#f7f7f7;">주차비</th>
						<th style="background:#f7f7f7;" colspan="2">총지급액</th>
					</tr>
					<tr>
						<td><c:out value="${tot.DISTANCE}"/></td>
						<td><c:out value="${tot.DISTANCE_CAL}"/></td>
						<td><c:out value="${tot.OIL_TOT}"/></td>
						<td><c:out value="${tot.COST}"/></td>
						<td><c:out value="${tot.PARK_C}"/></td>
						<td colspan="2"><c:out value="${tot.TOT}"/></td>
					</tr>
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