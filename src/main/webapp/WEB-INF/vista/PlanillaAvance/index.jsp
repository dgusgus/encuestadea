<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<jsp:include page="/comun/cabecera.html"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="main-content-inner">
	<!-- /section:basics/content.breadcrumbs -->
	<div class="page-content">
		<!-- /section:settings.box -->
		<div class="page-header">
			<h1>
				PLANILLA DE AVANCE DE ACTIVIDADES ACADEMICAS DOCENTE
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
				<h4 class="widget-title lighter">PLANILLA DE AVANCE DE ACTIVIDADES ACADEMICAS DEL DOCENTE</h4>

				<div class="widget-toolbar">
					<div class="col-sm-4">
						<button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Añadir</button>
					</div>
				</div>
			</div>
		</div>
		<div id="tablaPlanillaAvance">

		</div>
	</div>
</div>
<div class="modal fade" id="ModalAgregarAvance" aria-hidden="true">
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
			toast.addEventListener('mouseleave', Swal.resumeTimer);
		}
	});
	$(function () {
		mostrarModalAvance();
		mostrarTablaAvance();
	});
	function mostrarModalAvance() {
		$("#ModalAgregarAvance").empty();
		$.ajax({
			type: "POST",
			url: 'planillaavance/modalAvance.html',
			success: function (response) {
				$("#ModalAgregarAvance").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function mostrarTablaAvance() {
		$("#tablaPlanillaAvance").empty();
		$.ajax({
			type: "POST",
			url: 'planillaavance/tablaAvance.html',
			success: function (response) {
				$("#tablaPlanillaAvance").html(response);
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
		$("#ModalAgregarAvance").modal('show');
	}

</script>