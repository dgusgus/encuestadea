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
public class InformeMemoria {
	//private Integer id_planilla_avance_detalle;
	//private String id_tipo_actividad;
	private Integer id_informe;
	//private String fecha_mod;
	//private String id_usuario_mod;
	//private String id_estado;
	private String grado;
	private String datalle;
	private Date fecha_fin;
	private Date fecha_ini;
	private String nombre_actividad;
	private Integer id_actividad_docente;

	//datos de la TABLA actividades_academicas_docente"
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

	//datos de la TABLA actividades_academicas_docente"
	private Integer id_actividad_academica_docente;
	/**
	private Integer nivel_actividad_academica_padre;
	private String actividad_academica;
	private Boolean estado;
	private Integer usuario_mod;
	private Integer nivel_actividad_academica_hijo;
	private Integer nivel_actividad_academica_subhijo;
	**/
	private Integer tipo_de_actividad;

	//datos de la TABLA tipo_actividad"
	private String nombre_tipo;

}
