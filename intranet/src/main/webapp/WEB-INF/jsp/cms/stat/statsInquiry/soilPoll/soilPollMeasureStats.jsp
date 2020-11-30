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
            <th rowspan="3">년도</th>
            <th rowspan="3">지점 명칭</th>
            <th rowspan="3">조사지역 종류</th>
            <th rowspan="3">조사지역위치(지번)</th>
            <th rowspan="3">토지지목</th>
            <th rowspan="3">면적<br>(m<sup>2</sup>)
            </th>
            <th colspan="20">조 사 항 목 오 염 도(mg/kg)</th>
            <th rowspan="3">pH</th>
            <th rowspan="3">비고</th>
        </tr>
        <tr>
            <th rowspan="2">Cd</th>
            <th rowspan="2">Cu</th>
            <th rowspan="2">As</th>
            <th rowspan="2">Hg</th>
            <th rowspan="2">Pb</th>
            <th rowspan="2">Cr+6</th>
            <th rowspan="2">Zn</th>
            <th rowspan="2">Ni</th>
            <th rowspan="2">F</th>
            <th rowspan="2">유기인</th>
            <th rowspan="2">PCB</th>
            <th rowspan="2">CN</th>
            <th rowspan="2">페놀</th>
            <th colspan="4">유 류</th>
            <th rowspan="2">TCE</th>
            <th rowspan="2">PCE</th>
            <th rowspan="2">벤조(a)피렌</th>
        </tr>
        <tr>
            <th>벤젠</th>
            <th>에틸벤젠</th>
            <th>크실렌</th>
            <th>TPH</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>2016</td>
            <td>삼덕초등학교</td>
            <td>어린이 놀이시설지역</td>
            <td class="AL">부산광역시 사상구 삼락동 산 409-17</td>
            <td>학교용지</td>
            <td>11790.8</td>
            <td>1.01</td>
            <td>14</td>
            <td>4.33</td>
            <td>0.02</td>
            <td>23.3</td>
            <td>0</td>
            <td>91.1</td>
            <td>9.5</td>
            <td>-</td>
            <td></td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>8.6</td>
            <td>-</td>
        </tr>
    </tbody>
</table>
※ '-'은 미검사이며, '0'은 정량한계 미만입니다.