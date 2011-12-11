<%-- 
    Document   : main
    Created on : 20.12.2010, 0:06:18
    Author     : Matej
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<z:layout pageTitle="Informační systém pro dětský oddíl">

    <c:choose>
        <c:when test="${userLoggedIn}">
            <c:if test="${roleId == 1}">
                <a href="user.htm">Výpis uživatelů</a><br />
                <a href="registrace.htm">Přidat nového uživatele</a><br />
            </c:if>
            <a href="seznamAkci.htm">Seznam akcí</a><br />
            <a href="logout.htm">Odhlásit se</a>
        </c:when>
        <c:otherwise>
            <p>Nejste přihlášen/a. Prosím pokračujte následujícím odkazem k přihlášení:</p>
            <a href="login.htm" class="btn primary">login</a>
        </c:otherwise>
    </c:choose>

</z:layout>