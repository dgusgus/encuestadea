package bo.edu.uto.encuestadea.dominios;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DatosVerificar{

	private Integer id_estudiante_materia;
	private Integer id_persona;
	private Integer id_materia;
	private Integer id_grupo;
	private Integer id_gestion;
	private Integer id_consulta_estudiantil;

	private String dip;
	private Date fec_nacimiento;
}
