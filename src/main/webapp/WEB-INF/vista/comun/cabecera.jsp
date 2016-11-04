<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>

<html lang="es">
	<head>
		<title>DTIC &copy; <%= session.getAttribute("__gestion").toString() %></title>
		<base href="<%= session.getAttribute("__direccion").toString() %>"/>
		<meta name="description" content="<%= session.getAttribute("__descripcion").toString() %>"/>

		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

		<link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="/assets/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="/assets/css/google-fonts.css"/>

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="/assets/css/jquery-ui.min.css"/>
		<link rel="stylesheet" href="/assets/css/jquery-ui.custom.min.css"/>
		<link rel="stylesheet" href="/assets/css/chosen.min.css"  />
		<link rel="stylesheet" href="/assets/css/datepicker.min.css"/>
		<link rel="stylesheet" href="/assets/css/ui.jqgrid.min.css"/>

		<link rel="stylesheet" href="/assets/css/fullcalendar.min.css" />
		<link rel="stylesheet" href="/assets/css/bootstrap-dialog.min.css" />

		<link rel="stylesheet" href="/assets/css/ace.min.css"/>
		<link rel="stylesheet" href="/assets/css/estilos.css"/>
		<link rel="stylesheet" href="/assets/css/bootstrap-datetimepicker.min.css"/>

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css"/>
		<![endif]-->

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
		<![endif]-->

		<script type="text/javascript" src="/assets/js/ace-extra.min.js" ></script>

		<!--[if lte IE 8]>
		<script type="text/javascript" src="assets/js/html5shiv.min.js" ></script>
		<script type="text/javascript" src="assets/js/respond.min.js" ></script>
		<![endif]-->

		<script type="text/javascript" src="/assets/js/jquery.min.js" ></script>
		<script src="/assets/js/jquery.cookie.js" ></script>
		<script src="/assets/js/jquery-ui.min.js" ></script>
		<script src="/assets/js/jquery.ui.touch-punch.min.js" ></script>
		<script src="/assets/js/chosen.jquery.js" ></script>

		<script type="text/javascript">
<c:set var="script">
$(function(){
	$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
		_title: function(title) {
			var $title = this.options.title || "&nbsp;";
			if( ("title_html" in this.options) && this.options.title_html == true )
				title.html($title);
			else title.text($title);
		}
	}));
});
function eventMenusRol(){
	$("#x-roles a[data-rol]").click(function(e){
		e.preventDefault();
		var panel="#x-menus";
		var id = $(this).attr("data-rol");
		$.cookie("${apodo}.rol", id, {path:"<%= session.getAttribute("__direccion").toString() %>", expires:30});
		$("#x-rol").text($(this).text());
		$.ajax({url:"comun/menu.html"
			,type:"POST"
			,data:{idRol:id}
			,beforeSend:function(){
				$(panel).html("<div class='cargando'>Cargando...</div>");
			}
			,success:function(html){
				$(panel).html(html);
				var msel=false;
				$("#x-menus li a[href!='#']").click(function(){
					$.cookie("${apodo}.menu.sel", this.href, {path:"<%= session.getAttribute("__direccion").toString() %>", expires:1});
				}).each(function(){
					if( !msel && this.href == window.location.href ) {
						$(this).parent().addClass("active").parents("li").addClass("active open");
						msel = true;
					}
				});
				if( !msel ) {
					var menu = $.cookie("${apodo}.menu.sel");
					$("#x-menus li a").each(function(){
						if( this.href == menu )
							$(this).parent().addClass("active").parents("li").addClass("active open");
					});
				}
			}
			,error: function(xhr, error){
				$(panel).html('<div class="ui-state-error ui-corner-all" style="width:400px;display:inline-block"><p>No se pudo cargar la página: '+page+'</p></div>');
			}
		});
	});
}
function getMenu(){
	$("#x-roles").html($.cookie("${apodo}.roles"));
	eventMenusRol();
	var rol = $.cookie("${apodo}.rol");
	if(rol===undefined) {
		$("#x-roles a[data-rol]:eq(0)").click();
	}else{
		$("#x-roles a[data-rol="+rol+"]").click();
	}

}
</c:set>
<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString()) %>
		</script>
	</head>

	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ ace.settings.check('navbar', 'fixed'); }catch(e){ }
			</script>
			<div class="navbar-container" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							SG - <%= session.getAttribute("__titulo").toString() %>
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="user-info"><small>Rol</small><span id="x-rol">Administrador</span></span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>
							<ul id="x-roles" class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close"></ul>
							<script type="text/javascript">
								getMenu();
							</script>
						</li>
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="/assets/avatars/avatar2.png"/>
								<span class="user-info" title="${nombre}"><small>Usuario</small>${apodo}</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>
							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="principal/index.html" data-href="usuario/cambiarclaveinicio.html" ><i class="ace-icon fa fa-user"></i>
										Cambiar Contraseña
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="j_spring_logout"><i class="ace-icon fa fa-power-off"></i>
										Salir
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		<div id="main-container" class="main-container">
			<script type="text/javascript">
				try{ ace.settings.check('main-container', 'fixed'); }catch(e){ }
			</script>

			<div id="sidebar" class="sidebar responsive">
				<script type="text/javascript">
					try{ ace.settings.check('sidebar', 'fixed'); }catch(e){ }
				</script>
				<div id="x-menus"></div>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<script type="text/javascript">
					try{ ace.settings.check('sidebar', 'collapsed'); }catch(e){ }
				</script>
			</div>


			<div class="main-content">
				<div class="main-content-inner">
