/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PlanillaAvanceDetalle {
	private Integer id_planilla_avance_detalle;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date fecha_planificacion;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date fecha_ejecucion;
	private String actividad;
	private String observacion;
	private Boolean id_estado;
	private Integer id_usuario_mod;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date fecha_mod;
	private Integer id_tipo_actividad;
	private Integer id_planilla_avance;
}
