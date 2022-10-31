package bo.edu.uto.encuestadea.mapas;

import bo.edu.uto.encuestadea.dominios.PlanillaAvanceDetalle;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface PlanillaAvanceDetalleMapa{


	List getAll()throws DataAccessException;
	PlanillaAvanceDetalle getById(Integer id)throws DataAccessException;
	void insert(PlanillaAvanceDetalle planillaavancedetalle)throws DataAccessException;
	public void update(PlanillaAvanceDetalle planillaavancedetalle)throws DataAccessException;
}
