/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.InformeMemoria;
import bo.edu.uto.encuestadea.mapas.InformeMemoriaMapa;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author raul
 */

@Controller
@RequestMapping("/informememoria/**")
public class InformeMemoriaController {

	@Autowired
	InformeMemoriaMapa informememoriaMapa;

	@RequestMapping(value = "/index")
	@ResponseBody
	public ModelAndView index()
	{
		return new ModelAndView("informeMemoria/index");
	}

	@RequestMapping(value = "/administracion")
	@ResponseBody
	public ModelAndView administracion() throws ParseException {
		List<InformeMemoria> planilladetalle;
		HashMap modelo = new HashMap();
		planilladetalle = informememoriaMapa.getAllplanilla();
		//System.out.println(planilladetalle);
		modelo.put("planilladetalle", planilladetalle);
		return new ModelAndView("informeMemoria/Administracion", modelo);
	}

	@RequestMapping(value = "/actualizacion")
	@ResponseBody
	public ModelAndView actualizacion() throws ParseException {
		return new ModelAndView("informeMemoria/Actualizacion");
	}

	@RequestMapping(value = "/investigacion")
	@ResponseBody
	public ModelAndView investigacion() throws ParseException {
		return new ModelAndView("informeMemoria/Investigacion");
	}

	@RequestMapping(value = "/produccion")
	@ResponseBody
	public ModelAndView produccion() throws ParseException {
		return new ModelAndView("informeMemoria/Produccion");
	}

	@RequestMapping(value = "/listar")
	public ResponseEntity<?> listar() {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		List<InformeMemoria> datos;
		datos = informememoriaMapa.getAll();
		//System.out.println(datos);
		response.put("data", datos);
		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping(value = "/nuevo")
	@ResponseBody
	public Object nuevo(InformeMemoria InformeMemoria, HttpSession hs, String fecha_ini1)
		throws ParseException {
		HashMap modelo = new HashMap();
		Integer id_usuarioModificar = (Integer) hs.getAttribute("__id_usuario");
		InformeMemoria.setFecha_ini(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_ini1));
		InformeMemoria.setId_estado(true);
		InformeMemoria.setId_usuario_mod(id_usuarioModificar);
		InformeMemoria.setFecha_mod(new Date());
		InformeMemoria.setId_informe(1);
		InformeMemoria.setId_planilla_avance(1);
		System.out.println(InformeMemoria);
		//planillaavancedetalleMapa.insert(Planilladeavancedetalle);
		//modelo.put("Planilladeavancedetalle", Planilladeavancedetalle);
		return modelo;
	}
}
