/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.dominios;

/**
 *
 * @author raul velasquez
 */
public class Unidad {

	private Long id_unidad;
	private String unidad;
	private String id_facultad;
	private String codigo;

	public Long getId_unidad() {
		return id_unidad;
	}

	public void setId_unidad(Long id_unidad) {
		this.id_unidad = id_unidad;
	}

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}

	public String getId_facultad() {
		return id_facultad;
	}

	public void setId_facultad(String id_facultad) {
		this.id_facultad = id_facultad;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

}
