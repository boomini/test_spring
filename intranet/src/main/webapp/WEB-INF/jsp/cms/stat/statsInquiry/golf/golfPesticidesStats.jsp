<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<ul class="tabs">
    <li class="MgL0"><a href="#tab1">골프장 농약사용량</a></li>
    <li><a href="#tab2">골프장 농약잔류량</a></li>
    <li><a href="#tab3">골프장 농약사용품목</a></li>
</ul>
<div class="tit">골프장 통계현황</div>
<div class="search_box">
    년도<select>
        <option value="2018">2018</option>
    </select> 분기<select>
        <option value="분기">분기</option>
    </select> <select>
        <option value="분기">검색조건</option>
    </select> <input type="text" /> <a href="#" class="btn_2">조회</a> <a href="#" class="xls">Excel 다운로드</a>
</div>
<table class="table_basic table01">
    <caption>골프장 통계</caption>
    <colgroup>
<!--                 <col style="width: 3%" /> -->
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>형태</th>
            <th>품목명</th>
            <th>상표명</th>
            <th>용도</th>
            <th>독성</th>
            <th>실물량(kg)</th>
            <th>성분량(kg)</th>
            <th>사용골프장수</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>살균제</td>
            <td>가스가마이신,시스-팔-도테세닐아세테이트</td>
            <td>[액제]가스기민</td>
            <td></td>
            <td>[액제]가스기민</td>
            <td>1.8</td>
            <td>0.324</td>
            <td>1</td>
        </tr>
        <tr>
            <td colspan="6" class="AR">소 계</td>
            <td>1.8</td>
            <td>0.324</td>
            <td>1</td>
        </tr>
        <tr>
            <td>1</td>
            <td>살균제</td>
            <td>가스가마이신,시스-팔-도테세닐아세테이트</td>
            <td>[액제]가스기민</td>
            <td></td>
            <td>[액제]가스기민</td>
            <td>1.8</td>
            <td>0.324</td>
            <td>1</td>
        </tr>
        <tr>
            <td colspan="6" class="AR">소 계</td>
            <td>1.8</td>
            <td>0.324</td>
            <td>1</td>
        </tr>
    </tbody>
</table>