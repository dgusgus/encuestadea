package bo.edu.uto.encuestadea.mapas;
import bo.edu.uto.encuestadea.dominios.InformeMemoria;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface InformeMemoriaMapa{
	public List<InformeMemoria> getAllplanilla()throws DataAccessException;

	public List<InformeMemoria> getAll()throws DataAccessException;
	/**
	InformeMemoria getById(Integer id)throws DataAccessException;
	void insert(InformeMemoria planillaavancedetalle)throws DataAccessException;
	void ActulizarInsert(InformeMemoria planillaavancedetalle)throws DataAccessException;
	public void update(InformeMemoria planillaavancedetalle)throws DataAccessException;
	**/
}
