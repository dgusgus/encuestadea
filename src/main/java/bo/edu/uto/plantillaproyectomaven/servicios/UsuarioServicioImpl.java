package bo.edu.uto.plantillaproyectomaven.servicios;

import bo.edu.uto.plantillaproyectomaven.daos.UsuarioDao;
import bo.edu.uto.plantillaproyectomaven.dominios.Usuarios;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author dtic
 */
@Service
@Transactional
public class UsuarioServicioImpl implements UsuarioServicio {

	@Autowired
	UsuarioDao usuarioDao;

	@Override
	public List<Usuarios> getUsuarios() {
		return this.usuarioDao.getUsuarios();
	}

	@Override
	public List<Object[]> getUsuarios(String nombre, String dip) throws DataAccessException {
		return this.usuarioDao.getUsuarios(nombre, dip);
	}

	@Override
	public Usuarios getBuscarUsuarios(String apodo) {
		return this.usuarioDao.getBuscarUsuarios(apodo);
	}

	@Override
	public Usuarios getUsuario(Integer idUsuario) {
		return this.usuarioDao.getUsuario(idUsuario);
	}

	@Override
	public boolean setEditarUsuario(Integer id, String apodo, String recordatorio, Boolean estado) throws DataAccessException {
		boolean resultado = false;
		resultado = this.usuarioDao.setEditarUsuario(id, apodo, recordatorio, estado);
		return resultado;
	}

	@Override
	public boolean cambiarPassword(Integer id, String passwordant, String passwordnuevo) throws DataAccessException {
		boolean resultado = false;
		resultado = this.usuarioDao.cambiarPassword(id, passwordant, passwordnuevo);
		return resultado;
	}

	@Override
	public boolean setResetPassword(Integer id_usuario) throws DataAccessException {
		return this.usuarioDao.setResetPassword(id_usuario);
	}

	@Override
	public boolean setDarAltaBaja(Integer id_usuario, boolean alta) throws DataAccessException {
		return this.usuarioDao.setDarAltaBaja(id_usuario, alta);
	}

}
