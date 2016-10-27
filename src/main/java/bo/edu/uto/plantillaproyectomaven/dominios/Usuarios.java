package bo.edu.uto.plantillaproyectomaven.dominios;

import org.apache.ibatis.type.Alias;

@Alias("Usuarios")
public class Usuarios  implements java.io.Serializable {

    private int idUsuario;    
    private Boolean idEstado;
    private String apodo;
    private String clave;
    private String recordatorio;

    public Usuarios() {
    }
	
    public Usuarios(int idUsuario, String apodo, String clave) {
        this.idUsuario = idUsuario;
        this.apodo = apodo;
        this.clave = clave;
    }
    public Usuarios(int idUsuario, Boolean idEstado, String apodo, String clave, String recordatorio) {
       this.idUsuario = idUsuario;
       this.idEstado = idEstado;
       this.apodo = apodo;
       this.clave = clave;
       this.recordatorio = recordatorio;
    }

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Boolean getIdEstado() {
		return idEstado;
	}

	public void setIdEstado(Boolean idEstado) {
		this.idEstado = idEstado;
	}

	public String getApodo() {
		return apodo;
	}

	public void setApodo(String apodo) {
		this.apodo = apodo;
	}

	public String getClave() {
		return clave;
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
     
}


