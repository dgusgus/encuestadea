package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.Enlaces;
import bo.edu.uto.encuestadea.dominios.Menu;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface MenuMapa {
	List getAll()throws DataAccessException;
	Menu getById(Integer id)throws DataAccessException;
	List <Enlaces> selectMenuPadres(Integer id_rol)throws DataAccessException;

}
