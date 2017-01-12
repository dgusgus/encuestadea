package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.Encuesta;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/administrador/**")
public class AdministradorController {
				

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Encuesta datosEncuesta) {
		HashMap modelo = new HashMap();		
		return new ModelAndView("administrador/index", modelo);
	}				
}
