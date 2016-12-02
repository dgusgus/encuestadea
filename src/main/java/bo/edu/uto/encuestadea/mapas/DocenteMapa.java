package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.CriterioBusqueda;
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
public interface DocenteMapa {

	List<Docente> getDocentes(CriterioBusqueda criterio) throws DataAccessException;
	List<Docente> getDocentesBusqueda(String criterio) throws DataAccessException;
	Docente getDocenteEncuesta(Encuesta encuesta)throws DataAccessException;
}
