package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Menu {
	private Integer id_menu;   //primary key
	private Integer id_rol;	   //menu name
	private Integer id_enlace; //parent primary key
	private Boolean id_estado;

	private List enlaces;
}
