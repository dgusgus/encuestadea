<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="">
	<form>
		<div class="row">
			<div class="col-sm-12">

				<!-- #section:elements.accordion -->
				<div id="accordion" class="accordion-style1 panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
									<i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Plan de trabajo
								</a>
							</h4>
						</div>

						<div class="panel-collapse collapse in" id="collapseOne">
							<div class="panel-body">
								<div class="col-xs-12">

									<!-- #section:elements.form -->
									<div class="form-group">
										<label class="col-sm-3 control-label " for="form-field-1"> Text Fielddddddddddddddddd </label>
										<div class="col-sm-9">
											<input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label " for="form-field-1"> Fecha de Presentacion </label>
										<div class="col-sm-9">
											<div class="input-group col-sm-6">
												<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" />
												<span class="input-group-addon">
													<i class="fa fa-calendar bigger-110"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label " for="form-field-1"> Fecha de inicio de actividades</label>
										<div class="col-sm-9">
											<div class="input-group col-sm-6">
												<input class="form-control date-picker" id="id-date-picker-2" type="text" data-date-format="dd-mm-yyyy" />
												<span class="input-group-addon">
													<i class="fa fa-calendar bigger-110"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label " for="form-field-1">Fecha de inicio de conclusiones</label>
										<div class="col-sm-9">
											<div class="input-group col-sm-6">
												<input class="form-control date-picker" id="id-date-picker-3" type="text" data-date-format="dd-mm-yyyy" />
												<span class="input-group-addon">
													<i class="fa fa-calendar bigger-110"></i>
												</span>
											</div>
										</div>
									</div>
									<h1>Avance materia</h1>
									<div class="col-xs-10">
										<div class="widget-box widget-color-green">
											<div class="widget-header">
												<h5 class="widget-title">Temas avanzados</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-2 ">
										<a onclick="abrirModal()" class="btn btn-block btn-success">
											<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
											<span>Agregar</span>
										</a>
									</div>
									<div>
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center" style="width: 5%">
															<label class="pos-rel">
																Numero
															</label>
														</th>
														<th class="center">Temas</th>
														<th class="center"style="width: 2	0%">Estado</th>
														<th class="center">Justificacion</th>
														<th class="center" style="width: 10%">Botones</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="center">
															<label class="pos-rel">1</label>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">
															<div class="hidden-sm hidden-xs action-buttons">
																<a class="green" href="#">
																	<i class="ace-icon fa fa-pencil bigger-130"></i>
																</a>
																<a class="red" href="#">
																	<i class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<hr>

									<div class="col-xs-10">
										<div class="widget-box widget-color-blue">
											<div class="widget-header">
												<h5 class="widget-title">Examenes(Parciales, final, revalida)</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-2 ">
										<a onclick="abrirModal()" class="btn btn-block btn-primary">
											<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
											<span>Agregar</span>
										</a>
									</div>
									<div>
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label class="pos-rel">
																Numero
															</label>
														</th>
														<th class="center">Asunto</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Establecida
														</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
														</th>
														<th class="center">
															Estado
														</th>
														<th class="center">Botones</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="center">
															<label class="pos-rel">1</label>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">enero 1</td>
														<td class="center">junio 12</td>
														<td class="center">No Cumplio</td>
														<td class="center">
															<div class="hidden-sm hidden-xs action-buttons">
																<a class="green" href="#">
																	<i class="ace-icon fa fa-pencil bigger-130"></i>
																</a>

																<a class="red" href="#">
																	<i class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<hr>

									<div class="col-xs-10">
										<div class="widget-box widget-color-blue">
											<div class="widget-header">
												<h5 class="widget-title">Practicas</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-2 ">
										<a href="#" class="btn btn-block btn-primary">
											<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
											<span>Agregar</span>
										</a>
									</div>
									<div>
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label class="pos-rel">
																Numero
															</label>
														</th>
														<th class="center">Asunto</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Establecida
														</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
														</th>
														<th class="center">
															Estado
														</th>
														<th class="center">Botones</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="center">
															<label class="pos-rel">1</label>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">enero 1</td>
														<td class="center">junio 12</td>
														<td class="center">No Cumplio</td>
														<td class="center">
															<div class="hidden-sm hidden-xs action-buttons">
																<a class="green" href="#">
																	<i class="ace-icon fa fa-pencil bigger-130"></i>
																</a>

																<a class="red" href="#">
																	<i class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<hr>

									<div class="col-xs-10">
										<div class="widget-box widget-color-blue">
											<div class="widget-header">
												<h5 class="widget-title">Proyectos, trabajos de campo, etc.</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-2 ">
										<a href="#" class="btn btn-block btn-primary">
											<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
											<span>Agregar</span>
										</a>
									</div>
									<div>
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label class="pos-rel">
																Numero
															</label>
														</th>
														<th class="center">Asunto</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Establecida
														</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
														</th>
														<th class="center">
															Estado
														</th>
														<th class="center">Botones</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="center">
															<label class="pos-rel">1</label>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">enero 1</td>
														<td class="center">junio 12</td>
														<td class="center">No Cumplio</td>
														<td class="center">
															<div class="hidden-sm hidden-xs action-buttons">
																<a class="green" href="#">
																	<i class="ace-icon fa fa-pencil bigger-130"></i>
																</a>

																<a class="red" href="#">
																	<i class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<hr>
									<h3>OTRAS ACTIVIDADES DOCENTES</h3>
									<div class="col-xs-10">
										<div class="widget-box widget-color-purple">
											<div class="widget-header">
												<h5 class="widget-title">Examen de competecia</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-2 ">
										<a href="#" class="btn btn-block btn-purple">
											<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
											<span>Agregar</span>
										</a>
									</div>
									<div>
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label class="pos-rel">
																Numero
															</label>
														</th>
														<th class="center">Asunto</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
														</th>
														<th class="center">Botones</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="center">
															<label class="pos-rel">1</label>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">enero 1</td>
														<td class="center">
															<div class="hidden-sm hidden-xs action-buttons">
																<a class="green" href="#">
																	<i class="ace-icon fa fa-pencil bigger-130"></i>
																</a>

																<a class="red" href="#">
																	<i class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<hr>

									<div class="col-xs-10">
										<div class="widget-box widget-color-purple">
											<div class="widget-header">
												<h5 class="widget-title">Examen de grado</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-2 ">
										<a href="#" class="btn btn-block btn-purple">
											<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
											<span>Agregar</span>
										</a>
									</div>
									<div>
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label class="pos-rel">
																Numero
															</label>
														</th>
														<th class="center">Asunto</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
														</th>
														<th class="center">Botones</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="center">
															<label class="pos-rel">1</label>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">enero 1</td>
														<td class="center">
															<div class="hidden-sm hidden-xs action-buttons">
																<a class="green" href="#">
																	<i class="ace-icon fa fa-pencil bigger-130"></i>
																</a>

																<a class="red" href="#">
																	<i class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<hr>

									<div class="col-xs-10">
										<div class="widget-box widget-color-purple">
											<div class="widget-header">
												<h5 class="widget-title">Tesis (Proyecto de Grado)</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-2 ">
										<a href="#" class="btn btn-block btn-purple">
											<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
											<span>Agregar</span>
										</a>
									</div>
									<div>
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="center">
															<label class="pos-rel">
																Numero
															</label>
														</th>
														<th class="center">Asunto</th>
														<th class="center">
															<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
															Fecha Ejecutada
														</th>
														<th class="center">Botones</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="center">
															<label class="pos-rel">1</label>
														</td>
														<td class="center">
															<a>Primer Parcial</a>
														</td>
														<td class="center">enero 1</td>
														<td class="center">
															<div class="hidden-sm hidden-xs action-buttons">
																<a class="green" href="#">
																	<i class="ace-icon fa fa-pencil bigger-130"></i>
																</a>

																<a class="red" href="#">
																	<i class="ace-icon fa fa-trash-o bigger-130"></i>
																</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<hr>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
									<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Asesoramiento
								</a>
							</h4>
						</div>

						<div class="panel-collapse collapse" id="collapseTwo">
							<div class="panel-body">
								<div class="col-xs-10">
									<div class="widget-box widget-color-blue">
										<div class="widget-header">
											<h5 class="widget-title">Proyecto</h5>
										</div>
									</div>
								</div>
								<div class="col-xs-2 ">
									<a href="#" class="btn btn-block btn-primary">
										<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
										<span>Agregar</span>
									</a>
								</div>
								<div>
									<div>
										<table id="dynamic-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label class="pos-rel">
															Numero
														</label>
													</th>
													<th class="center">Tema</th>
													<th class="center">
														<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
														Fecha
													</th>
													<th class="center">Botones</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="center">
														<label class="pos-rel">1</label>
													</td>
													<td class="center">
														<a>Primer Parcial</a>
													</td>
													<td class="center">Feb 12</td>
													<td class="center">
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green" href="#">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red" href="#">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="col-xs-10">
									<div class="widget-box widget-color-blue">
										<div class="widget-header">
											<h5 class="widget-title">Tesis de Grado</h5>
										</div>
									</div>
								</div>
								<div class="col-xs-2 ">
									<a href="#" class="btn btn-block btn-primary">
										<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
										<span>Agregar</span>
									</a>
								</div>
								<div>
									<div>
										<table id="dynamic-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label class="pos-rel">
															Numero
														</label>
													</th>
													<th class="center">Tema</th>
													<th class="center">
														<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
														Fecha
													</th>
													<th class="center">Botones</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="center">
														<label class="pos-rel">1</label>
													</td>
													<td class="center">
														<a>Primer Parcial</a>
													</td>
													<td class="center">Feb 12</td>
													<td class="center">
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green" href="#">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red" href="#">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
									<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Tareas encomendadas por autoridades ejecutivas u órganos de gobierno
								</a>
							</h4>
						</div>

						<div class="panel-collapse collapse" id="collapseThree">
							<div class="panel-body">
								<div class="col-xs-10">
									<div class="widget-box widget-color-blue">
										<div class="widget-header">
											<h5 class="widget-title">Tesis (Proyecto de Grado)</h5>
										</div>
									</div>
								</div>
								<div class="col-xs-2 ">
									<a href="#" class="btn btn-block btn-primary">
										<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
										<span>Agregar</span>
									</a>
								</div>
								<div>
									<div>
										<table id="dynamic-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label class="pos-rel">
															Numero
														</label>
													</th>
													<th class="center">Tema</th>
													<th class="center">
														<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
														Fecha
													</th>
													<th class="center">Botones</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="center">
														<label class="pos-rel">1</label>
													</td>
													<td class="center">
														<a>Primer Parcial</a>
													</td>
													<td class="center">Feb 12</td>
													<td class="center">
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green" href="#">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red" href="#">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
									<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
									&nbsp;Docencia en programas de postgrado
								</a>
							</h4>
						</div>

						<div class="panel-collapse collapse" id="collapseFour">
							<div class="panel-body">
								<div class="col-xs-10">
									<div class="widget-box widget-color-blue">
										<div class="widget-header">
											<h5 class="widget-title">Tesis (Proyecto de Grado)</h5>
										</div>
									</div>
								</div>
								<div class="col-xs-2 ">
									<a href="#" class="btn btn-block btn-primary">
										<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
										<span>Agregar</span>
									</a>
								</div>
								<div>
									<div>
										<table id="dynamic-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label class="pos-rel">
															Numero
														</label>
													</th>
													<th class="center">Tema</th>
													<th class="center">
														<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
														Fecha
													</th>
													<th class="center">Botones</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="center">
														<label class="pos-rel">1</label>
													</td>
													<td class="center">
														<a>Primer Parcial</a>
													</td>
													<td class="center">Feb 12</td>
													<td class="center">
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green" href="#">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red" href="#">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /section:elements.accordion -->
			</div><!-- /.col -->
		</div><!-- /.ROW -->
	</form>
</div>
