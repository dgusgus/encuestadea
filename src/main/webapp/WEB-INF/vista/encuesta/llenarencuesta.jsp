<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>

<fmt:setLocale value="es_BO" scope="session"/>

<jsp:include page="/comun/cabecera_2.html"/>
<spring:url value="/encuesta/guardarencuestaestudiante.html" var="urlguardar"/>
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
										<form id="form">
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
										</form>
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
		$('#form').submit(function(e){
			return false;
		});
		$('#wizard-encuesta').ace_wizard()
		.on('finished.fu.wizard', function(e) {
			guardar_nuevo();
		}).on('stepclick.fu.wizard', function(e){
		}).on('actionclicked.fu.wizard' , function(e, info){
			$('html, body').animate({scrollTop:0}, '300');
		});
	});

	function guardar_nuevo() {
		datos = $('#form').serializeArray();
		datos.push({name: 'id_materia', value: "${docente.id_materia}"});
		datos.push({name: 'id_grupo', value: "${docente.id_grupo}"});
		datos.push({name: 'id_gestion', value: "${docente.id_gestion}"});
		datos.push({name: 'id_docente', value: "${docente.id_docente}"});
		datos.push({name: 'id_estudiante_materia', value: "${datos.id_estudiante_materia}"});
		datos.push({name: 'id_docente', value: "${docente.id_docente}"});
		$.ajax({
			type: "POST",
			url: window.location.origin+'/encuestadea/encuesta/guardarencuestaestudiante.html',
			data: datos,
			success: function (response) {
				Swal.fire({
					title: '¡Gracias por participar en la encuesta!',
					html: 'Sus respuestas fueron guardadas exitosamente, su participación ya fue registrada. '+'<br>Redirigiendo a <small>'+ window.location.origin+'/encuestadea/seguridad/loginestudiante.html?consulta=${consulta}</small>',
					timer: 8000,
					timerProgressBar: true,
					didOpen: () => {
						Swal.showLoading()
					},
					willClose: () => {
					}
				}).then((result) => {
					if (result.dismiss === Swal.DismissReason.timer) {
						window.location.replace(window.location.origin+'/encuestadea/seguridad/loginestudiante.html?consulta=${consulta}');
					}
				});
			},
			error: function(response){
				Swal.fire({
					icon: 'error',
					title: '¡Error al verificar sus datos!',
					html: 'Error al guardar sus datos, la encuesta ya esta cerrada o el estudiante ya emitió su encuesta.'
							+'Redirigiendo a '
							+ window.location.origin+'/encuestadea/seguridad/loginestudiante.html?consulta=${consulta}',
					timer: 8000,
					timerProgressBar: true,
					didOpen: () => {
						Swal.showLoading()
					},
					willClose: () => {
					}
				}).then((result) => {
					if (result.dismiss === Swal.DismissReason.timer) {
						window.location.replace(window.location.origin+'/encuestadea/seguridad/loginestudiante.html?consulta=${consulta}');
					}
				})
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