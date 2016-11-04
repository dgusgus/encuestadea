package bo.edu.uto.plantillaproyectomaven.servicios;

import bo.edu.uto.plantillaproyectomaven.dominios.Roles;
import bo.edu.uto.plantillaproyectomaven.dominios.UsuarioAcceso;
import bo.edu.uto.plantillaproyectomaven.dominios.Usuarios;
import bo.edu.uto.plantillaproyectomaven.mapas.AccesoMapa;
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

/**
 *
 * @author dtic
 */
@Service("accesoServicio")
@Transactional(readOnly = true)
public class AccesoServicio implements UserDetailsService{

	@Autowired
	AccesoMapa accesoMapa;
	
	@Override
	public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {

		UsuarioAcceso usuario = accesoMapa.getDatosUsuario(string);
		if (null == usuario) {
			throw new UsernameNotFoundException("Usuario NO Registrado");
		}
		List<GrantedAuthority> rolesAuth = new ArrayList<GrantedAuthority>();

		List<Roles> roles = new ArrayList<Roles>();
		roles.add(new Roles(0, "0"));
		for (Roles rol : roles) {
			rolesAuth.add(new SimpleGrantedAuthority(String.valueOf(rol.getIdRol())));
		}

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
