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
		<style>
			.infodocente{
				background-color: white;
			}
		</style>
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
									<span class="red">Encuesta DEA portal Estudiante</span>
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
											<form action="<c:url value='/seguridad/verficarestudiante.html'/>" method="post" id="form">
												<c:if test="${not empty param.login_error}">
													<div class="alert alert-danger">
														<strong>Error!</strong> Clave o Usuario Incorrectos.
													</div>
												</c:if>
												<fieldset>
													<label class="block clearfix">
														<h3>Carnet de Identidad</h3>
														<span class="block input-icon input-icon-right">
															<input type="text" id="dip" name="dip" class="form-control" placeholder="Número de Documento de Identidad" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<h3>Fecha de Nacimiento</h3>
														<span class="block input-icon input-icon-right">
															<input type="date" name="fec_nacimiento" class="form-control" placeholder="Fecha de Nacimiento" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<input type="hidden" name="consulta" value="${consulta}"/>
													<input type="hidden" name="id_consulta_estudiantil" value="${consulta_estudiantil.id_consulta_estudiantil}"/>
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
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->
								<div class="infodocente">
									<div class="center"><h3>Información de la Encuesta</h3></div>
									<dl id="dt-list-1" class="dl-horizontal">
										<dt>Docente:</dt>
										<dd>${docente.nombre}</dd>
										<dt>Nombre Materia:</dt>
										<dd>${docente.nombreMateria}</dd>
										<dt>Materia:</dt>
										<dd>
											<c:if test="${consulta_estudiantil.sigla_paralelo_teoria != null}">${docente.sigla} (${consulta_estudiantil.sigla_paralelo_teoria})</c:if>
											<c:if test="${consulta_estudiantil.sigla_paralelo_teoria == null}">${docente.sigla}</c:if>
										</dd>
										<dt>Paralelo:</dt>
										<dd>
											<c:if test="${consulta_estudiantil.sigla_paralelo_teoria == null}">${docente.grupo}</c:if>
										</dd>
										<dt>Gestión:</dt>
										<dd>${docente.gestion}</dd>
										<dt>Facultad:</dt>
										<dd>${docente.facultad_materia}</dd>
									</dl>
								</div>
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<script type="text/javascript">
			<c:set var="script">

			if ('ontouchstart' in document.documentElement)
				document.write('<script type="text/javascript"  src="${jquerymobilecustomjs}"><\/script>');

			$(function () {
				$("#j_username").focus();
				$(document).on('click', '.toolbar a[data-target]', function (e) {
					e.preventDefault();
					var target = $(this).data('target');
					$('.widget-box.visible').removeClass('visible'); //hide others
					$(target).addClass('visible'); //show target
				});
			});

			</c:set>
			<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
		</script>
	</body>
</html>
