package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.AccesoUsuario;
import bo.edu.uto.encuestadea.dominios.ConsultaEstudiantil;
import bo.edu.uto.encuestadea.dominios.Rol;
import bo.edu.uto.encuestadea.dominios.UsuarioAcceso;
import bo.edu.uto.encuestadea.mapas.AccesoMapa;
import bo.edu.uto.encuestadea.mapas.ConsultaEstudiantilMapa;
import bo.edu.uto.encuestadea.mapas.RolMapa;
import bo.edu.uto.encuestadea.mapas.UsuarioMapa;
import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/consultaestudiantil/**")
public class ConsultaEstudiantilController {

	@Autowired
	private ConsultaEstudiantilMapa consultaEstudiantilMapa;
	@Autowired
	AccesoMapa accesoMapa;
	@Autowired
	RolMapa rolesMapa;

	@RequestMapping(value = "/index")
	public ModelAndView index(ConsultaEstudiantil datosConsultaEstudiantil, HttpSession hs, Principal principal) {
		HashMap modelo = new HashMap();
		UsuarioAcceso usuario = accesoMapa.getUsuario(principal.getName());
		List datosUsusario = accesoMapa.getDatosUsuario(principal.getName());
		if (null == usuario) {
			throw new UsernameNotFoundException("Usuario NO Registrado");
		}
		modelo.put("logout", usuario == null);

		if(usuario != null){
			ServletContext servletContext = hs.getServletContext();
			String realPath = servletContext.getRealPath("/");

			UsuarioAcceso primero = (UsuarioAcceso)datosUsusario.get(0);
			List<ConsultaEstudiantil> consultasEstudiantiles = consultaEstudiantilMapa.getByIdUsuario(primero.getId_usuario());
			modelo.put("consultasEstudiantiles", consultasEstudiantiles);
			modelo.put("realpath", realPath);
			List<Rol> roles = new ArrayList<Rol>();
			roles = rolesMapa.getRoles(primero.getId_usuario());
			usuario.setRoles(roles);
			hs.setAttribute("__sess_cliente", usuario);
			modelo.put("usuario", usuario);
		}
		return new ModelAndView("consultaestudiantil/index", modelo);
	}

	@RequestMapping(value = "/listarByIdUsuario")
	public ResponseEntity<?> listarByIdUsuario(HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		List<ConsultaEstudiantil> datos;
		try {
			datos = consultaEstudiantilMapa.getByIdUsuario(id_usuario);
			response.put("data", datos);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping(value = "/listar")
	public ResponseEntity<?> listar(HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		List<ConsultaEstudiantil> datos;
		try {
			datos = consultaEstudiantilMapa.getAll();
			response.put("data", datos);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping(value = "/listarById")
	public ResponseEntity<?> listarById(ConsultaEstudiantil datosConsultaEstudiantil, HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		ConsultaEstudiantil dato;
		try {
			dato = consultaEstudiantilMapa.get(datosConsultaEstudiantil.getId_consulta_estudiantil());
			response.put("data", dato);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping("/nuevo")
	@ResponseBody
	public ResponseEntity<?> nuevo(ConsultaEstudiantil nuevoDato, HttpSession hs) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		try {
			if(id_usuario != null){
				nuevoDato.setId_usuario(id_usuario);
				nuevoDato.setEstado("N");
				nuevoDato.setFecha_creacion(new Date());
				nuevoDato.setId_estado(true);
				consultaEstudiantilMapa.insert(nuevoDato);
				response.put("resultado", true);
			}
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		response.put("mensaje", "El registro ha sido creado con exito");
		response.put("data", nuevoDato);
		return new ResponseEntity(response, HttpStatus.CREATED);
	}

	@RequestMapping("/eliminar")
	@ResponseBody
	public ResponseEntity<?> eliminar(ConsultaEstudiantil dato, HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		ConsultaEstudiantil datoActual = consultaEstudiantilMapa.get(dato.getId_consulta_estudiantil());

		if (datoActual == null || id_usuario == null) {
			response.put("mensaje", "No existe ningun dato para el id: " + dato.getId_consulta_estudiantil());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NO_CONTENT);
		}

		try {
			datoActual.setUltimo_usuario_modificador(id_usuario);
			datoActual.setFecha_ultima_modificacion(new Date());
			datoActual.setId_estado(false);
			consultaEstudiantilMapa.update(datoActual);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		response.put("mensaje", "El registro ha sido actualizado con exito");
		response.put("data", datoActual);
		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping("/modificar")
	@ResponseBody
	public ResponseEntity<?> modificar(ConsultaEstudiantil dato, HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		ConsultaEstudiantil datoActual = consultaEstudiantilMapa.get(dato.getId_consulta_estudiantil());

		if (datoActual == null || id_usuario == null) {
			response.put("mensaje", "No existe ningun dato para el id: " + dato.getId_consulta_estudiantil());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NO_CONTENT);
		}

		try {
			datoActual.setUltimo_usuario_modificador(id_usuario);
			datoActual.setFecha_ultima_modificacion(new Date());
			datoActual.setId_estado(false);
			consultaEstudiantilMapa.update(datoActual);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		response.put("mensaje", "El registro ha sido actualizado con exito");
		response.put("data", datoActual);
		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping("/abrir")
	@ResponseBody
	public ResponseEntity<?> abrir(ConsultaEstudiantil dato, HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		ConsultaEstudiantil datoActual = consultaEstudiantilMapa.get(dato.getId_consulta_estudiantil());

		if (datoActual == null || id_usuario == null) {
			response.put("mensaje", "No existe ningun dato para el id: " + dato.getId_consulta_estudiantil());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NO_CONTENT);
		}

		try {
			datoActual.setUltimo_usuario_modificador(id_usuario);
			datoActual.setFecha_ultima_modificacion(new Date());
			datoActual.setEstado("A");
			consultaEstudiantilMapa.update(datoActual);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		response.put("mensaje", "El registro ha sido actualizado con exito");
		response.put("data", datoActual);
		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping("/cerrar")
	@ResponseBody
	public ResponseEntity<?> cerrar(ConsultaEstudiantil dato, HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		ConsultaEstudiantil datoActual = consultaEstudiantilMapa.get(dato.getId_consulta_estudiantil());

		if (datoActual == null || id_usuario == null) {
			response.put("mensaje", "No existe ningun dato para el id: " + dato.getId_consulta_estudiantil());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NO_CONTENT);
		}

		try {
			datoActual.setUltimo_usuario_modificador(id_usuario);
			datoActual.setFecha_ultima_modificacion(new Date());
			datoActual.setEstado("C");
			consultaEstudiantilMapa.update(datoActual);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		response.put("mensaje", "El registro ha sido actualizado con exito");
		response.put("data", datoActual);
		return new ResponseEntity(response, HttpStatus.OK);
	}
}
