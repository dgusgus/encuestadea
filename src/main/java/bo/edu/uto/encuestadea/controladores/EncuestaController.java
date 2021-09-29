package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.DatosVerificar;
import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.Encuesta;
import bo.edu.uto.encuestadea.dominios.EstudianteMateria;
import bo.edu.uto.encuestadea.dominios.RespuestasEncuesta;
import bo.edu.uto.encuestadea.dominios.Unidad;
import bo.edu.uto.encuestadea.mapas.DocenteMapa;
import bo.edu.uto.encuestadea.mapas.EncuestaMapa;
import bo.edu.uto.encuestadea.mapas.EstudianteMateriaMapa;
import bo.edu.uto.encuestadea.mapas.IntegranteComisionMapa;
import bo.edu.uto.encuestadea.mapas.RespuestasEncuestaMapa;
import bo.edu.uto.encuestadea.mapas.UnidadMapa;
import bo.edu.uto.encuestadea.reportes.ReporteEncuestaGeneralPDF;
import bo.edu.uto.encuestadea.reportes.ReporteEncuestaTotalMateriaPDF;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class EncuestaController {

	@Autowired
	private EncuestaMapa encuestaMapa;
	@Autowired
	private DocenteMapa docenteMapa;
	@Autowired
	private RespuestasEncuestaMapa respuestasEncuestaMapa;
	@Autowired
	private UnidadMapa unidadMapa;
	@Autowired
	private IntegranteComisionMapa integranteComisionMapa;
	@Autowired
	private EstudianteMateriaMapa estudianteMateriaMapa;

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Encuesta datosEncuesta) {
		String env = request.getServletContext().getInitParameter("entorno");

		HashMap modelo = new HashMap();

		List<Encuesta> encuestasDocente = encuestaMapa.getListaEncuestas(datosEncuesta);
		Docente docente = docenteMapa.getDocenteEncuesta(datosEncuesta);
		modelo.put("docente", docente);
		modelo.put("datosEncuesta", datosEncuesta);
		modelo.put("encuestas", encuestasDocente);
		//

		return new ModelAndView("encuesta/index", modelo);
	}

	@RequestMapping(value = "/llenarencuesta")
	public ModelAndView llenarencuesta(HttpServletRequest request, HttpServletResponse response, Encuesta datosEncuesta, String consulta) {
		HashMap modelo = new HashMap();

//		List<Encuesta> encuestasDocente = encuestaMapa.getListaEncuestas(datosEncuesta);
//		Docente docente = docenteMapa.getDocenteEncuesta(datosEncuesta);
//		modelo.put("docente", docente);
//		modelo.put("datosEncuesta", datosEncuesta);
//		modelo.put("encuestas", encuestasDocente);
		modelo.put("consulta", consulta);
		return new ModelAndView("encuesta/llenarencuesta", modelo);
	}

	@RequestMapping("/guardar")
	@ResponseBody
	public Map guardar(Encuesta datosEncuesta, RespuestasEncuesta respuestasEncuesta, HttpSession hs) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
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

	@RequestMapping("/guardarencuestaestudiante")
	@ResponseBody
	public ResponseEntity<?> guardarencuestaestudiante(DatosVerificar datosVerificar, Encuesta datosEncuesta, RespuestasEncuesta respuestasEncuesta, HttpSession hs) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException {
		Map modelo = new HashMap();
		Map<String, Object> response = new HashMap<String, Object>();

		EstudianteMateria estudianteMateria = estudianteMateriaMapa.getById(datosVerificar.getId_estudiante_materia());

		if(estudianteMateria == null || estudianteMateria.getEstado().equals("E")){
			response.put("mensaje", "error al verificar estudiante");
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		try
		{
		estudianteMateria.setEstado("E");
		estudianteMateriaMapa.update(estudianteMateria);

		datosEncuesta.setId_estado(true);
		encuestaMapa.getNuevaEncuesta(datosEncuesta);

		respuestasEncuesta.setId_encuesta(datosEncuesta.getId_encuesta());
		respuestasEncuestaMapa.insertarRespuestasEncuesta(respuestasEncuesta);
		}catch (Exception e) {
			response.put("mensaje", "Error al realizar la consulta: " + e.toString());
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		response.put("resultado", true);
		return new ResponseEntity(response, HttpStatus.OK);
	}

	@RequestMapping("/eliminar")
	@ResponseBody
	public Map eliminar(Encuesta datosEncuesta, HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
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
	public RespuestasEncuesta buscar(RespuestasEncuesta datosEncuesta, HttpSession hs) {

		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");

		datosEncuesta = respuestasEncuestaMapa.getBuscarRespuestasEncuesta(datosEncuesta);

		return datosEncuesta;
	}

	@RequestMapping("/modificar")
	@ResponseBody
	public Map modificar(Encuesta datosEncuesta, RespuestasEncuesta respuestasEncuesta, HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
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
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		//
		//List lista = encuestaMapa.getListaEncuestas(datosEncuesta);
		//modelo.put("lista", lista);
		//
		docente = docenteMapa.getDocenteEncuesta(encuesta);
		modelo.put("docente", docente);

		List<RespuestasEncuesta> listaRespuestasEncuestas = respuestasEncuestaMapa.getListaRespuestasEncuesta(docente);
		modelo.put("listaRespuestasEncuestas", listaRespuestasEncuestas);

		unidad = unidadMapa.getUnidad(unidad);
		modelo.put("unidad", unidad);

		return new ModelAndView(new ReporteEncuestaGeneralPDF(), modelo);
	}

	@RequestMapping("/reporte_total_materia")
	public ModelAndView reporte_total_materia(Docente docente, Encuesta encuesta, Unidad unidad, HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");

		modelo.put("logout", id_usuario == null);

		List integrantesComision = integranteComisionMapa.getIntegrantesComisionPorIdUsuario(id_usuario);
		modelo.put("integrantesComision", integrantesComision);

		docente = docenteMapa.getDocenteEncuesta(encuesta);
		modelo.put("docente", docente);

		List<RespuestasEncuesta> listaRespuestasEncuestas = respuestasEncuestaMapa.getListaRespuestasEncuesta(docente);

		unidad = unidadMapa.getUnidad(unidad);
		modelo.put("unidad", unidad);

		int[] r1 = new int[31];
		int[] r2 = new int[31];
		int[] r3 = new int[31];
		int[] r4 = new int[31];
		int[] r5 = new int[31];

		int NN = listaRespuestasEncuestas.size(); //Numero total de encuestados
		for (RespuestasEncuesta respuesta : listaRespuestasEncuestas) {
			int dato, i;
			dato = respuesta.getP1();
			i = 0;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP2();
			i = 1;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP3();
			i = 2;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP4();
			i = 3;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP5();
			i = 4;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP6();
			i = 5;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP7();
			i = 6;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP8();
			i = 7;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP9();
			i = 8;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP10();
			i = 9;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP11();
			i = 10;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP12();
			i = 11;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP13();
			i = 12;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP14();
			i = 13;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP15();
			i = 14;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP16();
			i = 15;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP17();
			i = 16;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP18();
			i = 17;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP19();
			i = 18;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP20();
			i = 19;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP21();
			i = 20;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP22();
			i = 21;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP23();
			i = 22;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP24();
			i = 23;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP25();
			i = 24;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP26();
			i = 25;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP27();
			i = 26;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP28();
			i = 27;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP29();
			i = 28;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP30();
			i = 29;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
			dato = respuesta.getP31();
			i = 30;
			if (dato == 0) {
				r5[i] += 1;
			}
			if (dato == 1) {
				r1[i] += 1;
			}
			if (dato == 2) {
				r2[i] += 1;
			}
			if (dato == 3) {
				r3[i] += 1;
			}
			if (dato == 4) {
				r4[i] += 1;
			}
		}

		double po = 0;
		double me = 0;
		double ne = 0;

		double IT1 = 0;//Resultad1
		double IT2 = 0; //Resultad2
		double IT3 = 0; //Resultad3

		String val1 = "";//comentario1
		String val2 = ""; //comentario1
		double val3 = 0; //comentario1

		for (int i = 0; i <= 30; i++) //Son 31 preguntas
		{
			double pc1 = (((double) r1[i]) / ((double) NN)) * 100.0;
			double pc2 = (((double) r2[i]) / ((double) NN)) * 100.0;
			double pc3 = (((double) r3[i]) / ((double) NN)) * 100.0;
			double pc4 = (((double) r4[i]) / ((double) NN)) * 100.0;
			double pc5 = (((double) r5[i]) / ((double) NN)) * 100.0;

			if (i == 3 || i == 24) {
				po = po + pc3;
				me = me + pc2;
				ne = ne + pc1;
			} else if (i == 11 || i == 12 || i == 19) {
				r3[i] = 0;
				r4[i] = 0;
				pc3 = 0;
				pc4 = 0;
				po = po + pc1;
				//me=me;
				ne = ne + pc2;
			} else if (i == 25) {
				po = po + pc1;
				me = me + pc2 + pc3;
				ne = ne + pc4;
			} else {
				po = po + pc1;
				me = me + pc2;
				ne = ne + pc3;
			}

			r5[i] = 0;
			pc5 = 0;

			if (i == 12) {
				IT1 = ((po + me - ne) / 13.0) * .4;
				po = 0;
				me = 0;
				ne = 0;

			}
			if (i == 27) {
				IT2 = ((po + me - ne) / 15.0) * .4;
				po = 0;
				me = 0;
				ne = 0;
			}

			if (i == 30) {
				IT3 = ((po + me - ne) / 3.0) * .2;
			}
		}

		if (IT1 < 20.0) {
			val1 = "Insuficiente";

		} else if (IT1 >= 20.0 && IT1 < 28.0) {
			val1 = "Regular";
		} else if (IT1 >= 28.0 && IT1 < 36.0) {
			val1 = "Bueno";
		} else if (IT1 >= 36.0 && IT1 <= 40.0) {
			val1 = "Excelente";
		}

		if (IT2 < 20.0) {
			val2 = "Insuficiente";

		} else if (IT2 >= 20.0 && IT2 < 28.0) {
			val2 = "Regular";
		} else if (IT2 >= 28.0 && IT2 < 36.0) {
			val2 = "Bueno";
		} else if (IT2 >= 36.0 && IT2 <= 40.0) {
			val2 = "Excelente";
		}
		val3 = (((double) IT3) / ((double) 20)) * 100.0;
		modelo.put("it1", IT1);
		modelo.put("val1", val1);
		modelo.put("it2", IT2);
		modelo.put("val2", val2);
		modelo.put("it3", IT3);
		modelo.put("val3", val3);
		return new ModelAndView(new ReporteEncuestaTotalMateriaPDF(), modelo);
	}

	@RequestMapping("/reporte_total_materia_todos")
	@ResponseBody
	public Object reporte_total_materia_todos(HttpSession hs) {
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Integer id_usuario = (Integer) hs.getAttribute("__id_usuario");

		modelo.put("logout", id_usuario == null);

		List resultado = new ArrayList();

		List<Docente> materias = encuestaMapa.getTodosDocumentos();
		for (Docente materia : materias) {
			List integrantesComision = integranteComisionMapa.getIntegrantesComisionPorIdUsuario(materia.getId_usuario());

			materia.setIntegrantes_comision(integrantesComision);

			List<RespuestasEncuesta> listaRespuestasEncuestas = respuestasEncuestaMapa.getListaRespuestasEncuesta(materia);

			int[] r1 = new int[31];
			int[] r2 = new int[31];
			int[] r3 = new int[31];
			int[] r4 = new int[31];
			int[] r5 = new int[31];

			int NN = listaRespuestasEncuestas.size(); //Numero total de encuestados
			for (RespuestasEncuesta respuesta : listaRespuestasEncuestas) {
				int dato, i;
				dato = respuesta.getP1();
				i = 0;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP2();
				i = 1;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP3();
				i = 2;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP4();
				i = 3;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP5();
				i = 4;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP6();
				i = 5;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP7();
				i = 6;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP8();
				i = 7;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP9();
				i = 8;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP10();
				i = 9;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP11();
				i = 10;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP12();
				i = 11;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP13();
				i = 12;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP14();
				i = 13;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP15();
				i = 14;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP16();
				i = 15;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP17();
				i = 16;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP18();
				i = 17;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP19();
				i = 18;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP20();
				i = 19;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP21();
				i = 20;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP22();
				i = 21;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP23();
				i = 22;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP24();
				i = 23;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP25();
				i = 24;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP26();
				i = 25;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP27();
				i = 26;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP28();
				i = 27;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP29();
				i = 28;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP30();
				i = 29;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
				dato = respuesta.getP31();
				i = 30;
				if (dato == 0) {
					r5[i] += 1;
				}
				if (dato == 1) {
					r1[i] += 1;
				}
				if (dato == 2) {
					r2[i] += 1;
				}
				if (dato == 3) {
					r3[i] += 1;
				}
				if (dato == 4) {
					r4[i] += 1;
				}
			}

			double po = 0;
			double me = 0;
			double ne = 0;

			double IT1 = 0;//Resultad1
			double IT2 = 0; //Resultad2
			double IT3 = 0; //Resultad3

			String val1 = "";//comentario1
			String val2 = ""; //comentario1
			double val3 = 0; //comentario1

			for (int i = 0; i <= 30; i++) //Son 31 preguntas
			{
				double pc1 = (((double) r1[i]) / ((double) NN)) * 100.0;
				double pc2 = (((double) r2[i]) / ((double) NN)) * 100.0;
				double pc3 = (((double) r3[i]) / ((double) NN)) * 100.0;
				double pc4 = (((double) r4[i]) / ((double) NN)) * 100.0;
				double pc5 = (((double) r5[i]) / ((double) NN)) * 100.0;

				if (i == 3 || i == 24) {
					po = po + pc3;
					me = me + pc2;
					ne = ne + pc1;
				} else if (i == 11 || i == 12 || i == 19) {
					r3[i] = 0;
					r4[i] = 0;
					pc3 = 0;
					pc4 = 0;
					po = po + pc1;
					//me=me;
					ne = ne + pc2;
				} else if (i == 25) {
					po = po + pc1;
					me = me + pc2 + pc3;
					ne = ne + pc4;
				} else {
					po = po + pc1;
					me = me + pc2;
					ne = ne + pc3;
				}

				r5[i] = 0;
				pc5 = 0;

				if (i == 12) {
					IT1 = ((po + me - ne) / 13.0) * .4;
					po = 0;
					me = 0;
					ne = 0;

				}
				if (i == 27) {
					IT2 = ((po + me - ne) / 15.0) * .4;
					po = 0;
					me = 0;
					ne = 0;
				}

				if (i == 30) {
					IT3 = ((po + me - ne) / 3.0) * .2;
				}
			}

			if (IT1 < 20.0) {
				val1 = "Insuficiente";

			} else if (IT1 >= 20.0 && IT1 < 28.0) {
				val1 = "Regular";
			} else if (IT1 >= 28.0 && IT1 < 36.0) {
				val1 = "Bueno";
			} else if (IT1 >= 36.0 && IT1 <= 40.0) {
				val1 = "Excelente";
			}

			if (IT2 < 20.0) {
				val2 = "Insuficiente";

			} else if (IT2 >= 20.0 && IT2 < 28.0) {
				val2 = "Regular";
			} else if (IT2 >= 28.0 && IT2 < 36.0) {
				val2 = "Bueno";
			} else if (IT2 >= 36.0 && IT2 <= 40.0) {
				val2 = "Excelente";
			}
			val3 = (((double) IT3) / ((double) 20)) * 100.0;
//			modelo.put("it1", IT1);
//			modelo.put("val1", val1);
//			modelo.put("it2", IT2);
//			modelo.put("val2", val2);
//			modelo.put("it3", IT3);
//			modelo.put("val3", val3);

			materia.setIT1(IT1);
			materia.setVal1(val1);
			materia.setIT2(IT2);
			materia.setVal2(val2);
			materia.setIT3(IT3);
			materia.setVal3(val3);
			resultado.add(materia);
		}

		return resultado;
	}
}
