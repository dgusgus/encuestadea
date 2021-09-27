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
				<div class="row">
					<div class="col-xs-12 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="ace-icon fa fa-check"></i>
							</span>
							<input type="text" class="form-control search-query" placeholder="criterio de búsqueda" id="busqueda" name="busqueda"
								<c:if test="${not empty busqueda}">
									value="${busqueda}"
								</c:if>
							/>
							<span class="input-group-btn">
								<button type="submit button" class="btn btn-info btn-sm" onclick="buscar()">
									<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
									Buscar
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="tabla">
	</div>
</div><!-- /.col -->
<sec:authorize access="isAuthenticated()">
<script type="text/javascript">
	$(function () {
		$('#busqueda').on('keypress',function(e) {
			if(e.which == 13) {
				buscar();
			}
		});
	})

	function buscar(){
		console.log("buscar");
		$.ajax({
			url:'principal/listar.html',
			data: {busqueda:$('#busqueda').val()||''},
			method: "GET",
			success: function (response) {
				$('#tabla').html(response);
			}
		});
	}
</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>