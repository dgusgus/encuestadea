package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.AccesoUsuario;
import bo.edu.uto.encuestadea.dominios.Usuarios;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface AccesoUsuarioMapa {

	List<AccesoUsuario> getAccesosUsuario (Usuarios usuario);
}
