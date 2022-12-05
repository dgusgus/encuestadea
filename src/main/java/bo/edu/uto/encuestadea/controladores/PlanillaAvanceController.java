/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.edu.uto.encuestadea.controladores;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import bo.edu.uto.encuestadea.dominios.PlanillaAvanceDetalle;
import bo.edu.uto.encuestadea.mapas.PlanillaAvanceDetalleMapa;
import java.util.Date;
import javax.servlet.http.HttpSession;
//librerias nuevas
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import java.util.Map;

/**
 *
 * @author raul
 */

@Controller
@RequestMapping("/planillaavance/**")
public class PlanillaAvanceController {

	@Autowired
	PlanillaAvanceDetalleMapa planillaavancedetalleMapa;

	@RequestMapping(value = "/index")
	@ResponseBody
	public ModelAndView index()
	{
		//List<PlanillaAvanceDetalle> actividades;
		//HashMap modelo = new HashMap();
		//actividades = planillaavancedetalleMapa.getAll();
		//System.out.println(actividades);
		//modelo.put("actividades", actividades);
		return new ModelAndView("PlanillaAvance/index");
	}

	@RequestMapping(value = "/actualizar")
	@ResponseBody
	public Object actualizar(PlanillaAvanceDetalle Planilladeavancedetalle, HttpSession hs)
		throws ParseException {
		HashMap modelo = new HashMap();
		Integer id_usuarioModificar = (Integer) hs.getAttribute("__id_usuario");
		Planilladeavancedetalle.setId_usuario_mod(id_usuarioModificar);
		Planilladeavancedetalle.setId_estado(true);
		Planilladeavancedetalle.setFecha_mod(new Date());
		//System.out.println(Planilladeavancedetalle);
		planillaavancedetalleMapa.ActulizarInsert(Planilladeavancedetalle);
		modelo.put("Planilladeavancedetalle", Planilladeavancedetalle);
		return modelo;
	}

	@RequestMapping(value = "/modalAvance")
	@ResponseBody
	public ModelAndView modalAvance() throws ParseException {
		return new ModelAndView("PlanillaAvance/ModalAgregar");
	}

	@RequestMapping(value = "/tablaAvance")
	@ResponseBody
	public ModelAndView tablaAvance() throws ParseException	{
		HashMap modelo = new HashMap();
		List actividades = planillaavancedetalleMapa.getAll();
		//System.out.println(actividades);
		modelo.put("actividades", actividades);
		return new ModelAndView("PlanillaAvance/Tabla", modelo);
	}

	@RequestMapping(value = "/nuevo")
	@ResponseBody
	public Object nuevo(PlanillaAvanceDetalle Planilladeavancedetalle, HttpSession hs, String fecha_planificacion1,String fecha_ejecucion1,String fecha_mod1)
		throws ParseException {
		HashMap modelo = new HashMap();
		Integer id_usuarioModificar = (Integer) hs.getAttribute("__id_usuario");
		Planilladeavancedetalle.setFecha_planificacion(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_planificacion1));
		Planilladeavancedetalle.setFecha_ejecucion(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_ejecucion1));
		Planilladeavancedetalle.setId_usuario_mod(id_usuarioModificar);
		Planilladeavancedetalle.setId_estado(true);
		Planilladeavancedetalle.setFecha_mod(new Date());
		Planilladeavancedetalle.setId_planilla_avance(1);
		//System.out.println(Planilladeavancedetalle);
		planillaavancedetalleMapa.insert(Planilladeavancedetalle);
		modelo.put("Planilladeavancedetalle", Planilladeavancedetalle);
		return modelo;
	}

	@RequestMapping(value = "/getById")
	@ResponseBody
	public Object getById(Integer id) {
		HashMap modelo = new HashMap();
		//System.out.println(id);
		PlanillaAvanceDetalle planillaAD = planillaavancedetalleMapa.getById(id);
		//System.out.println(planillaAD);
		modelo.put("planillaAD", planillaAD);
		return modelo;
	}

	@RequestMapping(value = "/editar")
	@ResponseBody
	public Object editar(PlanillaAvanceDetalle Planilladeavancedetalle, HttpSession hs,String fecha_planificacion1,String fecha_ejecucion1,String fecha_mod1) throws ParseException {
		HashMap modelo = new HashMap();
		//System.out.println(""+Planilladeavancedetalle);
		Integer id_usuarioModificar = (Integer) hs.getAttribute("__id_usuario");
		Planilladeavancedetalle.setFecha_planificacion(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_planificacion1));
		Planilladeavancedetalle.setFecha_ejecucion(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_ejecucion1));
		Planilladeavancedetalle.setId_usuario_mod(id_usuarioModificar);
		Planilladeavancedetalle.setFecha_mod(new Date());
		Planilladeavancedetalle.setId_planilla_avance(1);
		System.out.println(Planilladeavancedetalle);
		planillaavancedetalleMapa.update(Planilladeavancedetalle);
		modelo.put("Planilladeavancedetalle", Planilladeavancedetalle);
		return modelo;
		}

	@RequestMapping(value = "/eliminar")
	@ResponseBody
	public Object eliminar(PlanillaAvanceDetalle Planilladeavancedetalle,HttpSession hs,String fecha_mod1) throws ParseException {
		HashMap modelo = new HashMap();
		Integer id_usuarioModificar = (Integer) hs.getAttribute("__id_usuario");
		Planilladeavancedetalle = planillaavancedetalleMapa.getById(Planilladeavancedetalle.getId_planilla_avance_detalle());
		Planilladeavancedetalle.setId_estado(false);
		Planilladeavancedetalle.setId_usuario_mod(id_usuarioModificar);
		Planilladeavancedetalle.setFecha_mod(new Date());
		System.out.println(""+Planilladeavancedetalle);
		planillaavancedetalleMapa.update(Planilladeavancedetalle);
		modelo.put("Planilladeavancedetalle", Planilladeavancedetalle);
		return modelo;
		}
}
