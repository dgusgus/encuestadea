package bo.edu.uto.plantillaproyectomaven.servicios;

import bo.edu.uto.plantillaproyectomaven.dominios.Usuarios;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bo.edu.uto.plantillaproyectomaven.mapas.UsuarioMapa;

/**
 *
 * @author dtic
 */
@Service
@Transactional
public class UsuarioServicio{

	@Autowired
	UsuarioMapa usuarioMapa;

	public List<Usuarios> getUsuarios() {
		return this.usuarioMapa.getUsuarios();
	}

}
