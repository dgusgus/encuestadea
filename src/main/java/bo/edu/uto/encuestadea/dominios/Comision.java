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
public class Comision {

	private Long id_comision;	
	private String nombre;
        private String id_facultad;
        private Long id_unidad;

    public Long getId_comision() {
        return id_comision;
    }

    public void setId_comision(Long id_comision) {
        this.id_comision = id_comision;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getId_facultad() {
        return id_facultad;
    }

    public void setId_facultad(String id_facultad) {
        this.id_facultad = id_facultad;
    }

    public Long getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(Long id_unidad) {
        this.id_unidad = id_unidad;
    }

	
}