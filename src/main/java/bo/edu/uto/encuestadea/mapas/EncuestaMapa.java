package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.CriterioBusqueda;
import bo.edu.uto.encuestadea.dominios.Encuesta;
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
	Encuesta getEncuesta(Encuesta encuesta) throws DataAccessException;
	List<Encuesta> getListaEncuestas(Encuesta criterio) throws DataAccessException;
	public void getEliminarEncuesta(Encuesta datosEncuesta);
	public void getActualizarEncuesta(Encuesta datosEncuesta);
	
}
