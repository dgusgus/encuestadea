<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"		uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags" %>

<html lang="es">
	<head>
		<title>DTIC &copy;</title>

		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

		<spring:url value="/assets/css/bootstrap.min.css" var="bootstrapcss"/>
		<link rel="stylesheet" href="${bootstrapcss}"/>
		<spring:url value="/assets/css/font-awesome.min.css" var="fontawesomemincss"/>
		<link rel="stylesheet" href="${fontawesomemincss}"/>

		<!-- page specific plugin styles -->
		<spring:url value="/assets/css/jquery-ui.min.css" var="jqueryuimincss"/>
		<link rel="stylesheet" href="${jqueryuimincss}"/>
		<spring:url value="/assets/css/jquery-ui.custom.min.css" var="jqueryuicustommincss"/>
		<link rel="stylesheet" href="${jqueryuicustommincss}"/>
		<spring:url value="/assets/css/chosen.min.css" var="chosenmincss"/>
		<link rel="stylesheet" href="${chosenmincss}"  />
		<spring:url value="/assets/css/datepicker.min.css" var="datepickermincss"/>
		<link rel="stylesheet" href="${datepickermincss}"/>
		<spring:url value="/assets/css/ui.jqgrid.min.css" var="uijqgridmincss"/>
		<link rel="stylesheet" href="${uijqgridmincss}"/>

		<spring:url value="/assets/css/fullcalendar.min.css" var="fullcalendarmincss"/>
		<link rel="stylesheet" href="${fullcalendarmincss}" />		
		<spring:url value="/assets/css/bootstrap-dialog.min.css" var="bootstrapdialogmincss"/>
		<link rel="stylesheet" href="${bootstrapdialogmincss}" />
		<spring:url value="/assets/css/ace.min.css" var="acemincss"/>
		<link rel="stylesheet" href="${acemincss}"/>

		<spring:url value="/assets/css/bootstrap-datetimepicker.min.css" var="bootstrapdatetimepickermincss"/>
		<link rel="stylesheet" href="${bootstrapdatetimepickermincss}"/>

		<spring:url value="/assets/js/ace-extra.min.js" var="aceextraminjs"/>
		<script type="text/javascript" src="${aceextraminjs}" ></script>

		<spring:url value="/assets/js/jquery.min.js" var="jqueryminjs"/>
		<script type="text/javascript" src="${jqueryminjs}" ></script>
		<spring:url value="/assets/js/jquery.cookie.js" var="jquerycookiejs"/>
		<script src="${jquerycookiejs}" ></script>
		<spring:url value="/assets/js/jquery-ui.min.js" var="jqueryuiminjs"/>
		<script src="${jqueryuiminjs}" ></script>
		<spring:url value="/assets/js/jquery.ui.touch-punch.min.js" var="jqueryuitouchpunchminjs"/>
		<script src="${jqueryuitouchpunchminjs}" ></script>
		<spring:url value="/assets/js/validator.min.js" var="validatorjs"/>
		<script src="${validatorjs}" ></script>
		<spring:url value="/assets/js/bootstrap.min.js" var="bootstrapjs"/>
		<script src="${bootstrapjs}" ></script>
		<spring:url value="/assets/js/dataTables/jquery.dataTables.min.js" var="datatablesjs"/>
		<script src="${datatablesjs}" ></script>
		<spring:url value="/assets/js/dataTables/jquery.dataTables.bootstrap.min.js" var="datatablesbootstrapjs"/>
		<script src="${datatablesbootstrapjs}" ></script>
		<spring:url value="/assets/js/dataTables/extensions/TableTools/js/dataTables.tableTools.min.js" var="tableTools"/>
		<script src="${tableTools}" ></script>

		<spring:url value="/assets/js/dataTables/extensions/ColVis/js/dataTables.colVis.min.js" var="colVis"/>
		<script src="${colVis}" ></script>
		<spring:url value="/assets/js/sweetalert2v11.min.js" var="sweetalert2v11"/>
		<script src="${sweetalert2v11}" ></script>
		<!-- page specific plugin styles -->
		<spring:url value="/assets/js/fuelux/fuelux.wizard.min.js" var="fueluxwizard"/>
		<script src="${fueluxwizard}" ></script>
		<spring:url value="/assets/js/ace/elements.wizard.js" var="elementswizard"/>
		<script src="${elementswizard}" ></script>
		<spring:url value="/assets/js/chosen.jquery.min.js" var="chosen"/>
		<script src="${chosen}" ></script>

		<style>
			.swal2-popup {
				font-size: 1.6rem !important;
			}
		</style>

		<script type="text/javascript">
			$(function () {
				$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
					_title: function (title) {
						var $title = this.options.title || "&nbsp;";
						if (("title_html" in this.options) && this.options.title_html == true)
							title.html($title);
						else
							title.text($title);
					}
				}));
			});
		</script>
	</head>

	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try {
					ace.settings.check('navbar', 'fixed');
				} catch (e) {
				}
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
							SG - EncuestaDEA
						</small>
					</a>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		<div id="main-container" class="main-container">
			<script type="text/javascript">
				try {
					ace.settings.check('main-container', 'fixed');
				} catch (e) {
				}
			</script>

			<div id="sidebar" class="sidebar responsive">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed');
					} catch (e) {
					}
				</script>
				<div id="x-menus"></div>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed');
					} catch (e) {
					}
				</script>
			</div>


			<div class="main-content">
				<div class="main-content-inner">
