<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cType" value="line"/>
<c:if test="${not empty param.cType}">
<c:set var="cType" value="${param.cType }"/>
</c:if>
<c:set var="xLabel" value="false"/>
<c:if test="${not empty param.xLabel}">
<c:set var="xLabel" value="${param.xLabel }"/>
</c:if>
<c:set var="legendUse" value="true"/>
<c:if test="${not empty param.legendUse}">
<c:set var="legendUse" value="${param.legendUse }"/>
</c:if>
<c:set var="ymin" value="0"/>
<c:if test="${not empty param.ymin}">
<c:set var="ymin" value="${param.ymin }"/>
</c:if>

<c:set var="ymax1" value="null"/>
<c:if test="${not empty param.ymax1}">
<c:set var="ymax1" value="${param.ymax1 }"/>
</c:if>
<c:set var="ymax2" value="null"/>
<c:if test="${not empty param.ymax2}">
<c:set var="ymax2" value="${param.ymax2 }"/>
</c:if>

<c:set var="interval1" value="null"/>
<c:if test="${not empty param.interval1}">
<c:set var="interval1" value="${param.interval1}"/>
</c:if>
<c:set var="interval2" value="null"/>
<c:if test="${not empty param.interval2}">
<c:set var="interval2" value="${param.interval2 }"/>
</c:if>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Highcharts</title>
<script src="/js/jquery-1.11.3.min.js"></script>
<script src="/js/highcharts/highcharts.js"></script>
<script src="/js/highcharts/modules/exporting.js"></script>
<style>
#loading_img{
 position:absolute; 
 top:50%;
 left:50%;
 margin-top:-55px;
 margin-left:-110px;
 z-index: 200;
} 
</style>
<script>
	$(document).ready(function() {
		chartLoad();
	});
	
	function chartLoad(){
		jQuery.ajax({
		    type:"GET",
		    data:{ pa1 : '${param.pa1 }', pa2 : '${param.pa2 }',  pa3 : '${param.pa3 }', pa4 : '${param.pa4 }', pa5 : '${param.pa5 }', 
		    	   pa6 : '${param.pa6 }', pa7 : '${param.pa7 }',  pa8 : '${param.pa8 }', pa9 : '${param.pa9 }', pa10 : '${param.pa10 }',
		    	   pa11 : '${param.pa11 }', pa12 : '${param.pa12 }', pa13 : '${param.pa13 }', pa14 : '${param.pa14 }', qid : '${param.qid }'
		    	   },
		    url:"/Chart2",
		    dataType:"JSON",
		    success: function(data){
		    	chartRendering(data.categories, data.series);
		    },
		     complete : function(date){
		    }, 
		    error : function(xhr, status, error){
		        alert("실패");
		    }
		    
		});
	}
    //http://api.highcharts.com        
	function chartRendering(categories, series){ 
		
		$('#container').highcharts({
	        chart: {
	            //zoomType: 'xy'
	        	type: '${cType}'
	        },
	        credits: {
                enabled : false
            },
	        title: {
	            text: ''
	        },
	        subtitle: {
	            text: ''
	        },
	        plotOptions: {
                series: {
                    marker: {
                        enabled: false
                    }
                }
            }, 
	        xAxis: [{
	        	labels: {
	        		enabled: ${xLabel}
                },
	        	categories:categories
	        }],
	        yAxis: [{ // Primary yAxis
	            labels: {
	                format: '',
	                style: {
	                    color: Highcharts.getOptions().colors[1]
	                }
	            },
	            title: {
	                text: '',
	                style: {
	                    color: Highcharts.getOptions().colors[1]
	                }
	            },
	            //,
                //tickInterval :0.02,
                //max : 0.2,
                min : ${ymin},
                tickInterval : ${interval1},
                max : ${ymax1}
	        }, { // Secondary yAxis
	            title: {
	                text: '',
	                style: {
	                    color: Highcharts.getOptions().colors[0]
	                }
	            },
	            labels: {
	                format: '',
	                style: {
	                    color: Highcharts.getOptions().colors[0]
	                }
	            },
	            opposite: true,
	            //,
	            tickInterval : ${interval2},
	            max : ${ymax2},
	            min : ${ymin}
	        }],
	        tooltip: {
	            shared: true
	        },
	        legend: {
	            layout: 'horizontal',
	            align: 'center',
	            verticalAlign: 'bottom',
	            enabled : ${legendUse},
	            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
	        },
	        series: series
	    });
	    
	}
</script>
</head> 
<body>
	<div id="container" style="width: 100%;height: ${param.h}px"><img id="loading_img" src="/img/loading5.gif" /></div>
</body>
</html>