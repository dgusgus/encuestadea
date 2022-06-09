package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonInclude;
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
	private int idEnlace;
	private int idEnlacePadre;
	private boolean idEstado;
	private int orden;
	private int nivel;
	private String enlace;
	private String ruta;
	private Set menuses = new HashSet(0);
}
