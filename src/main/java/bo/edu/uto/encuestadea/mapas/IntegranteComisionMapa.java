package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.Comision;
import bo.edu.uto.encuestadea.dominios.CriterioBusqueda;
import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.Encuesta;
import bo.edu.uto.encuestadea.dominios.IntegranteComision;
import bo.edu.uto.encuestadea.dominios.Usuarios;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface IntegranteComisionMapa {

	List<IntegranteComision> getIntegrantes(Usuarios usuario) throws DataAccessException;
	
}
