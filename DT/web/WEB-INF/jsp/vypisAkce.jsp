<%-- 
    Document   : vypisAkce
    Created on : 15.12.2010, 16:28:08
    Author     : Matej
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<z:layout pageTitle="Detail akce">
    
        <c:forEach items="${detailyAkce}" var="detail">
            <dl>
                 <dt>Typ akce</dt>
                 <dd>${nadpisAkce}</dd>

                 <dt>Místo konání</dt>
                 <dd><c:out value="${detail.misto}"></c:out></dd>

                 <dt>Termín konání</dt>
                 <dd><c:out value="${detail.termin}"></c:out></dd>

                 <dt>Cena (v Kč)</dt>
                 <dd><c:out value="${detail.cena}"></c:out></dd>

                 <c:if test="${jeVicedenni}">
                    <dt>Ubytování</dt>
                    <dd><c:out value="${detail.ubytovani}"></c:out></dd>
                 </c:if>
            </dl>    
        </c:forEach>
        <h2>Přihlášení účastníci</h2>
            <ul>
                <c:forEach items="${prihlaseneUcasti}" var="ucast">
                    <c:forEach items="${vsichniUzivatele}" var="uziv">
                        <c:if test = "${ucast.uzivatelId eq uziv.id}">
                            <li><c:out value="${uziv.jmeno}"></c:out></li>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </ul>
        <a href="seznamAkci.htm"><- zpět na výpis všech akcí</a>
                
</z:layout>