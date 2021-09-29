package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.DatosVerificar;
import bo.edu.uto.encuestadea.dominios.Usuarios;
import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.Encuesta;
import bo.edu.uto.encuestadea.mapas.ConsultaEstudiantilMapa;
import bo.edu.uto.encuestadea.mapas.DocenteMapa;
import bo.edu.uto.encuestadea.mapas.EncuestaMapa;
import bo.edu.uto.encuestadea.mapas.EstudianteMateriaMapa;
import bo.edu.uto.encuestadea.mapas.RespuestasEncuestaMapa;
import bo.edu.uto.encuestadea.servicios.UsuarioServicio;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/seguridad/**")
public class SeguridadController {

	@Autowired
	UsuarioServicio usuarioServicio;

	@Autowired
	ConsultaEstudiantilMapa consultaEstudiantilMapa;
	@Autowired
	private EncuestaMapa encuestaMapa;
	@Autowired
	private DocenteMapa docenteMapa;
	@Autowired
	private EstudianteMateriaMapa estudianteMateriaMapa;

	@Autowired
	private RespuestasEncuestaMapa respuestasEncuestaMapa;

	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		return new ModelAndView("seguridad/login");
	}

	@RequestMapping("/loginestudiante")
	public ModelAndView loginestudiante(HttpServletRequest request, String consulta, String dip, Date fec_nacimiento) {
		HashMap modelo = new HashMap();
		modelo.put("consulta", consulta);
		return new ModelAndView("seguridad/loginestudiante", modelo);
	}

	@RequestMapping("/verficarestudiante")
	public ModelAndView verficarestudiante(HttpServletRequest request, String consulta, String dip, String fec_nacimiento) throws ParseException {
		HashMap modelo = new HashMap();
		modelo.put("consulta", consulta);
		DatosVerificar datos = new DatosVerificar();
		Integer id_consulta = Integer.parseInt(new String(Base64.getDecoder().decode(consulta)));
		Date fec_nacimiento_aux=new SimpleDateFormat("yyyy-MM-dd").parse(fec_nacimiento);
		datos.setId_consulta_estudiantil(id_consulta);
		datos.setFec_nacimiento(fec_nacimiento_aux);
		datos.setDip(dip);
		DatosVerificar resultado = consultaEstudiantilMapa.verificar(datos);
		modelo.put("datos", resultado);
		System.out.println(resultado);
		if(resultado == null || resultado.getId_estudiante_materia() == null || resultado.getId_consulta_estudiantil() == null){
			return new ModelAndView("seguridad/error");
		}

		Encuesta datosEncuesta = new Encuesta();
		datosEncuesta.setId_docente(resultado.getId_docente());
		datosEncuesta.setId_materia(resultado.getId_materia());
		datosEncuesta.setId_grupo(resultado.getId_grupo());
		datosEncuesta.setId_gestion(resultado.getId_gestion());

		List<Encuesta> encuestasDocente = encuestaMapa.getListaEncuestas(datosEncuesta);
		Docente docente = docenteMapa.getDocenteEncuesta(datosEncuesta);
		modelo.put("docente", docente);
		modelo.put("datosEncuesta", datosEncuesta);
		modelo.put("encuestas", encuestasDocente);
		return new ModelAndView("encuesta/llenarencuesta", modelo);
	}

	@RequestMapping("/error")
	public ModelAndView error(HttpServletRequest request, String consulta, String dip, Date fec_nacimiento) {
		HashMap modelo = new HashMap();
		modelo.put("consulta", consulta);
		return new ModelAndView("seguridad/error", modelo);
	}
}
