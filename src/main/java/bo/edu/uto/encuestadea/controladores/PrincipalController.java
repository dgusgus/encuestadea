package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.AccesoUsuario;
import bo.edu.uto.encuestadea.dominios.CriterioBusqueda;
import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.UsuarioAcceso;
import bo.edu.uto.encuestadea.dominios.Usuarios;
import bo.edu.uto.encuestadea.mapas.AccesoMapa;
import bo.edu.uto.encuestadea.mapas.AccesoUsuarioMapa;
import bo.edu.uto.encuestadea.mapas.DocenteMapa;
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

	@Autowired
	private AccesoUsuarioMapa accesoUsuarioMapa;

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
		ses.setAttribute("__id_unidad", datos.getId_unidad());
		// Datos del Sistema
		ses.setAttribute("__titulo", Tools.get_attr(env, "titulo", request));
		ses.setAttribute("__direccion", Tools.get_attr(env, "direccion", request));
		ses.setAttribute("__descripcion", Tools.get_attr("Sistema", "descripcion", request));
		ses.setAttribute("__gestion", Tools.get_attr("Sistema", "gestion", request));
		ses.setAttribute("__version", Tools.get_attr("Sistema", "version", request));
		// Datos de Acceso para la busqueda
		List<AccesoUsuario> accesos = accesoUsuarioMapa.getAccesosUsuario(new Usuarios(datos.getId_usuario()));
		ses.setAttribute("__accesos", accesos);

		modelo.put("apodo", x.getName());
		return new ModelAndView("redirect:/consultaestudiantil/index.html", modelo);
	}

	@RequestMapping(value = "/buscar")
	public ModelAndView buscar(HttpServletRequest request, HttpServletResponse response, String busqueda) {

		HashMap modelo = new HashMap();
		HttpSession ses = request.getSession();
		List<AccesoUsuario> accesos = (List<AccesoUsuario>) ses.getAttribute("__accesos");
		Integer id_unidad_usuario = Integer.parseInt(ses.getAttribute("__id_unidad").toString());

		List<Docente> docentes = null;

		if (busqueda != null) {
			modelo.put("busqueda", busqueda);
			busqueda = busqueda.trim();
			busqueda = busqueda.replaceAll("\\s", "%");
			busqueda = busqueda.toUpperCase();
			busqueda = "%" + busqueda + "%";
			CriterioBusqueda criterio = new CriterioBusqueda();
			criterio.setCadenaBusqueda(busqueda);
			criterio.setId_unidad(id_unidad_usuario);
			docentes = docenteMapa.getDocentesBusqueda(criterio);
		}

		modelo.put("docentes", docentes);
		return new ModelAndView("principal/buscar", modelo);
	}

	@RequestMapping(value = "/nuevo")
	public ModelAndView nuevo(HttpServletRequest request, HttpServletResponse response, String busqueda) {

		HashMap modelo = new HashMap();
		HttpSession ses = request.getSession();
		List<AccesoUsuario> accesos = (List<AccesoUsuario>) ses.getAttribute("__accesos");
		Integer id_unidad_usuario = Integer.parseInt(ses.getAttribute("__id_unidad").toString());

		List<Docente> docentes = null;

		if (busqueda != null) {
			modelo.put("busqueda", busqueda);
			busqueda = busqueda.trim();
			busqueda = busqueda.replaceAll("\\s", "%");
			busqueda = busqueda.toUpperCase();
			busqueda = "%" + busqueda + "%";
			CriterioBusqueda criterio = new CriterioBusqueda();
			criterio.setCadenaBusqueda(busqueda);
			criterio.setId_unidad(id_unidad_usuario);
			docentes = docenteMapa.getDocentesBusqueda(criterio);
		}

		modelo.put("docentes", docentes);
		return new ModelAndView("principal/nuevo", modelo);
	}

	@RequestMapping(value = "/listar")
	public ModelAndView listar(HttpServletRequest request, HttpServletResponse response, String busqueda) {

		HashMap modelo = new HashMap();
		HttpSession ses = request.getSession();
		List<AccesoUsuario> accesos = (List<AccesoUsuario>) ses.getAttribute("__accesos");
		Integer id_unidad_usuario = Integer.parseInt(ses.getAttribute("__id_unidad").toString());

		List<Docente> docentes = null;

		if (busqueda != null) {
			modelo.put("busqueda", busqueda);
			busqueda = busqueda.trim();
			busqueda = busqueda.replaceAll("\\s", "%");
			busqueda = busqueda.toUpperCase();
			busqueda = "%" + busqueda + "%";
			CriterioBusqueda criterio = new CriterioBusqueda();
			criterio.setCadenaBusqueda(busqueda);
			criterio.setId_unidad(id_unidad_usuario);
			docentes = docenteMapa.getDocentesBusqueda(criterio);
		}

		modelo.put("docentes", docentes);
		return new ModelAndView("principal/lista", modelo);
	}

	@RequestMapping("/reporte_total_materias")
	public ModelAndView reporte_total_materias(Usuarios usuario, HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		return null;
	}

	@RequestMapping("/denegado")
	public ModelAndView denegado(HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		return new ModelAndView("principal/denegado", modelo);
	}
}
