/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package JournalEntryServlet;

import config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Alarm;

/**
 *
 * @author Fathan Fardian Sanum
 */
@WebServlet(name = "AddJournalEntryServlet", urlPatterns = {"/AddJournalEntryServlet"})
public class AddJournalEntryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        DB db = new DB(); // Membuat object Koneksi
        
        db.connect(); // Koneksi ke database
        
        // Ambil data dari form
        Timestamp entryDate = request.getParameter("entrydate");
        String content = request.getParameter("content");
        
        // Buat object barang
        JournalEntry journalEntry = new JournalEntry(entryDate, content);
        
        String query = "INSERT INTO journalentry (entryDate, content) VALUES ('"
                + journalEntry.getEntryDate() +"', '"
                + journalEntry.getContent()+ "' )";
        
        // Simpan ke database
        db.runQuery(query);

        response.sendRedirect("JournalEntryServlet");
    }
}
