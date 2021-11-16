package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.ConsultaEstudiantil;
import bo.edu.uto.encuestadea.dominios.DatosVerificar;
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
		Integer id_consulta = null;
		Docente docente;
		try{
			id_consulta = Integer.parseInt(new String(Base64.getDecoder().decode(consulta)));
		} catch(Exception e){
		}
		ConsultaEstudiantil consultaEstudiantil = consultaEstudiantilMapa.get(id_consulta);
		if(consultaEstudiantil != null){
			Encuesta datosEncuesta = new Encuesta();
			datosEncuesta.setId_docente(consultaEstudiantil.getId_docente());
			datosEncuesta.setId_materia(consultaEstudiantil.getId_materia());
			datosEncuesta.setId_grupo(consultaEstudiantil.getId_grupo());
			datosEncuesta.setId_gestion(consultaEstudiantil.getId_gestion());
			docente = docenteMapa.getDocenteEncuesta(datosEncuesta);
			modelo.put("docente", docente);
			modelo.put("consulta", consultaEstudiantil);
		}
		return new ModelAndView("seguridad/loginestudiante", modelo);
	}

	@RequestMapping("/verficarestudiante")
	public ModelAndView verficarestudiante(HttpServletRequest request, String consulta, String dip, String fec_nacimiento) throws ParseException {
		HashMap modelo = new HashMap();
		modelo.put("consulta", consulta);
		DatosVerificar datos = new DatosVerificar();
		Integer id_consulta = Integer.parseInt(new String(Base64.getDecoder().decode(consulta)));
		Date fec_nacimiento_aux;
		try{
			fec_nacimiento_aux=new SimpleDateFormat("yyyy-MM-dd").parse(fec_nacimiento);
		} catch(Exception e){
			return new ModelAndView("seguridad/error", modelo);
		}
		datos.setId_consulta_estudiantil(id_consulta);
		datos.setFec_nacimiento(fec_nacimiento_aux);
		datos.setDip(dip);
		DatosVerificar resultado = consultaEstudiantilMapa.verificar(datos);
		modelo.put("datos", resultado);
		if(resultado == null || resultado.getId_estudiante_materia() == null || resultado.getId_consulta_estudiantil() == null){
			return new ModelAndView("seguridad/error", modelo);
		}

		Encuesta datosEncuesta = new Encuesta();
		datosEncuesta.setId_docente(resultado.getId_docente());
		datosEncuesta.setId_materia(resultado.getId_materia());
		datosEncuesta.setId_grupo(resultado.getId_grupo());
		datosEncuesta.setId_gestion(resultado.getId_gestion());

		Docente docente = docenteMapa.getDocenteEncuesta(datosEncuesta);
		modelo.put("docente", docente);
		modelo.put("datosEncuesta", datosEncuesta);
		return new ModelAndView("encuesta/llenarencuesta", modelo);
	}

	@RequestMapping("/error")
	public ModelAndView error(HttpServletRequest request, String consulta, String dip, Date fec_nacimiento) {
		HashMap modelo = new HashMap();
		modelo.put("consulta", consulta);
		return new ModelAndView("seguridad/error", modelo);
	}
}
