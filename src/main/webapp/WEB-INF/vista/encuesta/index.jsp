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
			Encuestas 
			<small class="hidden-xs">
				<i class="ace-icon fa fa-angle-double-right"></i>
				Encuestas creadas para la opinión estudiantil.
			</small>
		</h1>
	</div>

	<div class="row">

		<div class="col-sm-12 widget-container-col ui-sortable">
			<div class="widget-box ui-sortable-handle">
				<div class="widget-header widget-header-small">
					<h4 class="widget-title">Listado de Encuestas</h4>
					<div class="widget-toolbar">
						<a class="orange2" data-action="fullscreen" href="#"><i class="ace-icon fa fa-expand"></i></a>
						<a data-action="collapse" href="#"><i class="ace-icon fa fa-chevron-up"></i></a>
					</div>
					<div class="widget-toolbar">
						<a  id="btreporte" class="btn btn-minier btn-success btn-round" href="encuesta/reporte_general.html?id_materia=${docente.id_materia}&id_grupo=${docente.id_grupo}&id_gestion=${docente.id_gestion}&id_docente=${docente.id_docente}&id_unidad=${docente.id_unidad}" target="_blank"><i class="ace-icon fa fa-print"></i>Reporte General</a>
						<button  id="btnew" class="btn btn-minier btn-primary btn-round"><i class="ace-icon fa fa-plus"></i>Añadir Encuestas</button>
					</div>
				</div>

				<div class="widget-body">
					<dl id="dt-list-1" class="dl-horizontal">
						<dt>Docente:</dt>
						<dd>${docente.nombre}</dd>
						<dt>Nombre Materia:</dt>
						<dd>${docente.nombreMateria}</dd>
						<dt>Materia:</dt>
						<dd>${docente.sigla}</dd>						
						<dt>Paralelo:</dt>
						<dd>${docente.grupo}</dd>
						<dt>Gestión:</dt>
						<dd>${docente.gestion}</dd>
						<dt>Facultad:</dt>
						<dd>${docente.facultad_materia}</dd>
					</dl>
					<div id="tlista" class="widget-main padding-6">
						<table class="table table-striped table-bordered table-hover" id="flujoprocesos">
							<thead>
								<tr>
									<th class="hidden-480">Nro.</th>
									<th>Encuesta </th>
									<th>Fecha Creación</th>									
									<th>Opciones</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${encuestas}" var="encuesta" varStatus="contador">
								<tr>
									<td id="titulo" class="center hidden-480">${contador.count}</td>
									<td id="nombre" class="right">Encuesta</td>
									<td id="sigla" class="left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${encuesta.fecha_creacion}" /></td>									
									<td id="opciones" class="center">
										<div class="inline pos-rel">
											<button data-position="auto" class="btn btn-xs btn-primary " onclick="editar(${encuesta.id_encuesta});">
												<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Modificar</span>
											</button>
											<button data-position="auto" class="btn btn-xs btn-primary " onclick="eliminar(${encuesta.id_encuesta});">
												<i class="ace-icon fa fa-th-list bigger-140"></i> <span class="hidden-sm hidden-xs">Eliminar</span>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>						
					</div>
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
				<h4 class="modal-title" id="myModalLabel">Nueva Encuesta</h4>
			</div>
			<div class="modal-body">


				<form id="form" class="form-horizontal">
					<!-- Text input-->
					<h3>Conocimiento en la asignatura</h3>
					<div class="row">
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p1">p1</label>
								<div class="input-group">
									<input id="p1" name="p1"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p2">p2</label>
								<div class="input-group">
									<input id="p2" name="p2"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p3">p3</label>
								<div class="input-group">
									<input id="p3" name="p3"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p4">p4</label>
								<div class="input-group">
									<input id="p4" name="p4"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p5">p5</label>
								<div class="input-group">
									<input id="p5" name="p5"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p6">p6</label>
								<div class="input-group">
									<input id="p6" name="p6"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p7">p7</label>
								<div class="input-group">
									<input id="p7" name="p7"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p8">p8</label>
								<div class="input-group">
									<input id="p8" name="p8"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p9">p9</label>
								<div class="input-group">
									<input id="p9" name="p9"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p10">p10</label>
								<div class="input-group">
									<input id="p10" name="p10"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p11">p11</label>
								<div class="input-group">
									<input id="p11" name="p11"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p12">p12</label>
								<div class="input-group">
									<input id="p12" name="p12"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-2]{1}$"
										   data-error="Min:1 Max:2">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p13">p13</label>
								<div class="input-group">
									<input id="p13" name="p13"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-2]{1}$"
										   data-error="Min:1 Max:2">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
					</div>					
					<h3>Cualidades Pedagógicas</h3>
					<div class="row">
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p14">p14</label>
								<div class="input-group">
									<input id="p14" name="p14"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p15">p15</label>
								<div class="input-group">
									<input id="p15" name="p15"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p16">p16</label>
								<div class="input-group">
									<input id="p16" name="p16"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p17">p17</label>
								<div class="input-group">
									<input id="p17" name="p17"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p18">p18</label>
								<div class="input-group">
									<input id="p18" name="p18"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p19">p19</label>
								<div class="input-group">
									<input id="p19" name="p19"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p20">p20</label>
								<div class="input-group">
									<input id="p20" name="p20"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-2]{1}$"
										   data-error="Min:1 Max:2">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p21">p21</label>
								<div class="input-group">
									<input id="p21" name="p21"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p22">p22</label>
								<div class="input-group">
									<input id="p22" name="p22"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p23">p23</label>
								<div class="input-group">
									<input id="p23" name="p23"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p24">p24</label>
								<div class="input-group">
									<input id="p24" name="p24"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p25">p25</label>
								<div class="input-group">
									<input id="p25" name="p25"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p26">p26</label>
								<div class="input-group">
									<input id="p26" name="p26"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-4]{1}$"
										   data-error="Min:1 Max:4">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p27">p27</label>
								<div class="input-group">
									<input id="p27" name="p27"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p28">p28</label>
								<div class="input-group">
									<input id="p28" name="p28"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
					</div>
					<h3>Cumplimiento</h3>
					<div class="row">
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p29">p29</label>
								<div class="input-group">
									<input id="p29" name="p29"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p30">p30</label>
								<div class="input-group">
									<input id="p30" name="p30"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="p31">p31</label>
								<div class="input-group">
									<input id="p31" name="p31"
										   class="form-control input-md inputs" type="text"
										   pattern="^[0-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>						
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button id="guardar-btn" type="button" class="btn btn-primary">Guardar</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
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
				¿Está seguro de Borrar La Encuesta? 
			</div>
			<div class="modal-footer">
				<button id="confirmar-eliminar-btn" type="button" class="btn btn-primary" >Si</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
			</div>
		</div>
	</div>
