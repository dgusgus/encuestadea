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
public class ConsultaEstudiantil {
	private Integer id_consulta_estudiantil;
	private Integer id_materia;
	private Integer id_grupo;
	private Integer id_gestion;
	private Integer id_docente;
	private Integer id_usuario;
	private Integer ultimo_usuario_modificador;
	private Date fecha_ultima_modificacion;
	private Date fecha_creacion;
	private String estado;
	private Boolean id_estado;
	private String sigla_paralelo_teoria;

	private String nombre_docente;
	private String nombre_materia;
	private String sigla_materia;
	private String paralelo;
	private String gestion;
	private String facultad;
}
