package bo.edu.uto.plantillaproyectomaven.servicios;

import bo.edu.uto.plantillaproyectomaven.dominios.Usuarios;
import java.util.List;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author dtic
 */
public interface UsuarioServicio {

	public List<Usuarios> getUsuarios();

	public List<Object[]> getUsuarios(String nombre, String dip) throws DataAccessException;

	Usuarios getBuscarUsuarios(String apodo) throws DataAccessException;

	Usuarios getUsuario(Integer idUsuario) throws DataAccessException;

	boolean setEditarUsuario(Integer id, String apodo, String recordatorio, Boolean estado) throws DataAccessException;

	boolean cambiarPassword(Integer id, String passwordant, String passwordnuevo) throws DataAccessException;

	boolean setResetPassword(Integer idUsuario) throws DataAccessException;

	boolean setDarAltaBaja(Integer id_usuario, boolean alta) throws DataAccessException;

}
