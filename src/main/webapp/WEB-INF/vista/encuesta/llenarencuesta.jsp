<%--

	Document   : index
	Created on : Nov 22, 2016, 5:11:01 pM
	Author	 : raul velasquez
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
			Encuesta

			<small class="hidden-xs">
				<i class="ace-icon fa fa-angle-double-right"></i>
				Llenado de la encuesta de opinión estudiantil.
			</small>
		</h1>
	</div>

	<div class="row">

		<div class="col-sm-12 widget-container-col ui-sortable">
			<div class="widget-box ui-sortable-handle">
				<div class="widget-header widget-header-small">
					<h4 class="widget-title">Encuesta</h4>
					<div class="widget-toolbar">
						<a class="orange2" data-action="fullscreen" href="#"><i class="ace-icon fa fa-expand"></i></a>
						<a data-action="collapse" href="#"><i class="ace-icon fa fa-chevron-up"></i></a>
					</div>
					<div class="widget-toolbar">
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
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr hr-18 hr-double dotted"></div>
								<div class="wizard-content">
									<div id="wizard-encuesta">
										<div class="modal-header">
											<ul class="steps">
												<li data-step="1" class="active">
													<span class="step">1</span>
													<span class="title">CONOCIMIENTOS EN  LA ASIGNATURA</span>
												</li>
												<li data-step="2">
													<span class="step">2</span>
													<span class="title">CUALIDADES  PEDAGÓGICAS</span>
												</li>
												<li data-step="3">
													<span class="step">3</span>
													<span class="title">CUMPLIMIENTO</span>
												</li>
											</ul>
										</div>
										<div class="modal-body step-content">
											<div class="step-pane active" data-step="1">
												<div class="">
													<h4 class="blue">1. DEMOSTRACIÓN DE CONOCIMIENTOS:</h4>
													<div class="row">
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p1">El docente, no tiene dificultades para responder algunas interrogantes que se le plantea en clase.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p1" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Nunca las tiene</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p1" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Tiene</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p1" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Siempre las tiene</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p2">En la explicación desarrollada, advierte Ud., que el docente domina la asignatura.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p2" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Bastante</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p2" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Regular</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p2" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nada</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p3">Los objetivos planteados en su criterio, están relacionados con los contenidos que el docente desarrolla en cada clase.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p3" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Muy bien relacionados</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p3" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Relacionados</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p3" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nada relacionados</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p4">En el desarrollo del tema, el docente demuestra falta de conocimientos</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p4" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Frecuentemente</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p4" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Alguna vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p4" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p5">El docente, tiene facilidad en la ejemplificación de algunos temas.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p5" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Bastante facilidad</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p5" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Relativa</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p5" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Ninguna facilidad</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<h4 class="blue">2. USO DE CONOCIMIENTOS:</h4>
													<div class="row">
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p6">En el desarrollo de la asignatura<br>El docente, demuestra el uso de la totalidad de sus conocimientos.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p6" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Bastante facilidad</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p6" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Relativa</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p6" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Ninguna facilidad</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p7">Utiliza distintos criterios o ejemplos para explicar la misma idea.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p7" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p7" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Casi siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p7" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p8">El docente demuestra preocupación sobre la formación del alumno.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p8" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p8" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Casi siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p8" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p9">El docente es exigente consigo mismo.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p9" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p9" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Casi siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p9" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p10">El docente es exigente con el estudiante.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p10" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p10" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Casi siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p10" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<h4 class="blue">3. ACTUALIZACIÓN DE CONOCIMIENTOS</h4>
													<div class="row">
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p11">El docente, demuestra que utiliza información actualizada en el desarrollo de su clase.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p11" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p11" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Casi siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p11" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p12">Los ejemplos utilizados, tienen que ver con los avances de la ciencia y la tecnología, o la realidad actual.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p12" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Si</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p12" type="radio" class="ace" value="2"/>
																			<span class="lbl"> No</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p13">En el desarrollo de la gestión académica el docente sugiere al alumno, nueva bibliografía.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p13" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Si</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p13" type="radio" class="ace" value="2"/>
																			<span class="lbl"> No</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="step-pane" data-step="2">
												<div class="">
													<h4 class="blue">1. PLANIFICACIÓN:</h4>
													<div class="row">
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p14">El docente hace conocer los objetivos de la clase.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p14" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p14" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p14" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p15">El docente presenta, la Información de manera organizada.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p15" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p15" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p15" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p16">El docente luego de transcurrida la clase, realiza una síntesis de la misma.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p16" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p16" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p16" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<h4 class="blue">2. MOTIVACIÓN:</h4>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p17">El docente presenta, el tema en forma motivadora.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p17" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p17" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p17" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p18">El docente, intercala en la exposición algunas preguntas que estimulen la atención.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p18" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Si</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p18" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Frecuentemente</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p18" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p19">El docente, dirige preguntas al auditorio.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p19" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p19" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p19" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p20">El docente, mantiene interesado al auditorio.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p20" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Si</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p20" type="radio" class="ace" value="2"/>
																			<span class="lbl"> No</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<h4 class="blue">3. DIÁLOGO:</h4>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p21">En el desarrollo de la clase, el docente: <br>Acepta criterios distintos a los de su exposición:</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p21" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p21" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p21" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p22">El docente, en su trabajo de aula.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p22" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre dialoga con los estudiantes</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p22" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Dialoga Alguna vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p22" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca dialoga</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p23">Cuando se le interroga, el docente:</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p23" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Responde</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p23" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Se molesta</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p23" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Es indiferente</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p24">Al finalizar la clase y a requerimiento de los alumnos, el docente.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p24" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Aclara dudas a los estudiantes</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p24" type="radio" class="ace" value="2"/>
																			<span class="lbl"> No presta atención al requerimiento</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p24" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Se marcha</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p25">El docente en clase, impone sus criterios.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p25" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p25" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p25" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<h4 class="blue">4. MÉTODO:</h4>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p26">En su criterio, el docente, a lo largo de su exposición refuerza los datos más significativos.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p26" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p26" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Casi Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p26" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Rara vez</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p26" type="radio" class="ace" value="4"/>
																			<span class="lbl"> Nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p27">El docente, en su exposición es.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p27" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Muy claro</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p27" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Poco claro</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p27" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Nada claro</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p28">Ud., cree que el docente utiliza.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p28" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Un buen método de enseñanza</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p28" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Un método aceptable</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p28" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Un método poco aceptable</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="step-pane" data-step="3">
												<div class="">
													<h4 class="blue">1. ASISTENCIA:</h4>
													<div class="row">
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p29">El docente cumple con los horarios establecidos.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p29" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p29" type="radio" class="ace" value="2"/>
																			<span class="lbl"> Casi Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p29" type="radio" class="ace" value="3"/>
																			<span class="lbl"> No cumple</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p30">El docente devuelve los exámenes oportunamente.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p30" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p30" type="radio" class="ace" value="2"/>
																			<span class="lbl"> A veces</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p30" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Casi nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-xs-12">
															<div class="form-group has-feedback">
																<label class="control-label" for="p31">El docente resuelve y/o analiza los exámenes.</label>
																<div class="input-group row">
																	<div class="radio">
																		<label>
																			<input name="p31" type="radio" class="ace" value="1"/>
																			<span class="lbl"> Siempre</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p31" type="radio" class="ace" value="2"/>
																			<span class="lbl"> A veces</span>
																		</label>
																	</div>
																	<div class="radio">
																		<label>
																			<input name="p31" type="radio" class="ace" value="3"/>
																			<span class="lbl"> Casi nunca</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer wizard-actions">
										<button class="btn btn-sm btn-prev">
											<i class="ace-icon fa fa-arrow-left"></i>
											Anterior
										</button>
										<button class="btn btn-success btn-sm btn-next" data-last="Finalizar">
											Siguiente
											<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
										</button>
									</div>
								</div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
						<div class="col-lg-12 col-md-12 col-xs-12">
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
	var idFp;
	var datos;

	$(function () {
		$('#wizard-encuesta').ace_wizard();

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
			$(this).each(function () {
				this.reset();
			});
		};

		jQuery.fn.getSelectionStart = function () {
			if (this.lengh == 0)
				return -1;
			input = this[0];

			var pos = input.value.length;

			if (input.createTextRange) {
				var r = document.selection.createRange().duplicate();
				r.moveEnd('character', input.value.length);
				if (r.text == '')
					pos = input.value.length;
				pos = input.value.lastIndexOf(r.text);
			} else if (typeof (input.selectionStart) != "undefined")
				pos = input.selectionStart;

			return pos;
		};

		jQuery.fn.getSelectionEnd = function () {
			if (this.lengh == 0)
				return -1;
			input = this[0];

			var pos = input.value.length;

			if (input.createTextRange) {
				var r = document.selection.createRange().duplicate();
				r.moveStart('character', -input.value.length);
				if (r.text == '')
					pos = input.value.length;
				pos = input.value.lastIndexOf(r.text);
			} else if (typeof (input.selectionEnd) != "undefined")
				pos = input.selectionEnd;

			return pos;
		};

		setKeypressFunction();

	});

	function setKeypressFunction() {
		var charLimit = 1;
		var selector = '.inputs';

		$(selector).keydown(function (e) {

			var keys = [8, 9, /*16, 17, 18,*/ 19, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 46, 144, 145, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105];

			if (e.which == 8 && this.value.length == 0) {
				console.log('1');
				var index = $(selector).index(this) - 1;
				$(selector).eq(index).focus();
			} else if ($.inArray(e.which, keys) >= 0) {
				console.log('2');
				return true;
			} else if (this.value.length >= charLimit) {
				console.log('3');
				var index = $(selector).index(this) + 1;
				$(selector).eq(index).focus();
				return false;
			} else if (e.shiftKey || e.which <= 47 || e.which >= 58) {
				console.log('4');
				return false;
			}
		}).keyup(function (e) {
			if (e.wich != 46) {
				if (this.value.length >= charLimit) {
					console.log('5');
					var index = $(selector).index(this) + 1;
					$(selector).eq(index).focus();
					return false;
				}
			} else {
				console.log('6');
				this.value = '';
			}

		});
	}

	function nuevo() {

		$('#form').resetear();
		$('#nuevo').modal('show');
		$("#guardar-btn").unbind("click");
		$("#guardar-btn").bind("click", function () {
			guardar_nuevo();
		});
	}

	function guardar_nuevo() {
		$('#form').validator('validate');

		if (!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();
			datos.push({name: 'id_materia', value: "${docente.id_materia}"});
			datos.push({name: 'id_grupo', value: "${docente.id_grupo}"});
			datos.push({name: 'id_gestion', value: "${docente.id_gestion}"});
			datos.push({name: 'id_docente', value: "${docente.id_docente}"});

			$.ajax({
				type: "POST",
				url: 'encuesta/guardar.html',
				data: datos,
				success: function (response) {
					$('#nuevo').modal('hide');
					location.reload();
				}
			});
		} else {
			$('.has-error input').val('');
		}
	}

	function editar(id) {
		$.ajax({
			type: "POST",
			url: 'encuesta/buscar.html?id_encuesta=' + id,

			success: function (response) {

				$('#form').resetear();
				populate_form(response);
				$('#nuevo').modal('show');
				$('#form').validator('validate');
				$("#guardar-btn").unbind("click");
				$("#guardar-btn").bind("click", function () {
					guardar_editar(id);
				});
			},
			error: function () {
				alert('Ocurrio un error inesperado');
			}
		});
	}

	function guardar_editar(id) {
		$('#form').validator('validate');

		if (!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();
			datos.push({name: 'id_encuesta', value: id});

			$.ajax({
				type: "POST",
				url: 'encuesta/modificar.html',
				data: datos,
				success: function (response) {
					$('#nuevo').modal('hide');
				}
			});
		} else {
			$('.has-error input').val('');
		}
	}

	function eliminar(id) {

		$('#confirmar').modal('show');
		$("#confirmar-eliminar-btn").unbind("click");
		$("#confirmar-eliminar-btn").bind("click", function () {
			guardar_eliminar(id);
		});
	}

	function guardar_eliminar(id) {
		$.ajax({
			type: "POST",
			url: 'encuesta/eliminar.html?id_encuesta=' + id,

			success: function (response) {
				$('#confirmar').modal('hide');
				location.reload();
			},
			error: function () {
				alert('Ocurrio un error inesperado');
			}
		});
	}

	function reporteGeneral() {
		$.ajax({
			type: "POST",
			url: 'encuesta/reporte_general.html',

			success: function (response) {
				var win = window.open(response, '_blank');
				win.focus();
			},
			error: function () {
				alert('Ocurrio un error inesperado');
			}
		});
	}

	function populate_form(datos) {
		//console.log(datos[0]);
		$.each(datos, function (name, val) {
			var $el = $('[name="' + name + '"]'),
					type = $el.attr('type');

			switch (type) {
				case 'checkbox':
					$el.attr('checked', 'checked');
					break;
				case 'radio':
					$el.filter('[value="' + val + '"]').attr('checked', 'checked');
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

</style>

<jsp:include page="/comun/pie.html"/>