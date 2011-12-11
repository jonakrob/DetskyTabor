<%-- 
    Document   : user
    Created on : 13.12.2010, 21:41:04
    Author     : Matej
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<z:layout pageTitle="Výpis registrovaných uživatelů">
    
    <table class="bordered-table zebra-striped">
        <thead>
        <tr>
            <th>Jméno</th>
            <th>Login</th>
            <th>Heslo</th>
            <th>E-mail</th>
            <th>Telefon</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody>
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
        </tbody>
    </table>
    <a href="registrace.htm" class="btn primary">Přidat uživatele</a>
    <p><a href="main.htm"><- zpět</a></p>
                
</z:layout>