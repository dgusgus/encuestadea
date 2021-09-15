package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.ConsultaEstudiantil;
import bo.edu.uto.encuestadea.mapas.ConsultaEstudiantilMapa;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
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
@RequestMapping("/encuesta/**")
public class ConsultaEstudiantilController {

	@Autowired
	private ConsultaEstudiantilMapa consultaEstudiantilMapa;

	@RequestMapping(value = "/index")
	public ModelAndView index(ConsultaEstudiantil datosConsultaEstudiantil, HttpSession hs) {
		HashMap modelo = new HashMap();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		List<ConsultaEstudiantil> consultasEstudiantiles = consultaEstudiantilMapa.getByIdUsuario(id_usuario);
		modelo.put("consultasEstudiantiles", consultasEstudiantiles);

		return new ModelAndView("encuesta/index", modelo);
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
			response.put("consultasEstudiantiles", datos);

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
			response.put("consultasEstudiantiles", datos);

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
			dato = consultaEstudiantilMapa.get(datosConsultaEstudiantil);
			response.put("consultaEstudiantil", dato);

		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping("/guardar")
	@ResponseBody
	public ResponseEntity<?> guardar(ConsultaEstudiantil nuevoDato, HttpSession hs) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		try {
			if(id_usuario != null){
				nuevoDato.setId_usuario(id_usuario);
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
		response.put("consultaEstudiantil", nuevoDato);
		return new ResponseEntity(response, HttpStatus.CREATED);
	}

	@RequestMapping("/eliminar")
	@ResponseBody
	public ResponseEntity<?> eliminar(ConsultaEstudiantil dato, HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		ConsultaEstudiantil datoActual = consultaEstudiantilMapa.get(dato);

		if (datoActual == null || id_usuario == null) {
			response.put("mensaje", "No existe ningun dato para el id: " + dato.getId_consulta_estudiantil());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NO_CONTENT);
		}

		try {
			dato.setUltimo_usuario_modificador(id_usuario);
			dato.setFecha_ultima_modificacion(new Date());
			dato.setId_estado(false);
			consultaEstudiantilMapa.delete(dato);
			consultaEstudiantilMapa.update(dato);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		response.put("mensaje", "El registro ha sido actualizado con exito");
		response.put("seguimiento", dato);
		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping("/modificar")
	@ResponseBody
	public ResponseEntity<?> modificar(ConsultaEstudiantil dato, HttpSession hs) {
		HashMap modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);

		ConsultaEstudiantil datoActual = consultaEstudiantilMapa.get(dato);

		if (datoActual == null || id_usuario == null) {
			response.put("mensaje", "No existe ningun dato para el id: " + dato.getId_consulta_estudiantil());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NO_CONTENT);
		}

		try {
			dato.setUltimo_usuario_modificador(id_usuario);
			dato.setFecha_ultima_modificacion(new Date());
			dato.setId_estado(false);
			consultaEstudiantilMapa.delete(dato);
			consultaEstudiantilMapa.update(dato);
		} catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		response.put("mensaje", "El registro ha sido actualizado con exito");
		response.put("seguimiento", dato);
		return new ResponseEntity(response, HttpStatus.OK);
	}
}
