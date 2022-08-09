package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.Encuesta;
import bo.edu.uto.encuestadea.dominios.Usuarios;
import bo.edu.uto.encuestadea.mapas.UsuarioMapa;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/usuario/**")
public class UsuarioController {

	@Autowired
	private UsuarioMapa usuarioMapa;

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Encuesta datosEncuesta) {
		HashMap modelo = new HashMap();

		return new ModelAndView("usuario/index", modelo);
	}

	@RequestMapping(value = "/lista")
	public ModelAndView lista(HttpServletRequest request, HttpServletResponse response) {
		HashMap modelo = new HashMap();
		List<Usuarios> lista = usuarioMapa.getUsuarios();
		modelo.put("lista", lista);
		return new ModelAndView("usuario/lista", modelo);
	}

	@RequestMapping(value = "/listar")
	@ResponseBody
	public Object listar(HttpServletRequest request, HttpServletResponse response) {
		HashMap modelo = new HashMap();
		List<Usuarios> lista = usuarioMapa.getUsuarios();
		modelo.put("data", lista);
		return modelo;
	}

	@RequestMapping(value = "/listarById")
	public ResponseEntity<?> listarById(Principal principal) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		modelo.put("logout", principal==null);

		List dato;
		try {
			dato = usuarioMapa.getUsuariosDetalle();
			response.put("data", dato);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity(response, HttpStatus.OK);
	}
}
