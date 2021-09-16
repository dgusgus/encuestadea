package bo.edu.uto.encuestadea.dominios;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Alias("Usuarios")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Usuarios implements java.io.Serializable {

	private Integer id_usuario;
	private Boolean id_estado;
	private String apodo;
	private String clave;
	private Integer id_persona;

	public Usuarios(Integer id_usuario) {
		this.id_usuario = id_usuario;
	}

	public Usuarios(Integer id_usuario, String apodo, String clave) {
		this.id_usuario = id_usuario;
		this.apodo = apodo;
		this.clave = clave;
	}

}
