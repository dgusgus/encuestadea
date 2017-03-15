<%-- 
    Document   : index
    Created on : Nov 22, 2016, 5:11:01 pM
    Author     : raul velasquez
--%>

<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>

<fmt:setLocale value="es_BO" scope="session"/>

<jsp:include page="/comun/cabecera.html"/>

<div class="page-content">
	<div class="page-header">
		<h1>
			Administrador 
			<small class="hidden-xs">
				<i class="ace-icon fa fa-angle-double-right"></i>
				Gestión de los usuarios, comisiones, etc.
			</small>
		</h1>
	</div>

	<div class="row">

		<div class="col-sm-12 widget-container-col ui-sortable">
			<div class="widget-box ui-sortable-handle">
				<div class="widget-header widget-header-small">
					<h4 class="widget-title">Administración del Sistema</h4>
					<div class="widget-toolbar">
						<a class="orange2" data-action="fullscreen" href="#"><i class="ace-icon fa fa-expand"></i></a>
						<a data-action="collapse" href="#"><i class="ace-icon fa fa-chevron-up"></i></a>
					</div>
					<div class="widget-toolbar">						
						
					</div>
				</div>

				<div class="widget-body">
					<div class="row">
						<div class="col-sm-12">
							<!-- #section:elements.tab.position -->
							<div class="tabbable tabs-left">
								<ul class="nav nav-tabs" id="myTab3">
									<li class="active">
										<a data-toggle="tab" href="#usuarios_tab">
											<i class="green ace-icon fa fa-user bigger-110"></i>
											Usuarios
										</a>
									</li>

<!--									<li>
										<a data-toggle="tab" href="#comisionados_tab">
											<i class="blue ace-icon fa fa-users bigger-110"></i>
											Comisiones
										</a>
									</li>											-->
								</ul>

								<div class="tab-content">
									<div id="usuarios_tab" class="tab-pane in active">
										<div class="ventana" id="usuarios">
										</div>
									</div>

<!--									<div id="comisionados_tab" class="tab-pane">
										<div class="ventana" id="comisionados">
										</div>
									</div>											-->
								</div>
							</div>
							<!-- /section:elements.tab.position -->									
						</div>
					</div><!-- /.row -->
				</div>
			</div>
		</div>
	</div>


</div><!-- /.page-content -->

<script type="text/javascript">
	<c:set var="script">
	var idFp;
	var datos;

	$(function () {
		$.ajax({
			url: "usuario/index.html",
			success: function(result){
				$("#usuarios").html(result);
			}
		});
		
		$('#nuevo').on('shown.bs.modal', function (e) {
			$('#form').validator();			
		});

		$("#btnew").click(function () {
			nuevo();
		});
		
//		$(".input-md").keyup(function () {
//			if (true) {
//				$(this).next('.input-md').focus();
//			}
//		});
		
		jQuery.fn.resetear = function () {
		  $(this).each (function() { this.reset(); });
		};
			
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

<style type="text/css">
	.ui-dialog, .ui-dialog-content{ overflow:visible !important; }
	input[type=number]::-webkit-outer-spin-button,
	input[type=number]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;	
	}

	input[type=number] {
		-moz-appearance:textfield;
	}

</style>

<jsp:include page="/comun/pie.html"/>