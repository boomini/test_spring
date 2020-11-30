<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<ul class="tabs">
    <li class="MgL0"><a href="#tab1">골프장 농약사용량</a></li>
    <li><a href="#tab2">골프장 농약잔류량</a></li>
    <li><a href="#tab3">골프장 농약사용품목</a></li>
</ul>
<div class="tit">골프장 농약잔류량</div>
<div class="search_box">
    년도<select>
        <option value="2018">2018</option>
    </select> 분기<select>
        <option value="분기">분기</option>
    </select> 골프장명 <input type="text" /> <a href="#" class="btn_2">조회</a> <a href="#" class="xls">Excel 다운로드</a>
</div>
<table class="table_basic table01">
    <caption>농약잔류량목록</caption>
    <colgroup>
<!--         <col style="width: 3%" /> -->
    </colgroup>
    <thead>
        <tr>
            <th rowspan="2">번호</th>
            <th rowspan="2">지역</th>
            <th rowspan="2">골프장명</th>
            <th rowspan="2">주소</th>
            <th rowspan="2">시료채취<br>일자
            </th>
            <th rowspan="2">시료채취<br>홀번호
            </th>
            <th rowspan="2">검사항목</th>
            <th colspan="2">잔디</th>
            <th colspan="2">토양</th>
            <th rowspan="2">유출수</th>
            <th rowspan="2">분기</th>
        </tr>
        <tr>
            <th>Green</th>
            <th>Fairway</th>
            <th>Green</th>
            <th>Fairway</th>
        </tr>
    </thead>
    <tbody>
    <tbody>
        <tr>
            <td>1</td>
            <td>강원도</td>
            <td>O2리조트대중제</td>
            <td></td>
            <td>2016-05-12</td>
            <td>9</td>
            <td>Phorate</td>
            <td>불검출</td>
            <td>불검출</td>
            <td>불검출</td>
            <td>불검출</td>
            <td>불검출</td>
            <td>상반기</td>
        </tr>
    </tbody>
    </tbody>
</table>