package org.dtic.tools;

import com.jpacker.JPackerEncoding;
import com.jpacker.JPackerExecuter;
import com.sun.org.apache.xerces.internal.parsers.DOMParser;
import com.sun.org.apache.xml.internal.serialize.OutputFormat;
import com.sun.org.apache.xml.internal.serialize.XMLSerializer;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

/**
 * Esta clase contiene diferentes métodos útiles para el desarrollo.
 *
 * @author Alvis Freddy Tuna Mamani
 */
public class Tools {

	/**
	 * Método que obtiene un <code>int[]</code> de una <code>String</code> de
	 * acuerdo a una cadena de separación.<br/>
	 * p.e. "1,2,8" &rarr; [1,2,8]
	 *
	 * @param	str	Cadena contenida de enteros separado por algún token.
	 * @param	sep	Token de separación de los datos contenidos en
	 * <code>str</code>.
	 * @return	Retorna un vector de enteros, de una cadena pasada como parámetro
	 * y token de separación.
	 */
	public static int[] getsInt(String str, String sep) {
		if (str == null)
			return null;
		if (sep == null)
			sep = ",";
		String[] s = str.split(sep);
		int[] x = new int[s.length];
		for (int i = 0; i < s.length; i++) {
			try {
				x[i] = Integer.parseInt(s[i]);
			} catch (Exception ex) {
				x[i] = 0;
			}
		}
		return x;
	}

	/**
	 * Método que obtiene un <code>Integer[]</code> de una <code>String</code>
	 * de acuerdo a una cadena de separación.<br/>
	 * p.e. "1,2,8" &rarr; [1,2,8]
	 *
	 * @param	str	Cadena contenida de enteros separado por algún token.
	 * @param	sep	Token de separación de los datos contenidos en
	 * <code>str</code>.
	 * @return	Retorna un vector de enteros, de una cadena pasada como parámetro
	 * y token de separación.
	 */
	public static Integer[] getsInteger(String str, String sep) {
		if (str == null)
			return null;
		if (sep == null)
			sep = ",";
		String[] s = str.split(sep);
		Integer[] x = new Integer[s.length];
		for (int i = 0; i < s.length; i++) {
			try {
				x[i] = new Integer(s[i]);
			} catch (Exception ex) {
				x[i] = null;
			}
		}
		return x;
	}

	/**
	 * Método que obtiene un <code>List<Integer></code> de un
	 * <code>String</code> de acuerdo a una cadena de separación.<br/>
	 * p.e. "1,2,8" &rarr; {1,2,8}
	 *
	 * @param	str	Cadena contenida de enteros separado por algún token.
	 * @param	sep	Token de separación de los datos contenidos en
	 * <code>str</code>. Si no se coloca este parámetro por defecto se asume la
	 * coma (,).
	 * @return	Retorna una lista de integers, de una cadena pasada como
	 * parámetro y token de separación.
	 */
	public static List<Integer> getListInteger(String str, String sep) {
		if (str == null || str.isEmpty())
			return null;
		if (sep == null)
			sep = ",";
		String[] s = str.replaceAll("\\s+", "").split(sep);
		List<Integer> x = new ArrayList<Integer>();
		for (int i = 0; i < s.length; i++) {
			try {
				x.add(new Integer(s[i]));
			} catch (Exception ex) {
			}
		}
		if (x.isEmpty())
			return null;
		return x;
	}

	/**
	 * Método que obtiene un <code>int[]</code> de una <code>String</code> de
	 * acuerdo a una cadena de separación.<br/>
	 * p.e. "1,2,8" &rarr; [1,2,8]
	 *
	 * @param	str	Cadena contenida de enteros separado por algún token.
	 * @param	sep	Token de separación de los datos contenidos en
	 * <code>str</code>.
	 * @return	Retorna un vector de objetos Date, de una cadena pasada como
	 * parámetro y token de separación.
	 */
	public static Date[] getsDate(String str, String sep, String formato) {
		if (sep == null)
			sep = ",";
		String[] s = str.split(sep);
		Date[] x = new Date[s.length];
		for (int i = 0; i < s.length; i++)
			x[i] = ManejadorFechas.stringToDate(s[i], formato);
		return x;
	}

