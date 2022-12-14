package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.Encuesta;
import bo.edu.uto.encuestadea.mapas.UsuarioMapa;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
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

	@Autowired
	UsuarioMapa usuarioMapa;

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Encuesta datosEncuesta) {
		HashMap modelo = new HashMap();
		List usuarios = usuarioMapa.getUsuariosDetalle();
		modelo.put("usuarios", usuarios);
		return new ModelAndView("administrador/index", modelo);
	}

}
