<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="col-xs-12">
	<div id="contenedor-tabla">
		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">
					PLANILLA DE AVANCE DE ACTIVIDADES ACADEMICAS DEL DOCENTE
					<div class="widget-toolbar">
						<div class="col-sm-4">
							<button type="button" class="btn_add btn btn-inverse" onclick="AgregarNuevo();"><i class="fa fa-plus"></i> Añadir</button>
						</div>
					</div>
				</div>
				<form id="formulario1">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Id </th>
								<th>Fecha de Planficicacion</th>
								<th>Fecha de Ejecucion</th>
								<th>Activiades</th>
								<th>Observaciones</th>
								<th> Tipo </th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${actividades}" var="actividades" varStatus="contador">
								<tr id="fila-planilla${actividades.id_planilla_avance_detalle}">
									<td class="center hidden-480">${actividades.id_planilla_avance_detalle}</td>
									<td class="right"> <fmt:formatDate pattern="yyyy-MM-dd" value="${actividades.fecha_planificacion}"/></td>
									<td class="right"><fmt:formatDate pattern="yyyy-MM-dd" value="${actividades.fecha_ejecucion}"/></td>
									<td class="right">${actividades.actividad}</td>
									<td class="right">${actividades.observacion}</td>
									<td> <span class="label label-sm label-warning">${actividades.id_tipo_actividad}</span></td>
									<td>
										<div class="btns_a_d hidden-sm hidden-xs btn-group">
											<button type="button" class="btn btn-xs btn-info" onclick="abrirEditar(${actividades.id_planilla_avance_detalle});">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-danger" onclick="eliminar(${actividades.id_planilla_avance_detalle});">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div><!-- /.col -->
<!--
<div class="container-lg">
	<div class="table-responsive">
		<div class="table-wrapper">
			<form id="formulario">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Id Planilla de vance detalle</th>
						<th>Fecha de Planficicacion</th>
						<th>Fecha de Ejecucion</th>
						<th>Activiades</th>
						<th>Observaciones</th>
						<th>Estado</th>
						<th>Id usuario modificacion</th>
						<th>Fecha modificiacion </th>
						<th>Id tipo actividad</th>
						<th>Id planilla avance</th>
						<th></th>
					</tr>
				</thead>
				<tbody >
					<c:forEach items="${actividades}" var="actividades" varStatus="contador">
						<tr id="fila${actividades.id_planilla_avance_detalle}">
							<td class="center hidden-480">${actividades.id_planilla_avance_detalle}</td>
							<td class="right"> <fmt:formatDate pattern="yyyy-MM-dd" value="${actividades.fecha_planificacion}"/></td>
							<td class="right"><fmt:formatDate pattern="yyyy-MM-dd" value="${actividades.fecha_ejecucion}"/></td>
							<td class="right">${actividades.actividad}</td>
							<td class="right">${actividades.observacion}</td>
							<td class="right">${actividades.id_estado}</td>
							<td class="right">${actividades.id_usuario_mod}</td>
							<td class="right">${actividades.fecha_mod}</td>
							<td class="center">${actividades.id_tipo_actividad}</td>
							<td> <span class="label label-sm label-warning">${actividades.id_planilla_avance}</span></td>
							<td>
								<a id="add" class="add" title="Add" data-toggle="tooltip"><i class="ace-icon fa fa-trash-o bigger-120"></i></a>
								<a class="edit" title="Edit" data-toggle="tooltip"><i class="ace-icon fa fa-trash-o bigger-120" onclick="abrirEditar(${actividades.id_planilla_avance_detalle});"></i></a>
								<a class="delete" title="Delete" data-toggle="tooltip"><i class="ace-icon fa fa-trash-o bigger-120" onclick="eliminar(${actividades.id_planilla_avance_detalle});"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</div>
-->




