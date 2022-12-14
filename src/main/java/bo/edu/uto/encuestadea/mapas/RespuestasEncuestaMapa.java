package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.RespuestasEncuesta;
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

	public RespuestasEncuesta getBuscarRespuestasEncuesta(RespuestasEncuesta datosEncuesta)throws DataAccessException;

	public void modificarRespuestasEncuesta(RespuestasEncuesta respuestasEncuesta)throws DataAccessException;

	public List<RespuestasEncuesta> getListaRespuestasEncuesta(Docente docente)throws DataAccessException;
	
}
