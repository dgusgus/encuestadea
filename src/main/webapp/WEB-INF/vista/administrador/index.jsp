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
            Administrador 
            <small class="hidden-xs">
                <i class="ace-icon fa fa-angle-double-right"></i>
                Gesti?n de los usuarios, comisiones, etc.
            </small>
        </h1>
    </div>

    <div class="row">

        <div class="col-sm-12 widget-container-col ui-sortable">
            <div class="widget-box ui-sortable-handle">
                <div class="widget-header widget-header-small">
                    <h4 class="widget-title">Administraci?n del Sistema</h4>
                    <div class="widget-toolbar">
                        <a class="orange2" data-action="fullscreen" href="#"><i class="ace-icon fa fa-expand"></i></a>
                        <a data-action="collapse" href="#"><i class="ace-icon fa fa-chevron-up"></i></a>
                    </div>
                    <div class="widget-toolbar">
                        <button  id="btnew" class="btn btn-minier btn-primary btn-round"><i class="ace-icon fa fa-plus"></i>A?adir Usuarios</button>
                    </div>
                </div>

                <div class="widget-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- #section:elements.tab.position -->
                            <div class="tabbable tabs-left">
                                <ul class="nav nav-tabs" id="myTab3">
                                    <li class="active">
                                        <a data-toggle="tab" href="#usuarios_tab">
                                            <i class="green ace-icon fa fa-user bigger-110"></i>
                                            Usuarios
                                        </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div id="usuarios_tab" class="tab-pane in active">
                                        <div class="ventana" id="usuarios">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /section:elements.tab.position -->
                        </div>
                    </div><!-- /.row -->
                </div>
            </div>
        </div>
    </div>
</div><!-- /.page-content -->



<div id="form-nuevo" class="hide">
    <div class="center">
        <span class="input-icon">
            <input type="text" id="ibusc" class="input-xlarge" placeholder="Nombre ? C.I."/>
            <i class="ace-icon fa fa-search blue"></i>
        </span>
        <!--<div class="space-4"></div>-->
        <hr/>
        <div class="pfoto wfoto hfoto">
            <div class="wfoto hfoto" style="position:absolute;background:transparent;"></div>
            <img id="ifoto" class="hfoto" style="margin:0 0 0 -40px"
                 onload='$(this).show("scale");'/>
        </div>
        <div class="space-10"></div>
        <div class="profile-user-info profile-user-info-striped">
            <div class="profile-info-row">
                <div class="profile-info-name">Nombre</div>
                <div class="profile-info-value"><span id="snom"></span></div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name">C.I.</div>
                <div class="profile-info-value"><span id="sdip"></span></div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name">Cuenta</div>
                <div class="profile-info-value"><input id="fusr" type="text" class="form-control" ></div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="control-label">Password</label>
                <div class="form-inline row">
                    <div class="form-group col-sm-6">
                        <input type="password" data-minlength="6" class="form-control" id="inputPassword" placeholder="Password" required>
                        <div class="help-block">Minimo 6 Caracteres</div>
                    </div>
                    <div class="form-group col-sm-6">
                        <input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Las contrase?as deben ser iguales" placeholder="Confirmar" required>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
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
                <h4 class="modal-title" id="myModalLabel">?Borrar?</h4>
            </div>
            <div class="modal-body">
                ?Est? seguro de Borrar el elemento? 
            </div>
            <div class="modal-footer">
                <button id="confirmar-eliminar-btn" type="button" class="btn btn-primary" >Si</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/chosen.jquery.min.js" ></script>
<script type="text/javascript">

    $(function () {

        $.ajax({
            url: "usuario/index.html",
            success: function (result) {
                $("#usuarios").html(result);
            }
        });

        $('#form-nuevo').on('shown.bs.modal', function (e) {
            $('#form-nuevo').validator();
        });

        $("#btnew").click(function () {
            abrirFormularioNuevo();
        });

    });

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

    function abrirFormularioNuevo() {
        //$('#form-nuevo').resetear();
        $('#form-nuevo').modal('show');
        $("#guardar-btn").unbind("click");
        $("#guardar-btn").bind("click", function () {
            guardar_nuevo();
        });
    }

    function guardar_nuevo() {
        $('#form').validator('validate');

        if (!$('#form').find('.has-error').length) {
            datos = $('#form').serializeArray();
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
                //$('#form').resetear();
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
</script>

<style type="text/css">
    .ui-dialog, .ui-dialog-content{
        overflow:visible !important;
    }
    input[type=number]::-webkit-outer-spin-button,
    input[type=number]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    input[type=number] {
        -moz-appearance:textfield;
    }
    .well {
        margin-bottom:0px;
    }

    .ui-autocomplete {
        max-height:180px;
        overflow-y:auto;
        overflow-x:hidden;
        padding-right:20px;
    }
    .ui-autocomplete-loading {
        background: white url("assets/img/loading.gif") right center no-repeat;
    }

    .wfoto{
        width:170px;
    }
    .hfoto{
        height:160px;
    }
    .pfoto{
        display:inline-block;
        overflow:hidden;
        border:1px solid #aaa;
        border-radius:6px;
        -webkit-border-radius:6px;
        box-shadow:3px 3px 1px #666;
        background:#fff url("assets/css/images/overlay.png") repeat scroll 0 0;
        margin:0 20px;
    }
</style>

<jsp:include page="/comun/pie.html"/>