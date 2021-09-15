<%--

	Document   : index
	Created on : Nov 22, 2016, 5:11:01 pM
	Author	 : raul velasquez
--%>

<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>

<fmt:setLocale value="es_BO" scope="session"/>

<jsp:include page="/comun/cabecera.html"/>

<div class="page-content">
	<div class="page-header">
		<h1>
			Comisión a imprimir

			<small class="hidden-xs">
				<i class="ace-icon fa fa-angle-double-right"></i>
				para su usuario.
			</small>
		</h1>
	</div>

	<div class="row">

		<div class="col-sm-12 widget-container-col ui-sortable">
			<div class="widget-box ui-sortable-handle">
				<div class="widget-header widget-header-small">
					<h4 class="widget-title">Listado de Integrantes</h4>
					<div class="widget-toolbar">
						<a class="orange2" data-action="fullscreen" href="#"><i class="ace-icon fa fa-expand"></i></a>
						<a data-action="collapse" href="#"><i class="ace-icon fa fa-chevron-up"></i></a>
					</div>
					<div class="widget-toolbar">

						<button  id="btnew" class="btn btn-minier btn-primary btn-round"><i class="ace-icon fa fa-plus"></i>Añadir Integrante</button>

					</div>
				</div>

				<div class="widget-body">
					<dl id="dt-list-1" class="dl-horizontal">
						<dt>Usuario</dt>
						<dd>${apodo}</dd>

					</dl>
					<div id="tlista" class="widget-main padding-6">
						<table class="table table-striped table-bordered table-hover" id="flujoprocesos">
							<thead>
								<tr>
									<th class="hidden-480">Nro.</th>
									<th>Nombre Integrante </th>
									<th>Opciones</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${integrantes}" var="integrante" varStatus="contador">
									<tr>
										<td id="titulo" class="center hidden-480">${contador.count}</td>
										<td id="nombre" class="right">${integrante.nombre}</td>
										<td id="opciones" class="center">
											<div class="inline pos-rel">

												<button data-position="auto" class="btn btn-xs btn-primary " onclick="editar(${integrante.id_integrante_comision});">
													<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Modificar</span>
												</button>
												<button data-position="auto" class="btn btn-xs btn-danger " onclick="eliminar(${integrante.id_integrante_comision});">
													<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Eliminar</span>
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

</div><!-- /.page-content -->

<div class="modal fade" id="nuevo" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Nuevo Integrante</h4>
			</div>
			<div class="modal-body">
				<form id="form" class="form-horizontal">
					<!-- Text input-->
					<h3>Datos del Nuevo Integrante de la comisión</h3>

					<div class="row">
						<div class="col-sm-12">
							<div class="form-group has-feedback">

								<label class="control-label" for="nombre">Nombre y título del Integrante</label>
								<div class="input-group">
									<span class="input-group-addon">Nombre</span>
									<input id="nombre" name="nombre"
										   class="form-control" type="text"

										   required>
								</div>

								<span class="glyphicon form-control-feedback"
									  aria-hidden="true"></span>
								<div class="help-block with-errors"></div>

							</div>
						</div>

					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button id="guardar-btn" type="button" class="btn btn-primary">Guardar</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>

</div>

<div class="modal fade" id="confirmar" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">¿Borrar?</h4>
			</div>
			<div class="modal-body">
				¿Está seguro de Borrar al Integrante de la Comisión?

			</div>
			<div class="modal-footer">
				<button id="confirmar-eliminar-btn" type="button" class="btn btn-primary" >Si</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	<c:set var="script">
	var idFp;
	var datos;

	$(function () {
		$('#nuevo').on('shown.bs.modal', function (e) {
			$('#form').validator();

		});

		$("#btnew").click(function () {
			nuevo();
		});

		jQuery.fn.resetear = function () {
			$(this).each(function () {
				this.reset();
			});
		};

	});

	function nuevo() {

		$('#form').resetear();
		$('#nuevo').modal('show');
		$("#guardar-btn").unbind("click");
		$("#guardar-btn").bind("click", function () {
			guardar_nuevo();
		});
	}

	function guardar_nuevo() {
		$('#form').validator('validate');

		if (!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();

			$.ajax({
				type: "POST",
				url: 'comision/guardar.html',
				data: datos,
				success: function (response) {
					$('#nuevo').modal('hide');
					location.reload();
				}
			});
		} else {
			$('.has-error input').val('');
		}
	}

	function editar(id) {
		$.ajax({
			type: "POST",
			url: 'comision/buscar.html?id_integrante_comision=' + id,

			success: function (response) {

				$('#form').resetear();
				populate_form(response);
				$('#nuevo').modal('show');
				$('#form').validator('validate');
				$("#guardar-btn").unbind("click");
				$("#guardar-btn").bind("click", function () {
					guardar_editar(id);
				});
			},
			error: function () {
				alert('Ocurrio un error inesperado');
			}
		});
	}

	function guardar_editar(id) {
		$('#form').validator('validate');

		if (!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();
			datos.push({name: 'id_integrante_comision', value: id});

			$.ajax({
				type: "POST",
				url: 'comision/modificar.html',
				data: datos,
				success: function (response) {
					$('#nuevo').modal('hide');
					location.reload();
				}
			});
		} else {
			$('.has-error input').val('');
		}
	}

	function eliminar(id) {

		$('#confirmar').modal('show');
		$("#confirmar-eliminar-btn").unbind("click");
		$("#confirmar-eliminar-btn").bind("click", function () {
			guardar_eliminar(id);
		});
	}

	function guardar_eliminar(id) {
		$.ajax({
			type: "POST",
			url: 'comision/eliminar.html?id_integrante_comision=' + id,

			success: function (response) {
				$('#confirmar').modal('hide');
				location.reload();
			},
			error: function () {
				alert('Ocurrio un error inesperado');
			}
		});
	}

	function populate_form(datos) {
		//console.log(datos[0]);
		$.each(datos, function (name, val) {
			var $el = $('[name="' + name + '"]'),
					type = $el.attr('type');

			switch (type) {
				case 'checkbox':
					$el.attr('checked', 'checked');
					break;
				case 'radio':
					$el.filter('[value="' + val + '"]').attr('checked', 'checked');
					break;
				default:
					$el.val(val);
			}
		});
	}
	</c:set>
	<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
</script>

<jsp:include page="/comun/pie.html"/>