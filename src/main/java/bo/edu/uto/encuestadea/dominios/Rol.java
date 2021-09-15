package bo.edu.uto.encuestadea.dominios;
// Generated 07-07-2015 10:15:39 AM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;
import org.apache.ibatis.type.Alias;

@Alias("Rol")
public class Rol implements java.io.Serializable {

	private int id_rol;

	private String rol;
	private String descripcion;

	private boolean id_estado;

	public int getId_rol() {
		return id_rol;
	}

	public void setId_rol(int id_rol) {
		this.id_rol = id_rol;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public boolean isId_estado() {
		return id_estado;
	}

	public void setId_estado(boolean id_estado) {
		this.id_estado = id_estado;
	}
}
