/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.plantillaproyectomaven.dominios;

/**
 *
 * @author raul velasquez
 */
public class Docente {

	private Long id_materia;
	private Long id_grupo;
	private Long id_gestion;
	private Long id_docente;
	private String dip;
	private String titulo;
	private String nombre;
	private String sigla;
	private String grupo;
	private String titularia;
	private String nombreMateria;
	private int anioGestion;
	private String gestion;

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
	
	public String getDip() {
		return dip;
	}

	public void setDip(String dip) {
		this.dip = dip;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

	public String getTitularia() {
		return titularia;
	}

	public void setTitularia(String titularia) {
		this.titularia = titularia;
	}

	public String getNombreMateria() {
		return nombreMateria;
	}

	public void setNombreMateria(String nombreMateria) {
		this.nombreMateria = nombreMateria;
	}

	public int getAnioGestion() {
		return anioGestion;
	}

	public void setAnioGestion(int anioGestion) {
		this.anioGestion = anioGestion;
	}

	public String getGestion() {
		return gestion;
	}

	public void setGestion(String gestion) {
		this.gestion = gestion;
	}	
}
