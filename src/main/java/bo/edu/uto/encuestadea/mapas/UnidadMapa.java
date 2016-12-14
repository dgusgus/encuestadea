package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Encuesta;
import bo.edu.uto.encuestadea.dominios.Unidad;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface UnidadMapa {

	Unidad getUnidad(Unidad unidad) throws DataAccessException;
	//Unidad getUnidad(Encuesta encuesta) throws DataAccessException;
}
