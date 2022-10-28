package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Rol implements java.io.Serializable {
	private Integer id_rol;
	private Boolean id_estado;
	private String rol;
	private String descripcion;
	private Integer id_sistema;

	private List menus;
}
