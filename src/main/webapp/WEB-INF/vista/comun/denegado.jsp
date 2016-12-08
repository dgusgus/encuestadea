<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html> 
<html lang="en"> 
    <head> 
        <meta charset="utf-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="dtic">
	<title>D.T.I.C. - Soluciones Inform&aacute;ticas</title>
        <link type="text/css" href="<c:url value="/ace/css/bootstrap.min.css" />" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
            .centro { 
                text-align: center;
            }
        </style>
        <link type="text/css" href="<c:url value="/ace/css/bootstrap-responsive.min.css" />" rel="stylesheet">
        
        <!--[if lt IE 9]>
        <script src="/js/html5.js"></script>
        <![endif]-->
    </head>
    
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Aplicaci&oacute;n Inform&aacute;tica de Gesti&oacute;n Acad&eacute;mica</a>                  
                </div>
            </div>
        </div>
        <div class="container-fluid">               
            <div class="row-fluid">       
                
                <div class="offset4 span4">
                    
                    <h1 class="centro">Acceso Denegado</h1>
                    <p class="centro"><img class="centro" WIDTH=280 HEIGHT=280  src="<c:url value="/img/uto.png" />" alt="Facultad de Ciencias de la Salud" /></p>
                    <hr />
                    <p class="centro"><blink>No tiene permisos para esta acci&oacute;n<br />
                       Consulte con el administrador del Sistema 
                     </blink></p>
                    <form class="centro" action="javascript:history.back()"   method="post" >
                <button type="submit" class="btn btn-primary"><i class="icon-arrow-left  icon-white"></i> Retornar</button>
              </form>
                    
                    <p class="centro">Ing. Victor Hugo Martinez Mendez<br /> 
                   Direcci&oacute;n de Tecnologias de Informaci&oacute;n y Comunicaci&oacute;n<br />
                   Universidad T&eacute;nica de Oruro</p>
                </div>
            </div>            
                        
            <div class="navbar navbar-fixed-bottom">
                <div class="navbar-inner">
                    <p class="centro"><small>&copy; Universidad T&eacute;cnica de Oruro - D.T.I.C. - Desarrollado por DTIC  <c:out value="${gestion}" /> Version <c:out value="${version}"/></small></p>
                </div>
            </div>                          
        </div>        
    </body>
</html>