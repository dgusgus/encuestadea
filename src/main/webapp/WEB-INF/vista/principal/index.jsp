<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/comun/cabecera.html"/>
<div class="col-xs-6">
	<h1>Bienvenido...</h1>
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
	});
</script>
</sec:authorize>
<jsp:include page="/comun/pie.html"/>