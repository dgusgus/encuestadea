package bo.edu.uto.plantillaproyectomaven.servicios;

import bo.edu.uto.plantillaproyectomaven.dominios.Roles;
import bo.edu.uto.plantillaproyectomaven.dominios.Usuarios;
import java.util.ArrayList;
import java.util.List;
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
@Service("acceso")
@Transactional(readOnly = true)
public class AccesoServicio implements UserDetailsService{

	@Override
	public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {

		Object usuario = new Usuarios(0, "Raul", "password");
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
				"Raul", "password",
				enabled,
				accountNonExpired,
				credentialsNonExpired,
				accountNonLocked,
				rolesAuth);
		return user;
	}

}
