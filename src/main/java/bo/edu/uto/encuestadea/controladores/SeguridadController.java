package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.DatosVerificar;
import bo.edu.uto.encuestadea.dominios.Usuarios;
import bo.edu.uto.encuestadea.mapas.ConsultaEstudiantilMapa;
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

	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		return new ModelAndView("seguridad/login");
	}

	@RequestMapping("/loginestudiante")
	public ModelAndView loginestudiante(HttpServletRequest request, String consulta, String dip, Date fec_nacimiento) {
		HashMap modelo = new HashMap();
		System.out.println("consulta:" + consulta);
		modelo.put("consulta", consulta);
		return new ModelAndView("seguridad/loginestudiante", modelo);
	}

	@RequestMapping("/verficarestudiante")
	public ModelAndView verficarestudiante(HttpServletRequest request, String consulta, String dip, String fec_nacimiento) throws ParseException {
		HashMap modelo = new HashMap();
		System.out.println("consulta en verificar:" + consulta);
		modelo.put("consulta", consulta);
		DatosVerificar datos = new DatosVerificar();
		Integer id_consulta = Integer.parseInt(new String(Base64.getDecoder().decode(consulta)));
		System.out.println("id_consulta: "+id_consulta);
		System.out.println("dip: "+dip);
		Date fec_nacimiento_aux=new SimpleDateFormat("yyyy-MM-dd").parse(fec_nacimiento);
		System.out.println("fec_nacimiento: "+fec_nacimiento);
		datos.setId_consulta_estudiantil(id_consulta);
		datos.setFec_nacimiento(fec_nacimiento_aux);
		datos.setDip(dip);
		modelo.put("datos", datos);
		System.out.println(datos);
		return new ModelAndView("seguridad/loginestudiante", modelo);
	}
}
