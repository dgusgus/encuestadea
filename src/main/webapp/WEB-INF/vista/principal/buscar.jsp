<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/comun/cabecera.html"/>
<div class="col-xs-12">
	<h2>Busqueda de Docentes</h2>

	<div class="widget-box">
		<div class="widget-header widget-header-small">
			<h5 class="widget-title lighter">Criterios de búsqueda</h5>
		</div>

		<div class="widget-body">
			<div class="widget-main">
				<form class="form-search" action="principal/buscar.html">
					<div class="row">
						<div class="col-xs-12 col-sm-8">
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

	<c:if test="${not empty docentes}">

		<table class="table table-striped table-bordered table-hover" id="flujoProcesos">
			<thead>
				<tr>
					<th class="hidden-480">Título</th>
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
						<td id="titulo" class="center hidden-480">${docente.titulo}</td>
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
	</c:if>
</div><!-- /.col -->
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		$(function () {

			$.ajax({url: "comun/roles.html", type: "POST"
				, success: function (html) {
					html = html.replace(/\s{2,}/g, " ");
					$("#x-roles").html(html);
					$.cookie("${apodo}.roles", html, {path: "<%= session.getAttribute("__direccion").toString() %>", expires: 30});
					eventMenusRol();
				}
				, error: function (xhr, error) {
				}
			});

			$('#nuevo').on('shown.bs.modal', function (e) {
				$('#form').validator();
			});
		});

		function nuevo() {
			;
			$('#nuevo').appendTo("body").modal('show');
			$("#guardar-btn").unbind("click");

		}
	</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>