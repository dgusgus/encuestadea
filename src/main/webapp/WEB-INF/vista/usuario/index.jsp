<%--

	Document   : index
	Created on : Nov 22, 2016, 5:11:01 pM
	Author	 : raul velasquez
--%>
<%@page import="org.dtic.tools.Tools"%>
<%@taglib prefix="sec"		uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>

<p>usuarios

<div id="tlista"></div>
</p>

<script type="text/javascript">
	<c:set var="script">
	var idFp;
	var datos;

	$(function () {

		listar('usuario/lista.html', null, '#tlista');

	});

	function listar(page, datos, panel, tipo, fun) {
		$.ajax({
			url: page,
			type: (tipo ? tipo : "POST"),
			data: datos,
			beforeSend: function () {
				$(panel).html('<div class="alert alert-info text-center">C a r g a n d o . . .<br><div class="spsg0"> <div class="spsg spsg1"></div> <div class="spsg spsg2"></div> <div class="spsg spsg3"></div> <div class="spsg spsg4"></div> <div class="spsg spsg5"></div> <div class="spsg spsg6"></div> <div class="spsg spsg7"></div> <div class="spsg spsg8"></div> </div>  </div>');
				$(panel).show();
			},
			success: function (html) {
				var $html = $(html);
				if ($html.find("input[name='j_username']").size() > 0)
					window.location = "/encuestadea/j_spring_security_logout";
				else {
					$(panel).html($html);
					$(panel).slideDown();
					if (typeof fun == 'function')
						fun();
				}
			},
			error: function (xhr, error) {
				$(panel).html('<div class="alert alert-danger center"><i class="ace-icon fa fa-exclamation-triangle red"></i><b> Error: </b>No se pudo cargar la página.</div>');
			}
		});
	}
	</c:set>
	<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
</script>
