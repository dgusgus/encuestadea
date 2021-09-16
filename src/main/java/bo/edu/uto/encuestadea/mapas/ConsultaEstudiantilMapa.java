package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.ConsultaEstudiantil;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface ConsultaEstudiantilMapa {
	public Integer insert(ConsultaEstudiantil criterio) throws DataAccessException;
	public ConsultaEstudiantil get(ConsultaEstudiantil consultaEstudiantil) throws DataAccessException;
	public List<ConsultaEstudiantil> getAll() throws DataAccessException;
	public void delete(ConsultaEstudiantil datosConsultaEstudiantil) throws DataAccessException;
	public void update(ConsultaEstudiantil datosConsultaEstudiantil) throws DataAccessException;

	public List<ConsultaEstudiantil> getByIdUsuario(Integer id_usuario) throws DataAccessException;
}
