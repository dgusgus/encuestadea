package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Enlaces;
import bo.edu.uto.encuestadea.dominios.Roles;
import bo.edu.uto.encuestadea.dominios.UsuarioAcceso;
import java.util.List;


/**
 *
 * @author dtic
 */
public interface AccesoMapa {

	public UsuarioAcceso getDatosUsuario(String apodo);

	public List<Roles> getRolList(Integer id_usuario);

	public List<Enlaces> getEnlacesMenu(Integer id_rol);

	public int getRolUsr(String usuario);
}
