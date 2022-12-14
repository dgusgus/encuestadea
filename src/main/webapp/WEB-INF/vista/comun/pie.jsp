<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"		uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags" %>

</div> <!-- /.main-content-inner -->
</div><!-- /.main-content -->

<div class="footer">
	<div class="footer-inner">
		<div class="footer-content">
			<span class="bigger-120">
				<span class="blue bolder">D.T.I.C.</span> &copy; 2021
				<small>Dirección de Tecnologías de Información y Comunicación</small>
			</span>
		</div>
	</div>
</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>
</div><!-- /.main-container -->

<div id="__msg" class="hide">
	<div>
		<h3 id="__stit" style="text-align:center"></h3>
		<p id="__con"></p>
	</div>
</div>
<div id="__wait" class="hide">
	<div>
		<p style="background-color:#fff;text-align:center">
			Se está procesando su solicitud.<br/>
			<img src="assets/img/procesando.gif"/><br/>
			Espere por favor...
		</p>
	</div>
</div>

<script type="text/javascript">
	<c:set var="script">
	$(function () {
		__crear_dialogos();
		///limpiarMenu();
		mostarDocente();
	});

	if ('ontouchstart' in document.documentElement)
		document.write('<script src="assets/js/jquery.mobile.custom.min.js"><\/script>');
	</c:set>

	function limpiarMenu(){
		$("#x-menus").html('');
		var GuardarIdRol = localStorage.getItem('numero_rol');
		//console.log(id);
		$.ajax({
			type: "POST",
			url: 'menus/menu_rol.html?id_rol=' + GuardarIdRol,
			success: function (response) {
				console.log(response);
				$("#x-menus").html(generarMenu(response.enlaces[0]));
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function mostarDocente(){
		$("#info_docente").empty();
		$.ajax({
			type: "POST",
			url: 'informaciondocente/informacion.html',
			success: function (response) {
				$("#info_docente").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function GuardaRol(id_rol){
		localStorage.setItem('numero_rol', id_rol);
		limpiarMenu();
	}
	//menu y subs menus dinamicos para la
	function generarMenu(enlace){
		//console.log(enlace.enlaces);
		var menu = '<ul class="nav nav-list">';
			menu = menu +'<li>';
			menu = menu +'<a href="'+enlace.ruta+'" class="dropdown-toggle">';
			menu = menu +'<i class="menu-icon fa fa-desktop"></i>';
			menu = menu +'<span class="menu-text">'+enlace.enlace+'</span>';
			menu = menu +'<b class="arrow fa fa-angle-down"></b>';
			menu = menu +'</a>';
			menu = menu +'<b class="arrow"></b>';
			for (var i = 0; i < enlace.enlaces.length; i++) {
				menu = menu + generarSubMenu(enlace.enlaces[i]);
			};
			menu = menu +'</li>';
//			if(enlace.enlaces.length > 0) {menu = menu + generarMenu(enlace.enlaces[i]);}
		return menu;
	}
	function generarSubMenu(enlace){
		var menu = '<ul class="submenu">';
			menu = menu +'<li>';
			menu = menu +'<a href="'+enlace.ruta+'">';
			menu = menu +'<i class="menu-icon fa fa-caret-right"></i>';
			menu = menu +'<span class="menu-text">'+enlace.enlace+'</span>';
			menu = menu +'<b class="arrow fa fa-angle-down"></b>';
			menu = menu +'</a>';
			menu = menu +'<b class="arrow"></b>';
			menu = menu +'</li>';
			menu = menu +'</ul>';
		return menu;
	}
	<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
</script>

<spring:url value="/assets/js/bootstrap-dialog.min.js" var="bootstrapdialog"/>
<script src="${bootstrapdialog}" ></script>
<spring:url value="/assets/js/bootbox.min.js" var="bootbox"/>
<script src="${bootbox}" ></script>
<spring:url value="/assets/js/ace-elements.min.js" var="aceelements"/>
<script src="${aceelements}" ></script>
<spring:url value="/assets/js/ace.min.js" var="acemin"/>
<script src="${acemin}" ></script>
<spring:url value="/assets/js/tools.js" var="tools"/>
<script type="text/javascript" charset="utf-8" src="${tools}" ></script>
</body>
</html>
