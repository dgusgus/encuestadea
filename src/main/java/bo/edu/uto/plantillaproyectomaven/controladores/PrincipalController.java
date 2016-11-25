package bo.edu.uto.plantillaproyectomaven.controladores;

import bo.edu.uto.plantillaproyectomaven.dominios.Docente;
import bo.edu.uto.plantillaproyectomaven.dominios.Enlaces;
import bo.edu.uto.plantillaproyectomaven.dominios.Roles;
import bo.edu.uto.plantillaproyectomaven.dominios.UsuarioAcceso;
import bo.edu.uto.plantillaproyectomaven.mapas.AccesoMapa;
import bo.edu.uto.plantillaproyectomaven.mapas.DocenteMapa;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
@RequestMapping("/principal/**")
public class PrincipalController {

	@Autowired
	private AccesoMapa accesoMapa;
	
	@Autowired
	private DocenteMapa docenteMapa;

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		String env = request.getServletContext().getInitParameter("entorno");

		HashMap modelo = new HashMap();
		java.security.Principal x = request.getUserPrincipal();
		UsuarioAcceso datos = accesoMapa.getDatosUsuario(x.getName());
		HttpSession ses = request.getSession();
		ses.setAttribute("__apodo", x.getName());
		ses.setAttribute("__id_persona", datos.getId_persona());
		ses.setAttribute("__id_usuario", datos.getId_usuario());
		ses.setAttribute("__nombre_completo", datos.getNombre_completo());
		ses.setAttribute("__id_facultad", datos.getId_facultad());
		ses.setAttribute("__id_unidad", datos.getId_facultad());
		// Datos del Sistema
		ses.setAttribute("__titulo", Tools.get_attr(env, "titulo", request));
		ses.setAttribute("__direccion", Tools.get_attr(env, "direccion", request));
		ses.setAttribute("__descripcion", Tools.get_attr("Sistema", "descripcion", request));
		ses.setAttribute("__gestion", Tools.get_attr("Sistema", "gestion", request));
		ses.setAttribute("__version", Tools.get_attr("Sistema", "version", request));
		//
		List<Docente> docentes = docenteMapa.getDocentes(null);
		
		modelo.put("apodo", x.getName());
		modelo.put("docentes", docentes);
		return new ModelAndView("principal/index", modelo);
	}

	// TEST
	@RequestMapping("/pagina2")
	public ModelAndView pagina2() {
		return new ModelAndView("principal/pagina2");
	}

	// TEST
	@RequestMapping("/pagina")
	public ModelAndView pagina() {
		Map modelo = new HashMap();

		List<Roles> roles = this.accesoMapa.getRolList(64);
		modelo.put("roles", roles);
		for (Roles rol : roles) {
			System.err.println(rol.getRol());
		}

		List<Enlaces> menus = this.accesoMapa.getEnlacesMenu(22);
		modelo.put("menus", menus);

		return new ModelAndView("principal/pagina", modelo);
	}

	// TEST
	@RequestMapping("/getmenurol")
	public ModelAndView getMenuRol(Integer idRol) {
		Map modelo = new HashMap();

		List<Roles> roles = this.accesoMapa.getRolList(idRol);
		modelo.put("roles", roles);
		for (Roles rol : roles) {
			System.err.println(rol.getRol());
		}
		return new ModelAndView("principal/pagina", modelo);
	}
}
