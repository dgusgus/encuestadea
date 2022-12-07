<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="">
	<form>
		<div class="row">
			<div class="col-sm-12">
				<!-- #section:elements.accordion -->
				<div id="accordion" class="accordion-style1 panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
									<i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Plan de trabajo
								</a>
							</h4>
						</div>

						<div class="panel-collapse collapse in" id="collapseOne">
							<div class="panel-body">
								<div class="col-xs-12">
									<h1>Avance materia</h1>
								<div>
									<div class="table-header">
										TEMAS AVANZADOS
									</div>
									<form id="frm_Admin_1">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
															<label class="pos-rel">
																Numero
															</label>
													</th>
													<th class="center">
															<label class="pos-rel">
																Actividad
															</label>
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Planificada
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
													</th>
													<th> Tipo
														<span class="label label-sm label-info">
															Tema
														</span>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${planilladetalle}" var="planilladetalle" varStatus="contador">
													<c:if test="${planilladetalle.id_tipo_actividad < 3}">
													<tr id="fila-planilla${planilladetalle.id_planilla_avance_detalle}">
														<td class="center hidden-480">${planilladetalle.id_planilla_avance_detalle}</td>
														<td class="right">${planilladetalle.actividad}</td>
														<td class="center">
															<span class="label label-default">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_planificacion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-warning">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_ejecucion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-sm info">${planilladetalle.nombre_tipo}</span>
														</td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</form>
									<hr>
									<div class="table-header">
										EXAMENES
									</div>
									<form id="frm_Admin_1">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
															<label class="pos-rel">
																Numero
															</label>
													</th>
													<th class="center">
															<label class="pos-rel">
																Actividad
															</label>
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Planificada
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
													</th>
													<th> Tipo
														<span class="label label-sm label-danger">
															Examen
														</span>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${planilladetalle}" var="planilladetalle" varStatus="contador">
													<c:if test="${planilladetalle.id_tipo_actividad == 4}">
													<tr id="fila-planilla${planilladetalle.id_planilla_avance_detalle}">
														<td class="center hidden-480">${planilladetalle.id_planilla_avance_detalle}</td>
														<td class="right">${planilladetalle.actividad}</td>
														<td class="center">
															<span class="label label-default">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_planificacion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-warning">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_ejecucion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-sm info">${planilladetalle.nombre_tipo}</span>
														</td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</form>
									<hr>
									<div class="table-header">
										PRACTICAS
									</div>
									<form id="frm_Admin_1">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
															<label class="pos-rel">
																Numero
															</label>
													</th>
													<th class="center">
															<label class="pos-rel">
																Actividad
															</label>
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Planificada
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
													</th>
													<th> Tipo
														<span class="label label-sm label-success">
															Practica
														</span>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${planilladetalle}" var="planilladetalle" varStatus="contador">
													<c:if test="${planilladetalle.id_tipo_actividad == 5}">
													<tr id="fila-planilla${planilladetalle.id_planilla_avance_detalle}">
														<td class="center hidden-480">${planilladetalle.id_planilla_avance_detalle}</td>
														<td class="right">${planilladetalle.actividad}</td>
														<td class="center">
															<span class="label label-default">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_planificacion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-warning">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_ejecucion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-sm info">${planilladetalle.nombre_tipo}</span>
														</td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</form>
									<hr>
									<div class="table-header">
										PROYECTOS
									</div>
									<form id="frm_Admin_1">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
															<label class="pos-rel">
																Numero
															</label>
													</th>
													<th class="center">
															<label class="pos-rel">
																Actividad
															</label>
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Planificada
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
													</th>
													<th> Tipo
														<span class="label label-sm label-pink">
															Proyecto
														</span>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${planilladetalle}" var="planilladetalle" varStatus="contador">
													<c:if test="${planilladetalle.id_tipo_actividad == 6}">
													<tr id="fila-planilla${planilladetalle.id_planilla_avance_detalle}">
														<td class="center hidden-480">${planilladetalle.id_planilla_avance_detalle}</td>
														<td class="right">${planilladetalle.actividad}</td>
														<td class="center">
															<span class="label label-default">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_planificacion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-warning">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_ejecucion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-sm info">${planilladetalle.nombre_tipo}</span>
														</td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</form>
									<hr>

									<hr>
									<div class="table-header">
										LABORATORIOS
									</div>
									<form id="frm_Admin_1">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
															<label class="pos-rel">
																Numero
															</label>
													</th>
													<th class="center">
															<label class="pos-rel">
																Actividad
															</label>
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Planificada
													</th>
													<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
													</th>
													<th> Tipo
														<span class="label label-sm label-warning">
															Laboratorio
														</span>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${planilladetalle}" var="planilladetalle" varStatus="contador">
													<c:if test="${planilladetalle.id_tipo_actividad == 35}">
													<tr id="fila-planilla${planilladetalle.id_planilla_avance_detalle}">
														<td class="center hidden-480">${planilladetalle.id_planilla_avance_detalle}</td>
														<td class="right">${planilladetalle.actividad}</td>
														<td class="center">
															<span class="label label-default">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_planificacion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-warning">
																<fmt:formatDate type = "date" dateStyle ="long" timeStyle ="long" value="${planilladetalle.fecha_ejecucion}"/>
															</span>
														</td>
														<td class="center">
															<span class="label label-sm info">${planilladetalle.nombre_tipo}</span>
														</td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</form>
								</div>
								<!--
								<hr>
								<div id='actividades_1'class="table-header">
									EXAMENES DE COMPETENCIA
								</div>
								<form id="frm_Admin_3">
									<table id="tabla_memoria" class="table table-striped table-bordered table-hover">
										<thead class="thead-dark" name='tabla_head'>
										</thead>
										<tbody id="body_competencia">
										</tbody>
									</table>
								</form>
								<hr>
								<div id='actividades_2' class="table-header">
									EXAMENES DE GRADO
								</div>
								<form id="frm_Admin_4">
									<table id="tabla_memoria" class="table table-striped table-bordered table-hover">
										<thead name='tabla_head'>
										</thead>
										<tbody id="body_exgrado">
										</tbody>
									</table>
								</form>
								<hr>
								<div id='actividades_3' class="table-header">
									TESIS (PROYECTO DE GRADO)
								</div>
								<form id="frm_Admin_4">
									<table id="tabla_memoria" class="table table-striped table-bordered table-hover">
										<thead name='tabla_head'>
										</thead>
										<tbody id="body_tesis">
										</tbody>
									</table>
								</form>
								<hr>
								comment -->


								<div id='actividades_0' class="table-header">
									EXAMENES DE COMPETENCIA
								</div>
								<div id='add_tabla_0'></div>

								<div id='actividades_1' class="table-header">
									EXAMENES DE GRADO
								</div>
								<div id='add_tabla_1'></div>

								<div id='actividades_2' class="table-header">
									TESIS (PROYECTO DE GRADO)
								</div>
								<div id='add_tabla_2'></div>

								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
									<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Asesoramiento
								</a>
							</h4>
						</div>
						<div class="panel-collapse collapse" id="collapseTwo">
							<div id='actividades_3' class="table-header">
								PROYECTO DE GRADO
							</div>
							<div id='add_tabla_3'></div>
							<div id='actividades_4' class="table-header">
								TESIS DE GRADO
							</div>
							<div id='add_tabla_4'></div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
									<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Tareas encomendadas por autoridades ejecutivas u órganos de gobierno
								</a>
							</h4>
						</div>
						<div class="panel-collapse collapse" id="collapseThree">

							<div id='actividades_5' class="table-header">
								TAREAS ENCOMENDADAS POR AUTORIDADES EJECUTIVAS
							</div>
							<div id='add_tabla_5'></div>


						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
									<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Docencia en programas de postgrado
								</a>
							</h4>
						</div>
						<div class="panel-collapse collapse" id="collapseFour">
							<div id='actividades_6' class="table-header">
								DOCENCIA EN PROGRAMA DE POSTGRADO
							</div>
							<div id='add_tabla_6'></div>

							<div id='actividades_7' class="table-header">
								TABLA DE MAS PARA PRUEBAS
							</div>
							<div id='add_tabla_7'></div>
						</div>
					</div>
				</div>
			</div><!-- /.col -->
		</div><!-- /.ROW -->
	</form>
