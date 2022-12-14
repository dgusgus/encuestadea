package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Docente;
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

	Integer getNuevaEncuesta(Encuesta criterio) throws DataAccessException;
	Encuesta getEncuesta(Encuesta encuesta) throws DataAccessException;
	List<Encuesta> getListaEncuestas(Encuesta criterio) throws DataAccessException;
	public void getEliminarEncuesta(Encuesta datosEncuesta);
	public void getActualizarEncuesta(Encuesta datosEncuesta);
	public List<Docente> getTodosDocumentos()throws DataAccessException;
}
