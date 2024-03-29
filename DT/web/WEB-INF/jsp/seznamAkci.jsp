<%-- 
    Document   : seznamAkci
    Created on : 15.12.2010, 21:39:41
    Author     : Matej
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<z:layout pageTitle="Seznam akcí">
    
    <h3>Jednodenní akce</h3>
        <table class="bordered-table zebra-striped">
            <thead>
            <tr>
                <th>Místo konání</th>
                <th>Termín</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${jednodenni}" var="akce">
                    <tr>
                        <td><c:out value="${akce.misto}"></c:out></td>
                        <td><c:out value="${akce.termin}"></c:out></td>
                        <td><a href="vypisAkce.htm?druhAkce=1&idAkce=<c:out value="${akce.id}"></c:out>">detail akce</a></td>
                        <td>
                            <c:choose>
                                <c:when test="${akce.cena==42}">
                                    JSEM přihlášen - <a href="odhlaseni.htm?idAkce=${akce.id}&druhAkce=1">odhlásit</a>
                                </c:when>
                                <c:otherwise>
                                    NEJSEM přihlášen - <a href="prihlaseni.htm?idAkce=${akce.id}&druhAkce=1">přihlásit</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
           </c:forEach>
            </tbody>
        </table>

    <h3>Vícedenní akce</h3>
        <table class="bordered-table zebra-striped">
            <thead>
            <tr>
                <th>Místo konání</th>
                <th>Termín</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${vicedenni}" var="akce">
                    <tr>
                        <td><c:out value="${akce.misto}"></c:out></td>
                        <td><c:out value="${akce.termin}"></c:out></td>
                        <td><a href="vypisAkce.htm?druhAkce=2&idAkce=<c:out value="${akce.id}"></c:out>">detail akce</a></td>
                        <td>
                            <c:choose>
                                <c:when test="${akce.cena==42}">
                                    JSEM přihlášen - <a href="odhlaseni.htm?idAkce=${akce.id}&druhAkce=2">odhlásit</a>
                                </c:when>
                                <c:otherwise>
                                    NEJSEM přihlášen - <a href="prihlaseni.htm?idAkce=${akce.id}&druhAkce=2">přihlásit</a>
                                </c:otherwise>
                            </c:choose>
                        </td>

                    </tr>
           </c:forEach>
            </tbody>
        </table>
    <a href="main.htm"><- zpět</a>
                
</z:layout>