	/**
	 * Método que obtiene un <code>boolean[]</code> de una <code>String</code>
	 * de acuerdo a una cadena de separación.<br/>
	 * p.e. "true,false,true" &rarr; [true,false,true]
	 *
	 * @param	str	Cadena contenida de booleanos separado por algún token.
	 * @param	sep	Token de separación de los datos contenidos en
	 * <code>str</code>
	 * @param verdadero	Cadena de texto considerada verdadero.
	 * @return	Retorna un vector de booleanos, de una cadena pasada como
	 * parámetro y token de separación.
	 */
	public static boolean[] getsBoolean(String str, String sep, String verdadero) {
		if (sep == null)
			sep = ",";
		String[] s = str.split(sep);
		boolean[] x = new boolean[s.length];
		for (int i = 0; i < s.length; i++)
			x[i] = s[i].compareToIgnoreCase(verdadero) == 0;
		return x;
	}

	/**
	 * Método que ofusca un código JavaScript ingresado como argumento en una
	 * cadena de texto.<br/>
	 * p.e. "true,false,true" &rarr; [true,false,true]
	 *
	 * @param	script	Cadena que contiene el javascript.
	 * @return	Retorna una cadena de texto ofuscada que representa el javascript
	 * introducido.
	 */
	public static String ofuscarJavaScript(String script) {
		if (script.isEmpty())
			return "";
		JPackerExecuter executer = new JPackerExecuter(JPackerEncoding.NORMAL);
		return executer.pack(script, false, false);
	}

	/**
	 * Este método une una lista de cadenas separado por algún token. p.e.
	 * ["1","2","3"] " $$ " &rarr; "1 $$ 2 $$ 3"
	 *
	 * @param	string	Lista de cadenas a combinar
	 * @return	Retorna una cadena de texto unida por un token, con los elementos
	 * de la lista introducidos.
	 */
	public static String stringJoin(List<String> strings, String token) {
		StringBuilder sb = new StringBuilder();
		String sep = "";
		for (String s : strings) {
			sb.append(sep).append(s);
			sep = token;
		}
		return sb.toString();
	}

	/**
	 * Este método une una lista de cadenas separado por algún token. p.e.
	 * ["1","2","3"] " $$ " &rarr; "1 $$ 2 $$ 3"
	 *
	 * @param	string	Lista de cadenas a combinar
	 * @return	Retorna una cadena de texto unida por un token, con los elementos
	 * de la lista introducidos.
	 */
	public static String stringJoin(String[] strings, String token) {
		StringBuilder sb = new StringBuilder();
		String sep = "";
		for (int i = 0; i < strings.length; i++) {
			sb.append(sep).append(strings[i]);
			sep = token;
		}
		return sb.toString();
	}

	/**
	 * Da formato a un numero decimal.
	 *
	 * @param dato	Valor a formatear.
	 * @param formato	formato en el cual se quiere formatear el
	 * <code>dato</code>.
	 * @return Retorna una cadena en la cual se encuentra el <code>dato</code>
	 * formateado.
	 */
	public static String formatNumber(Double dato, String formato) {
		try {
			DecimalFormat df = new DecimalFormat(formato);
			return df.format(dato);
		} catch (Exception ex) {
		}
		return "";
	}

	/**
	 * Da formato a un numero decimal.
	 *
	 * @param dato	Valor a formatear.
	 * @param formato	formato en el cual se quiere formatear el
	 * <code>dato</code>.
	 * @return Retorna una cadena en la cual se encuentra el <code>dato</code>
	 * formateado.
	 */
	public static String formatNumber(Integer dato, String formato) {
		try {
			DecimalFormat df = new DecimalFormat(formato);
			return df.format(dato);
		} catch (Exception ex) {
		}
		return "";
	}

