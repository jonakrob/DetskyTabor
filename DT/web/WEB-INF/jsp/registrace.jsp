<%-- 
    Document   : registrace
    Created on : 15.12.2010, 22:49:21
    Author     : Matej
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8_czech_ci">

        <title>Přidání nového uživatele</title>
        <style type="text/css" >
			.error {
				color: red;
			}
		</style>
    </head>
    <body>
		<h1>Přidání nového uživatele</h1>
        <h3>Vyplňte prosím osobní údaje uživatele:</h3>
        <spring:nestedPath path="name">

            <form:form method="POST" commandName="user">

                Jméno <form:errors path="jmeno" cssClass="error"/><br />
				<form:input path="jmeno"/><br /><br />

                Přihlašovací jméno <form:errors path="login" cssClass="error" /><br />
                <form:input path="login"/><br /><br />

                Heslo <form:errors path="heslo" cssClass="error" /><br />
                <form:input type="password" path="heslo"/><br /><br />

                E-mail <form:errors path="email" cssClass="error" /><br />
                <form:input path="email"/><br /><br />

                Telefon <form:errors path="telefon" cssClass="error" /><br />
                <form:input path="telefon"/><br /><br />

				Role:
                <spring:bind path="roleId">
                    <select name="${status.expression}">
						<option value="1">Hlavní vedoucí</option>
						<option value="2">Hospodář</option>
						<option value="3">Zdravotník</option>
						<option value="4">Kuchař</option>
						<option value="5">Oddílový vedoucí</option>
						<option value="6">Praktikant</option>
                    </select>
                </spring:bind>

                <input type="submit" value="OK">

            </form:form>
        </spring:nestedPath>
    </body>
</html>

