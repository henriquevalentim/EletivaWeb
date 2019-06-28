package br.edu.fatec.web.test;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class Testsssss {

	public static void main(String[] args) {

		Document document = new Document();
		try {

			PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\Pichau\\Desktop\\PROJWEB\\PDF_DevMedia.pdf"));
			document.open();

			// adicionando um parágrafo no documento
			document.add(new Paragraph("Tirza Gorda"));
		} catch (DocumentException de) {
			System.err.println(de.getMessage());
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
		}
		document.close();
		
		try {
			Desktop.getDesktop().open(new File("C:\\Users\\Pichau\\Desktop\\PROJWEB\\PDF_DevMedia.pdf"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