</div>

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
		
//		$(".input-md").keyup(function () {
//			if (true) {
//				$(this).next('.input-md').focus();
//			}
//		});
		
		jQuery.fn.resetear = function () {
		  $(this).each (function() { this.reset(); });
		};
		
	jQuery.fn.getSelectionStart = function(){
    if(this.lengh == 0) return -1;
    input = this[0];
 
    var pos = input.value.length;
 
    if (input.createTextRange) {
      var r = document.selection.createRange().duplicate();
      r.moveEnd('character', input.value.length);
      if (r.text == '') 
        pos = input.value.length;
      pos = input.value.lastIndexOf(r.text);
    } else if(typeof(input.selectionStart)!="undefined")
      pos = input.selectionStart;
 
    return pos;
  };
 
  jQuery.fn.getSelectionEnd = function(){
    if(this.lengh == 0) return -1;
    input = this[0];
 
    var pos = input.value.length;
 
    if (input.createTextRange) {
      var r = document.selection.createRange().duplicate();
      r.moveStart('character', -input.value.length);
      if (r.text == '') 
        pos = input.value.length;
      pos = input.value.lastIndexOf(r.text);
    } else if(typeof(input.selectionEnd)!="undefined")
      pos = input.selectionEnd;
 
    return pos;
  };
		
		setKeypressFunction();
		
		
	});

	function setKeypressFunction(){
		var charLimit = 1;
		var selector = '.inputs';
				
		$(selector).keydown(function(e) {			
			var keys = [8, 9, /*16, 17, 18,*/ 19, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 46, 144, 145, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105];			
			if (e.which == 8 && this.value.length == 0) {
				var index = $(selector).index(this) - 1;
				$(selector).eq(index).focus();
			} else if ($.inArray(e.which, keys) >= 0) {
				return true;
			} else if (this.value.length >= charLimit) {
				var index = $(selector).index(this) + 1;
				$(selector).eq(index).focus();
				return false;
			} else if (e.shiftKey || e.which <= 48 || e.which >= 58) {
				return false;
			}
		}).keyup (function (e) {
			if(e.wich != 46){
				if (this.value.length >= charLimit) {
					var index = $(selector).index(this) + 1;
					$(selector).eq(index).focus();
					return false;
				}
			}else{
				this.value = '';
			}
			
		});
	}
	
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