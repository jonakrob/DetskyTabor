<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag body-content="scriptless"  %>
<%@ tag pageEncoding='UTF-8' %>
<%@ attribute name="pageTitle" required="true" type="java.lang.String" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <title>${pageTitle}</title>
    </head>
    <body>
        <div class="topbar">
            <div class="fill">
                <div class="container">
                    <a class="brand" href="#">Dětské tábory</a>
                    <ul class="nav">
                        <c:choose>
                            <c:when test="${userLoggedIn}">
                                <c:if test="${roleId == 1}">
                                    <li><a href="user.htm">Výpis uživatelů</a></li>
                                    <li><a href="registrace.htm">Přidat nového uživatele</a></li>
                                </c:if>
                                <li><a href="seznamAkci.htm">Seznam akcí</a></li>
                                <li><a href="logout.htm">Odhlásit se</a></li>
                            </c:when>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>

        <div class="container">

            <div class="content">
                <div class="page-header">
                    <h1>${pageTitle}</h1>
                </div>
                <div class="row">
                    <div class="span16">
                        <jsp:doBody/>
                    </div>
                </div>
            </div>

            <footer>

            </footer>

        </div> <!-- /container -->





    </body>
</html>