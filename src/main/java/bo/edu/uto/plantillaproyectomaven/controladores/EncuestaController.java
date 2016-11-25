package bo.edu.uto.plantillaproyectomaven.controladores;

import bo.edu.uto.plantillaproyectomaven.dominios.Docente;
import bo.edu.uto.plantillaproyectomaven.dominios.Encuesta;
import bo.edu.uto.plantillaproyectomaven.dominios.RespuestasEncuesta;
import bo.edu.uto.plantillaproyectomaven.mapas.DocenteMapa;
import bo.edu.uto.plantillaproyectomaven.mapas.EncuestaMapa;
import bo.edu.uto.plantillaproyectomaven.mapas.RespuestasEncuestaMapa;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/encuesta/**")
public class EncuestaController {
		
	@Autowired
	private EncuestaMapa encuestaMapa;
	@Autowired
	private DocenteMapa docenteMapa;	
	@Autowired
	private RespuestasEncuestaMapa respuestasEncuestaMapa;

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Encuesta datosEncuesta) {
		String env = request.getServletContext().getInitParameter("entorno");
		
		HashMap modelo = new HashMap();		
		List<Encuesta> encuestasDocente = encuestaMapa.getListaEncuestas(datosEncuesta);
		Docente docente = docenteMapa.getDocenteEncuesta(datosEncuesta);
		modelo.put("docente", docente);
		modelo.put("datosEncuesta",datosEncuesta);
		modelo.put("encuestas", encuestasDocente);
		//			
		return new ModelAndView("encuesta/index", modelo);
	}
	
	@RequestMapping("/listar")
	public ModelAndView listar(Encuesta datosEncuesta, HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		//
		List lista = encuestaMapa.getListaEncuestas(datosEncuesta);
		modelo.put("lista", lista);
		//
		return new ModelAndView("encuesta/listar", modelo);
	}
	
	@RequestMapping("/guardar")
	@ResponseBody
	public Map guardar(Encuesta datosEncuesta, RespuestasEncuesta respuestasEncuesta, HttpSession hs) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		//
		datosEncuesta.setId_usuario(id_usuario);
		datosEncuesta.setId_estado(true);
			
		Long encuestaNueva = encuestaMapa.getNuevaEncuesta(datosEncuesta);
		
		respuestasEncuesta.setId_encuesta(datosEncuesta.getId_encuesta());
		respuestasEncuestaMapa.insertarRespuestasEncuesta(respuestasEncuesta);
		//modelo.put("lista", lista);
		//
		HashMap respuesta = new HashMap();
		respuesta.put("resultado", true);
		return respuesta;
	}
}
