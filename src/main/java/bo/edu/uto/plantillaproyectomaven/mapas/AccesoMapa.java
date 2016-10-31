package bo.edu.uto.plantillaproyectomaven.mapas;

import bo.edu.uto.plantillaproyectomaven.dominios.Enlaces;
import bo.edu.uto.plantillaproyectomaven.dominios.Roles;
import java.util.List;


/**
 *
 * @author dtic
 */
public interface AccesoMapa {

	public Object[] getDatosUsuario(String apodo);

	public List<Roles> getRolList(Integer id_usuario);

	public List<Enlaces> getEnlacesMenu(Integer id_rol);

	public int setCambioClaveDCT(String usuario, String clave);

	public int getRolUsr(String usuario);
}
