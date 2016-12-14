package bo.edu.uto.encuestadea.dominios;

public class AccesoUsuario  implements java.io.Serializable {

	private Long id_unidad_usuario;
	private Long id_usuario;
	private String id_facultad;
	private Long id_unidad;

	public Long getId_unidad_usuario() {
		return id_unidad_usuario;
	}

	public void setId_unidad_usuario(Long id_unidad_usuario) {
		this.id_unidad_usuario = id_unidad_usuario;
	}
	
	public Long getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Long id_usuario) {
		this.id_usuario = id_usuario;
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


