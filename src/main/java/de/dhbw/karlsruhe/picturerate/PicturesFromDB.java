/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.dhbw.karlsruhe.picturerate;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kai
 */
@WebServlet(name = "PicturesFromDB", urlPatterns = {"/PicturesFromDB"})
public class PicturesFromDB extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PicturesFromDB</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PicturesFromDB at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    //Methode um Anzahl Bilder aus der DB zu bekommen
    MysqlDataSource picturetest;
    private String anzBilderSQL = "SELECT COUNT(*) as ANZ FROM picture ";
    public int anzBilder;
    public int getAnzBilder () throws ServletException {
        picturetest = DbConnection.getDataSource();
        anzBilder = 0;
        
          try(Connection connection = picturetest.getConnection();
                PreparedStatement statement = connection.prepareStatement(anzBilderSQL)) {
              
            /*Daten aus dem ResultSet auslesen*/
            try (ResultSet rs = statement.executeQuery()) {
                String anzahl ="";
                while(rs.next())
                anzahl = rs.getString("ANZ");
                anzBilder = Integer.parseInt(anzahl);
            } 
          } catch (SQLException ex) {
            throw new ServletException("Whoopsi! Etwas ist schief gelaufen!");
        }
        return anzBilder;
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
