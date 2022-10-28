<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>

<c:forEach items="${personas}" var="personas" varStatus="contador">
	<tr>
		<td class="center hidden-480">${personas.id_persona}</td>
		<td class="right">${personas.nombre}</td>
		<td class="center"> <fmt:formatDate pattern="yyyy-MM-dd" value="${personas.fecha_nacimiento}"/></td>
		<td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${personas.fecha_modificacion}"/></td>
		<td class="right">${personas.id_estado}</td>
		<td class="right">${personas.estado}</td>
		<td class="center">
			<div class="inline pos-rel">

				<button data-position="auto" class="btn btn-xs btn-primary " onclick="abrirEditar(${personas.id_persona});">
					<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Modificar</span>
				</button>
				<button data-position="auto" class="btn btn-xs btn-danger " onclick="eliminar(${personas.id_persona});">
					<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Eliminar</span>
				</button>
			</div>
		</td>
	</tr>
</c:forEach>