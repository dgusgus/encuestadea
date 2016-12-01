package bo.edu.uto.plantillaproyectomaven.mapas;

import bo.edu.uto.plantillaproyectomaven.dominios.Unidad;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface UnidadMapa {

	Unidad getUnidad(Unidad unidad) throws DataAccessException;
}
