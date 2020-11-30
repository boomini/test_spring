<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<ul class="tabs">
    <li class="MgL0"><a href="#tab1">측정지점조회</a></li>
    <li><a href="#tab2">초과지점조회</a></li>
</ul>
<div class="tit">통계현황조회</div>
<div class="search_box">
    <select>
        <option value="2018/상반기">2018/상반기</option>
    </select> <input type="radio" name="areaWt" id="areaWt" checked="checked"> <label for="areaWt">미입력 보기</label> <a href="#" class="btn_2">조회</a> <a href="#" class="xls">Excel 다운로드</a>
</div>
<table class="table_basic table01">
    <caption>초과지점 목록</caption>
    <colgroup>
        <col style="width: 8%" />
        <col style="width:8%" />
        <col />
        <col style="width:10%" />
        <col style="width:8%" />
        <col style="width:20%" />
        <col style="width:8%" />
        <col style="width:5%" />
        <col style="width:5%" />
        <col style="width:5%" />
    </colgroup>
    <thead>
        <tr>
            <th rowspan="2">년도</th>
            <th rowspan="2">기관</th>
            <th rowspan="2">오염우려지역</th>
            <th rowspan="2">조사지점(용도)</th>
            <th rowspan="2">지목</th>
            <th rowspan="2">초과<br>항목
            </th>
            <th rowspan="2">오염도</th>
            <th colspan="2">토양오염기준</th>
            <th rowspan="2">초과<br>기준
            </th>
        </tr>
        <tr>
            <th width="40">우려</th>
            <th width="40">대책</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>2016</td>
            <td>한강청</td>
            <td>경기도 광명시 철산동 555</td>
            <td>배경농도지점(사람활동)</td>
            <td>학교용지</td>
            <td>폴리클로리네이트페닐</td>
            <td>1</td>
            <td>1</td>
            <td></td>
            <td>우려</td>
        </tr>
    </tbody>
</table>
※ '-'은 미검사이며, '0'은 정량한계 미만입니다.