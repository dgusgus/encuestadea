/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.dominios;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author raul
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
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
}
