<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>


<div id="x-menus">
	<ul class="nav nav-list">
		<li class="active">
			<a href="index.html">
				<i class="menu-icon fa fa-tachometer"></i>
				<span class="menu-text"> Dashboard </span>
			</a>

			<b class="arrow"></b>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-desktop"></i>
				<span class="menu-text">
					UI &amp; Elements
				</span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-caret-right"></i>

						Layouts
						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>
				</li>
			</ul>
		</li>
	</ul>
	<ul class="nav nav-list">
		<li class="">
			<a href="consultaestudiantil/index.html">
				<i class="menu-icon fa fa-file"></i>
				<span class="menu-text"> Consultas </span>
			</a>
			<b class="arrow"></b>
		</li>
		<li class="">
			<a href="principal/buscar.html">
				<i class="menu-icon fa fa-search"></i>
				<span class="menu-text"> Buscar Docente </span>
			</a>
			<b class="arrow"></b>
		</li>

		<li class="">
			<a href="personanuevo/index.html">
				<i class="menu-icon fa fa-adjust"></i>
				<span class="menu-text"> Personas </span>
			</a>
			<b class="arrow"></b>
		</li>
		<sec:authorize access="hasRole('ADMINISTRADOR')">
			<h1>Hola</h1>
		</sec:authorize>
	</ul>
</div>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
