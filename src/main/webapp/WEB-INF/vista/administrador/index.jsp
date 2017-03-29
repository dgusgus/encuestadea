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

									<li>
										<a data-toggle="tab" href="#comisionados_tab">
											<i class="blue ace-icon fa fa-users bigger-110"></i>
											Comisiones
										</a>
									</li>											
								</ul>

								<div class="tab-content">
									<div id="usuarios_tab" class="tab-pane in active">
										<div class="ventana" id="usuarios">
										</div>
									</div>

									<div id="comisionados_tab" class="tab-pane">
										<div class="ventana" id="comisionados">
											<div class="row">
												<div class="col-xs-12">
													<div>														
														<table id="example" class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<th>Id Usuario</th>
																	<th>Apodo</th>
																	<th>Clave</th>
																	<th>Estado</th>
																	<th>Id Persona</th>														
																</tr>
															</thead>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>	
									
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

<div class="modal fade" id="nuevo" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Nuevo Usuario</h4>
			</div>
			<div class="modal-body">
				<form id="form" class="form-horizontal">
					<!-- Text input-->
					<h3>Datos del Nuevo Usuario</h3>					
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group has-feedback">								
								<label class="control-label" for="apodo">Apodo o Nick del Usuario: (apellido.nombre)</label>
								<div class="input-group">
									<span class="input-group-addon">Apodo</span>
									<input id="nombre" name="apodo"
										   class="form-control" type="text"
										   pattern="^[A-Za-z]+.[A-Za-z]+[0-9]*$"
										   data-error="El formato normalmente es apellido.nombre en caso de repetirse puede usar un número al final"
										   required>
								</div>	
								<span class="glyphicon form-control-feedback"
								aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
						</div>											
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group has-feedback">								
								<label class="control-label" for="persona">Dueño de la cuenta</label>
								<div class="input-group">
									<span class="input-group-addon">Persona</span>
									<input id="persona" name="persona"
										   class="form-control" type="text"										   										   
										   required>
								</div>	
								<span class="glyphicon form-control-feedback"
								aria-hidden="true"></span>
								<div class="help-block with-errors"></div>																
							</div>
						</div>											
					</div>
					<input id="persona1" name="persona1" required/>
				</form>
			</div>
			<div class="modal-footer">
				<button id="guardar-btn" type="button" class="btn btn-primary">Guardar</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>		
</div>

<div id="dformu" class="hide">
	<div class="center">
		<span class="input-icon">
			<input type="text" id="ibusc" class="input-xlarge" placeholder="Nombre ó C.I."/>
			<i class="ace-icon fa fa-search blue"></i>
		</span>
		<!--<div class="space-4"></div>-->
		<hr/>
		<div class="pfoto wfoto hfoto">
			<div class="wfoto hfoto" style="position:absolute;background:transparent;"></div>
			<img id="ifoto" class="hfoto" style="margin:0 0 0 -40px"
				onload='$(this).show("scale");'/>
		</div>
		<div class="space-10"></div>
		<div class="profile-user-info profile-user-info-striped">
			<div class="profile-info-row">
				<div class="profile-info-name">Nombre</div>
				<div class="profile-info-value"><span id="snom"></span></div>
			</div>
			<div class="profile-info-row">
				<div class="profile-info-name">C.I.</div>
				<div class="profile-info-value"><span id="sdip"></span></div>
			</div>
			<div class="profile-info-row">
				<div class="profile-info-name">Cuenta</div>
				<div class="profile-info-value"><input id="fusr" type="text" class="form-control" ></div>
			</div>
			<div class="profile-info-row">
				<div class="profile-info-name">Rol</div>
				<div class="profile-info-value">
					<div style="width: 100%">
						<select id="frol" placeholder="Seleccione" class="form-control">
							<option value=""></option>
							<option value="1">ADMINISTRADOR</option>
							<option value="2">JEFE CONTRATACIONES</option>
							<option value="3" selected>TECNICO</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="confirmar" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">¿Borrar?</h4>
			</div>
			<div class="modal-body">
				¿Está seguro de Borrar el elemento? 
			</div>
			<div class="modal-footer">
				<button id="confirmar-eliminar-btn" type="button" class="btn btn-primary" >Si</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>
