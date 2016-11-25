<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/comun/cabecera.html"/>
<div class="col-xs-6">
	<h1>Bienvenido...</h1>
	
	<table class="table table-striped table-bordered table-hover" id="flujoProcesos">
		<thead>
			<tr>
				<th class="hidden-480">Título</th>
				<th>Nombre</th>
				<th>Sigla</th>
				<th>Paralelo</th>
				<th>Titularía</th>
				<th>Opciones</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${docentes}" var="docente" varStatus="contador">
			<tr>
				<td id="titulo" class="center hidden-480">${docente.titulo}</td>
				<td id="nombre" class="right">${docente.nombre}</td>
				<td id="sigla" class="left">${docente.sigla}</td>
				<td id="paralelo" class="center">${docente.grupo}</td>
				<td id="paralelo" class="center">${docente.titularia}</td>
				<td id="opciones" class="center">
					<div class="inline pos-rel">
						<a data-position="auto" class="btn btn-xs btn-primary " href="encuesta/index.html?id_materia=${docente.id_materia}&id_grupo=${docente.id_grupo}&id_gestion=${docente.id_gestion}&id_docente=${docente.id_docente}">
							<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Encuestas</span>
						</a>
						
					</div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<a href="#" onclick="nuevo();" class="glyphicon glyphicon-plus"
		data-toggle="modal" style="font-size: 15px; padding-bottom: 10px;">Nuevo</a>
		
	<div class="modal fade" id="nuevo" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Nuevo Empleado</h4>
				</div>
				<div class="modal-body">
					<form id="form" class="form-horizontal" data-toggle="validator"
						role="form">
						<fieldset>

							<!-- Text input-->
							<div class="form-group has-feedback">
								<label class="col-md-4 control-label" for="nombres">Nombres</label>
								<div class="input-group col-md-7">
									<input id="nombres" name="nombres"
										placeholder="Nombre del Empleado"
										class="form-control input-md" type="text"
										pattern="^[A-z\s]{1,}$" required
										data-error="Campo Obligatorio solo letras y espacios"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group has-feedback">
								<label class="col-md-4 control-label" for="nombres">Apellidos</label>
								<div class="input-group col-md-7">
									<input id="apellidos" name="apellidos"
										placeholder="Apellidos del Empleado"
										class="form-control input-md" type="text"
										pattern="^[A-z\s]{1,}$" required
										data-error="Campo Obligatorio solo letras y espacios"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group has-feedback">
								<label class="col-md-4 control-label" for="nombres">CI</label>
								<div class="input-group col-md-7">
									<input id="ci" name="ci" placeholder="CI del Empleado"
										class="form-control input-md" type="text"
										pattern="^[_A-Z0-9\-]{1,}$" required
										data-error="Campo Obligatorio solo números y letras mayúsculas y guión">
									<span class="glyphicon form-control-feedback"
										aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group has-feedback">
								<label class="col-md-4 control-label" for="nombres">Dirección</label>
								<div class="input-group col-md-7">
									<input id="direccion" name="direccion"
										placeholder="Dirección del Empleado"
										class="form-control input-md" type="text"
										pattern="^[A-z0-9\s]{1,}$" required
										data-error="Campo Obligatorio solo números y letras y guión">
									<span class="glyphicon form-control-feedback"
										aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group has-feedback">
								<label class="col-md-4 control-label" for="nombres">Teléfonos</label>
								<div class="input-group col-md-7">
									<input id="telefonos" name="telefonos"
										placeholder="Teléfonos del Empleado"
										class="form-control input-md" type="text"
										pattern="^[0-9\-\(\)]{1,}$" required
										data-error="Campo Obligatorio solo números y guiónes y parentésis">
									<span class="glyphicon form-control-feedback"
										aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group has-feedback">
								<label class="col-md-4 control-label" for="nombres">Email</label>
								<div class="input-group col-md-7">
									<input id="email" name="email" placeholder="Email del Empleado"
										class="form-control input-md" type="email" required
										data-error="Campo Obligatorio debe ser un email válido"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="cargo">Cargo</label>
								<div class="col-md-7">
									<input id="cargo" name="cargo" placeholder="Cargo"
										class="form-control input-md" type="text"
										pattern="^[a-zA-Z\s]{1,}$" required
										data-error="Campo Obligatorio debe ser texto"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>

								</div>
							</div>							
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button id="guardar-btn" type="button" class="btn btn-primary">Guardar</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.col -->
<sec:authorize access="isAuthenticated()">
<script type="text/javascript">
	$(function(){
		
		$.ajax({url:"comun/roles.html",type:"POST"
			,success:function(html){
				html = html.replace(/\s{2,}/g, " ");
				$("#x-roles").html(html);
				$.cookie("${apodo}.roles", html, {path:"<%= session.getAttribute("__direccion").toString() %>", expires:30});
				eventMenusRol();
			}
			,error: function(xhr, error){
			}
		});
		
		$('#nuevo').on('shown.bs.modal', function (e) { $('#form').validator() });
	});
	
	function nuevo(){	;
	$('#nuevo').appendTo("body").modal('show');
	$( "#guardar-btn").unbind( "click" );	
}
</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>