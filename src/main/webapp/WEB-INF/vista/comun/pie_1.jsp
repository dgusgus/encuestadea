            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <div class="navbar navbar-fixed-bottom">
                <div class="navbar-inner">
                    <p class="centro"><small>Universidad T&eacute;cnica de Oruro - D.T.I.C. - Desarrollado por DTIC  <c:out value="${gestion}" /> Version <c:out value="${version}"/></small></p>
                </div>
            </div>                          
        </div>  
        
        
        
        <script src="<c:url value="/js/jquery.min.js" />"></script>
        <script src="<c:url value="/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/js/bootstrap-datepicker.js" />"></script>
        <script src="<c:url value="/js/locales/bootstrap-datepicker.es.js" />"></script>
        <script>
            $(function(){
                window.prettyPrint && prettyPrint();
                $('#m3181').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3182').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3201').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3202').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3221').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3222').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3241').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3242').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3611').datepicker({format: 'dd/mm/yy', language:'es'});
                $('#m3612').datepicker({format: 'dd/mm/yy', language:'es'});
            });
        </script>
    </body>
</html>