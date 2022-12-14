<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>

<fmt:setLocale value="es_BO" scope="session"/>

<table id="tblista" class="table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th class="hidden-480">N?</th>
			<th>Usuario</th>
			<th>ID</th>
			<th class="hidden-480">Clave</th>
			<th title="A=Activo I=Inactivo">Estado</th>
				<sec:authorize access="hasRole('ROLE_ADMINISTRADOR')">
				<th>Opciones</th>

			</sec:authorize>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${lista}" var="r" varStatus="contador">
			<tr>
				<td class="center hidden-480">${contador.count}</td>
				<td class="center">${r.apodo}</td>
				<td>${r.id_usuario}</td>
				<td class="center hidden-480">${r.clave}</td>
				<td>${r.id_estado}</td>
				<sec:authorize access="hasRole('ROLE_ADMINISTRADOR')">

					<td class="center" data-id="${r.id_usuario}">
						<div class="inline pos-rel">
							<c:if test="${r.id_estado}">
								<button data-position="auto" data-toggle="dropdown" class="btn btn-xs btn-primary dropdown-toggle">
									<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Opciones</span>
								</button>
								<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
							<!--		<li><a class="tooltip-info"  onclick="goResetPassw(${r.id_usuario});"><span class="orange">
										<i class="ace-icon fa fa-refresh bigger-120"/> Resetear Contrase?a
									</span></a></li>-->
							<!--		<li><a class="tooltip-info" onclick="goAdmRoles(${r.id_usuario});"><span class="light-grey">
										<i class="ace-icon fa fa-arrow-right bigger-120"/> Admin. Roles
									</span></a></li>-->
									<li><a class="tooltip-info" onclick="goBaja(${r.id_usuario});"><span class="light-red">
												<i class="ace-icon fa fa-thumbs-o-down bigger-120"/> Dar de Baja
											</span></a></li>
									<!--		<li><a class="tooltip-info" onclick="goAlta(${r.id_usuario});"><span class="green">
												<i class="ace-icon fa fa-thumbs-o-up bigger-120"/> Dar de Alta
											</span></a></li>-->
								</ul>
							</c:if>
						</div>
					</td>
				</sec:authorize>
			</tr>
		</c:forEach>
	</tbody>
</table>
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
			listar();
		});

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

	</script>
</sec:authorize>