package bo.edu.uto.plantillaproyectomaven.dominios;

import java.util.HashSet;
import java.util.Set;

public class Enlaces implements java.io.Serializable {

	private int idEnlace;
	private int idEnlacePadre;
	private boolean idEstado;
	private int orden;
	private int nivel;
	private String enlace;
	private String ruta;
	private Set menuses = new HashSet(0);

	public Enlaces() {
	}

	public Enlaces(int idEnlace, int idEnlacePadre, boolean idEstado, int orden, int nivel, String enlace, String ruta) {
		this.idEnlace = idEnlace;
		this.idEnlacePadre = idEnlacePadre;
		this.idEstado = idEstado;
		this.orden = orden;
		this.nivel = nivel;
		this.enlace = enlace;
		this.ruta = ruta;
	}

	public Enlaces(int idEnlace, int idEnlacePadre, boolean idEstado, int orden, int nivel, String enlace, String ruta, Set menuses) {
		this.idEnlace = idEnlace;
		this.idEnlacePadre = idEnlacePadre;
		this.idEstado = idEstado;
		this.orden = orden;
		this.nivel = nivel;
		this.enlace = enlace;
		this.ruta = ruta;
		this.menuses = menuses;
	}

	public int getIdEnlace() {
		return this.idEnlace;
	}

	public void setIdEnlace(int idEnlace) {
		this.idEnlace = idEnlace;
	}

	public int getIdEnlacePadre() {
		return this.idEnlacePadre;
	}

	public void setIdEnlacePadre(int idEnlacePadre) {
		this.idEnlacePadre = idEnlacePadre;
	}

	public boolean isIdEstado() {
		return this.idEstado;
	}

	public void setIdEstado(boolean idEstado) {
		this.idEstado = idEstado;
	}

	public int getOrden() {
		return this.orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	public int getNivel() {
		return this.nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public String getEnlace() {
		return this.enlace;
	}

	public void setEnlace(String enlace) {
		this.enlace = enlace;
	}

	public String getRuta() {
		return this.ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	public Set getMenuses() {
		return this.menuses;
	}

	public void setMenuses(Set menuses) {
		this.menuses = menuses;
	}

}
