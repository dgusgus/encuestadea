package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.EstudianteMateria;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dtic
 */
@Repository
public interface EstudianteMateriaMapa {
	Integer insert(EstudianteMateria criterio) throws DataAccessException;
	EstudianteMateria getById(Integer id_estudiante_materia) throws DataAccessException;
	List<EstudianteMateria> getAll(EstudianteMateria criterio) throws DataAccessException;
	public void delete(EstudianteMateria datosEstudianteMateria);
	public void update(EstudianteMateria datosEstudianteMateria);
}
