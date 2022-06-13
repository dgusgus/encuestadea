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
	private Integer id_comision;

	private String nombre;
	private String abrev;
	private String unidad;

	public Usuarios(Integer id_usuario){
		this.id_usuario = id_usuario;
	}
}
