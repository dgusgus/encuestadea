package bo.edu.uto.plantillaproyectomaven.dominios;
// Generated 07-07-2015 10:15:39 AM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;
import org.apache.ibatis.type.Alias;

@Alias("Roles")
public class Roles implements java.io.Serializable {

	private int idRol;
	private Boolean idEstado;
	private String rol;
	private String descripcion;
	private Set menuses = new HashSet(0);
	private Set usrRoleses = new HashSet(0);

	public Roles() {
	}

	public Roles(int idRol, String rol) {
		this.idRol = idRol;
		this.rol = rol;
	}

	public Roles(int idRol, Boolean idEstado, String rol, String descripcion, Set menuses, Set usrRoleses) {
		this.idRol = idRol;
		this.idEstado = idEstado;
		this.rol = rol;
		this.descripcion = descripcion;
		this.menuses = menuses;
		this.usrRoleses = usrRoleses;
	}

	public int getIdRol() {
		return this.idRol;
	}

	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}

	public Boolean getIdEstado() {
		return this.idEstado;
	}

	public void setIdEstado(Boolean idEstado) {
		this.idEstado = idEstado;
	}

	public String getRol() {
		return this.rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Set getMenuses() {
		return this.menuses;
	}

	public void setMenuses(Set menuses) {
		this.menuses = menuses;
	}

	public Set getUsrRoleses() {
		return this.usrRoleses;
	}

	public void setUsrRoleses(Set usrRoleses) {
		this.usrRoleses = usrRoleses;
	}

}
