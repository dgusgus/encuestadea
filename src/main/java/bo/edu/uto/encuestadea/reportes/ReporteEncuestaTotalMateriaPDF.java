/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.reportes;

import bo.edu.uto.encuestadea.dominios.Docente;
import bo.edu.uto.encuestadea.dominios.IntegranteComision;
import bo.edu.uto.encuestadea.dominios.RespuestasEncuesta;
import bo.edu.uto.encuestadea.dominios.Unidad;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.text.DateFormatSymbols;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.dtic.tools.Tools;

/**
 *
 * @author Raúl Antonio Velásquez Muriel
 */
public class ReporteEncuestaTotalMateriaPDF extends AbstractITextPdfView {

	private static final Font DATO_CABECERA = new Font(FontFamily.HELVETICA, 9, Font.NORMAL, BaseColor.BLACK);
	private static final Font TITULO_DATO_CABECERA = new Font(FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.BLACK);

	@Override
	protected void buildPdfMetadata(Map<String, Object> model, Document document, HttpServletRequest request) {
		document.setPageSize(PageSize.LETTER);
		document.setMargins(40f, 50f, 30f, 40f);
	}

	@Override

	protected void prepareWriter(Map<String, Object> model, PdfWriter writer, HttpServletRequest request) throws DocumentException {
		writer.setViewerPreferences(getViewerPreferences());
	}

	@Override
	protected int getViewerPreferences() {
		return 0;
	}

