<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="es_BO" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-xs-10">
	<div class="widget-box widget-color-blue">
		<div class="widget-header">
			<h5 class="widget-title">Actividades de investigación en el P.E.A. según el plan</h5>
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
			<h5 class="widget-title">Actividades de investigación en el P.E.A. según el plan</h5>
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