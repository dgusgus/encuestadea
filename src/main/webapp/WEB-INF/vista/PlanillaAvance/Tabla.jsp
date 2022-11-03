<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
							<td class="center">${actividades.id_planilla_avance}</td>
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

<script>
	var actions = $("table td:last-child").html();
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
					'<td><input name="id_tipo_actividad" type="text" class="form-control"></td>' +
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
	});
	function abrirEditar(id){
			$.ajax({
			type: "POST",
			url: 'planillaavance/getById.html?id=' + id,
			success: function (response) {
			console.log(response.planillaAD.id_planilla_avance_detalle);
			//$("#fila"+id).parents("tr").find("td:not(:last-child)").replaceWith('1');
			//("#fila"+id).closest('tr').remove();
			console.log('hola');
			var row2 ='<tr>'+
					'<td><input name="hola" type="number" class="form-control" value="' +response.planillaAD.id_planilla_avance_detalle + '"></td>'+
					'<td><input name="fecha_planificacion1" type="date" class="form-control" value="' +response.planillaAD.fecha_planificacion + '"></td>'+
					'<td><input name="fecha_ejecucion1" class="form-control" value="' +response.planillaAD.fecha_ejecucion + '"></td>'+
					'<td><input name="actividad" class="form-control" value="' +response.planillaAD.actividad + '"></td>'+
					'<td><input name="observacion" type="text" class="form-control" value="' +response.planillaAD.observacion + '"></td>'+
					'<td><input name="id_estado" type="text" class="form-control" value="' +response.planillaAD.id_estado + '" checked></td>'+
					'<td><input name="id_usuario_mod" type="number" class="form-control" value="' +response.planillaAD.id_usuario_mod + '"></td>'+
					'<td><input name="fecha_mod1" type="date" class="form-control" value="' +response.planillaAD.fecha_mod + '"></td>'+
					'<td><input name="id_tipo_actividad" type="number" class="form-control" value="' +response.planillaAD.id_tipo_actividad + '"></td>'+
					'<td><input name="id_planilla_avance" type="number" class="form-control" value="' +response.planillaAD.id_planilla_avance + '"></td>'+
					'<td><a id="addedit" class="añadir" title="Add" data-toggle="tooltip"><i class="ace-icon fa fa-trash-o bigger-120" onclick="editarGuardar('+response.planillaAD.id_planilla_avance_detalle+');"></i></a></td>'+
					'</tr>';
			$("#fila"+id).replaceWith(row2);
			},
			/**
			 * if(response.planillaAD.id_estado) row2 = row2 +'<td><input name="id_estado" type="checkbox" class="form-control" value="' +response.planillaAD.id_estado + '" checked></td>'+;
					else row2 = row2 +'<td><input name="id_estado" type="checkbox" class="form-control" value="' +response.planillaAD.id_estado + '"></td>'+;
					row2 = row2 +
			 * **/
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function editarGuardar(id) {
		var data = $("#formulario").serializeArray();
		data.push({name: 'id_planilla_avance_detalle', value: id});
		console.log('editando');
		console.log(data);
		type: "POST",
		$.ajax({
			url: 'planillaavance/editar.html',
			data: data,
			success: function (response) {
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
		var data = $("#formulario").serializeArray();
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
<style>

	table.table th i {
		font-size: 13px;
		margin: 0 5px;
		cursor: pointer;
	}

	table.table td a {
		cursor: pointer;
		display: inline-block;
		margin: 0 5px;
		min-width: 24px;
	}
	table.table td a.add {
		color: #27C46B;
	}
	table.table td a.edit {
		color: #FFC107;
	}
	table.table td a.delete {
		color: #E34724;
	}
	table.table td i {
		font-size: 19px;
	}
	table.table td a.add i {
		font-size: 24px;
		margin-right: -1px;
		position: relative;
		top: 3px;
	}
	table.table .form-control {
		height: 32px;
		line-height: 32px;
		box-shadow: none;
		border-radius: 2px;
	}
	table.table td .add {
		display: none;
	}
</style>