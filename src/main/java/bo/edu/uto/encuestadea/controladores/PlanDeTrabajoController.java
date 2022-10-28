/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.Persona;
import bo.edu.uto.encuestadea.mapas.PersonaMapa;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author raul
 */

@Controller
@RequestMapping("/plandetrabajo/**")
public class PlanDeTrabajoController {

	@Autowired
	PersonaMapa personaMapa;

	@RequestMapping(value = "/index")
	@ResponseBody
	public Object index()
	{
		HashMap modelo = new HashMap();
		List personas = personaMapa.getAll();
		modelo.put("personas", personas);

		return new ModelAndView("PlanDeTrabajo/index", modelo);
	}

	@RequestMapping(value = "/listar")
	@ResponseBody
	public ModelAndView listar() throws ParseException {
		HashMap modelo = new HashMap();
		List personas = personaMapa.getAll();
		modelo.put("personas", personas);
		return new ModelAndView("persona/listar", modelo);
	}

	@RequestMapping(value = "/getById")
	@ResponseBody
	public Object getById(Integer id) {
		HashMap modelo = new HashMap();
		Persona persona = personaMapa.getById(id);
		modelo.put("personas", persona);
		return modelo;
	}

	@RequestMapping(value = "/nuevo")
	@ResponseBody
	public Object nuevo(Persona persona,String fecha_nacimiento_aux,String fecha_modificacion_aux) throws ParseException {
		HashMap modelo = new HashMap();
		System.out.println(""+persona);
		System.out.println(""+fecha_nacimiento_aux);
		persona.setEstado("H");
		persona.setFecha_nacimiento(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nacimiento_aux));
		persona.setFecha_modificacion(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_modificacion_aux));
		personaMapa.insert(persona);
		System.out.println("id nuevo:"+persona.getId_persona());
		modelo.put("personas", persona);
		return modelo;
	}

	@RequestMapping(value = "/editar")
	@ResponseBody
	public Object editar(Persona persona,String fecha_nacimiento_aux,String fecha_modificacion_aux) throws ParseException {
		HashMap modelo = new HashMap();
		persona.setFecha_nacimiento(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nacimiento_aux));
		persona.setFecha_modificacion(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_modificacion_aux));
		if(persona.getId_estado() == null) persona.setId_estado(false);
		personaMapa.update(persona);
		System.out.println("id nuevo:"+persona.getId_persona());
		modelo.put("personas", persona);
		return modelo;
	}

	@RequestMapping(value = "/eliminar")
	@ResponseBody
	public Object eliminar(Persona persona) throws ParseException {
		HashMap modelo = new HashMap();
		persona = personaMapa.getById(persona.getId_persona());
		persona.setId_estado(false);
		personaMapa.update(persona);
		System.out.println("id nuevo:"+persona.getId_persona());
		modelo.put("personas", persona);
		return modelo;
	}
}
