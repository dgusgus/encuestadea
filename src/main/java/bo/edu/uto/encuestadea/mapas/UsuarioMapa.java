package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Usuarios;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface UsuarioMapa {

	List<Usuarios> getUsuarios() throws DataAccessException;

}
