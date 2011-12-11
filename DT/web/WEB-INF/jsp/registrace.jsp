<%-- 
    Document   : registrace
    Created on : 15.12.2010, 22:49:21
    Author     : Matej
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<z:layout pageTitle="Přidání nového uživatele">

    <spring:nestedPath path="name">

        <form:form method="POST" commandName="user">
            <fieldset>
                <legend>Vyplňte prosím své osobní údaje</legend>

                <div class="clearfix">
                    <spring:bind path="jmeno">
                        <label for="${status.expression}">Jméno</label>
                        <div class="input">
                            <form:input path="jmeno" class="xlarge" size="30"/>
                            <span class="help-inline"><form:errors path="jmeno" cssClass="error"/></span>
                        </div>
                    </spring:bind>
                </div>

                <div class="clearfix">
                    <spring:bind path="login">
                        <label for="${status.expression}">Přihlašovací jméno</label>
                        <div class="input">
                            <form:input path="login" class="xlarge" size="30"/>
                            <span class="help-inline"><form:errors path="login" cssClass="error"/></span>
                        </div>
                    </spring:bind>
                </div>

                <div class="clearfix">
                    <spring:bind path="heslo">
                        <label for="${status.expression}">Heslo</label>
                        <div class="input">
                            <form:password path="heslo" class="xlarge" size="30"/>
                            <span class="help-inline"><form:errors path="heslo" cssClass="error"/></span>
                        </div>
                    </spring:bind>
                </div>

                <div class="clearfix">
                    <spring:bind path="email">
                        <label for="${status.expression}">E-mail</label>
                        <div class="input">
                            <form:input path="email" class="xlarge" size="30"/>
                            <span class="help-inline"><form:errors path="email" cssClass="error"/></span>
                        </div>
                    </spring:bind>
                </div>

                <div class="clearfix">
                    <spring:bind path="telefon">
                        <label for="${status.expression}">Telefon</label>
                        <div class="input">
                            <form:input path="telefon" class="xlarge" size="30"/>
                            <span class="help-inline"><form:errors path="telefon" cssClass="error"/></span>
                        </div>
                    </spring:bind>
                </div>

                <div class="clearfix">
                    <label for="normalSelect">Role</label>
                    <div class="input">
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
                    </div>
                </div>

                <div class="clearfix">
                    <div class="input">
                        <input type="submit" class="btn primary" value="Ok">
                    </div>
                </div>
                
            </fieldset>
        </form:form>
    </spring:nestedPath>

</z:layout>