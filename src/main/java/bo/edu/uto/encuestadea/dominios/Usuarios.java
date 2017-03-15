package bo.edu.uto.encuestadea.dominios;

import org.apache.ibatis.type.Alias;

@Alias("Usuarios")
public class Usuarios  implements java.io.Serializable {

    private Long id_usuario;    
    private Boolean id_estado;
    private String apodo;
    private String clave;
    private String recordatorio;

    public Usuarios() {
    }

	public Usuarios(Long idUsuario) {
		this.id_usuario = idUsuario;
	}
	
    public Usuarios(Long idUsuario, String apodo, String clave) {
        this.id_usuario = idUsuario;
        this.apodo = apodo;
        this.clave = clave;
    }
    public Usuarios(Long idUsuario, Boolean idEstado, String apodo, String clave, String recordatorio) {
       this.id_usuario = idUsuario;
       this.id_estado = idEstado;
       this.apodo = apodo;
       this.clave = clave;
       this.recordatorio = recordatorio;
    }

	public Long getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Long id_usuario) {
		this.id_usuario = id_usuario;
	}

	
	public String getApodo() {
		return apodo;
	}

	public void setApodo(String apodo) {
		this.apodo = apodo;
	}

	public String getClave() {
		return clave==null?"sin clave":"*********";
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getRecordatorio() {
		return recordatorio;
	}

	public void setRecordatorio(String recordatorio) {
		this.recordatorio = recordatorio;
	}

	public Boolean getId_estado() {
		return id_estado;
	}

	public void setId_estado(Boolean id_estado) {
		this.id_estado = id_estado;
	}
}


