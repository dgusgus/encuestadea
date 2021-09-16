package bo.edu.uto.encuestadea.dominios;

public class AccesoUsuario implements java.io.Serializable {

	private Integer id_unidad_usuario;
	private Integer id_usuario;
	private String id_facultad;
	private Integer id_unidad;

	public Integer getId_unidad_usuario() {
		return id_unidad_usuario;
	}

	public void setId_unidad_usuario(Integer id_unidad_usuario) {
		this.id_unidad_usuario = id_unidad_usuario;
	}

	public Integer getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Integer id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getId_facultad() {
		return id_facultad;
	}

	public void setId_facultad(String id_facultad) {
		this.id_facultad = id_facultad;
	}

	public Integer getId_unidad() {
		return id_unidad;
	}

	public void setId_unidad(Integer id_unidad) {
		this.id_unidad = id_unidad;
	}

}
