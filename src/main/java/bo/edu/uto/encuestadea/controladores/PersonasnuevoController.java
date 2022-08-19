/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.Persona;
import bo.edu.uto.encuestadea.mapas.PersonaMapa;
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
@RequestMapping("/personanuevo/**")
public class PersonasnuevoController {

	@Autowired
	PersonaMapa personaMapa;

	@RequestMapping(value = "/index")
	@ResponseBody
	public Object index() {
		HashMap modelo = new HashMap();
		List personas = personaMapa.getAll();
		modelo.put("personas", personas);
		return modelo;
	}


	@RequestMapping(value = "/getById")
	@ResponseBody
	public Object getById(Integer id) {
		HashMap modelo = new HashMap();
		Persona persona = personaMapa.getById(id);
		modelo.put("personas", persona);
		return modelo;
	}
}
