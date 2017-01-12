<%-- 
    Document   : index
    Created on : Nov 22, 2016, 5:11:01 pM
    Author     : raul velasquez
--%>
<%@page import="org.dtic.tools.Tools"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>

<p>usuarios</p>

<script type="text/javascript">
	<c:set var="script">
	var idFp;
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
		
	jQuery.fn.getSelectionStart = function(){
    if(this.lengh == 0) return -1;
    input = this[0];
 
    var pos = input.value.length;
 
    if (input.createTextRange) {
      var r = document.selection.createRange().duplicate();
      r.moveEnd('character', input.value.length);
      if (r.text == '') 
        pos = input.value.length;
      pos = input.value.lastIndexOf(r.text);
    } else if(typeof(input.selectionStart)!="undefined")
      pos = input.selectionStart;
 
    return pos;
  };
 
  jQuery.fn.getSelectionEnd = function(){
    if(this.lengh == 0) return -1;
    input = this[0];
 
    var pos = input.value.length;
 
    if (input.createTextRange) {
      var r = document.selection.createRange().duplicate();
      r.moveStart('character', -input.value.length);
      if (r.text == '') 
        pos = input.value.length;
      pos = input.value.lastIndexOf(r.text);
    } else if(typeof(input.selectionEnd)!="undefined")
      pos = input.selectionEnd;
 
    return pos;
  };
		
		setKeypressFunction();
		
		
	});

	function setKeypressFunction(){
		var charLimit = 1;
		var selector = '.inputs';
				
		$(selector).keydown(function(e) {			
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
		}).keyup (function (e) {
			if(e.wich != 46){
				if (this.value.length >= charLimit) {
                                    console.log('5');
					var index = $(selector).index(this) + 1;
					$(selector).eq(index).focus();
					return false;
				}
			}else{
                            console.log('6');
				this.value = '';
			}
			
		});
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
		
		if(!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();
			datos.push({name: 'id_materia', value: "${docente.id_materia}"});
			datos.push({name: 'id_grupo', value: "${docente.id_grupo}"});
			datos.push({name: 'id_gestion', value: "${docente.id_gestion}"});
			datos.push({name: 'id_docente', value: "${docente.id_docente}"});
			
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

	function editar(id){
		$.ajax({
			type: "POST",
			url: 'encuesta/buscar.html?id_encuesta='+id,        
			success: function(response){ 
				$('#form').resetear();
				populate_form(response);
				$('#nuevo').modal('show');
				$('#form').validator('validate');
				$( "#guardar-btn").unbind( "click" );
				$( "#guardar-btn" ).bind( "click", function() {
					  guardar_editar(id);
				});
			},
			error: function(){alert('Ocurrio un error inesperado');}
		});
	}
	
	function guardar_editar(id){
		$('#form').validator('validate');		
		
		if(!$('#form').find('.has-error').length) {
			datos = $('#form').serializeArray();
			datos.push({name: 'id_encuesta', value: id});		
			
			$.ajax({
				type: "POST",
				url: 'encuesta/modificar.html',
				data: datos,
				success: function(response){ $('#nuevo').modal('hide');}
			});
		} 
		else{
			$('.has-error input').val('');
		}
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
	
	function reporteGeneral(){
		$.ajax({
			type: "POST",
			url: 'encuesta/reporte_general.html',        
			success: function(response){
				var win = window.open(response, '_blank');
				win.focus();
			},
			error: function(){alert('Ocurrio un error inesperado');}
		});
	}
	
	function populate_form(datos){
		//console.log(datos[0]);
		$.each(datos, function(name, val){
			var $el = $('[name="'+name+'"]'),
				type = $el.attr('type');			
			switch(type){
				case 'checkbox':
					$el.attr('checked', 'checked');
					break;
				case 'radio':
					$el.filter('[value="'+val+'"]').attr('checked', 'checked');
					break;
				default:
					$el.val(val);
			}
		});
	}
	</c:set>
	<%= Tools.ofuscarJavaScript(pageContext.getAttribute("script").toString())%>
</script>

