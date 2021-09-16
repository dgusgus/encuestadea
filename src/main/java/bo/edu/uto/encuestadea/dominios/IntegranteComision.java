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
public class IntegranteComision {

	private Integer id_integrante_comision;
	private Integer id_comision;
	private Integer id_usuario;
	private String nombre;

	public Integer getId_integrante_comision() {
		return id_integrante_comision;
	}

	public void setId_integrante_comision(Integer id_integrante_comision) {
		this.id_integrante_comision = id_integrante_comision;
	}

	public Integer getId_comision() {
		return id_comision;
	}

	public void setId_comision(Integer id_comision) {
		this.id_comision = id_comision;
	}

	public Integer getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Integer id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}
