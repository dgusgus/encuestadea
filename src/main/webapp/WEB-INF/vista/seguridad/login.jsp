<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"		uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>

<fmt:setLocale value="es_BO" scope="session"/>
<html lang="es">
	<head>
		<title>Plantilla :: Identificación</title>		
		<meta name="description" content="User login page" />

		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- let's add tag srping:url -->
		<spring:url value="/assets/css/bootstrap.min.css" var="bootstrapcss" />
		<spring:url value="/assets/css/font-awesome.min.css" var="fontawesomecss" />
		<spring:url value="/assets/css/ace-fonts.min.css" var="acefontscss" />
		<spring:url value="/assets/css/ace.min.css" var="acecss" />
		<spring:url value="/assets/js/jquery.min.js" var="jqueryjs" />
		<spring:url value="/assets/css/ace-rtl.min.css" var="acertlcss" />
		<spring:url value="/assets/js/jquery.mobile.custom.min.js" var="jquerymobilecustomjs" />
		
<!--		<link href="${crunchifyCSS}" rel="stylesheet" />
		<script src="${crunchifyJS}"></script>-->
		<!-- Finish adding tags -->
		
		
		<link rel="stylesheet" href="${bootstrapcss}"  />
		<link rel="stylesheet" href="${fontawesomecss}" />
		<link rel="stylesheet" href="${acefontscss}"  />
		<link rel="stylesheet" href="${acecss}"  />

		<script type="text/javascript" src="${jqueryjs}" ></script>


		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/assets/css/ace-part2.min.css"  />
		<![endif]-->
		<link rel="stylesheet" href="${acertlcss}"  />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/assets/css/ace-ie.min.css"  />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script type="text/javascript" src="/assets/js/html5shiv.min.js" ></script>
		<script type="text/javascript" src="/assets/js/respond.min.js" ></script>
		<![endif]-->
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">SG</span>
									<span class="white" id="id-text2">${titulo}</span>
								</h1>
								<h4 class="blue" id="id-company-text">DTIC &copy; ${gestion}<br/><small>Dirección de Tecnologías de Información y Comunicación</small></h4>
							</div>
							<div class="space-6"></div>
							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Introduzca su información
											</h4>
											<div class="space-6"></div>
											<form action="<c:url value='/j_spring_security_check'/>" method="post" id="form">
												<c:if test="${not empty param.login_error}">
													<div class="alert alert-danger">
														<strong>Error!</strong> Clave o Usuario Incorrectos.
													</div>
												</c:if>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="j_username" name="j_username" class="form-control" placeholder="Cuenta de Usuario" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="j_password" class="form-control" placeholder="Contraseña" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<div class="space"></div>
													<div class="clearfix">
														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Ingresar</span>
														</button>
													</div>
													<div class="space-4"></div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
<!--												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													Olvidé mi contraseña
												</a>-->
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Recuperar Contraseña
											</h4>
											<div class="space-6"></div>
											<p>Ingrese su correo electrónico y para recibir instrucciones.</p>
											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Correo" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">¡Envíame!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Volver a identificarse
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<script type="text/javascript">
			<c:set var="script">

			if('ontouchstart' in document.documentElement)
				document.write('<script type="text/javascript"  src="${jquerymobilecustomjs}"><\/script>');

			$(function (){
				$("#j_username").focus();
				$(document).on('click', '.toolbar a[data-target]', function (e){
					e.preventDefault();
					var target=$(this).data('target');
					$('.widget-box.visible').removeClass('visible'); //hide others
					$(target).addClass('visible'); //show target
				});
			});

			</c:set>
			<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
		</script>
	</body>
</html>
