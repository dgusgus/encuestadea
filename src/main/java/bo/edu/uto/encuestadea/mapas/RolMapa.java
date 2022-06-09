package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Rol;
import bo.edu.uto.encuestadea.dominios.UsuarioAcceso;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface RolMapa {

	List<Rol> getRoles(Integer id_usuario) throws DataAccessException;

}
