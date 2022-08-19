package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.Encuesta;
import bo.edu.uto.encuestadea.dominios.Persona;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface PersonaMapa {

	
	List getAll()throws DataAccessException;
	Persona getById(Integer id)throws DataAccessException;
	
	
}
