/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bo.edu.uto.encuestadea.reportes;

import bo.edu.uto.encuestadea.dominios.Docente;
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
//import org.sib.modelo.dominios.Af_libros;

/**
 *
 * @author vhmartinezmendez
 */
public class ReporteEncuestaGeneralPDF extends AbstractITextPdfView {

	private static final Font DATO_CABECERA = new Font(FontFamily.HELVETICA, 8, Font.NORMAL, BaseColor.BLACK);
	private static final Font TITULO_DATO_CABECERA = new Font(FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.BLACK);

	@Override
	protected void buildPdfMetadata(Map<String, Object> model, Document document, HttpServletRequest request) {
		document.setPageSize(PageSize.LETTER.rotate());
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

		List<RespuestasEncuesta> listaRespuestasEncuestas = (List<RespuestasEncuesta>) map.get("listaRespuestasEncuestas");
		Docente docente = (Docente) map.get("docente");
		Unidad unidad = (Unidad) map.get("unidad");		

		ServletContext servletContext = hsr.getServletContext();
		String realPath = servletContext.getRealPath("/");

		Image uto = Image.getInstance(realPath + "/pdf/uto.png");
		Image dtic = Image.getInstance(realPath + "/pdf/dtic.png");
		Image dea = Image.getInstance(realPath + "/pdf/dea.jpg");
		uto.scaleAbsolute(55, 50);
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
		PdfPCell logo2 = new PdfPCell(dtic,true);
		logo2.setBorder(PdfPCell.NO_BORDER);
		table1.addCell(logo2);

		dcmnt.add(table1);

		float[] ancho2 = {0.3f,0.7f,0.3f,0.7f};
		
		PdfPTable tableDatosCabecera = new PdfPTable(4);
		
		tableDatosCabecera.setWidths(ancho2);
		//tableDatosCabecera.setWidthPercentage(100);
		tableDatosCabecera.getDefaultCell().setBorderWidth(0);
		
		p = new Paragraph("Facultad:", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(docente.getFacultad_materia(), DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		
		p = new Paragraph("Carrera:", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(unidad.getUnidad(), DATO_CABECERA);
		tableDatosCabecera.addCell(p);	
		
		p = new Paragraph("Docente:", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(docente.getNombre(), DATO_CABECERA);
		tableDatosCabecera.addCell(p);	
		
		p = new Paragraph("Sigla Materia:", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(docente.getSigla(), DATO_CABECERA);
		tableDatosCabecera.addCell(p);	
		
		p = new Paragraph("Materia:", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(docente.getNombreMateria(), DATO_CABECERA);
		tableDatosCabecera.addCell(p);	
		
		p = new Paragraph("Paralelo:", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(docente.getGrupo(), DATO_CABECERA);
		tableDatosCabecera.addCell(p);	
		
		p = new Paragraph("Gestión:", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(docente.getGestion(), DATO_CABECERA);
		tableDatosCabecera.addCell(p);	
		
		p = new Paragraph(" ", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);
		p = new Paragraph(" ", TITULO_DATO_CABECERA);
		tableDatosCabecera.addCell(p);	
		dcmnt.add(tableDatosCabecera);
		
		if(listaRespuestasEncuestas != null){
			
			BaseColor fondoCelda = new BaseColor(222, 240, 245);
			PdfPTable tablaDatos = new PdfPTable(32);
			tablaDatos.setWidthPercentage(100);
			PdfPCell celda = null;
			celda = new PdfPCell(new Phrase("Nr",TITULO_DATO_CABECERA));
			celda.setBackgroundColor(fondoCelda);
			tablaDatos.addCell(celda);

			for(int i = 1 ; i <= 31 ; i++){
				celda = new PdfPCell(new Phrase("p"+i,TITULO_DATO_CABECERA));
				celda.setBackgroundColor(fondoCelda);
				//celda.setRotation(90);
				tablaDatos.addCell(celda);
			}
			
			int i = 1;
			
			for(RespuestasEncuesta respuestas:listaRespuestasEncuestas){
				celda = new PdfPCell(new Phrase(i+"",TITULO_DATO_CABECERA));
				celda.setBackgroundColor(fondoCelda);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP1().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP2().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP3().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP4().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP5().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP6().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP7().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP8().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP9().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP10().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP11().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP12().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP13().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP14().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP15().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP16().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP17().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP18().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP19().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP20().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP21().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP22().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP23().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP24().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP25().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP26().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP27().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP28().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP29().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP30().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				celda = new PdfPCell(new Phrase(respuestas.getP31().toString(),DATO_CABECERA));
				celda.setHorizontalAlignment(Element.ALIGN_CENTER);
				tablaDatos.addCell(celda);
				i++;
			}		
			
			dcmnt.add(tablaDatos);
		}
	}
		
}