	/**
	 * Acomoda la cadena de caracteres a imprimir en un impresora matricial de
	 * 40 columnas.
	 *
	 * @param str	Cadena de caracteres para acomodar.
	 * @param sep	Separador de la cadena.
	 * @param sangria	Estable la sangría de la primera linea.
	 * @return Retorna una cadena acomodada para la impresión.
	 */
	public static String acomodarLinea(String str, String sep, int sangria) {
		char[] san = new char[sangria];
		Arrays.fill(san, ' ');
		//
		String[] s = str.split(sep);
		StringBuilder linea = new StringBuilder();
		StringBuilder sb = new StringBuilder();
		int i = 0;
		while (i < s.length) {
			if (i != 0)
				linea.append(san);
			while (i < s.length) {
				if (linea.length() + s[i].length() > 40) {
					sb.append(linea.toString().replaceAll("\\s+$", ""));
					linea.setLength(0);
					break;
				} else {
					linea.append(s[i]);
					if (++i < s.length)
						if (linea.length() + sep.length() > 40) {
							sb.append(linea.toString().replaceAll("\\s+$", ""));
							linea.setLength(0);
							break;
						} else {
							linea.append(sep);
						}
				}
			}
			if (linea.length() > 0)
				sb.append(linea);
			sb.append('\n');
		}
		return sb.toString();
	}

	/**
	 * Acomoda la cadena de caracteres a imprimir en un impresora matricial de
	 * 40 columnas.
	 *
	 * @param str	Cadena de caracteres para acomodar.
	 * @param sep	Separador de la cadena.
	 * @param sangria	Estable la sangría de la primera linea.
	 * @param ancho	Estable ancho de la columna.
	 * @return Retorna una cadena acomodada para la impresión.
	 */
	public static String acomodarLinea2(String str, String sep, int sangria, int ancho) {
		char[] san = new char[sangria];
		Arrays.fill(san, ' ');
		//
		String[] s = str.split(sep);
		StringBuilder linea = new StringBuilder();
		StringBuilder sb = new StringBuilder();
		int i = 0;
		while (i < s.length) {
			if (i != 0)
				linea.append(san);
			while (i < s.length) {
				if (linea.length() + s[i].length() > ancho) {
					sb.append(linea.toString().replaceAll("\\s+$", ""));
					linea.setLength(0);
					break;
				} else {
					linea.append(s[i]);
					if (++i < s.length)
						if (linea.length() + sep.length() > ancho) {
							sb.append(linea.toString().replaceAll("\\s+$", ""));
							linea.setLength(0);
							break;
						} else {
							linea.append(sep);
						}
				}
			}
			if (linea.length() > 0)
				sb.append(linea);
			sb.append('\n');
		}
		return sb.toString();
	}

	/**
	 * Centra una cadena de caracteres en un ancho especifico y con un relleno
	 * estipulado.
	 *
	 * @param str	Cadena de caracteres para acomodar.
	 * @param relleno	Relleno del centrado.
	 * @param ancho	Longitud de la cadena de caracteres.
	 * @return Retorna una cadena centrada con el ancho y relleno estipulados.
	 */
	public static String centrarString(String str, char relleno, int ancho) {
		int t = str.length();
		int lado = (ancho - t) / 2;
		char[] rellenos = new char[lado];
		Arrays.fill(rellenos, relleno);
		StringBuilder sb = new StringBuilder();
		sb.append(rellenos);
		sb.append(str);
		sb.append(rellenos);
		return sb.toString();
	}

	/**
	 * Método que obtiene un <code>int[]</code> de una <code>String</code> de
	 * acuerdo a una cadena de reparaciÃ³n.<br/>
	 * p.e. "1,2,8" &rarr; [1,2,8]
	 *
	 * @param	str	Cadena contenida de enteros separado por algÃºn token.
	 * @param	sep	Token de separaciÃ³n de los datos contenidos * en
	 * <code>str</code>.
	 * @return	Retorna un vector de enteros, de una cadena pasada como
	 * parÃ¡metro y token de separaciÃ³n.
	 */
	public static float[] getsFloat(String str, String sep) {
		if (str == null)
			return null;
		if (sep == null)
			sep = ",";
		String[] s = str.split(sep);
		float[] x = new float[s.length];
		for (int i = 0; i < s.length; i++) {
			try {
				x[i] = Float.parseFloat(s[i]);
			} catch (Exception ex) {
				x[i] = 0;
			}
		}
		return x;
	}

