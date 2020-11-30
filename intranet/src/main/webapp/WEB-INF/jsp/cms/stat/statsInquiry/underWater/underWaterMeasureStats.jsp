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
    <caption>측정지점조회 목록</caption>
    <colgroup>
        <!--         <col width="3%" /> -->
    </colgroup>
    <thead>
        <tr>
            <th rowspan="2">년도</th>
            <th rowspan="2">분기</th>
            <th rowspan="2">환경청</th>
            <th rowspan="2">지점코드</th>
            <th rowspan="2">지점</th>
            <th rowspan="2">용도</th>
            <th rowspan="2">음용여부</th>
            <th colspan="20">조 사 항 목 별 오 염 도(mg/L)</th>
        </tr>
        <tr>
            <th>수소이온농도</th>
            <th>총대장균군</th>
            <th>질산성질소</th>
            <th>염소이온</th>
            <th>카드뮴</th>
            <th>비소</th>
            <th>시안</th>
            <th>수은</th>
            <th>유기인</th>
            <th>페놀</th>
            <th>납</th>
            <th>6가크롬</th>
            <th>트리클로로에틸렌</th>
            <th>테트라클로로에틸렌</th>
            <th>1.1.1-트리클로로에탄</th>
            <th>벤젠</th>
            <th>톨루엔</th>
            <th>에틸벤젠</th>
            <th>크실렌</th>
            <th>전기전도도</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="28">검색된 결과가 없습니다.</td>
        </tr>
    </tbody>
</table>