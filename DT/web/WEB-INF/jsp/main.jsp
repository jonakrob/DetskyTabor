<%-- 
    Document   : main
    Created on : 20.12.2010, 0:06:18
    Author     : Matej
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vítejte</title>
    </head>
    <body>
        <h1>Informační systém pro dětský oddíl</h1>
        <c:choose>
            <c:when test="${userLoggedIn}">
				<c:if test="${roleId == '1'}">
					<a href="user.htm">Výpis uživatelů</a><br />
				</c:if>
                <a href="seznamAkci.htm">Seznam akcí</a><br />
                <a href="registrace.htm">Registrace nového uživatele</a><br />
				<a href="logout.htm">Odhlásit se</a>
            </c:when>
            <c:otherwise>
                <p>Nejste přihlášen/a. Prosím pokračujte následujícím odkazem k přihlášení:</p>
                <a href="login.htm">login</a>
            </c:otherwise>
        </c:choose>
    </body>
</html>
