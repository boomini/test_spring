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

<c:set var="interval1" value="null"/>
<c:if test="${not empty param.interval1}">
<c:set var="interval1" value="${param.interval1}"/>
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
		    	   pa6 : '${param.pa6 }', pa7 : '${param.pa7 }',  pa8 : '${param.pa8 }', pa9 : '${param.pa9 }', qid : '${param.qid }'
		    	   },
		    url:"/Chart",
		    dataType:"JSON",
		    success: function(data){
		    	$("#loading_img").fadeOut();
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
		
		var options = {
			 chart: {
	                renderTo: 'container',             //div 태그와 연동되는 필수(str)
	                type: '${cType}'
	            },
				credits: {
	                enabled : false
	            },
	            title: {
	                text: ''
	            },
	            xAxis: {
	                 labels: {
	                     enabled: ${xLabel}
	                 },
	                 categories:categories
	            },
	            plotOptions: {
	                series: {
	                    marker: {
	                        enabled: false
	                    }
	                }
	            }, 
	            yAxis: {
	                title: {
	                    text: ''
	                }, 
	                min : ${ymin} ,
	                tickInterval : ${interval1},
	                max : ${ymax1},
	                plotLines: [{
	                    value: 0,
	                    width: 1,
	                    color: '#808080'
	                }]
	            },
	            tooltip: {
	                valueSuffix: ''
	            },
	            legend: {
	                layout: 'horizontal',    //horizontal, vertical
	                align: 'center',         //left, center, right
	                verticalAlign: 'bottom', //top, middle, bottom 
	                borderWidth: 1 
	            },
	            series: series
		};
		var chart = new Highcharts.Chart(options);
	    
	}
</script>
</head>
<body>
	<div id="container" style="width: 100%;height:100%"><img id="loading_img" src="/img/loading5.gif" /></div>
</body>
</html>