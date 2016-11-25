package bo.edu.uto.plantillaproyectomaven.mapas;

import bo.edu.uto.plantillaproyectomaven.dominios.CriterioBusqueda;
import bo.edu.uto.plantillaproyectomaven.dominios.Docente;
import bo.edu.uto.plantillaproyectomaven.dominios.Encuesta;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface DocenteMapa {

	List<Docente> getDocentes(CriterioBusqueda criterio) throws DataAccessException;
	Docente getDocenteEncuesta(Encuesta encuesta)throws DataAccessException;
}