	/**
	 * Redondea una número decimal a una cantidad de dígitos deseados.
	 *
	 * @param numero	Número decimal a redondear.
	 * @param digitos	Cantidad de dígitos decimales para el redondeo.
	 * @return	El número decimal redondeado.
	 */
	public static Double redondear(Double numero, int digitos) {
		int cifras = (int) Math.pow(10, digitos);
		return Math.rint(numero * cifras) / cifras;
	}

	/**
	 * Imprime un texto hacia una matriz de caracteres, de acuerdo a una
	 * posición, ancho y alto específicos.
	 *
	 * @param s Matriz de caracteres donde imprimir.
	 * @param x Posición inicial en X.
	 * @param y Posición inicial en Y.
	 * @param w Ancho específico para la impresión.
	 * @param h Alto específico para la impresión.
	 * @param t Texto a imprimir.
	 *
	 * @return La cantidad de filas utilizadas.
	 */
	public static int print(char[][] s, int x, int y, int w, int h, String t) {
		int xi = x, yi = y;
		w--;
		h--;
		for (int i = 0; i < t.length(); i++) {
			if ((yi >= 0 && yi < s.length) && (xi >= 0 && xi < s[yi].length)
					&& (yi <= (y + h) && (xi <= (x + w))))
				s[yi][xi] = t.charAt(i);
			xi++;
			if (xi >= s[yi].length || xi > (x + w)) {
				xi = x;
				yi++;
			}
			if (yi > (y + h))
				break;
		}
		return yi - y + 1;
	}

	/**
	 * Convierte una matriz de caracteres en una cadena con saltos de linea.
	 *
	 * @param s Matriz de caracteres a convertir.
	 *
	 * @return La cadena convertida.
	 */
	public static String sheet2string(char[][] s) {
		StringBuilder sb = new StringBuilder();
		int x, y, xt;
		for (y = 0; y < s.length; y++) {
			xt = s[y].length - 1;
			while (xt >= 0 && s[y][xt] == 0)
				xt--;
			for (x = 0; x <= xt; x++)
				sb.append(s[y][x] == 0 ? ' ' : s[y][x]);
			sb.append("\n");
		}
		return sb.toString();
	}

