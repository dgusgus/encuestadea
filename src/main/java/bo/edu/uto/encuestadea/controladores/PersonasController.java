package bo.edu.uto.encuestadea.controladores;

import bo.edu.uto.encuestadea.mapas.PersonasMapa;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author dtic
 */
@Controller
@RequestMapping("/personas/**")
public class PersonasController {

	@Autowired
	private PersonasMapa personasMapa;

	@RequestMapping
	@ResponseBody
	public List buscarPersonas(String term, HttpServletRequest hsr, HttpSession hs) {
		HashMap modelo = new HashMap();
		// Verificando si el Usuario sigue autentificado.
		Long id_usuario = (Long) hs.getAttribute("__id_usuario");
		modelo.put("logout", id_usuario == null);
		//
		term = "%" + term.trim().replaceAll("\\s+", "%") + "%";
		//
		List lista = personasMapa.buscarPersonas(term);
		//
		modelo.put("lista", lista);

		return lista;
	}
}
