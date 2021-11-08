/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.dominios;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CriterioBusqueda {
	private String tipoBusqueda;
	private String cadenaBusqueda;
	private String inicio;
	private String offset;
	private int entero1;
	private int entero2;
	private int entero3;
	private String cadena1;
	private String cadena2;
	private String cadena3;
	private Integer id_unidad;
	private String facultad;
	private Integer id_persona;
}
