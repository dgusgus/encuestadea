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
						<div class="btn-group" role="group">
							<button type="button" class="btn_add btn btn-inverse" onclick="actualizar();"><i class="fa fa-plus"></i> Actualizar</button>
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
								<th> Tipo
									<span class="label label-sm label-info">
										Tema
									</span>
									<span class="label label-sm label-info">
										Subtema
									</span>
									</br>
									<span class="label label-sm label-danger">
										Examen
									</span>
									<span class="label label-sm label-pink">
										Proyecto
									</span>
									</br>
									<span class="label label-sm label-warning">
										Laboratorio
									</span>
									<span class="label label-sm label-success">
										Practica
									</span>
								</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${actividades}" var="actividades" varStatus="contador">
								<tr id="fila-planilla${actividades.id_planilla_avance_detalle}">
									<td class="center hidden-480">${actividades.id_planilla_avance_detalle}</td>
									<td class="center">
										<span class="label label-default">
											<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${actividades.fecha_planificacion}"/>
										</span>
									</td>
									<td class="center">
										<span class="label label-warning">
										<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${actividades.fecha_ejecucion}"/>
										</span>
									</td>
									<td class="right">${actividades.actividad}</td>
									<td class="right">${actividades.observacion}</td>
									<!-- <td>TipoActividad(${actividades.id_tipo_actividad}) </td>-->
									<td>
										<span class="label label-sm tipo-${actividades.id_tipo_actividad}">${actividades.nombre_tipo}</span>
									</td>
									<!-- TipoActividad(${actividades.id_tipo_actividad}) -->
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

<script>

	function AgregarNuevo() {
		var row3  = '<tr id="variable">' +
						'<td></td>' +
						'<td><input name="fecha_planificacion1" type="date"required class="form-control"></td>' +
						'<td><input name="fecha_ejecucion1" type="date"required class="form-control"></td>' +
						'<td><input name="actividad" type="text" class="form-control" ></td>' +
						'<td><input name="observacion" type="text" class="form-control"></td>' +
						'<td><select name="id_tipo_actividad" id="number">'+
								'<option selected="selected" value="4">Examen</option>'+
								'<option value="5">Practica</option>'+
								'<option value="6">Proyecto</option>'+
								'<option value="35">Laboratorio</option>'+
							'</select></td>'+
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
					'<td>' +response.planillaAD.id_planilla_avance_detalle + '</td>'+
					'<td><input name="fecha_planificacion1" type="date" class="form-control" value="' +response.planillaAD.fecha_planificacion + '"></td>'+
					'<td><input name="fecha_ejecucion1" type="date" class="form-control" value="' +response.planillaAD.fecha_ejecucion + '"></td>'+
					'<td><input name="actividad" class="form-control" value="' +response.planillaAD.actividad + '"></td>'+
					'<td><input name="observacion"  class="form-control" value="' +response.planillaAD.observacion + '"></td>';
			if (response.planillaAD.id_tipo_actividad <= 2) {row2 = row2 + '<td><select name="id_tipo_actividad">'+
							'<option selected="selected" value="' +response.planillaAD.id_tipo_actividad+ '">Temario</option>'+
						'</select></td>'+
					'</td>'}
			else{row2 = row2 + '<td><select name="id_tipo_actividad" id="number"><option selected="selected" value="4">Examen</option><option value="5">Practica</option><option value="6">Proyecto</option><option value="35">Laboratorio</option></select></td>'};
				row2 = row2 + '<td>'+
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

	function actualizar()
	{
		$.ajax({
			type: "POST",
			url: 'planillaavance/actualizar.html',
			success: function (response) {
				Toast.fire({
					icon: 'success',
					title: 'Registro Actualizado con exito'
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
	.tipo-1, .tipo-2 {
		background-color: #3a87ad;
	}
	.tipo-4 {
		background-color: #d15b47;
	}
	.tipo-5 {
		background-color: #d6487e;
	}
	.tipo-6 {
		background-color: #f89406;
	}
	.tipo-35 {
		background-color: #82af6f;
	}
</style>