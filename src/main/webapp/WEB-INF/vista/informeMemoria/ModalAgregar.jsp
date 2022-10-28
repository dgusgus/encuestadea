<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--datos que tendra el modal-->
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
							<div class="">
								<span class="input-group-addon">Nombre</span>
								<input id="nombre" name="nombre"class="form-control" type="text"required />
								<span class="input-group-addon">Fecha de nacimiento</span>
								<input id="fecha_nacimiento" name="fecha_nacimiento_aux"class="form-control" type="date"required />
								<span class="input-group-addon">Fecha de modificacion</span>
								<input id="fecha_modificacion" name="fecha_modificacion_aux"class="form-control" type="date"required />
								<span class="input-group-addon">Estado</span>
								<input id="id_estado" name="id_estado"class="form-control" type="checkbox" />
								<span class="input-group-addon">Estado</span>
								<input id="estado" name="estado"class="form-control" type="text"required />
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