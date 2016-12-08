<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html> 
<html lang="es"> 
    <head> 
        <meta charset="utf-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="dtic">
	<title><c:out value="${titulo}" /></title>       
        <link type="text/css" href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
        <link href="<c:url value="/css/datepicker.css" />" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
            .centro { 
                text-align: center;
            }
            .mayuscula{
                text-transform: uppercase;
            }
        </style>
        <link type="text/css" href="<c:url value="/css/bootstrap-responsive.min.css" />" rel="stylesheet">
        
        <!--[if lt IE 9]>
        <script src="/js/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="<c:url value="/principal/index.html"/>" >DTIC</a>
                    <div class="nav-collapse collapse"> 
                      <sec:authorize access="isAuthenticated()">     
                        <jsp:include page="/comun/menu.html" />
                      </sec:authorize> 
                    </div>
                </div>
            </div>
        </div>        
        <header class="jumbotron subhead">
         <!--   <div class="modal-header">
                <h3 id="myModalLabel"><c:out value="${titulo}" /> </h3>
            </div>  -->
        <center><legend><c:out value="${subtitulo}" /></legend></center>                
        </header>
            
        
        
        
        <div class="container">              