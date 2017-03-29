package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Personas;
import java.util.List;
import org.springframework.dao.DataAccessException;


/**
 *
 * @author dtic
 */
public interface PersonasMapa {

	public List<Personas> buscarPersonas(String term)throws DataAccessException;
}
