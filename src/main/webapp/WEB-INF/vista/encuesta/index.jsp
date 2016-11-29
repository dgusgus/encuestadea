<%-- 
    Document   : index
    Created on : Nov 22, 2016, 5:11:01 PM
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
						<dt>Gestion:</dt>
						<dd>${docente.gestion}</dd>						
					</dl>
					<div id="tlista" class="widget-main padding-6">
						<table class="table table-striped table-bordered table-hover" id="flujoProcesos">
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
											<button data-position="auto" class="btn btn-xs btn-primary " href="encuesta/modificar.html?id_encuesta=${encuesta.id_encuesta}">
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
								<label class="control-label" for="P1">P1</label>
								<div class="input-group">
									<input id="P1" name="P1"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P2">P2</label>
								<div class="input-group">
									<input id="P2" name="P2"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P3">P3</label>
								<div class="input-group">
									<input id="P3" name="P3"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P4">P4</label>
								<div class="input-group">
									<input id="P4" name="P4"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P5">P5</label>
								<div class="input-group">
									<input id="P5" name="P5"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P6">P6</label>
								<div class="input-group">
									<input id="P6" name="P6"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P7">P7</label>
								<div class="input-group">
									<input id="P7" name="P7"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P8">P8</label>
								<div class="input-group">
									<input id="P8" name="P8"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P9">P9</label>
								<div class="input-group">
									<input id="P9" name="P9"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P10">P10</label>
								<div class="input-group">
									<input id="P10" name="P10"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P11">P11</label>
								<div class="input-group">
									<input id="P11" name="P11"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P12">P12</label>
								<div class="input-group">
									<input id="P12" name="P12"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-2]{1}$"
										   data-error="Min:1 Max:2">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P13">P13</label>
								<div class="input-group">
									<input id="P13" name="P13"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-2]{1}$"
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
								<label class="control-label" for="P14">P14</label>
								<div class="input-group">
									<input id="P14" name="P14"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P15">P15</label>
								<div class="input-group">
									<input id="P15" name="P15"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P16">P16</label>
								<div class="input-group">
									<input id="P16" name="P16"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P17">P17</label>
								<div class="input-group">
									<input id="P17" name="P17"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P18">P18</label>
								<div class="input-group">
									<input id="P18" name="P18"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P19">P19</label>
								<div class="input-group">
									<input id="P19" name="P19"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P20">P20</label>
								<div class="input-group">
									<input id="P20" name="P20"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P21">P21</label>
								<div class="input-group">
									<input id="P21" name="P21"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P22">P22</label>
								<div class="input-group">
									<input id="P22" name="P22"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P23">P23</label>
								<div class="input-group">
									<input id="P23" name="P23"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P24">P24</label>
								<div class="input-group">
									<input id="P24" name="P24"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P25">P25</label>
								<div class="input-group">
									<input id="P25" name="P25"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P26">P26</label>
								<div class="input-group">
									<input id="P26" name="P26"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-4]{1}$"
										   data-error="Min:1 Max:4">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P27">P27</label>
								<div class="input-group">
									<input id="P27" name="P27"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P28">P28</label>
								<div class="input-group">
									<input id="P28" name="P28"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
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
								<label class="control-label" for="P29">P29</label>
								<div class="input-group">
									<input id="P29" name="P29"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P30">P30</label>
								<div class="input-group">
									<input id="P30" name="P30"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
										   data-error="Min:1 Max:3">
									<span class="glyphicon form-control-feedback"
										  aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>								
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-xs-6">
							<div class="form-group has-feedback">								
								<label class="control-label" for="P31">P31</label>
								<div class="input-group">
									<input id="P31" name="P31"
										   class="form-control input-md inputs" type="text"
										   pattern="^[1-3]{1}$"
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
	var idFP;
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
		}).keyup (function () {
			if (this.value.length >= charLimit) {
				var index = $(selector).index(this) + 1;
				$(selector).eq(index).focus();
				return false;
			}
		});
	}

	function listar() {
		jjAyax("flujo_proceso/listar.html", {idProyecto: "${proyecto.idProyecto}"}, "#tlista");
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
		datos = $('#form').serializeArray();
		datos.push({name: 'id_materia', value: "${docente.id_materia}"});
		datos.push({name: 'id_grupo', value: "${docente.id_grupo}"});
		datos.push({name: 'id_gestion', value: "${docente.id_gestion}"});
		datos.push({name: 'id_docente', value: "${docente.id_docente}"});
		/*datos.id_materia="${docente.id_materia}";
		datos.id_grupo="${docente.id_grupo}";
		datos.id_gestion="${docente.id_gestion}";
		datos.id_docente="${docente.id_docente}";*/
		//console.log(datos);
		if(!$('#form').find('.has-error').length) {
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

	function modificar(id) {

	}

	function goProcesar() {

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