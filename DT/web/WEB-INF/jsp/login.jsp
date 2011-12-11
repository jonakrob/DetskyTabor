<%-- 
    Document   : login
    Created on : 15.12.2010, 23:31:40
    Author     : Matej
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<z:layout pageTitle="Přihlášení do Informačního Systému">
    <h3>Vyplňte, prosím, své přihlašovací údaje</h3>
    <spring:nestedPath path="name">

        <form:form method="POST" commandName="loginForm" class="form-stacked">

            <div class="clearfix">
                <spring:bind path="login">
                    <label for="${status.expression}">Přihlašovací údaje</label>
                    <div class="input">

                        <input type="text" class="xlarge" size="30" name="${status.expression}" value="${status.value}">

                    </div>
                </spring:bind>
            </div>

            <div class="clearfix">
                <spring:bind path="heslo">
                    <label for="${status.expression}">Heslo</label>
                    <div class="input">

                        <input type="password" class="xlarge" size="30" name="${status.expression}" value="${status.value}">

                    </div>
                </spring:bind>
            </div>

            <div class="clearfix">
                <div class="input">
                    <input type="submit" class="btn primary" value="Přihlásit">
                </div>
            </div>

        </form:form>
    </spring:nestedPath>
    <!--<p>Pokud nejste zaregistrováni do systému, můžete tak učinit <a href="registrace.htm">zde</a></p>-->
</z:layout>