<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<ul class="tabs">
    <li class="MgL0"><a href="#tab1">골프장 농약사용량</a></li>
    <li><a href="#tab2">골프장 농약잔류량</a></li>
    <li><a href="#tab3">골프장 농약사용품목</a></li>
</ul>
<div class="tit">골프장 농약사용량</div>
<div class="search_box">
    <select>
        <option value="2018">2018</option>
    </select> 년도 <select>
        <option value="2018">전체</option>
    </select> 분기 <a href="#" class="btn_2">조회</a> <a href="#" class="xls">Excel 다운로드</a>
</div>
<table class="table_basic table01">
    <caption>농약사용량목록</caption>
    <colgroup>
<!--         <col style="width: 3%" /> -->
    </colgroup>
    <thead>
        <tr>
            <th rowspan="2">번호<br></th>
            <th rowspan="2">시도</th>
            <th rowspan="2">골프장명</th>
            <th rowspan="2">형태</th>
            <th rowspan="2">소재지</th>
            <th rowspan="2">홀수</th>
            <th colspan="3">면적(m<sup>2</sup>)
            </th>
            <th colspan="2">총사용량</th>
            <th colspan="2">전체면적대비 ha당 사용량(kg)</th>
            <th colspan="2">농약사용면적대비 ha당 사용량(kg)</th>
            <th rowspan="2">농약<br>품목수
            </th>
        </tr>
        <tr>
            <th>면적총계</th>
            <th>농약사용<br>면적
            </th>
            <th>농약미사용<br>면적
            </th>
            <th>실물량</th>
            <th>성분량</th>
            <th>실물량</th>
            <th>성분량</th>
            <th>실물량</th>
            <th>성분량</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>강원도</td>
            <td>O2리조트</td>
            <td>대중제</td>
            <td></td>
            <td>9</td>
            <td>467,900</td>
            <td>238,765</td>
            <td>229,135</td>
            <td>60,90</td>
            <td>19.82</td>
            <td>1.30</td>
            <td>0.42</td>
            <td>2.55</td>
            <td>0.83</td>
            <td>8</td>
        </tr>
        <tr>
            <td>2</td>
            <td>강원도</td>
            <td>O2리조트</td>
            <td>회원제</td>
            <td></td>
            <td>9</td>
            <td>467,900</td>
            <td>238,765</td>
            <td>229,135</td>
            <td>60,90</td>
            <td>19.82</td>
            <td>1.30</td>
            <td>0.42</td>
            <td>2.55</td>
            <td>0.83</td>
            <td>8</td>
        </tr>
    </tbody>
</table>