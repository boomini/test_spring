<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<ul class="tabs">
    <li class="MgL0"><a href="#tab1">측정지점조회</a></li>
    <li><a href="#tab2">초과지점조회</a></li>
</ul>
<div class="tit">통계현황조회</div>
<div class="search_box">
    년도<select>
        <option>2017</option>
    </select> 시도<select>
        <option>전체</option>
    </select> <a href="#" class="btn_2">조회</a> <a href="#" class="xls">조회</a>
</div>
<table class="table_basic table01">
    <caption>토양측정망 목록</caption>
    <colgroup>
        <!--         <col style="width: 3%"/> -->
    </colgroup>
    <thead>
        <tr>
            <th rowspan="2">년도</th>
            <th rowspan="2">기관</th>
            <th rowspan="2">오염우려지역</th>
            <th rowspan="2">지점명칭</th>
            <th rowspan="2">조사지점(용도)</th>
            <th rowspan="2">지목</th>
            <th rowspan="2">초과항목</th>
            <th rowspan="2">오염도</th>
            <th colspan="2">토양오염기준</th>
            <th rowspan="2">초과기준</th>
        </tr>
        <tr>
            <th>우려</th>
            <th>대첵</th>
            
        </tr>
    </thead>
    <tbody>
        <tr>
           <td colspan="11">검색된 결과가 없습니다.</td>
        </tr>
    </tbody>
</table>
                  ※ '-'은 미검사이며, '0'은 정량한계 미만입니다.