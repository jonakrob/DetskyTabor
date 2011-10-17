<%-- 
    Document   : user
    Created on : 13.12.2010, 21:41:04
    Author     : Matej
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${message}</title>
    </head>
    <body>
        <h1>Výpis registrovaných uživatelů:</h1>
        

        <br/>
        <table>
            <tr>

                <th>Jméno</th>
                <th>Login</th>
                <th>Heslo</th>
                <th>E-mail</th>
                <th>Telefon</th>
                <th>Role</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>

                    <td><c:out value="${user.jmeno}"></c:out></td>
                    <td><c:out value="${user.login}"></c:out></td>
                    <td><c:out value="${user.heslo}"></c:out></td>
                    <td><c:out value="${user.email}"></c:out></td>
                    <td><c:out value="${user.telefon}"></c:out></td>
                    <td><c:out value="${user.roleId}"></c:out></td>
                </tr>
            </c:forEach>
        </table>
        <a href="main.htm"><- zpět</a>
    </body>

</html>
