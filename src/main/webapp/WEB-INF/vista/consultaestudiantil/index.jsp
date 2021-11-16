<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/comun/cabecera.html"/>
<div class="col-xs-12">
	<h2>Lista de Consultas Estudiantiles</h2>

	<div id="contenedor-tabla">
		<div class="row">
			<div class="col-xs-12">
				<h3 class="header smaller lighter blue">Encuestas Administración</h3>

				<div class="clearfix">
					<div class="pull-right tableTools-container"></div>
				</div>
				<a class="button btn btn-primary" href="principal/nuevo.html"><i class="ace-icon glyphicon glyphicon-plus"></i>Nueva Consulta Estudiantil</a>
				<hr />
				<div class="table-header">
					Consultas Estudiantiles
				</div>

				<!-- div.table-responsive -->

				<!-- div.dataTables_borderWrap -->
				<div>
					<table id="tabla" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>
									<b class="text-success">
									<span class="label label-sm label-gray">
										id
									</span>
										Docente
									</b>
									<br>
										Materia
									<span class="label label-sm label-info">
										sigla
									</span>
									<span class="label label-sm label-success">
										paralelo
									</span>
										<span class="label label-sm label-warning">
										gestión
									</span>
									</span>
										<span class="label label-sm label-danger">
										laboratorio
									</span>
								</th>
								<th>Estado</th>
								<th>Opciones</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.col -->
<!-- /.INICIO MODAL -->
<div id="modal-form" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Please fill the following form fields</h4>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="widget-box">
						<div class="widget-header widget-header-small">
							<h5 class="widget-title lighter">Criterios de búsqueda</h5>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								<form class="form-search" action="principal/buscar.html">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="ace-icon fa fa-check"></i>
												</span>

												<input type="text" class="form-control search-query" placeholder="criterio de búsqueda" name="busqueda"
													<c:if test="${not empty busqueda}">
														value="${busqueda}"
													</c:if>
												/>
												<span class="input-group-btn">
													<button type="submit button" class="btn btn-info btn-sm">
														<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
														Buscar
													</button>
												</span>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12">
						<div class="form-group">
							<table class="table table-striped table-bordered table-hover" id="flujoProcesos">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Facultad</th>
										<th>Sigla</th>
										<th>Nombre Materia</th>
										<th>Paralelo</th>
										<th>Gestión</th>
										<th>Titularía</th>
										<th>Opciones</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${docentes}" var="docente" varStatus="contador">
										<tr>
											<td id="nombre" class="right">${docente.nombre}</td>
											<td id="facultad" class="right">${docente.facultad_materia}</td>
											<td id="sigla" class="left">${docente.sigla}</td>
											<td id="nombreMateria" class="right">${docente.nombreMateria}</td>
											<td id="paralelo" class="center">${docente.grupo}</td>
											<td id="gestion" class="center">${docente.gestion}</td>
											<td id="titularia" class="center">${docente.titularia}</td>
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
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-sm" data-dismiss="modal">
					<i class="ace-icon fa fa-times"></i>
					Cancel
				</button>

				<button class="btn btn-sm btn-primary">
					<i class="ace-icon fa fa-check"></i>
					Save
				</button>
			</div>
		</div>
	</div>
</div>
<!-- /.FINAL MODAL -->

<!-- /.INICIO MODAL -->
<div id="modal-enlace" class="modal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">Enlace para entrar a la encuesta</h4>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="widget-box">
						<div class="widget-header widget-header-small">
							<h5 class="widget-title lighter">Enlace</h5>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								<div class="row">
									<div class="col-xs-12 col-sm-12">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="ace-icon fa fa-copy"></i>
											</span>

											<input id="enlace" type="text" class="form-control search-query" placeholder="enlace" name="enlace" readonly/>
											<span class="input-group-btn">
												<button type="submit button" class="btn btn-info btn-sm" onclick="copiarEnlace()">
													<span class="ace-icon fa fa-copy icon-on-right bigger-110"></span>
													Copiar Enlace
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-sm" data-dismiss="modal">
					<i class="ace-icon fa fa-times"></i>
					Cerrar
				</button>
			</div>
		</div>
	</div>
