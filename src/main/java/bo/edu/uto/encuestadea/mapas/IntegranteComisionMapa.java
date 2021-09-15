package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.IntegranteComision;
import bo.edu.uto.encuestadea.dominios.Unidad;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface IntegranteComisionMapa {

	List<IntegranteComision> getIntegrantesComision(Unidad unidad) throws DataAccessException;
	IntegranteComision getIntegranteComision(IntegranteComision integranteComision)throws DataAccessException;
	List<IntegranteComision> getIntegrantesComisionPorIdUsuario(Long id_usuario) throws DataAccessException;
	Integer insertarIntegrante(IntegranteComision ic) throws DataAccessException;
	int borrarIntegrante(IntegranteComision ic)throws DataAccessException;

	int modificarInegranteComision(IntegranteComision integranteComision);
}
