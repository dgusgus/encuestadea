<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/comun/cabecera.html"/>
<div class="col-xs-12">
	<h2>Lista de Consultas Estudiantiles</h2>

	<div id="contenedor-tabla">
		<div class="row">
			<div class="col-xs-12">
				<h3 class="header smaller lighter blue">jQuery dataTables</h3>

				<div class="clearfix">
					<div class="pull-right tableTools-container"></div>
				</div>
				<div class="table-header">
					Results for "Latest Registered Domains"
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
						table.append("<tr><td>"+elem.id_materia+" "+elem.id_grupo+" "+elem.id_docente+"</td><td>"+elem.estado+"</td><td>opcion("+elem.id_consulta_estudiantil+")</td></tr>");
					});
				}
			}).always(function(){
				console.log('final ajax');
				var oTable1 =
				$('#tabla')
				.dataTable({
					bAutoWidth: false,
					"aoColumns": [
						null, null, null
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