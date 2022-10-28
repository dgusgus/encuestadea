package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.dominios.AccesoUsuario;
import bo.edu.uto.encuestadea.dominios.ConsultaEstudiantil;
import bo.edu.uto.encuestadea.dominios.Rol;
import bo.edu.uto.encuestadea.dominios.UsuarioAcceso;
import bo.edu.uto.encuestadea.mapas.AccesoMapa;
import bo.edu.uto.encuestadea.mapas.ConsultaEstudiantilMapa;
import bo.edu.uto.encuestadea.mapas.MenuMapa;
import bo.edu.uto.encuestadea.mapas.RolMapa;
import bo.edu.uto.encuestadea.mapas.UsuarioMapa;
import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.text.ParseException;
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
@RequestMapping("/menus/**")
public class MenusController {

	@Autowired
	MenuMapa menuMapa;

	@RequestMapping(value = "/index")
	@ResponseBody
	public Object index() {
		HashMap modelo = new HashMap();
		List personas = menuMapa.getAll();
		modelo.put("personas", personas);

		return new ModelAndView("persona/index", modelo);
	}

	@RequestMapping(value = "/listarmenu")
	@ResponseBody
	public ModelAndView listarmenu() throws ParseException   {
		HashMap modelo = new HashMap();
		List menus = menuMapa.getAll();
		modelo.put("menus", menus);
		return new ModelAndView("menu_main/menu", modelo);
	}

	@RequestMapping(value = "/menu_rol")
	@ResponseBody
	public Object listar(Integer id_rol) throws ParseException {
		System.out.println(id_rol);
		HashMap modelo = new HashMap();
		List enlaces = menuMapa.selectMenuPadres(id_rol);
//		System.out.println(""+enlaces.toString());
		modelo.put("enlaces", enlaces);
//		return new ModelAndView("persona/listar", modelo);
//		return new ModelAndView("menu_main/menu", modelo);
		return modelo;
	}

}
