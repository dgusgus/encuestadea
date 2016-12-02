/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.reportes;

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
import com.itextpdf.text.Rectangle;
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
//import org.sib.modelo.dominios.Af_libros;

/**
 *
 * @author vhmartinezmendez
 */
public class ReporteEncuestaGeneralPDF extends AbstractITextPdfView {

	private static final Font TITULO_FONT = new Font(FontFamily.COURIER, 12, Font.BOLD, BaseColor.BLACK);
	private static final Font DATOS_FONT = new Font(FontFamily.HELVETICA, 9, Font.NORMAL, BaseColor.BLACK);
	private static final Font DATOS_FONT10 = new Font(FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.BLACK);
	private static final Font DATOS_FONTB = new Font(FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.BLACK);
	private static final Font DATOS_FONT10B = new Font(FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
	private static final Font DATOS_FONT7 = new Font(FontFamily.COURIER, 7, Font.BOLD, BaseColor.BLACK);
	private static final Font CABEZA_COLUMNA_FONT = new Font(FontFamily.HELVETICA, 11, Font.BOLD, BaseColor.BLACK);
	private static final Font DATON_FONT = new Font(FontFamily.COURIER, 6, Font.BOLD, BaseColor.BLACK);
	private static final Font DATO_FONT8 = new Font(FontFamily.HELVETICA, 8, Font.NORMAL, BaseColor.BLACK);
	private static final Font DATO_FONT9 = new Font(FontFamily.HELVETICA, 9, Font.NORMAL, BaseColor.BLACK);
	private static final Font DATO_FONT10 = new Font(FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.BLACK);
	private static final Font DATO_FONT13 = new Font(FontFamily.HELVETICA, 13, Font.BOLD, BaseColor.BLACK);
	private static final Font DATO_FONT14 = new Font(FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLACK);
	private static final Font DATO_FONT_FECHA = new Font(FontFamily.HELVETICA, 8, Font.ITALIC, BaseColor.BLACK);

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

		List datos = (List) map.get("lista");
		String usuario = (String) map.get("usuario");
		String tramite = (String) map.get("tramite");
		String descripcion = (String) map.get("descripcion");
		String duracion = (String) map.get("duracion");
//        int gestion = (Integer) map.get("gestion");

		ServletContext servletContext = hsr.getServletContext();
		String realPath = servletContext.getRealPath("/");

		Image uto = Image.getInstance(realPath + "/pdf/uto.png");
		Image dtic = Image.getInstance(realPath + "/pdf/dtic.png");
		Image dea = Image.getInstance(realPath + "/pdf/dea.jpg");
		uto.scaleAbsolute(55, 50);
		dtic.scaleAbsolute(50, 45);

		float[] ancho1 = new float[3];
		//ancho1[0] = 0.06f;
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
		PdfPCell logo2 = new PdfPCell(dea,true);
		logo2.setBorder(PdfPCell.NO_BORDER);
		table1.addCell(logo2);

		dcmnt.add(table1);

		Paragraph espacio = new Paragraph("En Construcción \n\n", DATO_FONT13);
		espacio.setAlignment(Element.ALIGN_CENTER);
		dcmnt.add(espacio);
		
//		Paragraph espacio = new Paragraph("TRAMITE  " + tramite + "\n\n", DATO_FONT13);
//		espacio.setAlignment(Element.ALIGN_CENTER);
//		dcmnt.add(espacio);
//
//		Paragraph desc = new Paragraph();
//		desc.add(new Phrase("DESCRIPCIÓN : ", DATOS_FONT10B));
//		desc.add(new Phrase(descripcion, DATO_FONT10));
//		dcmnt.add(desc);
//
//		Paragraph dura = new Paragraph();
//		dura.add(new Phrase("DURACIÓN : ", DATOS_FONT10B));
//		dura.add(new Phrase(duracion + "\n\n", DATO_FONT10));
//		dcmnt.add(dura);
//
//		Paragraph espacio1 = new Paragraph("PASOS\n\n", DATO_FONT13);
//		espacio1.setAlignment(Element.ALIGN_LEFT);
//		dcmnt.add(espacio1);
	}
		
}
