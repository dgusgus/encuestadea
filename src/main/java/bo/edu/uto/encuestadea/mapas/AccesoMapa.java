package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Enlaces;
import bo.edu.uto.encuestadea.dominios.Rol;
import bo.edu.uto.encuestadea.dominios.UsuarioAcceso;
import java.util.List;

/**
 *
 * @author dtic
 */
public interface AccesoMapa {
	public List getDatosUsuario(String apodo);
	public UsuarioAcceso getDatosUsuarioPublic(String apodo);
	public UsuarioAcceso getUsuario(String apodo);
	public UsuarioAcceso getUsuarioByIdUsuario(Integer id_usuario);
	public List<Rol> getRolList(Integer id_usuario);
	public List<Enlaces> getEnlacesMenu(Integer id_rol);
	public int getRolUsr(String usuario);
}
