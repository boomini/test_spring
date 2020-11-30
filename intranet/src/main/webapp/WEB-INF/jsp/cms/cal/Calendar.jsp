<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>

<link href='/js/fullcal/core/main.css' rel='stylesheet' />
<link href='/js/fullcal/daygrid/main.css' rel='stylesheet' />
<script src='/js/fullcal/core/main.js'></script>
<script src='/js/fullcal/interaction/main.js'></script>
<script src='/js/fullcal/daygrid/main.js'></script>


<script>
	$(function() {
		goSearch();
	});
	function goSearch() {
		var url = "/cms/cal/Ajax";
		var params = {};
		var sucessFunc = function(data) {
			var events = []
			for (var i = 0; i < data.length; i++) {
				events.push({
					title : data[i].TITLE,
					start : data[i].STARTDAY,
					end : data[i].ENDDAY,
					color : data[i].COLOR,
					cal_id : data[i].CAL_ID
				});
			}
			setCal(events);
		};
		ajaxCall(url, params, sucessFunc);
	};

	function setCal(event) {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid' ],
			defaultDate : gfnToday(),
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : event,
			eventClick : function(info) {
				goView(info.event.extendedProps.cal_id);
			}
		});
		calendar.render();
	};

	function goAdd() {
		var frm = document.searchForm;
		frm.action = "/cms/cal/page/Regist";
		frm.submit();
	};
	function goView(id) {
		if(id.indexOf("CAL_") != -1){
			var frm = document.searchForm;
			frm.CAL_ID.value = id;
			frm.action = "/cms/cal/page/View";
			frm.submit();
		};
	};
</script>
<style>
#calbody {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
<form id="searchForm" name="searchForm">
	
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>"/>
	<input type="hidden" name="CAL_ID" id="CAL_ID"/>
	
	<div id="calbody">
		<div id='calendar'></div>
	</div>
</form>
<div class="t_right">
	<html:buttonAuth gubun="add" script="goAdd();return false;" />
</div>

