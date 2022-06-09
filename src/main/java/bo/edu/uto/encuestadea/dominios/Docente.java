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
public class Docente {

	private Integer id_materia;
	private Integer id_grupo;
	private Integer id_gestion;
	private Integer id_docente;
	private String dip;
	private String titulo;
	private String nombre;
	private String sigla;
	private String grupo;
	private String titularia;
	private String nombreMateria;
	private int anioGestion;
	private String gestion;
	private String facultad_materia;
	private String id_facultad;
	private Integer id_unidad;
	private String unidad;
	private Integer id_usuario;
	private List integrantes_comision;
	private String sigla_paralelo_teoria;
	private double IT1 = 0;//Resultad1
	private double IT2 = 0; //Resultad2
	private double IT3 = 0; //Resultad3

	private String val1 = "";//comentario1
	private String val2 = ""; //comentario1
	private double val3 = 0; //comentario1
}
