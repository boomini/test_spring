<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<ul class="tabs">
    <li class="MgL0"><a href="#tab1">측정지점조회</a></li>
    <li><a href="#tab2">초과지점조회</a></li>
</ul>
<div class="tit">통계현황조회</div>
<div class="search_box">
    년도<select>
        <option value="2018">2018</option>
    </select> 환경청 <select>
        <option value="전체">전체</option>
    </select> <a href="#" class="btn_2">조회</a> <a href="#" class="xls">Excel 다운로드</a>
</div>
<table class="table_basic table01">
    <caption>측점지점 목록</caption>
    <colgroup>
<!--         <col style="width: 3%" /> -->
       
    </colgroup>
    <thead>
        <tr>
            <th rowspan="3">년도</th>
            <th rowspan="3">조사지점<br>번호
            </th>
            <th rowspan="3">고유명칭</th>
            <th rowspan="3">조사지점위치<br>(지번)
            </th>
            <th rowspan="3">지목<br>(토지용도)
            </th>
            <th rowspan="3">면적<br>(m<sup>2</sup>)
            </th>
            <th colspan="20">조 사 항 목 별 오 염 도(mg/kg)</th>
            <th rowspan="3">pH</th>
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
            <th colspan="5">유 류</th>
            <th rowspan="2">TCE</th>
            <th rowspan="2">PCE</th>
        </tr>
        <tr>
            <th>벤젠</th>
            <th>톨루엔</th>
            <th>에틸벤젠</th>
            <th>크실렌</th>
            <th>TPH</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>2010</td>
            <td>PN-39</td>
            <td>김해 대동</td>
            <td class="AL">경상남도 김해시 대동면 주동리 42-2</td>
            <td>답</td>
            <td>19955.3</td>
            <td>0.25</td>
            <td>35.43</td>
            <td>0.446</td>
            <td>0.157</td>
            <td>11.32</td>
            <td>0.72</td>
            <td>142.506</td>
            <td>12.837</td>
            <td>-</td>
            <td></td>
            <td>-</td>
            <td>0</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>7</td>
        </tr>
    </tbody>
</table>