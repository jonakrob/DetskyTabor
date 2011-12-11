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
            <!--<li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>-->
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