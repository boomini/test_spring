<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<script>

    Highcharts.setOptions({
    	lang: {
            thousandsSep: ','
        }
    });
    $(function() {
        var today = new Date();
        var y = today.getFullYear();
        var m = today.getMonth() + 1;
        if (m < 10) m = "0" + "" + m;

        <c:if test='${commandMap.STAT_TYP == "D" || commandMap.STAT_TYP == "M" || commandMap.STAT_TYP == "W"}'>
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
        /*
        <c:if test='${commandMap.STAT_TYP == "W"}'>
        	 $("#WW").val('<c:out value='${commandMap.WW}' />');
        </c:if>
        */
        <c:if test='${commandMap.STAT_TYP == "D"}'>
       		 $("#chartDiv").css("height","1000px");
        </c:if>

        $("ul.tabs li").removeClass("active"); 
        $("#tab<c:out value='${commandMap.STAT_TYP}' />").attr("class", $("#tab<c:out value='${commandMap.STAT_TYP}' />").attr("class").replace("off", "active"));
        
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
              categories: [<c:forEach var='EO' items='${statList}' varStatus='status'>
              '${EO.ILJA}'<c:if test="${!status.last}">,</c:if>
              </c:forEach>],
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
              name: '${commandMap.YY}-${commandMap.MM}',
              data: [<c:forEach var='EO' items='${statList}' varStatus='status'>
              ${EO.TOT_CNT}<c:if test="${!status.last}">,</c:if>
              </c:forEach>]
          }]
      });
    });
    
      //탭이동
    function view_type(val) {
        $("#STAT_TYP").val(val);
        $("#subCmd").val("tab");
        $("#frm").submit();
    }

      //검색
    function goSearch() {
        var typ = $("#STAT_TYP").val();
        $("#subCmd").val("search");
        if (typ == "M") {
            $("#DT").val($("#YY").val() + "-" + $("#MM").val());
        } else if (typ == "Y") {
            $("#DT").val($("#YY").val());
        }
        $("#frm").submit();
    }
      
</script>

<ul class="tabs">
    <li id="tabD" class="tab1 off" onclick="view_type('D');return false;"><a href="" onclick="view_type('D');return false;">일별 접속 통계</a></li>
    <li id="tabM" class="tab2 off" onclick="view_type('M');return false;"><a href="" onclick="view_type('M');return false;">월별 접속 통계</a></li>
    <li id="tabW" class="tab3 off" onclick="view_type('W');return false;"><a href="" onclick="view_type('W');return false;">주별 통계</a></li>
</ul>

<form name="frm" id="frm" action="/cms/accessStat/" method="post">
    <input type="hidden" name="pMENU_NO" value="<c:out value="${param.pMENU_NO}"/>" /> 
    <input type="hidden" name="STAT_TYP" id="STAT_TYP" value="<c:out value='${commandMap.STAT_TYP}' />" />
    <input type="hidden" name="subCmd" id="subCmd" value=""/>
    <div class="search_box">
        <!-- 1단계메뉴 -->
            <select name="YY" id="YY" class="MgL0 W80" title="년도"></select>
            <select name="MM" id="MM" class="MgL0 W60" title="월"></select>
            <input type="hidden" name="DT" id="DT" readonly="readonly" />
        <a href="" onclick="goSearch();return false;" class="btn_2">조 회</a>
        <!-- 
        <c:if test="${not empty param.DT or  not empty param.ONE_DEPTH_ID}">
            <a href="" onclick="goClear();return false;" class="btn_4">초기화</a>
        </c:if>
         -->
    </div> 
</form>
<div class="tit MgT10">검색결과</div>
<div id="chartDiv" style="min-width: 310px; max-width: 100%; height: 500px; margin: 0 auto;border: 1px solid #e1e1e1;padding: 2px;" class=""></div>
<table class="board-st-01 MgT5 dis_no" summary="접속통계- 구분,그래프,접속수">
    <colgroup>
        <col style="width: 15%;" />
        <col style="width: 70%;" />
        <col style="width: 15%;" />
    </colgroup>
    <thead>
        <tr>
            <th>구분</th>
            <th>그래프</th>
            <th>접속수</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${empty statList}">
            <tr>
                <td class="AC borR0" colspan="3">자료가 없습니다.</td>
            </tr>
        </c:if>
        <c:set var="tempTot" value="0" />
        <c:forEach var='EO' items='${statList}' varStatus='status'>
            <c:set var="tempTot" value="${tempTot+EO.TOT_CNT}" />
        </c:forEach>
        <c:forEach var='EO' items='${statList}' varStatus='status'>
            <c:set var="avg" value="0" />
            <c:if test="${tempTot >0}">
                <c:set var="avg" value="${90*EO.TOT_CNT/tempTot}" />
            </c:if>
            <tr>
                <td><c:out value='${EO.ILJA}' /></td>
                <td class="AL"><img src="/cms/_images/comm/imgBarGraph.gif" alt="" style="width:<c:out value="${avg}"/>%;" height="10px" /></td>
                <td><c:out value='${EO.TOT_CNT}' default="0" /></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
