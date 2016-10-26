package bo.edu.uto.plantillaproyectomaven.controladores;

import java.util.HashMap;
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
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
//		String env = request.getServletContext().getInitParameter("entorno");
		HashMap modelo = new HashMap();
		modelo.put("prueba", "prueba");
//		modelo.put("direccion", Tools.get_attr(env, "direccion", request));
//		modelo.put("titulo", Tools.get_attr(env, "titulo", request));
//		modelo.put("gestion", Tools.get_attr("Sistema", "gestion", request));
		return new ModelAndView("seguridad/login", modelo);
	}

}
