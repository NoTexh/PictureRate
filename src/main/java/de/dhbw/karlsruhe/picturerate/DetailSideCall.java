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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DetailSideCall", urlPatterns = {"/calldetail"})
public class DetailSideCall extends HttpServlet {
    
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
            out.println("<title>Servlet DetailSideCall</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailSideCall at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");           
        }
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
    
    MysqlDataSource detailtest;
    private String SQL_PICTURE_BY_ID = "SELECT name FROM picture WHERE idpicture = ";

    public String test(String imgid) throws ServletException {
        detailtest = DbConnection.getDataSource();
            String imgname = "Kein Name gefunden";
            SQL_PICTURE_BY_ID = SQL_PICTURE_BY_ID + imgid;
            
            try (Connection connection = detailtest.getConnection();
                    PreparedStatement statement = connection.prepareStatement(SQL_PICTURE_BY_ID)) {
                
                try (ResultSet rs = statement.executeQuery()) {
                    while(rs.next()) {
                        imgname = rs.getString("name");
                    }
                }
                return imgname;
                
            } catch (SQLException ex) {
                throw new ServletException("Abfrage ist schief gelaufen!");
        }
            
    }
    
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
