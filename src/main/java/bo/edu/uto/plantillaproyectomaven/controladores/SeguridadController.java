package bo.edu.uto.plantillaproyectomaven.controladores;

import bo.edu.uto.plantillaproyectomaven.servicios.UsuarioServicio;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.dtic.tools.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/seguridad/**")
public class SeguridadController {
	@Autowired
	UsuarioServicio usuarioServicio;
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {

		HashMap modelo = new HashMap();
		modelo.put("prueba", "prueba");
		List usuarios = usuarioServicio.getUsuarios();
		
		return new ModelAndView("seguridad/login", modelo);
	}

}