</div>
<!-- /.FINAL MODAL -->
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		var oTable1;

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
			//initiate dataTables plugin
			listar();

			$('#modal-form').on('shown.bs.modal', function () {
				$('.chosen-select', this).chosen('destroy').chosen();
			});
		});

		function formatoEstado(estado){
			switch(estado) {
				case 'N':
					return '<span class="label label-sm label-info arrowed arrowed-righ">NUEVO</span>';
					break;
				case 'A':
					return '<span class="label label-sm label-success">ABIERTO</span>';
					break;
				case 'C':
					return '<span class="label label-sm label-warning">CERRADO</span>';
					break;
				default:
					return '<span class="label label-sm label-inverse arrowed-in">ESTADO INCORRECTO</span>';
			}
		}

		function formatoOpcion(estado, id, id_materia, id_grupo, id_gestion, id_docente){
			switch(estado) {
				case 'N':
					return '<button onclick="abrir('+id+')" class="btn btn-xs btn-info">'
							+'<i class="ace-icon fa fa-check bigger-120"></i>Abrir Encuesta</button> '
							+'<button onclick="confirmar_borrar('+id+')" class="btn btn-xs btn-danger">'
							+'<i class="ace-icon fa fa-check bigger-120"></i>Borrar</button>'
					;
					break;
				case 'A':
					return '<button onclick="obtenerEnlace('+id+')" class="btn btn-xs btn-success">'
							+'<i class="ace-icon fa fa-check bigger-120"></i>Obtener Enlace Encuesta'
							+'</button> '
							+'<button onclick="cerrar('+id+')" class="btn btn-xs btn-warning">'
							+'<i class="ace-icon fa fa-check bigger-120"></i>Cerrar</button>'
							+' <button onclick="verencuestas('+id_materia+',' +id_grupo+',' +id_gestion+',' +id_docente+',' +id+')" class="btn btn-xs btn-info">'
							+'<i class="ace-icon fa fa-check bigger-120"></i>Encuestas</button>'
					;
					break;
				case 'C':
					return '<button onclick="abrir('+id+')" class="btn btn-xs btn-info">'
							+'<i class="ace-icon fa fa-check bigger-120"></i>Abrir Encuesta</button> '
							+' <button onclick="verencuestas('+id_materia+',' +id_grupo+',' +id_gestion+',' +id_docente+',' +id+')" class="btn btn-xs btn-info">'
							+'<i class="ace-icon fa fa-check bigger-120"></i>Encuestas</button>'
					;
					break;
				default:
					return '';
			}
		}

		function listar(){
			oTable1 =
			$('#tabla')
			.dataTable({
				ajax: {
					url: 'consultaestudiantil/listarByIdUsuario.html',
					method: "GET",
					xhrFields: {
						withCredentials: true
					}
				},
				columns:[
					{
						data:"nombre_docente",
						render: function(data, type, row){
							return '<b class="text-success">'
								+'</span> '+'<span class="label label-sm label-gray">'
									+row.id_consulta_estudiantil
								+'</span> '
									+row.nombre_docente
								+'</b><br> '
									+row.nombre_materia
								+' <span class="label label-sm label-info">'
									+row.sigla_materia
								+'</span> '
								+'<span class="label label-sm label-success">'
									+row.paralelo
								+'</span> '
								+'<span class="label label-sm label-warning">'
									+row.gestion
								+'</span> '
								+(row.sigla_paralelo_teoria?('<span class="label label-sm label-danger">'+row.sigla_paralelo_teoria+'</span> '):'')
							;
						}
					},
					{
						data:"estado",
						render: function(data, type, row){
							return formatoEstado(row.estado);
						},
					},
					{
						data:"id_consulta_estudiantil",
						orderable: false,
						render: function(data, type, row){
							return formatoOpcion(row.estado, row.id_consulta_estudiantil, row.id_materia, row.id_grupo, row.id_gestion, row.id_docente);
						}
					}
				],
				destroy:true,
				bAutoWidth: false,
				"aaSorting": [],
				"language": {
					"url": "assets/js/dataTables/Spanish.json"
				},
			});
		}

		function recargar(){
			oTable1.api().ajax.reload(null,false);
		}

		function abrir(id){
			console.log("abriendo consulta: ",id);
			$.ajax({
				url:'consultaestudiantil/abrir.html',
				data: {id_consulta_estudiantil:id},
				method: "GET",
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function (response) {
					console.log(response);
					recargar();
					Toast.fire({
						icon: 'success',
						title: 'Consulta Estudiantil Abierta'
					});
				}
			});
		}

		function cerrar(id){
			console.log("cerrando consulta: ",id);
			$.ajax({
				url:'consultaestudiantil/cerrar.html',
				data: {id_consulta_estudiantil:id},
				method: "GET",
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function (response) {
					console.log(response);
					Toast.fire({
						icon: 'success',
						title: 'Consulta Estudiantil Cerrada'
					});
					recargar();
				}
			});
		}

		function confirmar_borrar(id){
			Swal.fire({
				title: '¿Está seguro de borrar el elemento?',
				text: "El dato será borrado!",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Si, borrar',
				cancelButtonText: 'Cancelar'
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url:'consultaestudiantil/eliminar.html',
						data: {id_consulta_estudiantil:id},
						method: "GET",
						dataType: "json",
						contentType: "application/json; charset=utf-8",
						success: function (response) {
							console.log(response);
							Swal.fire(
								'Elemento Borrado',
								'El elemento '+id+' ha sido borrado',
								'success'
							);
							Toast.fire({
								icon: 'success',
								title: 'Consulta Estudiantil Borrada'
							});
							recargar();
						}
					});
				}
			})
		}

		function ventanaNuevo(){
			console.log('Nuevo');
			$('#modal-form').modal('show');
		}

		function obtenerEnlace(id){
			$('#enlace').val(window.location.origin+'/encuestadea/seguridad/loginestudiante.html?consulta='+btoa(id));
			$('#modal-enlace').modal('show');
		}

		function copiarEnlace(){
			$('#enlace').select();
			document.execCommand("copy");
			Swal.fire(
				'Enlace Copiado',
				'El enlace fue copiado al porta papeles puedes pegarlo con Ctrl + V',
				'success'
			);
		}

		function verencuestas(id_materia, id_grupo, id_gestion, id_docente, id_consulta_estudiantil){
			window.location.replace(window.location.origin+'/encuestadea/encuesta/index.html?id_materia='+id_materia+'&id_grupo='+id_grupo+'&id_gestion='+id_gestion+'&id_docente='+id_docente+'&id_consulta_estudiantil='+id_consulta_estudiantil);
		}
	</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>