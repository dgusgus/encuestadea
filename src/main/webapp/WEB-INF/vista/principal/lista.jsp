<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
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
						<button data-position="auto" class="btn btn-xs btn-primary " onclick="nuevo(${docente.id_materia},${docente.id_grupo},${docente.id_gestion},${docente.id_docente})" >
							<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Seleccionar Docente</span>
						</button>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
	function nuevo(id_materia, id_grupo, id_gestion, id_docente){
		console.log(id_materia);
		$.ajax({
			url:'consultaestudiantil/nuevo.html',
			data: {id_materia: id_materia, id_grupo:id_grupo, id_gestion:id_gestion, id_docente:id_docente},
			method: "GET",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (response) {
				console.log(response);
				window.location = "consultaestudiantil/index.html";
			}
		});
	}
</script>
