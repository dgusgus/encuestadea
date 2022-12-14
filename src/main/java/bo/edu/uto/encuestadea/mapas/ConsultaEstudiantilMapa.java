package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.ConsultaEstudiantil;
import bo.edu.uto.encuestadea.dominios.DatosVerificar;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface ConsultaEstudiantilMapa {
	public Integer insert(ConsultaEstudiantil criterio) throws DataAccessException;
	public ConsultaEstudiantil get(Integer id_consulta_estudiantil) throws DataAccessException;
	public List<ConsultaEstudiantil> getAll() throws DataAccessException;
	public void delete(ConsultaEstudiantil datosConsultaEstudiantil) throws DataAccessException;
	public void update(ConsultaEstudiantil datosConsultaEstudiantil) throws DataAccessException;

	public List<ConsultaEstudiantil> getByIdUsuario(Integer id_usuario) throws DataAccessException;
	public DatosVerificar verificar(DatosVerificar datos) throws DataAccessException;
}
