<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>
    $(function() {
        <c:if test='${commandMap.STAT_TYP == "D"}'>
        gfnSetDatePickerOne($("#DT"));
        </c:if>
        var today = new Date();
        var y = today.getFullYear();
        var m = today.getMonth() + 1;
        if (m < 10) m = "0" + "" + m;

        <c:if test='${commandMap.STAT_TYP == "M" || commandMap.STAT_TYP == "Y" || commandMap.STAT_TYP == "W"}'>
        for (var i = 2010; i < y + 1; i++) {
            var opt = $("<option value=\"" + i + "\">" + i + "년" + "</option>");
            $("#YY").append(opt);
        }

        for (var i = 1; i < 13; i++) {
            var val = i;
            if (i < 10) val = "0" + "" + i;
            var opt = $("<option value=\"" + val + "\">" + i + "월" + "</option>");
            $("#MM").append(opt);
        }

        $("#YY").val('<c:out value='${commandMap.YY}' />');
        $("#MM").val('<c:out value='${commandMap.MM}' />');
        </c:if>
        <c:if test='${commandMap.STAT_TYP == "W"}'>
        $("#WW").val('<c:out value='${commandMap.WW}' />');
        </c:if>

        $("ul.tabs li").removeClass("active"); 
        $("#tab<c:out value='${commandMap.STAT_TYP}' />").attr("class", $("#tab<c:out value='${commandMap.STAT_TYP}' />").attr("class").replace("off", "active"));
        
        var len = parseInt('${totCnt}');
        
        if(len*20 > 300)
        	$('#chartDiv').css("height",(len*20)+"px");
        		
        
        
      //차트생성
        $('#chartDiv').highcharts({
          chart: {
              type: 'bar'
          },
          colors: ['#e86730'],
          title: {
              text: ''
          },
          subtitle: {
              text: ''
          },
          xAxis: {
              categories: [
<c:forEach var='EO' items='${statList}' varStatus='status2'>
<c:forEach var='EEO' items='${EO.subList}' varStatus='status'>
'<c:out value='${EEO.PATH}' />'<c:if test="${!status.last}">,</c:if>
</c:forEach>
<c:if test="${!status2.last}">,</c:if>
</c:forEach>
                           ]
          ,
              title: {
                  text: null
              },
              labels: {
                style: { fontWeight:'bold'}
              }
              
          },
          yAxis: {
              min: 0,
              title: {
                  text: '접속수',
                  align: 'high'
              },
              labels: {
                  overflow: 'justify',
                  
              },
              minTickInterval : 1
          },
          tooltip: {
              valueSuffix: ' 명'
          },
          plotOptions: {
              bar: {
                  dataLabels: {
                      enabled: true
                  }
              }
          },
          credits: {
              enabled: false
          },
          series: [{
              name: ' 메뉴별 접속자수',
              data: [
<c:forEach var='EO' items='${statList}' varStatus='status2'>
<c:forEach var='EEO' items='${EO.subList}' varStatus='status'>
<c:out value='${EEO.TOT_CNT}' default='null'/><c:if test="${!status.last}">,</c:if>
</c:forEach>
<c:if test="${!status2.last}">,</c:if>
</c:forEach>
              ]
          }]
      });
    });
    function view_domain() {
        $("#UPPER_MENU_NO").val("");
        $("#frm").submit();
    }
    function view_menu() {
        
        $("#frm").submit();
    }
    function view_type(val) {
        $("#STAT_TYP").val(val);
        $("#DT").val('');
		$("#YY").val('');
		$("#MM").val('');
		$("#ONE_DEPTH_ID").val('');
        $("#frm").submit();
    }

    function goSearch() {
        var typ = $("#STAT_TYP").val();

        if (typ == "M") {
            $("#DT").val($("#YY").val() + "-" + $("#MM").val());
        } else if (typ == "Y") {
            $("#DT").val($("#YY").val());
        }
        $("#frm").submit();
    }

    function setWeek() {
        jQuery.ajax({
            type: "POST",
            url: "weekSelect.krc",
            data: "YY=" + $("#YY").val() + "&MM=" + $("#MM").val(),
            success: function(opt){
                $("#WW").html(opt);
            }
        });
    }
    
    function save() {
        $("#excelYn").val("Y");
        $("#frm").submit();
        $("#excelYn").val("");
    }
    
	//초기화
	function goClear() {
		$("#DT").val('');
		$("#YY").val('');
		$("#MM").val('');
		$("#ONE_DEPTH_ID").val('');
		$("#frm").submit();
	}
</script>
<ul class="tabs">
    <li id="tabD" class="tab1 off MgL0" onclick="view_type('D');return false;"><a href="" onclick="view_type('D');return false;">일별 접속 통계</a></li>
    <li id="tabM" class="tab2 off" onclick="view_type('M');return false;"><a href="" onclick="view_type('M');return false;">월별 접속 통계</a></li>
    <li id="tabY" class="tab3 off" onclick="view_type('Y');return false;"><a href="" onclick="view_type('Y');return false;">년별 접속 통계</a></li>
