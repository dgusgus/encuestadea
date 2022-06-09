package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class EstudianteMateria {
	private Integer id_estudiante_materia;
	private Integer id_persona;
	private String sigla_materia;
	private String paralelo;
	private Integer anio;
	private String estado;
	private Boolean id_estado;
	private Date fecha_modificacion;
}
