/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.dominios;

import java.util.List;

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
	private String facultad_materia;
	private String id_facultad;
	private Long id_unidad;
	private String unidad;
	private Long id_usuario;
	private List integrantes_comision;
	private double IT1 = 0;//Resultad1
	private double IT2 = 0; //Resultad2
	private double IT3 = 0; //Resultad3

	private String val1 = "";//comentario1
	private String val2 = ""; //comentario1
	private double val3 = 0; //comentario1

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

	public String getFacultad_materia() {
		return facultad_materia;
	}

	public void setFacultad_materia(String facultad_materia) {
		this.facultad_materia = facultad_materia;
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

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}

	public Long getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Long id_usuario) {
		this.id_usuario = id_usuario;
	}

	public List getIntegrantes_comision() {
		return integrantes_comision;
	}

	public void setIntegrantes_comision(List integrantes_comision) {
		this.integrantes_comision = integrantes_comision;
	}

	public double getIT1() {
		return IT1;
	}

	public void setIT1(double IT1) {
		this.IT1 = IT1;
	}

	public double getIT2() {
		return IT2;
	}

	public void setIT2(double IT2) {
		this.IT2 = IT2;
	}

	public double getIT3() {
		return IT3;
	}

	public void setIT3(double IT3) {
		this.IT3 = IT3;
	}

	public String getVal1() {
		return val1;
	}

	public void setVal1(String val1) {
		this.val1 = val1;
	}

	public String getVal2() {
		return val2;
	}

	public void setVal2(String val2) {
		this.val2 = val2;
	}

	public double getVal3() {
		return val3;
	}

	public void setVal3(double val3) {
		this.val3 = val3;
	}
}
