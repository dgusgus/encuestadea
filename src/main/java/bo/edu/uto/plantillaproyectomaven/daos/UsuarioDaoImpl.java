package bo.edu.uto.plantillaproyectomaven.daos;

import bo.edu.uto.plantillaproyectomaven.dominios.Usuarios;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Raúl Velásquez
 */
@Repository(value="usuarios")
public class UsuarioDaoImpl implements UsuarioDao {

	@Override
	public List getUsuarios() throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public List<Object[]> getUsuarios(String nombre, String dip) throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public Usuarios getBuscarUsuarios(String apodo) throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public Usuarios getUsuario(Integer idUsuario) throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public boolean setEditarUsuario(Integer id, String apodo, String recordatorio, Boolean estado) throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public boolean cambiarPassword(Integer id, String password, String password1) throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public boolean setResetPassword(Integer id_usuario) throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public boolean setDarAltaBaja(Integer id_usuario, boolean alta) throws DataAccessException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}
}