<script src="assets/js/chosen.jquery.min.js" ></script>
<script type="text/javascript">
	var idFp;
	var datos;
	var idPer=null, nom=null, dip=null, idUsr=null, apo=null;
	var autp=false;
	$(function () {
		
		$("#dformu").removeClass("hide").dialog({
			autoOpen:false,
			resizable:false,
			width:"400",
			modal:true,
			title:"<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-plus'></i> Adicionar Usuario</h4></div>",
			title_html:true,
			buttons:[
				{
					html:"<i class='ace-icon fa fa-times'></i> Cancel",
					"class":"btn btn-xs btn-danger btn-round",
					click:function (){
						$(this).dialog("close");
					}
				},
				{
					html:"<i class='ace-icon fa fa-check'></i> Aceptar",
					"class":"btn btn-xs btn-primary btn-round",
					click:guardar_nuevo()
				}
			]
		});


		//
		$("#ibusc").on("keydown", function (e){
			if(!autp){
				$("#ibusc").autocomplete({disabled:true});
				switch(e.which){
					case 13:
						$("#ibusc").removeClass("sres").autocomplete({disabled:false}).autocomplete("search", $("#ibusc").val());
						break;
					case 27:
						idPer=nom=dip=idUsr=apo=null;
						$("#ifoto").hide("slice");
						$("#snom,#sdip,#fusr").text("");
						setTimeout('$("#ibusc").val("");', 200);
						break;
				}
			}
		}).autocomplete({
			disabled:true,
			autoFocus:true,
			minLength:2,
			source:function (request, response){
				$.ajax({
					url:"personas/buscarPersonas.html",
					data:request,
					dataType:"json",
					success:function (data){
						if(data.length===0){
							autp=false;
							$("#ibusc").addClass("sres");
						}
						response(data);
					},
					error:function (){
						autp=false;
						$("#ibusc").addClass("sres");
						response([]);
					}
				});
			},
			open:function (){
				autp=true;
			},
			close:function (){
				autp=false;
			},
			select:function (event, ui){
				idPer=ui.item.id_persona;
				nom=ui.item.nombre;
				dip=ui.item.dip;
				idUsr=ui.item.id_usuario;				
				$("#snom").text(nom);
				$("#sdip").text(dip);
				var apodo = '';
				var array2 = ui.item.nombres.split(/\s+/);
				console.log(array2);
				if(ui.item.paterno != '') apodo = ui.item.paterno;
				else apodo = ui.item.materno;
				console.log(apodo);
				apodo = apodo + "." + array2[0];
				console.log(apodo);
				$("#fusr").val(apodo);
				$("#ifoto").attr("src", "/digital/"+dip+".jpg?o_o="+(new Date().getTime())).hide();
				//
//				$("#inomci").val($("#ibusc").val());
				//
				$("#frol").select();
				return false;
			}
		}).data("ui-autocomplete")._renderItem=function (ul, item){
			return $("<li/>")
				.append("<a><b>"+item.dip+"</b><br/>"+item.nombre+"</a>")
				.appendTo(ul);
		};
		
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
		
		jQuery.fn.resetear = function () {
		  $(this).each (function() { this.reset(); });
		};
		
		$('#example tbody').on( 'click', '.eliminar', function () {
			var data = table.row( $(this).parents('tr') ).data();
			alert( data.id_usuario +"'s salary is: "+ data.apodo );
		} );
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
//		$('#form').validator('validate');		
		
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
//				$('#form').validator('validate');
				$( "#guardar-btn").unbind( "click" );
				$( "#guardar-btn" ).bind( "click", function() {
					  guardar_editar(id);
				});
			},
			error: function(){alert('Ocurrio un error inesperado');}
		});
	}
	
	function guardar_editar(id){
//		$('#form').validator('validate');		
		
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
	.well {
		margin-bottom:0px;
	}

	.ui-autocomplete {
		max-height:180px;
		overflow-y:auto;
		overflow-x:hidden;
		padding-right:20px;
	}
	.ui-autocomplete-loading {
		background: white url("assets/img/loading.gif") right center no-repeat;
	}

	.wfoto{width:170px;}
	.hfoto{height:160px;}
	.pfoto{
		display:inline-block;
		overflow:hidden;
		border:1px solid #aaa;
		border-radius:6px;
		-webkit-border-radius:6px;
		box-shadow:3px 3px 1px #666;
		background:#fff url("assets/css/images/overlay.png") repeat scroll 0 0;
		margin:0 20px;
	}
</style>

<jsp:include page="/comun/pie.html"/>