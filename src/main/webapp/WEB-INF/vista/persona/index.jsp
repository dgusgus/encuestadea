<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<jsp:include page="/comun/cabecera.html"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
<div class="page-content">
	<div class="page-header">
		<h1>

		</h1>
<c:forEach items="${personas}" var="persona">
	<p>${persona.id_persona} - ${persona.nombre}</p>
</c:forEach>
</div>
</div>
-->
<div class="row">
	<div class="col-sm-12 widget-container-col ui-sortable">
		<div class="widget-box ui-sortable-handle">
			<div class="widget-header widget-header-small">
				<h4 class="widget-title">Listado de Personas</h4>
				<div class="widget-toolbar">
					<a class="orange2" data-action="fullscreen" href="#"><i class="ace-icon fa fa-expand"></i></a>
					<a data-action="collapse" href="#"><i class="ace-icon fa fa-chevron-up"></i></a>
				</div>
				<div class="widget-toolbar">
					<button onclick="abrirNuevo()" class="btn btn-minier btn-primary btn-round"><i class="ace-icon fa fa-plus"></i>Añadir Persona</button>
				</div>
			</div>

			<div class="widget-body">

				<div id="tlista" class="widget-main padding-6">
					<sec:authentication property="principal.authorities"/>
					<table class="table table-striped table-bordered table-hover" id="flujoprocesos">
						<thead>
							<tr>
								<th class="hidden-480">ID</th>
								<th>Nombre Integrante </th>
								<th>Fecha de Nacimiento</th>
								<th>Fecha de Modificacion</th>
								<th>Estado 1</th>
								<th>Estado 2</th>
								<th>Opciones</th>
							</tr>
						</thead>
						<tbody id="contenido_tabla">
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</div>
<!--IMPLEMTAR UN MODAL CON BOTON PARA AGREGAR A LA BASE DE DATOS -->

<div class="modal fade" id="nuevo" aria-hidden="true">

</div>
<!-- /.<page-content -->

<jsp:include page="/comun/pie.html"/>

<script>

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
		$('#nuevo').on('shown.bs.modal', function (e) {
			$('#form').validator();
		});

		$("#btnew").click(function () {
			nuevoConfirmar();
		});

		jQuery.fn.resetear = function () {
			$(this).each(function () {
				this.reset();
			});
		};
		listar();
		ContenidoModal();
	});

	function abrirNuevo() {
			$("#guardar-btn").unbind("click");
			$("#guardar-btn").bind("click", function () {
				nuevoConfirmar();
			});
		$('#form').resetear();
		$("#nuevo").modal('show');
	}

	function nuevoConfirmar() {
		var data = $("form").serializeArray();
		data.push({name: 'id_persona', value: 1})
		$.ajax({
			type: "POST",
			url: 'personanuevo/nuevo.html',
			data: data,
			success: function (response) {
				console.log(response);
				Toast.fire({
					icon: 'success',
					title: 'Llamada realizada con exito'
				});
				$("#nuevo").modal('hide');
				listar();
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function abrirEditar(id){
		$("#guardar-btn").unbind("click");
		$("#guardar-btn").bind("click", function () {
			editar(id);
		});
		$('#form').resetear();
		$.ajax({
			type: "POST",
			url: 'personanuevo/getById.html?id=' + id,
			success: function (response) {
				$('#nombre').val(response.personas.nombre);
				$('#fecha_nacimiento').val(response.personas.fecha_nacimiento);
				$('#fecha_modificacion').val(response.personas.fecha_modificacion);
				if(response.personas.id_estado) $("#id_estado").prop("checked", true);
				else $("#id_estado").prop("checked", false);
				$('#estado').val(response.personas.estado);
				$("#nuevo").modal('show');
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}

	function editar(id) {
		var data = $("form").serializeArray();
		data.push({name: 'id_persona', value: id});
		console.log('editando');
		console.log(data);
		type: "POST",
		$.ajax({
			url: 'personanuevo/editar.html',
			data: data,
			success: function (response) {
				Toast.fire({
					icon: 'success',
					title: 'Edicion realizada con exito'
				});
				$("#nuevo").modal('hide');
				listar();
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function eliminar(id)
	{
		$.ajax({
			type: "POST",
			url: 'personanuevo/eliminar.html?id_persona=' + id,
			success: function (response) {
				listar();
				Toast.fire({
					icon: 'success',
					title: 'Registro eliminado con exito'
				});
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}

	function listar(){
		$("#contenido_tabla").empty();
		$.ajax({
			type: "POST",
			url: 'personanuevo/listar.html',
			success: function (response) {
				$("#contenido_tabla").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}

	function ContenidoModal(){
		$("#nuevo").empty();
		$.ajax({
			type: "POST",
			url: 'personanuevo/modal.html',
			success: function (response) {
				$("#nuevo").html(response);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
</script>