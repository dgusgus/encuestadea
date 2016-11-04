package bo.edu.uto.plantillaproyectomaven.controladores;

import bo.edu.uto.plantillaproyectomaven.dominios.Enlaces;
import bo.edu.uto.plantillaproyectomaven.dominios.Roles;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bo.edu.uto.plantillaproyectomaven.mapas.AccesoMapa;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/comun/**")
public class ComunController {

	@Autowired
	private AccesoMapa accesoMapa;

	@RequestMapping("/cabecera")
	public ModelAndView cabecera(HttpSession hs) {
		Map modelo = new HashMap();
		modelo.put("apodo", hs.getAttribute("__apodo"));
		modelo.put("nombre", hs.getAttribute("__nombre_completo"));
		return new ModelAndView("comun/cabecera", modelo);
	}

	@RequestMapping("/menu")
	public ModelAndView menu(Integer idRol) {
		Map modelo = new HashMap();
		List<Enlaces> menus = this.accesoMapa.getEnlacesMenu(idRol);
		modelo.put("menus", menus);
		return new ModelAndView("comun/menu", modelo);
	}

	@RequestMapping("/roles")
	public ModelAndView roles(HttpSession hs) {
		Map modelo = new HashMap();
		List<Roles> roles = this.accesoMapa.getRolList((Integer) hs.getAttribute("__id_usuario"));
		modelo.put("apodo", (String) hs.getAttribute("__apodo"));
		modelo.put("roles", roles);
		return new ModelAndView("comun/roles", modelo);
	}

	@RequestMapping("/pie")
	public ModelAndView pie() {
		return new ModelAndView("comun/pie");
	}

	// REVISAR
	@RequestMapping("/denegado")
	public ModelAndView denegado(HttpServletResponse hsr) {
		return new ModelAndView("comun/denegado");
	}

}
