package org.dtic.tools;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Esta clase contiene diferentes métodos útiles para la manipulación de fechas
 * y horas.
 *
 * @author Alvis Freddy Tuna Mamani
 */
public class ManejadorFechas {

	/**
	 * Método usado para obtener la fecha actual.
	 *
	 * @param	formato	Indica el formato de la fecha * * * p.e.
	 * <code>"dd/MM/yyyy HH:mm:ss"</code>.
	 * @return	Retorna un <b>STRING</b> con la fecha actual en el formato
	 * especificado.
	 *
	 * @see	java.text.SimpleDateFormat
	 */
	public static String getDate(String formato) {
		Date ahora = new Date();
		SimpleDateFormat formateador = new SimpleDateFormat(formato);
		return formateador.format(ahora);
	}

	/**
	 * Muevo una fecha en la cantidad de días especificado a una fecha
	 * determinada.
	 *
	 * @param	fecha	La fecha a mover.
	 * @param	dias	Número de días a mover. Si es positivo suma y resta si es
	 * negativo.
	 *
	 * @return	La fecha movida los días especificados.
	 */
	public static Date moverFechaDias(Date fecha, int dias) {
		Calendar cal = new GregorianCalendar();
		cal.setTimeInMillis(fecha.getTime());
		cal.add(Calendar.DATE, dias);
		return new Date(cal.getTimeInMillis());
	}

	/**
	 * Diferencias entre dos fechas.
	 *
	 * @param	fechaInicial	La fecha de inicio.
	 * @param	fechaFinal	La fecha de fin.
	 * @return	Retorna el número de días entre dos fechas.
	 */
	public static int diferenciaFechas(Date fechaInicial, Date fechaFinal) {
		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
		String fechaInicioString = df.format(fechaInicial);
		try {
			fechaInicial = df.parse(fechaInicioString);
		} catch (Exception ex) {
		}
		String fechaFinalString = df.format(fechaFinal);
		try {
			fechaFinal = df.parse(fechaFinalString);
		} catch (Exception ex) {
		}
		long fechaInicialMs = fechaInicial.getTime();
		long fechaFinalMs = fechaFinal.getTime();
		long diferencia = fechaFinalMs - fechaInicialMs;
		double dias = Math.floor(diferencia / (1000 * 60 * 60 * 24));
		return ((int) dias);
	}

	/**
	 * Devuele un <tt>java.util.Date</tt> desde un String en formato
	 * espedificado.
	 *
	 * @param	fecha	Fecha en String a convertir a Date.
	 * @param	formato	Formato de la conversión p.e. <tt>"dd/MM/yyyy"</tt>.
	 *
	 * @return Retorna la fecha en formato Date o nulo en caso de error.
	 *
	 * @see	java.text.SimpleDateFormat
	 */
	public static java.util.Date stringToDate(String fecha, String formato) {
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat(formato);
		Date fechaEnviar = null;
		try {
			fechaEnviar = formatoDelTexto.parse(fecha);
			return fechaEnviar;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	/**
	 * Devuele un java.util.Date desde un String en formato dd/MM/yyyy
	 *
	 * @param fecha	La fecha a convertir a formato date
	 * @return Retorna la fecha en formato Date
	 */
	public static synchronized Date StringToDate(String fecha) {
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
		Date fechaEnviar = null;
		try {
			fechaEnviar = formatoDelTexto.parse(fecha);
			return fechaEnviar;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	/**
	 * Función que formatea una fecha dada a una cadena de texto.
	 *
	 * @param	dia	Fecha que se formateará.
	 * @param	formato	Formato de la fecha. Por ejemplo "dd/MM/yyyy"
	 * @return Una cadena con la fecha formateada.
	 */
	public static String format(Date dia, String formato) {
		if (dia == null) {
			return "";
		}
		SimpleDateFormat formatDate = new SimpleDateFormat(formato);
		return formatDate.format(dia);
	}

	/**
	 * Función que formatea una fecha dada con días y meses en español.
	 *
	 * @param	dia	Fecha que se formateará.
	 * @param	formato	Formato de la fecha. Por ejemplo "dd/MM/yyyy"
	 * @return Una cadena con la fecha formateada.
	 */
	public static String format_es(Date dia, String formato) {
		if (dia == null) {
			return "";
		}
		SimpleDateFormat formatDate = new SimpleDateFormat(formato);
		DateFormatSymbols dfs = formatDate.getDateFormatSymbols();
		dfs.setShortMonths(new String[]{"Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"});
		dfs.setMonths(new String[]{"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"});
		dfs.setWeekdays(new String[]{"", "Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"});
		dfs.setShortWeekdays(new String[]{"", "Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"});
		formatDate.setDateFormatSymbols(dfs);
		return formatDate.format(dia);
	}
}