	/**
	 * Permite obtener datos del archivo de configuración sg-datos.xml.
	 *
	 * @param entorno	Entorno en el que se encuentra se tiene: Sistema,
	 * Produccion, Desarrollo y Local.
	 * @param var	Nombre de la variable/ítem/elemento que se quiere leer.
	 * @param request	Objeto HttpServletRequest.
	 * @return	En caso de éxito retorna una cadena con el valor de la
	 * variable/ítem/elemento, caso contrario retorna nulo.
	 */
	public static String get_value(String entorno, String var, HttpServletRequest request) {
		try {
			ServletContext servletContext = request.getSession().getServletContext();

			DOMParser parser = new DOMParser();
			String path = servletContext.getRealPath("/sg-datos.xml");
			parser.parse(path);
			Document doc = parser.getDocument();

			// Obteniendo el nodo raiz del documento
			Node raiz = getNode("Contenedor", doc.getChildNodes());

			// Obteniendo el nodo
			Node nodo = getNode(entorno, raiz.getChildNodes());

			return getNodeValue(var, nodo.getChildNodes());

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Permite colocar datos en el archivo de configuración sg-datos.xml.
	 *
	 * @param entorno	Entorno en el que se encuentra se tiene: Sistema,
	 * Produccion, Desarrollo y Local.
	 * @param var	Nombre de la variable/ítem/elemento que se quiere leer.
	 * @param val	Contenido de <code>var</code>.
	 * @param request	Objeto HttpServletRequest.
	 * @return	En caso de éxito retorna <code>true</code>, caso contrario
	 * retorna <code>false</code>
	 */
	public static boolean set_value(String entorno, String var, String val, HttpServletRequest request) {
		try {
			ServletContext servletContext = request.getSession().getServletContext();

			DOMParser parser = new DOMParser();
			String path = servletContext.getRealPath("/sg-datos.xml");
			parser.parse(path);
			Document doc = parser.getDocument();

			// Obteniendo el nodo raiz del documento
			Node raiz = getNode("Contenedor", doc.getChildNodes());

			// Obteniendo el nodo
			Node nodo = getNode(entorno, raiz.getChildNodes());

			// Colocando valor
			if (!setNodeValue(var, val, nodo.getChildNodes()))
				addNode(var, val, nodo);

			OutputFormat format = new OutputFormat(doc);
			format.setIndenting(true);
			XMLSerializer serializer = new XMLSerializer(
					new FileOutputStream(new File(servletContext.getRealPath("/sg-datos.xml"))), format);
			serializer.serialize(doc);

			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
//			StreamResult result = new StreamResult(new File("C:\\file.xml"));
			StreamResult result = new StreamResult(System.out);
			transformer.transform(source, result);

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * Permite obtener datos del archivo de configuración sg-datos.xml.
	 *
	 * @param entorno	Entorno en el que se encuentra se tiene: Sistema,
	 * Produccion, Desarrollo y Local.
	 * @param var	Nombre de la variable/ítem/elemento que se quiere leer.
	 * @param request	Objeto HttpServletRequest.
	 * @return	En caso de éxito retorna una cadena con el valor de la
	 * variable/ítem/elemento, caso contrario retorna nulo.
	 */
	public static String get_attr(String entorno, String var, HttpServletRequest request) {
		try {
			ServletContext servletContext = request.getSession().getServletContext();

			DOMParser parser = new DOMParser();
			String path = servletContext.getRealPath("/sg-datos.xml");
			parser.parse(path);
			Document doc = parser.getDocument();

			// Obteniendo el nodo raiz del documento
			Node raiz = getNode("Contenedor", doc.getChildNodes());

			// Obteniendo el nodo
			Node nodo = getNode(entorno, raiz.getChildNodes());

			return getNodeAttr("dato", getNode(var, nodo.getChildNodes()));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Permite colocar datos en el archivo de configuración sg-datos.xml.
	 *
	 * @param entorno	Entorno en el que se encuentra se tiene: Sistema,
	 * Produccion, Desarrollo y Local.
	 * @param var	Nombre de la variable/ítem/elemento que se quiere leer.
	 * @param val	Contenido de <code>var</code>.
	 * @param request	Objeto HttpServletRequest.
	 * @return	En caso de éxito retorna <code>true</code>, caso contrario
	 * retorna <code>false</code>
	 */
	public static boolean set_attr(String entorno, String var, String val, HttpServletRequest request) {
		try {
			ServletContext servletContext = request.getSession().getServletContext();

			DOMParser parser = new DOMParser();
			String path = servletContext.getRealPath("/sg-datos.xml");
			parser.parse(path);
			Document doc = parser.getDocument();

			// Obteniendo el nodo raiz del documento
			Node raiz = getNode("Contenedor", doc.getChildNodes());

			// Obteniendo el nodo
			Node nodo = getNode(entorno, raiz.getChildNodes());

			// Colocando valor
			setNodeAttr("dato", val, getNode(var, nodo.getChildNodes()));

			OutputFormat format = new OutputFormat(doc);
			format.setIndenting(true);
			XMLSerializer serializer = new XMLSerializer(
					new FileOutputStream(new File(servletContext.getRealPath("/sg-datos.xml"))), format);
			serializer.serialize(doc);

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// XML
	private static Node getNode(String tagName, NodeList nodes) {
		for (int x = 0; x < nodes.getLength(); x++) {
			Node node = nodes.item(x);
			if (node.getNodeName().equalsIgnoreCase(tagName)) {
				return node;
			}
		}

		return null;
	}

	private static String getNodeValue(Node node) {
		NodeList childNodes = node.getChildNodes();
		for (int x = 0; x < childNodes.getLength(); x++) {
			Node data = childNodes.item(x);
			if (data.getNodeType() == Node.TEXT_NODE)
				return data.getNodeValue();
		}
		return "";
	}

	private static String getNodeValue(String tagName, NodeList nodes) {
		for (int x = 0; x < nodes.getLength(); x++) {
			Node node = nodes.item(x);
			if (node.getNodeName().equalsIgnoreCase(tagName)) {
				NodeList childNodes = node.getChildNodes();
				for (int y = 0; y < childNodes.getLength(); y++) {
					Node data = childNodes.item(y);
					if (data.getNodeType() == Node.TEXT_NODE)
						return data.getNodeValue();
				}
			}
		}
		return "";
	}

	private static boolean setNodeAttr(String attrName, String value, Node node) {
		NamedNodeMap attrs = node.getAttributes();
		for (int y = 0; y < attrs.getLength(); y++) {
			Node attr = attrs.item(y);
			if (attr.getNodeName().equalsIgnoreCase(attrName)) {
				attr.setNodeValue(value);
				return true;
			}
		}
		Document dom = node.getOwnerDocument();
		Attr attr = dom.createAttribute(attrName);
		attr.setNodeValue(value);
		node.appendChild(attr);
		return true;
	}

	private static String getNodeAttr(String attrName, Node node) {
		NamedNodeMap attrs = node.getAttributes();
		for (int y = 0; y < attrs.getLength(); y++) {
			Node attr = attrs.item(y);
			if (attr.getNodeName().equalsIgnoreCase(attrName)) {
				return attr.getNodeValue();
			}
		}
		return "";
	}

	private static String getNodeAttr(String tagName, String attrName, NodeList nodes) {
		for (int x = 0; x < nodes.getLength(); x++) {
			Node node = nodes.item(x);
			if (node.getNodeName().equalsIgnoreCase(tagName)) {
				NodeList childNodes = node.getChildNodes();
				for (int y = 0; y < childNodes.getLength(); y++) {
					Node data = childNodes.item(y);
					if (data.getNodeType() == Node.ATTRIBUTE_NODE) {
						if (data.getNodeName().equalsIgnoreCase(attrName))
							return data.getNodeValue();
					}
				}
			}
		}

		return "";
	}

	private static boolean setNodeValue(String tagName, String value, NodeList nodes) {
		Node node = getNode(tagName, nodes);
		if (node == null)
			return false;

		System.err.println("Nodo: " + node.toString());

		// Locate the child text node and change its value
		NodeList childNodes = node.getChildNodes();
		for (int y = 0; y < childNodes.getLength(); y++) {
			Node data = childNodes.item(y);
			System.err.println("\tHijo: " + data.toString());
			if (data.getNodeType() == Node.TEXT_NODE) {
				data.setNodeValue(value);
				return true;
			}
		}
		return false;
	}

	private static void addNode(String tagName, String value, Node parent) {
		Document dom = parent.getOwnerDocument();

		// Create a new Node with the given tag name
		Node node = dom.createElement(tagName);

		// Add the node value as a child text node
		Text nodeVal = dom.createTextNode(value);
		Node c = node.appendChild(nodeVal);

		// Add the new node structure to the parent node
		parent.appendChild(node);
	}

	// Varios
	public static String goLikeAny(String s) {
		return (s == null || s.trim().isEmpty()) ? "%" : "%" + s.trim().replaceAll("\\s+", "%") + "%";
	}

	public static String goLikeIni(String s) {
		return (s == null || s.trim().isEmpty()) ? "%" : "%" + s.trim().replaceAll("\\s+", " %") + "%";
	}

	// Raúl Velasquez esta función redondea muy bién para 2 o 3 decimales
	public static double round(double value, int places) {
		if (places < 0) {
			throw new IllegalArgumentException();
		}

		long factor = (long) Math.pow(10, places);
		value = value * factor;
		long tmp = Math.round(value);
		return (double) tmp / factor;
	}
}
