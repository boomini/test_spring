<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<ul class="tabs">
    <li class="MgL0"><a href="#tab1">측정지점조회</a></li>
    <li><a href="#tab2">초과지점조회</a></li>
    <li><a href="#tab3">중복초과지점조회</a></li>
</ul>
<div class="tit">측정지점조회</div>
<div class="search_box">
    구분 <input type="radio" name="areaWt" id="areaWt" checked="checked"> <label for="areaWt">오염우려지역(환경청)</label> <input type="radio" name="areaWt" id="areaWt" checked="checked"> <label for="areaWt">일반지역(시도)</label> 기관 <select>
        <option>전체</option>
    </select> 년도 <select>
        <option>2018</option>
    </select> 분기 <select>
        <option>상반기</option>
    </select> <a href="#" class="btn_2">조회</a> <a href="#" class="xls">Excel 다운로드</a>
</div>
<table class="table_basic table01">
    <caption>초과지점조회 목록</caption>
    <colgroup>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
    </colgroup>
    <thead>
        <tr>
            <th>지역구분</th>
            <th>지점번호</th>
            <th>소재지</th>
            <th>주용도</th>
            <th>음용여부</th>
            <th>초과현황<br />(항목, 농도)
            </th>
            <th>전년도<br />수질현황
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>낙동강청</td>
            <td>JN0104</td>
            <td class="AL">울산광역시 울주군 청량면 용암리 235-1</td>
            <td>생활</td>
            <td>비음용</td>
            <td>총대장균군,1</td>
            <td>총대장균군,10</td>
        </tr>
    </tbody>
</table>
