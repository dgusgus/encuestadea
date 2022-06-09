package bo.edu.uto.encuestadea.dominios;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(Include.NON_NULL)
public class Encuesta {

	private Integer id_encuesta;
	private Integer id_materia;
	private Integer id_grupo;
	private Integer id_gestion;
	private Integer id_docente;
	private Integer id_usuario;
	private boolean id_estado;
	private Date fecha_creacion;
	private Integer ultimo_usuario_modificador;
	private Date fecha_ultima_modificacion;
}
