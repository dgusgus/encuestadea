package bo.edu.uto.encuestadea.dominios;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Alias("UsuarioAcceso")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioAcceso implements java.io.Serializable {

	private Integer id_persona;
	private Integer id_usuario;
	private String apodo;
	private String clave;
	private String nombre_completo;
	private String id_facultad;
	private Integer id_unidad;
	private Boolean id_estado;

	private Persona persona;

	private List<Rol> roles;
}
