<%-- 
    Document   : index
    Created on : Nov 22, 2016, 5:11:01 pM
    Author     : raul velasquez
--%>
<%@page import="org.dtic.tools.Tools"%>
<%@taglib prefix="sec"		uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>


<p>usuarios 

<sec:authorize access="hasAnyRole('0','ROLE_1')">
	administrador2
</sec:authorize>
<sec:authorize access="isAnonymous()">
    anonimo
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    autenticado
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    autenticado2
</sec:authorize>
<sec:authorize access="hasAnyAuthority('ROLE_1')">
    authority1
</sec:authorize>
</p>

<script type="text/javascript">
	<c:set var="script">
	var idFp;
	var datos;

	$(function () {
		$('#nuevo').on('shown.bs.modal', function (e) {
			$('#form').validator();			
		});

		$("#btnew").click(function () {
			nuevo();
		});
				
	});
		
	function nuevo() {				
		$('#form').resetear();
		$('#nuevo').modal('show');
		$( "#guardar-btn").unbind( "click" );
		$( "#guardar-btn" ).bind( "click", function() {
			guardar_nuevo();
		});
	}
	
	function guardar_nuevo(){
		$('#form').validator('validate');		
		
		if(!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();
			datos.push({name: 'id_materia', value: "${docente.id_materia}"});
			datos.push({name: 'id_grupo', value: "${docente.id_grupo}"});
			datos.push({name: 'id_gestion', value: "${docente.id_gestion}"});
			datos.push({name: 'id_docente', value: "${docente.id_docente}"});
			
			$.ajax({
				type: "POST",
				url: 'encuesta/guardar.html',
				data: datos,
				success: function(response){ $('#nuevo').modal('hide');location.reload();}
			});
		} 
		else{
			$('.has-error input').val('');
		}
	}

	function editar(id){
		$.ajax({
			type: "POST",
			url: 'encuesta/buscar.html?id_encuesta='+id,        
			success: function(response){ 
				$('#form').resetear();
				populate_form(response);
				$('#nuevo').modal('show');
				$('#form').validator('validate');
				$( "#guardar-btn").unbind( "click" );
				$( "#guardar-btn" ).bind( "click", function() {
					  guardar_editar(id);
				});
			},
			error: function(){alert('Ocurrio un error inesperado');}
		});
	}
	
	function guardar_editar(id){
		$('#form').validator('validate');		
		
		if(!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();
			datos.push({name: 'id_encuesta', value: id});		
			
			$.ajax({
				type: "POST",
				url: 'encuesta/modificar.html',
				data: datos,
				success: function(response){ $('#nuevo').modal('hide');}
			});
		} 
		else{
			$('.has-error input').val('');
		}
	}

	function eliminar(id) {		
		$('#confirmar').modal('show');
		$( "#confirmar-eliminar-btn").unbind( "click" );
		$( "#confirmar-eliminar-btn" ).bind( "click", function() {
			  guardar_eliminar(id);
		});
	}
	
	function guardar_eliminar(id){
		$.ajax({
			type: "POST",
			url: 'encuesta/eliminar.html?id_encuesta='+id,        
			success: function(response){ $('#confirmar').modal('hide');location.reload();},
			error: function(){alert('Ocurrio un error inesperado');}
		});
	}
	
	function reporteGeneral(){
		$.ajax({
			type: "POST",
			url: 'encuesta/reporte_general.html',        
			success: function(response){
				var win = window.open(response, '_blank');
				win.focus();
			},
			error: function(){alert('Ocurrio un error inesperado');}
		});
	}
	
	function populate_form(datos){
		//console.log(datos[0]);
		$.each(datos, function(name, val){
			var $el = $('[name="'+name+'"]'),
				type = $el.attr('type');			
			switch(type){
				case 'checkbox':
					$el.attr('checked', 'checked');
					break;
				case 'radio':
					$el.filter('[value="'+val+'"]').attr('checked', 'checked');
					break;
				default:
					$el.val(val);
			}
		});
	}
	</c:set>
	<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
</script>

