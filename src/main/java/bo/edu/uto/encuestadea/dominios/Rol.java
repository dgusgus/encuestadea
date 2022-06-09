package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Rol implements java.io.Serializable {
	private int id_rol;
	private String rol;
	private String descripcion;

	private boolean id_estado;
}