</ul>
<form name="frm" id="frm" action="/cms/menuStat/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="STAT_TYP" id="STAT_TYP" value="<c:out value='${commandMap.STAT_TYP}' />" />
    <div class="search_box">
        <!-- 도메인 정보 -->
        <%-- <html:selectList name='MENU_SE' optionNames="관리자|업무" optionValues="1|2" selectedValue='${param.MENU_SE}' defaultValue="1" title="도메인정보" script="class=\"W90\" onchange='document.frm.ONE_DEPTH_ID.value=\"\";this.form.submit();'"/>--%>
        <input type="hidden" name="MENU_SE"  id="MENU_SE" value="1">
        <!-- 1단계메뉴 -->
        <html:selectList name='ONE_DEPTH_ID' list='menuList'  optionNames='전체' optionValues='' listValue='MENU_NO' listName='MENU_NM' selectedValue='${param.ONE_DEPTH_ID}' script="class=\"MgL0 W150\" onchange='this.form.submit()'"/>
        <c:if test='${commandMap.STAT_TYP == "D"}'>
            <input type="text" name="DT" id="DT" readonly="readonly" class="MgL0 W80" value="<c:out value='${commandMap.DT}' />" />
        </c:if>
        <c:if test='${commandMap.STAT_TYP == "M"}'>
            <select name="YY" id="YY" class="MgL0 W80"></select>
            <select name="MM" id="MM" class="MgL0 W60"></select>
            <input type="hidden" name="DT" id="DT" readonly />
        </c:if>
        <c:if test='${commandMap.STAT_TYP == "Y"}'>
            <select name="YY" id="YY" class="MgL0 W80"></select>
            <input type="hidden" name="DT" id="DT" readonly />
        </c:if>
        <a href="" onclick="goSearch();return false;" class="btn_2">조 회</a>
        <c:if test="${not empty param.DT or  not empty param.ONE_DEPTH_ID}">
            <a href="" onclick="goClear();return false;" class="btn_4">초기화</a>
        </c:if>
    </div> 
</form>
<div class="tit MgT10">검색결과</div>
<div id="chartDiv" style="min-width: 310px; max-width: 100%; height: 300px; margin: 0 auto;border: 1px solid #e1e1e1;padding: 2px;" class=""></div>
<table class="st_1 tr_hover" summary="메뉴명, 메뉴코드, 그래프, 접속수" style="display: none;">
<thead>
    <tr>
        <th style="width: 30%">메뉴명</th>
        <th style="width: 10%">메뉴코드</th>
        <th style="width: 50%">그래프</th>
        <th style="width: 10%">접속수</th>
    </tr>
    </thead>
    <tbody>
    
        <c:set var="tempTot" value="0"/>
        <c:forEach var='EO' items='${statList}' varStatus='status'>
            <c:forEach var='EEO' items='${EO.subList}'>
            <c:set var="tempTot" value="${tempTot+EEO.TOT_CNT}"/>
            </c:forEach>
        </c:forEach>
        
        
    <c:forEach var='EO' items='${statList}' varStatus='status'>
        <c:forEach var='EEO' items='${EO.subList}'>
        
        <c:set var="avg" value="0"/>
        <c:if test="${tempTot >0}">
            <c:set var="avg" value="${90*EEO.TOT_CNT/tempTot}"/>
        </c:if>
        <c:if test="${EEO.LEVEL==1}"><c:set var="trColor" value="#A4C6EB" /></c:if>
        <c:if test="${EEO.LEVEL==2}"><c:set var="trColor" value="#C0D8F1" /></c:if>
        <c:if test="${EEO.LEVEL==3}"><c:set var="trColor" value="#DDEAF8" /></c:if>
        <c:if test="${EEO.LEVEL==4}"><c:set var="trColor" value="#F2F7FC" /></c:if>
        <tr bgcolor="<c:out value="${trColor }"/>">
            <td class="AL">
                <c:forEach begin="1" end="${EEO.LEVEL}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
                <c:if test="${EEO.LEVEL==1}">① </c:if>
                <c:if test="${EEO.LEVEL==2}">② </c:if>
                <c:if test="${EEO.LEVEL==3}">③ </c:if>
                <c:if test="${EEO.LEVEL==4}">④ </c:if>
                <c:if test="${EEO.LEVEL==5}">⑤ </c:if>
                <c:if test="${EEO.LEVEL==6}">⑥ </c:if>
                <c:choose>
                    <c:when test="${EEO.USE_AT == 'Y'}"><c:out value="${EEO.MENU_NM}"/></c:when>
                    <c:otherwise><del><c:out value="${EEO.MENU_NM}"/></del></c:otherwise>
                </c:choose>
            </td>
            <td><c:out value="${EEO.MENU_NO}"/></td>
            <td class="AL"><img src="/web/images/etc/comm/imgBarGraph.gif" alt="" style="width:<c:out value="${avg}"/>%;" height="10px"/></td>
            <td><c:out value="${EEO.TOT_CNT}" /></td>
        </tr>
        </c:forEach>
    </c:forEach>
    <c:if test="${empty statList}">
        <tr>
            <td class="center" colspan="4">자료가 없습니다.</td>
        </tr>
    </c:if>
    </tbody>
</table>