	@Override
	protected void buildPdfDocument(Map<String, Object> map, Document dcmnt, PdfWriter writer, HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {

		Date fecha = new Date();

		SimpleDateFormat fecha1 = new SimpleDateFormat("dd-MM-yyyy '-' h:mm a");
		SimpleDateFormat fec_reg = new SimpleDateFormat("d 'de' MMMMM 'de' yyyy");
		DateFormatSymbols dfs = fec_reg.getDateFormatSymbols();
		dfs.setMonths(new String[]{"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"});
		dfs.setWeekdays(new String[]{"Sabado", "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes"});
		fec_reg.setDateFormatSymbols(dfs);
		DecimalFormat df = new DecimalFormat("#,##0.00");

		List<IntegranteComision> integrantesComision = (List<IntegranteComision>) map.get("integrantesComision");
		List<RespuestasEncuesta> listaRespuestasEncuestas = (List<RespuestasEncuesta>) map.get("listaRespuestasEncuestas");
		Docente docente = (Docente) map.get("docente");
		Unidad unidad = (Unidad) map.get("unidad");
		double it1 = (double) map.get("it1");
		it1 = Tools.redondear(it1, 2);
		it1 = it1 > 0 ? it1 : 0.0;
		String val1 = (String) map.get("val1");
		double it2 = (double) map.get("it2");
		it2 = Tools.redondear(it2, 2);
		it2 = it2 > 0 ? it2 : 0.0;
		String val2 = (String) map.get("val2");
		double it3 = (double) map.get("it3");
		it3 = Tools.redondear(it3, 2);
		it3 = it3 > 0 ? it3 : 0.0;
		double val3 = (double) map.get("val3");
		val3 = Tools.redondear(val3, 2);
		val3 = val3 > 0 ? val3 : 0.0;

		DecimalFormat decimalFormat = new DecimalFormat("#.00");

		ServletContext servletContext = hsr.getServletContext();
		String realPath = servletContext.getRealPath("/");

		Image uto = Image.getInstance(realPath + "/pdf/uto.png");
		Image dtic = Image.getInstance(realPath + "/pdf/dtic.png");
		Image dea = Image.getInstance(realPath + "/pdf/dea.jpg");
		uto.scaleAbsolute(50, 50);
		dtic.scaleAbsolute(50, 45);

		float[] ancho1 = new float[3];

		ancho1[0] = 0.06f;
		ancho1[1] = 0.31f;
		ancho1[2] = 0.06f;

		PdfPTable table1 = new PdfPTable(ancho1);
		table1.setWidthPercentage(100);
		table1.getDefaultCell().setBorderWidth(0);
		Phrase p = new Phrase();

		table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
		table1.addCell(new Phrase(new Chunk(uto, 0, -50)));

		Chunk ck = new Chunk("\nUNIVERSIDAD TECNICA DE ORURO\nDIRECCIÓN DE EVALUACIÓN Y ACREDITACIÓN\nDIRECCIÓN DE TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIÓN", new Font(FontFamily.TIMES_ROMAN, 9, Font.BOLD, BaseColor.BLACK));
		p.add(ck);

		table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		table1.addCell(p);
		table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
		PdfPCell logo2 = new PdfPCell(dea, true);
		logo2.setBorder(PdfPCell.NO_BORDER);
		table1.addCell(logo2);
		table1.setSpacingAfter(10);
		dcmnt.add(table1);
		//dcmnt.add(new Phrase("\n"));

		float[] ancho2 = {1f, 4f, 1f, 1f};

		PdfPTable tableDatosCabecera = new PdfPTable(4);

		tableDatosCabecera.setWidths(ancho2);
		//tableDatosCabecera.setWidthPercentage(100);
		tableDatosCabecera.getDefaultCell().setBorderWidth(0);

		PdfPCell celda = null;
		p = new Paragraph("Facultad:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getFacultad_materia(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Carrera:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(unidad.getUnidad(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Asignatura:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getSigla() + " " + docente.getNombreMateria(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Docente:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getNombre(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Gestión:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getGestion(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Paralelo:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getGrupo(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		tableDatosCabecera.setSpacingAfter(10);
		dcmnt.add(tableDatosCabecera);

		PdfPTable tablaResultados = new PdfPTable(4);
		tablaResultados.setWidthPercentage(100);
		float[] ancho3 = {5f, 1f, 2f, 3f};
		tablaResultados.setWidths(ancho3);

		p = new Paragraph("DESCRIPCIÓN", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("SOBRE", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CALIFICACIÓN", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CALIFICACIÓN PARA ACTA DE EVALUACIÓN", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CONOCIMIENTOS DE LA ASIGNATURA", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("40%", DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it1) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(val1, DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CUALIDADES PEDAGÓGICAS", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("40%", DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it2) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(val2, DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CUMPLIMIENTO", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("20%", DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it3) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(decimalFormat.format(val3), DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CALIFICACIÓN FINAL", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("100%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it1 + it2 + it3) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(" ", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		dcmnt.add(tablaResultados);

		PdfPTable tablaComision = new PdfPTable(2);
		tablaComision.setHorizontalAlignment(Element.ALIGN_CENTER);
		tablaComision.setWidthPercentage(100);
		tablaComision.getDefaultCell().setBorder(PdfPCell.NO_BORDER);
		tablaComision.getDefaultCell().setHorizontalAlignment(PdfPCell.ALIGN_CENTER);

		for (IntegranteComision integrante : integrantesComision) {
			p = new Paragraph(" \n\n\n\n________________________\n" + integrante.getNombre().toUpperCase() + "\nCOMISIÓN EVALUADORA", DATO_CABECERA);
			tablaComision.addCell(p);
		}

		if (integrantesComision.size() < 4) {
			//if(integrantesComision.size()%2 != 0){
			for (int i = integrantesComision.size(); i <= 4; i++) {
				p = new Paragraph("\n\n\n\n", DATO_CABECERA);
				tablaComision.addCell(p);
			}
			//}
		}

		dcmnt.add(tablaComision);

		p = new Paragraph("\n", TITULO_DATO_CABECERA);
		dcmnt.add(p);

		/**
		 * ************** Duplicar impresión de arriba ****************
		 */
		//dcmnt.newPage();
		ancho1 = new float[3];

		ancho1[0] = 0.06f;
		ancho1[1] = 0.31f;
		ancho1[2] = 0.06f;

		table1 = new PdfPTable(ancho1);
		table1.setWidthPercentage(100);
		table1.getDefaultCell().setBorderWidth(0);
		p = new Phrase();

		table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
		table1.addCell(new Phrase(new Chunk(uto, 0, -50)));

		ck = new Chunk("\nUNIVERSIDAD TECNICA DE ORURO\nDIRECCIÓN DE EVALUACIÓN Y ACREDITACIÓN\nDIRECCIÓN DE TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIÓN", new Font(FontFamily.TIMES_ROMAN, 9, Font.BOLD, BaseColor.BLACK));
		p.add(ck);

		table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		table1.addCell(p);
		table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
		logo2 = new PdfPCell(dea, true);
		logo2.setBorder(PdfPCell.NO_BORDER);
		table1.addCell(logo2);
		table1.setSpacingAfter(10);
		dcmnt.add(table1);
		//dcmnt.add(new Phrase("\n"));

		float[] ancho22 = {1f, 4f, 1f, 1f};

		tableDatosCabecera = new PdfPTable(4);

		tableDatosCabecera.setWidths(ancho22);
		//tableDatosCabecera.setWidthPercentage(100);
		tableDatosCabecera.getDefaultCell().setBorderWidth(0);

		celda = null;
		p = new Paragraph("Facultad:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getFacultad_materia(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Carrera:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(unidad.getUnidad(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Asignatura:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getSigla() + " " + docente.getNombreMateria(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Docente:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getNombre(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.setPadding(-1f);
		celda.setColspan(3);
		celda.addElement(p);

		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Gestión:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getGestion(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);

		p = new Paragraph("Paralelo:", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		p = new Paragraph(docente.getGrupo(), DATO_CABECERA);
		celda = new PdfPCell();
		celda.setPadding(-1f);
		celda.setBorder(PdfPCell.NO_BORDER);
		celda.addElement(p);
		tableDatosCabecera.addCell(celda);
		tableDatosCabecera.setSpacingAfter(10);
		dcmnt.add(tableDatosCabecera);

		tablaResultados = new PdfPTable(4);
		tablaResultados.setWidthPercentage(100);
		float[] ancho32 = {5f, 1f, 2f, 3f};
		tablaResultados.setWidths(ancho32);

		p = new Paragraph("DESCRIPCIÓN", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("SOBRE", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CALIFICACIÓN", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CALIFICACIÓN PARA ACTA DE EVALUACIÓN", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CONOCIMIENTOS DE LA ASIGNATURA", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("40%", DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it1) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(val1, DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CUALIDADES PEDAGÓGICAS", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("40%", DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it2) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(val2, DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CUMPLIMIENTO", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("20%", DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it3) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(decimalFormat.format(val3), DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("CALIFICACIÓN FINAL", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("100%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph("" + decimalFormat.format(it1 + it2 + it3) + "%", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		p = new Paragraph(" ", TITULO_DATO_CABECERA);
		celda = new PdfPCell();
		celda.addElement(p);
		tablaResultados.addCell(celda);

		dcmnt.add(tablaResultados);

		tablaComision = new PdfPTable(2);
		tablaComision.setHorizontalAlignment(Element.ALIGN_CENTER);
		tablaComision.setWidthPercentage(100);
		tablaComision.getDefaultCell().setBorder(PdfPCell.NO_BORDER);
		tablaComision.getDefaultCell().setHorizontalAlignment(PdfPCell.ALIGN_CENTER);

		for (IntegranteComision integrante : integrantesComision) {
			p = new Paragraph(" \n\n\n\n________________________\n" + integrante.getNombre().toUpperCase() + "\nCOMISIÓN EVALUADORA", DATO_CABECERA);
			tablaComision.addCell(p);
		}
		if (integrantesComision.size() < 4) {
			//if(integrantesComision.size()%2 != 0){
			for (int i = integrantesComision.size(); i <= 4; i++) {
				p = new Paragraph("\n\n\n\n", DATO_CABECERA);
				tablaComision.addCell(p);
			}
			//}
		}
		dcmnt.add(tablaComision);

	}

}
