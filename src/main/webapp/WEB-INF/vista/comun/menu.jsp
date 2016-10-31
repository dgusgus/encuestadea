<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="nivel" value="${-1}"/>
	<c:set var="pila" value="${0}"/>
	<c:forEach items="${menus}" var="menui" varStatus="contador">
		<c:if test="${menui.nivel>nivel}">
<ul class="${nivel>=0?"submenu":"nav nav-list"}">
	<li>
		<a href="${menui.ruta}" class="${menui.ruta=="#"?"dropdown-toggle":""}">
			<i class="menu-icon fa fa-leaf green"></i>
			<span>${menui.enlace}</span>
			<b class="arrow ${menui.ruta=="#"?"fa fa-angle-down":""}"></b>
		</a>
		<b class="arrow"></b>
			<c:set var="pila" value="${pila+1}"/>
		</c:if>
		<c:if test="${menui.nivel==nivel}">
	</li>
	<li>
		<a href="${menui.ruta}" class="${menui.ruta=="#"?"dropdown-toggle":""}">
			<i class="menu-icon fa fa-leaf green"></i>
			<span>${menui.enlace}</span>
			<b class="arrow ${menui.ruta=="#"?"fa fa-angle-down":""}"></b>
		</a>
		<b class="arrow"></b>
		</c:if>
		<c:if test="${menui.nivel<nivel}">
			<c:forEach var="i" begin="1" end="${nivel-menui.nivel}">
	</li>
</ul>
			</c:forEach>
			<c:set var="pila" value="${pila-nivel+menui.nivel}"/>
	</li>
	<li>
		<a href="${menui.ruta}" class="${menui.ruta=="#"?"dropdown-toggle":""}">
			<i class="menu-icon fa fa-leaf green"></i>
			<span>${menui.enlace}</span>
			<b class="arrow ${menui.ruta=="#"?"fa fa-angle-down":""}"></b>
		</a>
		<b class="arrow"></b>
		</c:if>
		<c:set var="nivel" value="${menui.nivel}"/>
	</c:forEach>
	<c:forEach var="i" begin="1" end="${pila}">
	</li>
</ul>
	</c:forEach>
