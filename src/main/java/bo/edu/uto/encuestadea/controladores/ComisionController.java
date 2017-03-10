package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.IntegranteComision;
import bo.edu.uto.encuestadea.dominios.RespuestasEncuesta;
import bo.edu.uto.encuestadea.mapas.DocenteMapa;
import bo.edu.uto.encuestadea.mapas.IntegranteComisionMapa;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/comision/**")
public class ComisionController {
		
	@Autowired
	private DocenteMapa docenteMapa;	
	@Autowired
	private IntegranteComisionMapa integranteComisionMapa;

	@RequestMapping(value = "/index")	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		HashMap modelo = new HashMap();		
		Long id_usuario = (Long) session.getAttribute("__id_usuario");
		String apodo = (String) session.getAttribute("__apodo");
		modelo.put("logout", id_usuario == null);	
		List<IntegranteComision> integrantes = integranteComisionMapa.getIntegrantesComisionPorIdUsuario(id_usuario);
		modelo.put("id_usuario",id_usuario);
		modelo.put("integrantes",integrantes);
		modelo.put("apodo",apodo);
		return new ModelAndView("comision/index", modelo);
	}
			
	@RequestMapping("/guardar")
	@ResponseBody
	public Map guardar(HttpSession hs, IntegranteComision integrante) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException {
		Map modelo = new HashMap();
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");
		integrante.setId_usuario(id_usuario);
		integrante.setId_comision(0L);
		integranteComisionMapa.insertarIntegrante(integrante);
		modelo.put("resultado",true);
		return modelo;
	}
	
	@RequestMapping("/eliminar")
	@ResponseBody
	public Boolean eliminar(IntegranteComision integranteComision, HttpSession hs){
		Map modelo = new HashMap();
		int cantidadEliminados = integranteComisionMapa.borrarIntegrante(integranteComision);
		if(cantidadEliminados>0) return true;
		else return false;
	}
	
	@RequestMapping("/buscar")
	@ResponseBody
	public IntegranteComision buscar(IntegranteComision integranteComision, HttpSession hs){
		integranteComision = integranteComisionMapa.getIntegranteComision(integranteComision);
		return integranteComision;
	}	
	
	@RequestMapping("/modificar")
	@ResponseBody
	public boolean modificar(IntegranteComision integranteComision, HttpSession hs){
		Map modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		
		integranteComision.setId_usuario(id_usuario);
		integranteComision.setId_comision(0L);
		int cantidadModificados = integranteComisionMapa.modificarInegranteComision(integranteComision);
		if(cantidadModificados > 0)
			return true;
		else return false;
	}
}
