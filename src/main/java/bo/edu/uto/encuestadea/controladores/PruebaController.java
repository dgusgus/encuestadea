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
@RequestMapping("/prueba/**")
public class PruebaController {

	@RequestMapping
	@ResponseBody
	public Object index() {
		HashMap modelo = new HashMap();
		modelo.put("lista", null);

		return modelo;
	}
}
