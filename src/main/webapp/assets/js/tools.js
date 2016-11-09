function jjAyax(page, datos, panel, tipo, fun){
	$.ajax({
		url:page,
		type:(tipo?tipo:"POST"),
		data:datos,
		beforeSend:function(){
			$(panel).html('<div class="alert alert-info text-center">C a r g a n d o . . .<br><div class="spsg0"> <div class="spsg spsg1"></div> <div class="spsg spsg2"></div> <div class="spsg spsg3"></div> <div class="spsg spsg4"></div> <div class="spsg spsg5"></div> <div class="spsg spsg6"></div> <div class="spsg spsg7"></div> <div class="spsg spsg8"></div> </div>  </div>');
			$(panel).show();
		},
		success:function(html){
			var $html = $(html);
			if($html.find("input[name='j_username']").size()>0)
				window.location="/sg-contrataciones/j_spring_security_logout";
			else {
				$(panel).html($html);
				$(panel).slideDown();
				if(typeof fun=='function')
					fun();
			}
		},
		error: function(xhr, error){
			$(panel).html('<div class="alert alert-danger center"><i class="ace-icon fa fa-exclamation-triangle red"></i><b> Error: </b>No se pudo cargar la página.</div>');
		}
	});
	return false;
}


BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = 'Información';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = 'Información';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = 'Información';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = 'Correcto';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = 'Alerta';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = 'Peligro';
BootstrapDialog.DEFAULT_TEXTS['OK'] = 'Aceptar';
BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = 'Cancelar';
BootstrapDialog.DEFAULT_TEXTS['CONFIRM'] = 'Confirmación';

bootbox.setDefaults("locale", "es");


Number.prototype.fm=function(c, t, d){
	var n=this,
		c=isNaN(c=Math.abs(c))?2:c,
		d=d==undefined?".":d,
		t=t==undefined?"":t,
		s=n<0?"-":"",
		i=parseInt(n=Math.abs(+n||0).toFixed(c))+"",
		j=(j=i.length)>3?j%3:0;
	return s+(j?i.substr(0, j)+t:"")+i.substr(j).replace(/(\d{3})(?=\d)/g, "$1"+t)+(c?d+Math.abs(n-i).toFixed(c).slice(2):"");
};






Date.isLeapYear=function(year){
	return (((year%4===0)&&(year%100!==0))||(year%400===0));
};
Date.getDaysInMonth=function(year, month){
	return [31, (Date.isLeapYear(year)?29:28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
};
Date.prototype.isLeapYear=function(){
	var y=this.getFullYear();
	return (((y%4===0)&&(y%100!==0))||(y%400===0));
};
Date.prototype.getDaysInMonth=function(){
	return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
};
Date.prototype.addMonths=function(value){
	var n=this.getDate();
	this.setDate(1);
	this.setMonth(this.getMonth()+value);
	this.setDate(Math.min(n, this.getDaysInMonth()));
	return this;
};
Date.prototype.addDays=function(value){
	var n=this.getDate();
	this.setDate(this.getDate()+value);
	return this;
};
function currency(value, decimals, separators) {
    decimals = decimals >= 0 ? parseInt(decimals, 0) : 2;
    separators = separators || ['.', "'", ','];
    var number = (parseFloat(value) || 0).toFixed(decimals);
    if (number.length <= (4 + decimals))
        return number.replace('.', separators[separators.length - 1]);
    var parts = number.split(/[-.]/);
    value = parts[parts.length > 1 ? parts.length - 2 : 0];
    var result = value.substr(value.length - 3, 3) + (parts.length > 1 ?
        separators[separators.length - 1] + parts[parts.length - 1] : '');
    var start = value.length - 6;
    var idx = 0;
    while (start > -3) {
        result = (start > 0 ? value.substr(start, 3) : value.substr(0, 3 + start))
            + separators[idx] + result;
        idx = (++idx) % 2;
        start -= 3;
    }
    return (parts.length == 3 ? '-' : '') + result;
}


function __crear_dialogos(){
	__$msg=$("#__msg");
	__$stit=$("#__stit");
	__$con=$("#__con");
	__$msg.removeClass("hide").dialog({
		autoOpen:false,
		modal:true,
		resizable:false,
		width:'400',
		title:"<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-cogs'></i> D T I C </h4></div>",
		title_html:true,
		buttons:[
			{
				html:"<i class='ace-icon fa fa-ok'></i> Continuar",
				"class":"btn btn-xs btn-primary btn-round",
				click:function (){ $(this).dialog("close"); }
			}
		]
	});
	__$wait=$("#__wait");
	__$wait.removeClass("hide").dialog({autoOpen:false, modal:true, closeOnEscape:false, dialogClass:'hide-close',
		hide:"scale", resizable:false,
		title_html:true,
		title:"<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-cogs'></i> D T I C </h4></div>"
	});
}

function __showMsg(t, st, c, a){
//	__$msg.dialog({title:t?t:''});
	__$stit.html(st);
	__$con.html(c).css("text-align", (a?"left":"center"));
	__$msg.dialog("open");
}
function __isError(json){
	if(json.logout)
		window.location="/sg-contrataciones/j_spring_security_logout";
	if(json.error){
		__showMsg("¡ E R R O R !", null, "<i class='ace-icon fa fa-exclamation-triangle red'></i> Ocurrió un error durante la transacción.<br/>"+json.error);
		return true;
	}
}