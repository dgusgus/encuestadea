package bo.edu.uto.plantillaproyectomaven.daos;

import bo.edu.uto.plantillaproyectomaven.dominios.Usuarios;
import java.util.List;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author dtic
 */
public interface UsuarioDao {

	List getUsuarios() throws DataAccessException;

	public List<Object[]> getUsuarios(String nombre, String dip) throws DataAccessException;

	Usuarios getBuscarUsuarios(String apodo) throws DataAccessException;

	Usuarios getUsuario(Integer idUsuario) throws DataAccessException;

	boolean setEditarUsuario(Integer id, String apodo, String recordatorio, Boolean estado) throws DataAccessException;

	public boolean cambiarPassword(Integer id, String password, String password1) throws DataAccessException;

	public boolean setResetPassword(Integer id_usuario) throws DataAccessException;

	public boolean setDarAltaBaja(Integer id_usuario, boolean alta) throws DataAccessException;

}
