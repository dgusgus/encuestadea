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

    private Long id_integrante_comision;
    private Long id_comision;
    private Long id_usuario;
    private String nombre;

    public Long getId_integrante_comision() {
        return id_integrante_comision;
    }

    public void setId_integrante_comision(Long id_integrante_comision) {
        this.id_integrante_comision = id_integrante_comision;
    }

    public Long getId_comision() {
        return id_comision;
    }

    public void setId_comision(Long id_comision) {
        this.id_comision = id_comision;
    }

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
        
    
}
