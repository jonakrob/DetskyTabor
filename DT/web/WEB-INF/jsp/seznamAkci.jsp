<%-- 
    Document   : seznamAkci
    Created on : 15.12.2010, 21:39:41
    Author     : Matej
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>seznam akcí</title>
    </head>
    <body>
        <h1>Seznam akcí</h1>
            <h2>Jednodenní akce:</h2>
                <table>
                    <tr>
                        <td>Místo konání:</td>
                        <td>termín:</td>
                        <td></td>
                        <td></td>
                    </tr>
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
                   
                </table>

            <h2>Vícedenní akce:</h2>
                <table>
                    <tr>
                        <td>Místo konání:</td>
                        <td>termín:</td>
                        <td></td>
                        <td></td>
                    </tr>
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
                </table>
            <a href="main.htm"><- zpět</a>
    </body>
</html>
