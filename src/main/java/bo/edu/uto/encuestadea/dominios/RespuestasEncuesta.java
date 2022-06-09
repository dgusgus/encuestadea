package bo.edu.uto.encuestadea.dominios;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RespuestasEncuesta {
	private Integer id_respuesta_encuesta;
	private Integer id_pregunta;
	private Integer id_respuesta;
	private Integer id_encuesta;
	private Integer id_materia;
	private Integer id_grupo;
	private Integer id_gestion;
	private Integer id_docente;
	@Setter(AccessLevel.NONE)
	private Integer p1 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p2 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p3 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p4 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p5 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p6 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p7 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p8 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p9 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p10 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p11 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p12 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p13 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p14 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p15 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p16 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p17 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p18 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p19 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p20 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p21 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p22 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p23 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p24 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p25 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p26 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p27 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p28 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p29 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p30 = 0;
	@Setter(AccessLevel.NONE)
	private Integer p31 = 0;

	public void setP1(Integer p1) {
		this.p1 = p1;
		if (p1 == null) {
			this.p1 = 0;
		}
	}

	public void setP2(Integer p2) {
		this.p2 = p2;
		if (p2 == null) {
			this.p2 = 0;
		}
	}

	public void setP3(Integer p3) {
		this.p3 = p3;
		if (p3 == null) {
			this.p3 = 0;
		}
	}

	public void setP4(Integer p4) {
		this.p4 = p4;
		if (p4 == null) {
			this.p4 = 0;
		}
	}

	public void setP5(Integer p5) {
		this.p5 = p5;
		if (p5 == null) {
			this.p5 = 0;
		}
	}

	public void setP6(Integer p6) {
		this.p6 = p6;
		if (p6 == null) {
			this.p6 = 0;
		}
	}

	public void setP7(Integer p7) {
		this.p7 = p7;
		if (p7 == null) {
			this.p7 = 0;
		}
	}

	public void setP8(Integer p8) {
		this.p8 = p8;
		if (p8 == null) {
			this.p8 = 0;
		}
	}

	public void setP9(Integer p9) {
		this.p9 = p9;
		if (p9 == null) {
			this.p9 = 0;
		}
	}

	public void setP10(Integer p10) {
		this.p10 = p10;
		if (p10 == null) {
			this.p10 = 0;
		}
	}

	public void setP11(Integer p11) {
		this.p11 = p11;
		if (p11 == null) {
			this.p11 = 0;
		}
	}

	public void setP12(Integer p12) {
		this.p12 = p12;
		if (p12 == null) {
			this.p12 = 0;
		}
	}

	public void setP13(Integer p13) {
		this.p13 = p13;
		if (p13 == null) {
			this.p13 = 0;
		}
	}

	public void setP14(Integer p14) {
		this.p14 = p14;
		if (p14 == null) {
			this.p14 = 0;
		}
	}

	public void setP15(Integer p15) {
		this.p15 = p15;
		if (p15 == null) {
			this.p15 = 0;
		}
	}

	public void setP16(Integer p16) {
		this.p16 = p16;
		if (p16 == null) {
			this.p16 = 0;
		}
	}

	public void setP17(Integer p17) {
		this.p17 = p17;
		if (p17 == null) {
			this.p17 = 0;
		}
	}

	public void setP18(Integer p18) {
		this.p18 = p18;
		if (p18 == null) {
			this.p18 = 0;
		}
	}

	public void setP19(Integer p19) {
		this.p19 = p19;
		if (p19 == null) {
			this.p19 = 0;
		}
	}

	public void setP20(Integer p20) {
		this.p20 = p20;
		if (p20 == null) {
			this.p20 = 0;
		}
	}

	public void setP21(Integer p21) {
		this.p21 = p21;
		if (p21 == null) {
			this.p21 = 0;
		}
	}

	public void setP22(Integer p22) {
		this.p22 = p22;
		if (p22 == null) {
			this.p22 = 0;
		}
	}

	public void setP23(Integer p23) {
		this.p23 = p23;
		if (p23 == null) {
			this.p23 = 0;
		}
	}

	public void setP24(Integer p24) {
		this.p24 = p24;
		if (p24 == null) {
			this.p24 = 0;
		}
	}

	public void setP25(Integer p25) {
		this.p25 = p25;
		if (p25 == null) {
			this.p25 = 0;
		}
	}

	public void setP26(Integer p26) {
		this.p26 = p26;
		if (p26 == null) {
			this.p26 = 0;
		}
	}

	public void setP27(Integer p27) {
		this.p27 = p27;
		if (p27 == null) {
			this.p27 = 0;
		}
	}

	public void setP28(Integer p28) {
		this.p28 = p28;
		if (p28 == null) {
			this.p28 = 0;
		}
	}

	public void setP29(Integer p29) {
		this.p29 = p29;
		if (p29 == null) {
			this.p29 = 0;
		}
	}

	public void setP30(Integer p30) {
		this.p30 = p30;
		if (p30 == null) {
			this.p30 = 0;
		}
	}

	public void setP31(Integer p31) {
		this.p31 = p31;
		if (p31 == null) {
			this.p31 = 0;
		}
	}

}
