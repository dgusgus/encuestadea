package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Usuarios;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface UsuarioMapa {
	@PreAuthorize("hasRole('ROLE_ADMINISTRADOR')")
	List<Usuarios> getUsuarios() throws DataAccessException;
	@PreAuthorize("hasRole('ROLE_ADMINISTRADOR')")
	Usuarios getUsuario(Usuarios usuario)throws DataAccessException;
	@PreAuthorize("hasRole('ROLE_ADMINISTRADOR')")
	Usuarios insertarUsuario(Usuarios usuario)throws DataAccessException;
	@PreAuthorize("hasRole('ROLE_ADMINISTRADOR')")
	int borrarUsuario(Usuarios usuario)throws DataAccessException;
}