</div>
<script>
	$(function () {
			listar();
			//AgregarNuevo();
	});

	function AgregarFila(variable) {
		console.log(variable);
		var fila  = '<tr id="variable">' +
						'<td></td>' +
						'<td class="center"><input name="nombre_actividad" type="text" class="form-control" ></td>' +
						'<td class="center"><input name="fecha_ini1" type="date"required class="form-control"></td>' +
						'<td>'+
							'<div class="hidden-sm hidden-xs btn-group">'+
								'<button class="btn btn-xs btn-success" onclick="GuardarNuevoDato('+variable+');">'+
									'<i class="ace-icon fa fa-check bigger-120"></i>'+
								'</button>'+
							'</div>'+
						'</td>' +
					'</tr>';
			//$('thead[name="tabla_head_'+variable+'"]').append(fila);
			$("#tabla_"+variable+" tbody").append(fila);
		/**
		$.ajax({
			success: function () {
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});**/
	};

	function Botones(variable) {
		let botones =
			'<div class="widget-toolbar">'+
				'<div class="btn-group" role="group">'+
					'<button type="button" class="btn_add btn btn-inverse" onclick="AgregarFila('+variable+');"><i class="fa fa-plus"></i> Añadir</button>'+
				'</div>'+
			'</div>';
			$("#actividades_"+variable).append(botones);
	};

	function crear_thead(variable) {
		let cabezera  =
						'<tr>'+
							'<th class="center">'+
								'<label class="pos-rel">Numero</label>'+
							'</th>'+
							'<th class="center">'+
								'<label class="pos-rel">Actividad</label>'+
							'</th>'+
							'<th class="center">'+
								'<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>Fecha'+
							'</th>'+
							'<th></th>'+
						'</tr>';
		$('thead[name="tabla_head_'+variable+'"]').append(cabezera);
	};
	function crear_tabla(variable) {
		let tabla  =
			'<form id="formulario_'+variable+'">'+
				'<table id="tabla_'+variable+'" class="table table-striped table-bordered table-hover">'+
					'<thead name="tabla_head_'+variable+'">'+
					'</thead>'+
					'<tbody id="tabla_body_'+variable+'">'+
					'</tbody>'+
				'</table>'+
			'</form>'+
			'<hr>';
		$('#add_tabla_'+variable).append(tabla);
	};
	function llenar_body(variable) {
		/**
		let tabla  =
			'<form id="formulario_'+variable+'">'+
				'<table id="tabla_'+variable+'" class="table table-striped table-bordered table-hover">'+
					'<thead name="tabla_head_'+variable+'">'+
					'</thead>'+
					'<tbody id="tabla_body_'+variable+'">'+
					'</tbody>'+
				'</table>'+
			'</form>'+
			'<hr>';
		$('#add_tabla_'+variable).append(tabla);**/
	};

		function listar(){
		$.ajax({
			type: "POST",
			url: 'informememoria/listar.html',
			success: function (response) {
				let i = 0;
				let tipo =  7;
				while (i < response.data.length) {
					Botones(i);
					crear_tabla(i);
					crear_thead(i);
					//console.log(i);
					let j = 0;
					let k = 1;
					while (	j < response.data.length) {
						if (tipo == response.data[j].id_tipo_actividad){
							let fecha = new Date(response.data[j].fecha_ini).toLocaleDateString('es');
							let cuerpo =
										'<tr id="fila_'+k+'">'+
											'<td class="center hidden-480">'+k+'</td>'+
											'<td class="right">'+response.data[j].nombre_actividad+'</td>'+

											'<td class="center"><span class="label label-default">'+fecha+'</span></td>'+
											'<td class="center">'+
												'<div class="btns_edit hidden-sm hidden-xs btn-group">'+
													'<button type="button" class="btn btn-xs btn-info" onclick="crearEditar('+response.data[j].id_actividad_docente+','+i+','+k+');">'+
														'<i class="ace-icon fa fa-pencil bigger-120"></i>'+
													'</button>'+
													'<button class="btn btn-xs btn-danger" onclick="eliminar();">'+
														'<i class="ace-icon fa fa-trash-o bigger-120"></i>'+
													'</button>'+
												'</div>'+
											'</td>'+
										'</tr>';
							$("#tabla_body_"+i).append(cuerpo);
							k++;
							//console.log("esto es j",j);
						}
					j++;}
				tipo++;
				i++;}
		},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}

	function GuardarNuevoDato(variable){
		//console.log("estamos en GuardarNuevoDato",variable);
		var data = $("#formulario_"+variable).serializeArray();
		data.push({name: 'id_tipo_actividad', value: variable + 7});
		//variable + 6 es una suma para llegar a tipi de dato ya que "i" inicia de 1 y id_tipo_actividad inicia de 7
		console.log(data);
		$.ajax({
		type: "POST",
		url: 'informememoria/nuevo.html',
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

	function crearEditar(id,i,k){
			$('.btns_edit').hide(); // para cultar los botones de agregar
			//$('.btns_a_d').css('display','none');
			$.ajax({
			type: "POST",
			url: 'informememoria/getById.html?id=' + id,
			success: function (response) {
			console.log(response);
			let datos = new Date(response.informevariable.fecha_ini);
			var filanueva ='<tr>'+
					'<td></td>'+
					'<td><input name="nombre_actividad" class="form-control" value="'+response.informevariable.nombre_actividad+'"></td>'+
					'<td><input name="fecha_ini1" type="date" class="form-control" value="' +response.informevariable.fecha_ini+ '"></td>'+
					'<td>'+
						'<div class="hidden-sm hidden-xs btn-group">'+
							'<button type="button" class="btn btn-xs btn-success" onclick="editarGuardar('+response.informevariable.id_actividad_docente+','+i+','+response.informevariable.id_tipo_actividad+');">'+
								'<i class="ace-icon fa fa-check bigger-120"></i>'+
							'</button>'+
							'<button  class="btn btn-xs btn-danger">'+
								'<i class="ace-icon fa  fa-ban bigger-120"></i>'+
							'</button>'+
						'</div>'+
					'</td>' +
					'</tr>';
			$('#tabla_'+i+' #fila_'+k+'').replaceWith(filanueva);
			},
			error: function () {
				Toast.fire({
					icon: 'error',
					title: 'Error'
				});
			}
		});
	}
	function editarGuardar(id,formulario,tipo) {
		var data = $("#formulario_"+formulario).serializeArray();
		data.push({name: 'id_actividad_docente', value: id});
		data.push({name: 'id_tipo_actividad', value: tipo});
		//console.log('editando');
		//console.log(data);
		type: "POST",
		$.ajax({
			url: 'informememoria/guardareditar.html',
			data: data,
			success: function (response) {
				//$('.btns_a_d').show();
				Toast.fire({
					icon: 'success',
					title: 'Edicion realizada con exito'
				});
				mostrarAdminstracion();
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

