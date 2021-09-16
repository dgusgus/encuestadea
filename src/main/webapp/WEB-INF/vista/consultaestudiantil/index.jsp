<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/comun/cabecera.html"/>
<div class="col-xs-12">
	<h2>Lista de Consultas Estudiantiles</h2>

</div><!-- /.col -->
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		$(function () {

		});
	</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>