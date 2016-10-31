<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${roles}" var="r">
<li><a href="#" data-rol="${r.idRol}"><i class="ace-icon fa fa-user"></i>${r.rol}</a></li>
</c:forEach>
