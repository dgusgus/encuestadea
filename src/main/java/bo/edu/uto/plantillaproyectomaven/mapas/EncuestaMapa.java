package bo.edu.uto.plantillaproyectomaven.mapas;

import bo.edu.uto.plantillaproyectomaven.dominios.CriterioBusqueda;
import bo.edu.uto.plantillaproyectomaven.dominios.Encuesta;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface EncuestaMapa {

	Long getNuevaEncuesta(Encuesta criterio) throws DataAccessException;
	List<Encuesta> getEncuestas(CriterioBusqueda criterio) throws DataAccessException;
	List<Encuesta> getListaEncuestas(Encuesta criterio) throws DataAccessException;
	public void getEliminarEncuesta(Encuesta datosEncuesta);
	public void getActualizarEncuesta(Encuesta datosEncuesta);
	
}
