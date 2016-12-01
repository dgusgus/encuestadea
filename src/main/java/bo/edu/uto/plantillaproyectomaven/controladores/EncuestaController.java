package bo.edu.uto.plantillaproyectomaven.controladores;

import bo.edu.uto.plantillaproyectomaven.dominios.Docente;
import bo.edu.uto.plantillaproyectomaven.dominios.Encuesta;
import bo.edu.uto.plantillaproyectomaven.dominios.RespuestasEncuesta;
import bo.edu.uto.plantillaproyectomaven.dominios.Unidad;
import bo.edu.uto.plantillaproyectomaven.mapas.DocenteMapa;
import bo.edu.uto.plantillaproyectomaven.mapas.EncuestaMapa;
import bo.edu.uto.plantillaproyectomaven.mapas.RespuestasEncuestaMapa;
import bo.edu.uto.plantillaproyectomaven.mapas.UnidadMapa;
import bo.edu.uto.plantillaproyectomaven.reportes.ReporteEncuestaGeneralPDF;
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
	@Autowired
	private UnidadMapa unidadMapa;

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
			
		encuestaMapa.getNuevaEncuesta(datosEncuesta);
		
		respuestasEncuesta.setId_encuesta(datosEncuesta.getId_encuesta());
		respuestasEncuestaMapa.insertarRespuestasEncuesta(respuestasEncuesta);
		//modelo.put("lista", lista);
		//
		HashMap respuesta = new HashMap();
		respuesta.put("resultado", true);
		return respuesta;
	}
	
	@RequestMapping("/eliminar")
	@ResponseBody
	public Map eliminar(Encuesta datosEncuesta, HttpSession hs){
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		//
		datosEncuesta.setUltimo_usuario_modificador(id_usuario);
		datosEncuesta.setId_estado(false);
			
		encuestaMapa.getEliminarEncuesta(datosEncuesta);	
		
		HashMap respuesta = new HashMap();
		respuesta.put("resultado", true);
		return respuesta;
	}
	
	@RequestMapping("/buscar")
	@ResponseBody
	public RespuestasEncuesta buscar(RespuestasEncuesta datosEncuesta, HttpSession hs){
		
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");					
		datosEncuesta = respuestasEncuestaMapa.getBuscarRespuestasEncuesta(datosEncuesta);				
		return datosEncuesta;
	}
	
	@RequestMapping("/modificar")
	@ResponseBody
	public Map modificar(Encuesta datosEncuesta, RespuestasEncuesta respuestasEncuesta, HttpSession hs){
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		//
		datosEncuesta.setUltimo_usuario_modificador(id_usuario);		
			
		encuestaMapa.getActualizarEncuesta(datosEncuesta);
				
		respuestasEncuestaMapa.modificarRespuestasEncuesta(respuestasEncuesta);
		//modelo.put("lista", lista);
		//
		HashMap respuesta = new HashMap();
		respuesta.put("resultado", true);
		return respuesta;
	}
	
	@RequestMapping("/reporte_general")
	public ModelAndView reporte_general(Docente docente, Encuesta encuesta, Unidad unidad, HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		//
		//List lista = encuestaMapa.getListaEncuestas(datosEncuesta);
		//modelo.put("lista", lista);
		//
		docente = docenteMapa.getDocenteEncuesta(encuesta);
		modelo.put("docente",docente);
		
		List<RespuestasEncuesta> listaRespuestasEncuestas = respuestasEncuestaMapa.getListaRespuestasEncuesta(docente);
		modelo.put("listaRespuestasEncuestas",listaRespuestasEncuestas);
		
		unidad = unidadMapa.getUnidad(unidad);
		modelo.put("unidad", unidad);
		
		return new ModelAndView(new ReporteEncuestaGeneralPDF(),modelo);
	}
}
