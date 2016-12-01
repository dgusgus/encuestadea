package bo.edu.uto.plantillaproyectomaven.mapas;

import bo.edu.uto.plantillaproyectomaven.dominios.Docente;
import bo.edu.uto.plantillaproyectomaven.dominios.RespuestasEncuesta;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface RespuestasEncuestaMapa {

	void insertarRespuestasEncuesta(RespuestasEncuesta criterio) throws DataAccessException;

	public RespuestasEncuesta getBuscarRespuestasEncuesta(RespuestasEncuesta datosEncuesta);

	public void modificarRespuestasEncuesta(RespuestasEncuesta respuestasEncuesta);

	public List<RespuestasEncuesta> getListaRespuestasEncuesta(Docente docente);
	
}
