/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.dominios;

import java.util.Date;

/**
 *
 * @author raul velasquez
 */
public class Encuesta {
	private Long id_encuesta;
	private Long id_materia;
	private Long id_grupo;
	private Long id_gestion;
	private Long id_docente;
	private Long id_usuario;
	private boolean id_estado;
	private Date fecha_creacion;
	private Long ultimo_usuario_modificador;
	private Date fecha_ultima_modificacion;

	public Long getId_encuesta() {
		return id_encuesta;
	}

	public void setId_encuesta(Long id_encuesta) {
		this.id_encuesta = id_encuesta;
	}

	public Long getId_materia() {
		return id_materia;
	}

	public void setId_materia(Long id_materia) {
		this.id_materia = id_materia;
	}

	public Long getId_grupo() {
		return id_grupo;
	}

	public void setId_grupo(Long id_grupo) {
		this.id_grupo = id_grupo;
	}

	public Long getId_gestion() {
		return id_gestion;
	}

	public void setId_gestion(Long id_gestion) {
		this.id_gestion = id_gestion;
	}

	public Long getId_docente() {
		return id_docente;
	}

	public void setId_docente(Long id_docente) {
		this.id_docente = id_docente;
	}	

	public Long getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Long id_usuario) {
		this.id_usuario = id_usuario;
	}

	public boolean isId_estado() {
		return id_estado;
	}

	public void setId_estado(boolean id_estado) {
		this.id_estado = id_estado;
	}

	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	public Long getUltimo_usuario_modificador() {
		return ultimo_usuario_modificador;
	}

	public void setUltimo_usuario_modificador(Long ultimo_usuario_modificador) {
		this.ultimo_usuario_modificador = ultimo_usuario_modificador;
	}

	public Date getFecha_ultima_modificacion() {
		return fecha_ultima_modificacion;
	}

	public void setFecha_ultima_modificacion(Date fecha_ultima_modificacion) {
		this.fecha_ultima_modificacion = fecha_ultima_modificacion;
	}	
}
