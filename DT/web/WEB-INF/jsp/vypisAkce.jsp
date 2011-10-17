<%-- 
    Document   : vypisAkce
    Created on : 15.12.2010, 16:28:08
    Author     : Matej
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Výpis akcí</title>
    </head>
    <body>
        <h1>Detaily akce:</h1>

        <c:forEach items="${detailyAkce}" var="detail">
            <table>
                <tr>
                     <td>Typ akce:</td>
                     <td>Místo konání:</td>
                     <td>Termín konání:</td>
                     <td>Cena:</td>
                     <c:if test="${jeVicedenni}">
                        <td>Ubytování:</td>
                     </c:if>
                </tr>
                <tr>
                     <td>${nadpisAkce}</td>
                     <td><c:out value="${detail.misto}"></c:out></td>
                     <td><c:out value="${detail.termin}"></c:out></td>
                     <td><c:out value="${detail.cena}"></c:out></td>
                     <c:if test="${jeVicedenni}">
                        <td><c:out value="${detail.ubytovani}"></c:out></td>
                     </c:if>
                </tr>
            </table>
        </c:forEach>
        <h1>Přihlášení účastníci:</h1>
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
    </body>
</html>
