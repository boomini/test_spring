<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/tagCommon.jsp"%>
<!--헤더-->
    <div id="header">
        <div id="menu_wrap"> 
            <!-- GUI 메뉴 시작-->
            <div id="menu" class="fullLayout">
                <ul id="gnb" class="contLayout menu_num100">
                	<li><a href="/web">MAIN</a></li>
                    <c:forEach items="${cmsTopMenuList}" var="SO" varStatus="st">
                        <c:set var="SO_LINK_URL" value="${SO.LINK_URL}" />
                        <c:choose>
                            <c:when test="${fn:contains( SO_LINK_URL, '?' ) }">
                                <c:set var="SO_LINK_URL" value="${SO_LINK_URL}&pMENU_NO=${SO.MENU_NO}" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="SO_LINK_URL" value="${SO_LINK_URL}?pMENU_NO=${SO.MENU_NO}" />
                            </c:otherwise>
                        </c:choose>
                        <c:set var="classOn" value="" />
                        <c:if test='${menuLocationList[0].MENU_NO==SO.MENU_NO}'>
                            <c:set var="classOn" value=" class=on" />
                        </c:if>
                        <li <c:out value="${classOn}"/>>
                        <c:if test='${SO.CNTNTS_TY != "L"}'><a href="/web/link/?pMENU_NO=<c:out value='${SO.MENU_NO}'/>"  title="<c:out value="${SO.MENU_NM}"/>" ><c:out value="${SO.MENU_NM}"/></a></c:if>
                        <c:if test='${SO.CNTNTS_TY == "L"}'><a href="<c:out value="${SO_LINK_URL}"/>" <c:if test='${SO.POPUP_AT=="Y" }'>title="[새창으로 뜹니다.]" target="_blank"</c:if>><c:out value="${SO.MENU_NM}"/></a></c:if>
                            <ul class="tree" style="display:none;">
                            <c:forEach var='EO' items='${SO.menuTreeList }' varStatus='status'>
                            <c:if test='${EO.LEVEL==2}'>
                               <c:set var="classOn" value=""/>
                               <c:if test='${menuLocationList[1].MENU_NO==EO.MENU_NO}'>
                               <c:set var="classOn" value=" class=on"/>
                               </c:if>
                                <li>
                                    <h3>
                                    <c:choose>
                                        <c:when test="${EO.CNTNTS_TY == 'D'}"><c:out value="${EO.MENU_NM}"/></c:when>
                                        <c:when test="${EO.CNTNTS_TY == 'L'}"><a href="<c:out value='${EO.LINK_URL}'/><c:if test="${!fn:contains( EO.LINK_URL, '?' ) }">?</c:if><c:if test="${fn:contains( EO.LINK_URL, '?' ) }">&amp;</c:if>pMENU_NO=<c:out value="${EO.MENU_NO}"/>" <c:if test='${EO.POPUP_AT=="Y" }'> target="_blank" </c:if> title="새창열림:<c:out value="${EO.MENU_NM}"/>" ><c:out value="${EO.MENU_NM}"/></a></c:when>
                                        <c:otherwise><a href="/web/link/?pMENU_NO=<c:out value='${EO.MENU_NO}'/>"  title="<c:out value="${EO.MENU_NM}"/>" ><c:out value="${EO.MENU_NM}"/></a></c:otherwise>
                                    </c:choose>
                                    </h3>
                                    <ul class="subtree">
                                    <c:forEach var='EEO' items='${SO.menuTreeList}' varStatus='status'>
                                    <c:if test='${EEO.UPPER_MENU_NO == EO.MENU_NO}'>
                                    
                                        <c:set var="classOn" value=""/>
                                        <c:if test='${menuLocationList[2].MENU_NO==EEO.MENU_NO}'>
                                        <c:set var="classOn" value=" class=on"/>
                                        </c:if>
                                        <c:if test='${EEO.CNTNTS_TY != "L"}'><li <c:out value="${classOn}"/>><a href="/web/link/?pMENU_NO=<c:out value='${EEO.MENU_NO}'/>"  title="<c:out value="${EEO.MENU_NM}"/>"><c:out value="${EEO.MENU_NM}"/></a></li></c:if>
                                        <c:if test='${EEO.CNTNTS_TY == "L"}'><li <c:out value="${classOn}"/>><a href="<c:out value='${EEO.LINK_URL}'/><c:if test="${!fn:contains( EEO.LINK_URL, '?' ) }">?</c:if><c:if test="${fn:contains( EEO.LINK_URL, '?' ) }">&amp;</c:if>pMENU_NO=<c:out value="${EEO.MENU_NO}"/>" <c:if test='${EEO.POPUP_AT=="2" }'> target="_blank" </c:if> title="<c:out value="${EEO.MENU_NM}"/>"><c:out value="${EEO.MENU_NM}"/></a></li></c:if>
                                    </c:if>    
                                    </c:forEach>    
                                    </ul>
                                </li>
                            </c:if>    
                            </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                    
                    <c:choose>
                		<c:when test="${not empty memberVO}">
                     		<li class="fr"><a href="/web/loginOut">로그아웃</a></li> 
                		</c:when>
                		<c:otherwise>
                			<li class="fr"><a href="/web/login?pMENU_NO=223">로그인</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                    
                    
                </ul>
            </div>
            <!-- GUI 메뉴 끝 //--> 
        </div>
    </div>