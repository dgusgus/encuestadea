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
				<button class="btn btn-primary"><i class="ace-icon glyphicon glyphicon-plus"></i>Nueva Consulta Estudiantil</button>
				<hr />
				<div class="table-header">
					Encuentas generadas
				</div>

				<!-- div.table-responsive -->

				<!-- div.dataTables_borderWrap -->
				<div>
					<table id="tabla" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Materia</th>
								<th>Estado</th>
								<th></th>
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
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		$(function () {
			//initiate dataTables plugin
			listar();
		});

		function formatoEstadoConsultaEstudiantil(estado){
			switch(estado) {
				case 'N':
					return '<span class=\"label label-sm label-info arrowed arrowed-righ\">NUEVO</span>';
					break;
				case 'A':
					return '<span class=\"label label-sm label-success\">ABIERTO</span>';
					break;
				case 'C':
					return '<span class=\"label label-sm label-warning\">CERRADO</span>';
					break;
				default:
					return '<span class=\"label label-sm label-inverse arrowed-in\">ESTADO INCORRECTO</span>';
			}
		}

		function listar(){
			$.ajax({
				url:'consultaestudiantil/listarByIdUsuario.html',
				method: "GET",
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function (response) {
					console.log(response);
					var table = $("#tabla tbody");
					$.each(response.data, function(idx, elem){
						console.log(elem);
						table.append("<tr><td><b class=\"text-success\">"+elem.nombre_docente+"</b><br> "+elem.nombre_materia+" "+elem.sigla_materia+" "+elem.paralelo+" "+elem.gestion+"</td><td>"+formatoEstadoConsultaEstudiantil(elem.estado)+"</td><td>opcion("+elem.id_consulta_estudiantil+")</td></tr>");
					});
				}
			}).always(function(){
				var oTable1 =
				$('#tabla')
				.dataTable({
					bAutoWidth: false,
					"aoColumns": [
						null, null, { "bSortable": false }
					],
					"aaSorting": [],
					"language": {
						"url": "assets/js/dataTables/Spanish.json"
					},
				});
			}
			);
		}
	</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>