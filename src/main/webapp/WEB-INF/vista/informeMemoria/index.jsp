<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<jsp:include page="/comun/cabecera.html"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- iniciaremos con el formulario de New Item Wizard -->
<!-- /section:basics/sidebar -->
<div class="main-content">
	<div class="main-content-inner">
		<!-- /section:basics/content.breadcrumbs -->
		<div class="page-content">
			<!-- /section:settings.box -->
			<div class="page-header">
				<h1>
					REGLAMENTO DE EVALUACION DOCENTE
					</br>
					<small>
						INFORME MEMORIA DEL DOCENTE
					</small>
				</h1>
			</div><!-- /.page-header -->
			<div id="info_docente">
				<!-- Aqui va los datos del docente -->
			</div>
		</div><!-- /.row -->
	</div><!-- /.page-content -->
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="hr hr-18 hr-double dotted"></div>
		<div class="widget-box">

			<div class="widget-header widget-header-blue widget-header-flat">
				<h4 class="widget-title lighter">INFORME MEMORIA DEL DOCENTE</h4>
				<div class="widget-toolbar">
					<label>
						<small class="green">
							<b>Validation</b>
						</small>
						<input id="skip-validation" type="checkbox" class="ace ace-switch ace-switch-4" />
						<span class="lbl middle"></span>
					</label>
				</div>
			</div>

			<div class="widget-body">
				<div class="wizard-content">
					<div id="wizard-encuesta">
						<div class="modal-header">
							<ul class="steps">
								<li data-step="1" class="active">
									<span class="step">1</span>
									<span class="title">DOCENCIA</span>
								</li>
								<li data-step="2">
									<span class="step">2</span>
									<span class="title">INVESTIGACIÓN Y/O INTERACCIÓN SOCIAL</span>
								</li>
								<li data-step="3">
									<span class="step">3</span>
									<span class="title">3. PRODUCCIÓN CIENTÍFICA E INTELECTUAL</span>
								</li>
								<li data-step="4">
									<span class="step">4</span>
									<span class="title">4. SUPERACIÓN Y ACTUALIZACIÓN DOCENTE</span>
								</li>
							</ul>
						</div>
						<form id="form">
							<div class="modal-body step-content">
								<div class="step-pane active" data-step="1">
									<div class="" id="data_step_1">
										-<!-- Formulario 1 -->
									</div>
								</div>
								<div class="step-pane" data-step="2">
									<div class="" id="data_step_2">
										-<!-- Formulario 2-->
									</div>
								</div>
								<div class="step-pane" data-step="3">
									<div class="" id="data_step_3">
										-<!-- Formulario 3-->
									</div>
								</div>
								<div class="step-pane" data-step="4">
									<div class="" id="data_step_4">
										-<!-- Formulario 4-->
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer wizard-actions">
						<button class="btn btn-sm btn-prev">
							<i class="ace-icon fa fa-arrow-left"></i>
							Anterior
						</button>
						<button class="btn btn-success btn-sm btn-next" data-last="Finalizar">
							Siguiente
							<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
						</button>
					</div>
				</div>
			</div><!-- /.widget-body -->
		</div>
	</div>
</div>
<div class="modal fade" id="ModalAgregar1" aria-hidden="true">
</div>
<jsp:include page="/comun/pie.html"/>
<script type="text/javascript">
	const Toast = Swal.mixin({
		toast: true,
		position: 'top',
		showConfirmButton: false,
		timer: 3000,
		timerProgressBar: true,
		didOpen: (toast) => {
			toast.addEventListener('mouseleave', Swal.resumeTimer)
		}
	});
	$(function () {
		$('#form').submit(function (e) {
			return false;
		});
		$('#wizard-encuesta').ace_wizard()
				.on('finished.fu.wizard', function (e) {
					guardar_nuevo();
				}).on('stepclick.fu.wizard', function (e) {
		}).on('actionclicked.fu.wizard', function (e, info) {
			$('html, body').animate({scrollTop: 0}, '300');
		});
		mostrarAdminstracion();
		mostrarInvestigacion();
		mostrarActualizacion();
		mostrarProduccion();
		mostrarModalAgregar1();
		mostrarModalAgregar2();
	});
	function mostrarAdminstracion(){
		$("#data_step_1").empty();
		$.ajax({
			type: "POST",
			url: 'informememoria/administracion.html',
			success: function (response) {
				$("#data_step_1").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function mostrarInvestigacion(){
		$("#data_step_2").empty();
		$.ajax({
			type: "POST",
			url: 'informememoria/investigacion.html',
			success: function (response) {
				$("#data_step_2").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function mostrarActualizacion(){
		$("#data_step_3").empty();
		$.ajax({
			type: "POST",
			url: 'informememoria/actualizacion.html',
			success: function (response) {
				$("#data_step_3").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function mostrarProduccion(){
		$("#data_step_4").empty();
		$.ajax({
			type: "POST",
			url: 'informememoria/produccion.html',
			success: function (response) {
				$("#data_step_4").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function mostrarModalAgregar1(){
		$("#ModalAgregar1").empty();
		$.ajax({
			type: "POST",
			url: 'informememoria/modalAgregar.html',
			success: function (response) {
				$("#ModalAgregar1").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function mostrarModalAgregar2(){
		$("#ModalAgregar1").empty();
		$.ajax({
			type: "POST",
			url: 'informememoria/modalAgregar.html',
			success: function (response) {
				$("#ModalAgregar1").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}

	function abrirModal() {
		$("#ModalAgregar1").modal('show');

	}
	jQuery(function ($) {
	window.prettyPrint && prettyPrint();
	$('#id-check-horizontal').removeAttr('checked').on('click', function () {
	$('#dt-list-1').toggleClass('dl-horizontal').prev().html(this.checked ? '&lt;dl class="dl-horizontal"&gt;' : '&lt;dl&gt;');
	});
	})
			<--<!-- activar el calendario -->
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function(){
			$(this).prev().focus();
					});
</script>
