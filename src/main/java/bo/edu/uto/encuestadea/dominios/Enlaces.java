package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.List;
import java.util.HashSet;
import java.util.Set;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Enlaces implements java.io.Serializable {
	private Integer id_enlace;
	private Integer id_enlace_padre;
	private Boolean id_estado;
	private Integer orden;
	private Integer nivel;
	private String enlace;
	private String ruta;
	private String posicion;

	private String id_rol;
	private Set menuses = new HashSet(0);
	private List<Enlaces> enlaces;
}
