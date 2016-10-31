<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags" %>

</div> <!-- /.main-content-inner -->
</div><!-- /.main-content -->

<div class="footer">
	<div class="footer-inner">
		<div class="footer-content">
			<span class="bigger-120">
				<span class="blue bolder">D.T.I.C.</span> &copy; <%= session.getAttribute("__gestion").toString()%>
				<br/>
				<small>Dirección de Tecnologías de Información y Comunicación</small>
			</span>
		</div>
	</div>
</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>
</div><!-- /.main-container -->

<div id="__msg" class="hide">
	<div>
		<h3 id="__stit" style="text-align:center"></h3>
		<p id="__con"></p>
	</div>
</div>
<div id="__wait" class="hide">
	<div>
		<p style="background-color:#fff;text-align:center">
			Se está procesando su solicitud.<br/>
			<img src="assets/img/procesando.gif"/><br/>
			Espere por favor...
		</p>
	</div>
</div>

<script type="text/javascript">
<c:set var="script">
$(function (){
	__crear_dialogos();
});

if('ontouchstart' in document.documentElement)
	document.write('<script src="assets/js/jquery.mobile.custom.min.js"><\/script>');
</c:set>
<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
</script>
<script src="assets/js/bootstrap.min.js" ></script>
<script src="assets/js/bootstrap-dialog.min.js" ></script>
<script src="assets/js/bootbox.min.js" ></script>

<script src="assets/js/ace-elements.min.js" ></script>
<script src="assets/js/ace.min.js" ></script>

<script type="text/javascript" charset="utf-8" src="assets/js/tools.js" ></script>

</body>
</html>
