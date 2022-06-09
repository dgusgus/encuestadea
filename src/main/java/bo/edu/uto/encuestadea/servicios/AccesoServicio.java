package bo.edu.uto.encuestadea.servicios;

import bo.edu.uto.encuestadea.dominios.Rol;
import bo.edu.uto.encuestadea.dominios.UsuarioAcceso;
import bo.edu.uto.encuestadea.mapas.AccesoMapa;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bo.edu.uto.encuestadea.mapas.RolMapa;

/**
 *
 * @author dtic
 */
@Service("accesoServicio")
@Transactional(readOnly = true)
public class AccesoServicio implements UserDetailsService {

	@Autowired
	AccesoMapa accesoMapa;
	@Autowired
	RolMapa rolesMapa;

	@Override
	public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {
		UsuarioAcceso usuario = accesoMapa.getUsuario(string);
		List datosUsusario = accesoMapa.getDatosUsuario(string);
		if (null == usuario) {
			throw new UsernameNotFoundException("Usuario NO Registrado");
		}
		UsuarioAcceso primero = (UsuarioAcceso)datosUsusario.get(0);
		List<GrantedAuthority> rolesAuth = new ArrayList<>();
		List<Rol> roles = new ArrayList<Rol>();
		roles = rolesMapa.getRoles(primero.getId_usuario());
		usuario.setRoles(roles);
		for (Rol rol : roles) {
			rolesAuth.add(new SimpleGrantedAuthority("ROLE_"+rol.getRol().toUpperCase()));
		}
		System.out.println("auths");
		for(GrantedAuthority auth:rolesAuth)
			System.out.println(auth.getAuthority());
		boolean enabled = (Boolean) true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		UserDetails user = new User(
				usuario.getApodo(), usuario.getClave(),
				enabled,
				accountNonExpired,
				credentialsNonExpired,
				accountNonLocked,
				rolesAuth);
		return user;
	}

}
