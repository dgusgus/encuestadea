
						<div class="row">

							<div class="col-xs-6">
								<!-- PAGE CONTENT BEGINS -->
<h1>Menú 2</h1>
	<c:set var="nivel" value="${-1}"/>
	<c:set var="pila" value="${0}"/>
	<c:forEach items="${menus}" var="menui" varStatus="contador">
		<c:if test="${menui.nivel>nivel}">
<ul>
	<li>
		<a href="${menui.ruta}"><span>${menui.enlace}</span></a>
			<c:set var="pila" value="${pila+1}"/>
		</c:if>
		<c:if test="${menui.nivel==nivel}">
	</li>
	<li>
		<a href="${menui.ruta}"><span>${menui.enlace}</span></a>
		</c:if>
		<c:if test="${menui.nivel<nivel}">
			<c:forEach var="i" begin="1" end="${nivel-menui.nivel}">
	</li>
</ul>
			</c:forEach>
			<c:set var="pila" value="${pila-nivel+menui.nivel}"/>
	</li>
	<li>
		<a href="${menui.ruta}"><span>${menui.enlace}</span></a>
		</c:if>
		<c:set var="nivel" value="${menui.nivel}"/>
	</c:forEach>
	<c:forEach var="i" begin="1" end="${pila}">
	</li>
</ul>
	</c:forEach>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->

						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">D.T.I.C.</span> &copy; 2015
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

		<script>window.jQuery||document.write('<script src="assets/js/jquery.min.js"><\/script>')</script>
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement)
				document.write('<script src="assets/js/jquery.mobile.custom.min.js"><\/script>');
		</script>
		<script src="assets/js/bootstrap.min.js" ></script>
		<script src="assets/js/ace-elements.min.js" ></script>
		<script src="assets/js/ace.min.js" ></script>

		<script type="text/javascript">
			$("#menurol a[data-rol]").click(function(e){
				e.preventDefault();
				var panel="#p-menu-prin";
				var id = $(this).attr("data-rol");
				console.log( id + " :: " + $(this).text() );
				$.ajax({url:"comun/menu.html"
					,type:"POST"
					,data:{idRol:id}
					,beforeSend:function(){
						$(panel).html("<div class='cargando'>Cargando...</div>");
					}
					,success:function(html){
						$(panel).html(html);
					}
					,error: function(xhr, error){
						$(panel).html('<div class="ui-state-error ui-corner-all" style="width:400px;display:inline-block"><p>No se pudo cargar la página: '+page+'</p></div>');
					}
				});
			});

		</script>


	</body>
</html>