<script>
	function AgregarNuevo() {
		var row3  = '<tr id="variable">' +
					'<td><input name="id_planilla_avance_detalle" type="text" class="form-control"></td>' +
					'<td><input name="fecha_planificacion1" type="date"required class="form-control"></td>' +
					'<td><input name="fecha_ejecucion1" type="date"required class="form-control"></td>' +
					'<td><input name="actividad" type="text" class="form-control" ></td>' +
					'<td><input name="observacion" type="text" class="form-control"></td>' +
					'<td><select name="id_tipo_actividad" id="number"><option value="1">Avance</option><option selected="selected" value="2">Practica</option><option value="3">Examen</option><option value="4">Proyecto</option><option value="5">Laboratorio</option></select></td>'+
					'<td>'+
						'<div class="hidden-sm hidden-xs btn-group">'+
							'<button class="btn btn-xs btn-success" onclick="guardarNuevo();">'+
								'<i class="ace-icon fa fa-check bigger-120"></i>'+
							'</button>'+
						'</div>'+
					'</td>' +
					'</tr>';
		$("#simple-table tbody").append(row3);
		$.ajax({
			success: function () {
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	/**var actions = $("table td:last-child").html();
	$(document).ready(function () {
		$('[data-toggle="tooltip"]').tooltip();
		// Append table with add row form on add new button click
		$(".add-new").click(function () {
			$(this).attr("disabled", "disabled");
			var index = $("table tbody tr:last-child").index();
			var row  = '<tr id="variable">' +
					'<td><input name="id_planilla_avance_detalle" type="text" class="form-control"></td>' +
					'<td><input name="fecha_planificacion1" type="date"required class="form-control"></td>' +
					'<td><input name="fecha_ejecucion1" type="date"required class="form-control"></td>' +
					'<td><input name="actividad" type="text" class="form-control" ></td>' +
					'<td><input name="observacion" type="text" class="form-control"></td>' +
					'<td><input name="id_estado" type="checkbox" class="form-control"></td>' +
					'<td><input name="id_usuario_mod" type="text" class="form-control"></td>' +
					'<td><input name="fecha_mod1" type="date"required class="form-control"></td>' +
					'<td><select name="id_tipo_actividad" id="number"><option value="1">Avance</option><option selected="selected" value="2">Practica</option><option value="3">Examen</option><option value="4">Proyecto</option><option value="5">Laboratorio</option></select></td>'+
					'<td><input name="id_planilla_avance" type="text" class="form-control"></td>' +
					'<td>' + actions + '</td>' +
					'</tr>';
			$("table").append(row);
			$("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
			$('[data-toggle="tooltip"]').tooltip();
		});
		// Add row on add button click (aañdoir datos a la tabla y actiualizar la misma)
		$(document).on("click", ".add", function () {
			guardarNuevo();
			var empty = false;
			var input = $(this).parents("tr").find('input');
			input.each(function () {
				if (!$(this).val()) {
					$(this).addClass("error");
					empty = true;
				} else {
					$(this).removeClass("error");
				}
			});
			$(this).parents("tr").find(".error").first().focus();
			if (!empty) {

				input.each(function () {
					$(this).parent("td").html($(this).val());
				});
				$(this).parents("tr").find(".add, .edit").toggle();
				$(".add-new").removeAttr("disabled");
			}
		});
		// Edit row on edit button click (Editar los datos de la tabla)
		$(document).on("click", ".edit", function () {
			//$(this).parents("tr").find(".add, .edit").toggle();
			//$(".add-new").attr("disabled", "disabled");
		});
		// Delete row on delete button click
		$(document).on("click", ".delete", function () {
			//$(this).parents("tr").remove();
			$(".add-new").removeAttr("disabled");
		});
	});**/
	function abrirEditar(id){
			$('.btns_a_d').hide();
			//$('.btns_a_d').css('display','none');
			$.ajax({
			type: "POST",
			url: 'planillaavance/getById.html?id=' + id,
			success: function (response) {
			//console.log(response.planillaAD.id_planilla_avance_detalle);
			console.log(response);
			var row2 ='<tr>'+
					'<td><input name="id_planilla_avance_detalle" type="number" class="form-control" value="' +response.planillaAD.id_planilla_avance_detalle + '"></td>'+
					'<td><input name="fecha_planificacion1" type="date" class="form-control" value="' +response.planillaAD.fecha_planificacion + '"></td>'+
					'<td><input name="fecha_ejecucion1" type="date" class="form-control" value="' +response.planillaAD.fecha_ejecucion + '"></td>'+
					'<td><input name="actividad" class="form-control" value="' +response.planillaAD.actividad + '"></td>'+
					'<td><input name="observacion" type="text" class="form-control" value="' +response.planillaAD.observacion + '"></td>';
			if (response.planillaAD.id_estado === true) {row2 = row2 + '<td><input name="id_estado" type="checkbox" class="form-control" checked></td>'}
			else{row2 = row2 + '<td><input name="id_estado" type="checkbox" class="form-control"</td>'};
					row2 = row2 + '<td><select name="id_tipo_actividad" id="number"><option value="1">Avance</option><option selected="selected" value="2">Practica</option><option value="3">Examen</option><option value="4">Proyecto</option><option value="5">Laboratorio</option></select></td>'+
					'<td>'+
						'<div class="hidden-sm hidden-xs btn-group">'+
							'<button type="button" class="btn btn-xs btn-success" onclick="editarGuardar(' +response.planillaAD.id_planilla_avance_detalle + ');">'+
								'<i class="ace-icon fa fa-check bigger-120"></i>'+
							'</button>'+
							'<button  class="btn btn-xs btn-danger">'+
								'<i class="ace-icon fa  fa-ban bigger-120"></i>'+
							'</button>'+
						'</div>'+
					'</td>' +
					'</tr>';
			$("#fila-planilla"+id).replaceWith(row2);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	
	function editarGuardar(id) {
		var data = $("#formulario1").serializeArray();
		data.push({name: 'id_planilla_avance_detalle', value: id});
		console.log('editando');
		console.log(data);
		type: "POST",
		$.ajax({
			url: 'planillaavance/editar.html',
			data: data,
			success: function (response) {
				$('.btns_a_d').show();
				Toast.fire({
					icon: 'success',
					title: 'Edicion realizada con exito'
				});
				mostrarTablaAvance();
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function guardarNuevo(){
		var data = $("#formulario1").serializeArray();
		console.log(data);
		$.ajax({
		type: "POST",
		url: 'planillaavance/nuevo.html',
		data: data,
		success: function (response) {
			console.log(response);
			Toast.fire({
			icon: 'success',
			title: 'Llamada realizada con exito'
			});
			//mostrarTablaAvance();
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
			url: 'planillaavance/eliminar.html?Id_planilla_avance_detalle=' + id,
			success: function (response) {
				Toast.fire({
					icon: 'success',
					title: 'Registro eliminado con exito'
				});
				mostrarTablaAvance();
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