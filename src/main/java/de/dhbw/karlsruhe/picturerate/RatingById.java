package de.dhbw.karlsruhe.picturerate;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "RatingById", urlPatterns = {"/ratingbyid"})
public class RatingById extends HttpServlet {

    public MysqlDataSource datasrc;
    
    //Bewertungsbuttons
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String imgid = request.getParameter("id");
        String btn = request.getParameter("btn");
        int uprate = 0;
        String SQL_rate_update;
        
        datasrc = new DbConnection().getDataSource();
        
        if (btn.equals("star")) {
            
            String star = request.getParameter("star");
            int stern = Integer.parseInt(star.substring(0, 1));
            if (stern == 1) {
                stern = 0;
            } else {
                stern = 1;
            }
            
            SQL_rate_update = "update picture set ratestar= " + stern + " where idpicture=" + imgid; 
        }
        else {
            
            if (btn.equals("rateheart")) {
                String heart = request.getParameter("heart");
                uprate = Integer.parseInt(heart.substring(0, 1));
            }
            if (btn.equals("ratethumbup")) {
                String thumbup = request.getParameter("thumbup");
                uprate = Integer.parseInt(thumbup.substring(0, 1));
            }
            if (btn.equals("ratethumbdown")) {
                String thumbdown = request.getParameter("thumbdown");
                uprate = Integer.parseInt(thumbdown.substring(0, 1));
            }
            if (btn.equals("ratepoop")) {
                String poop = request.getParameter("poop");
                uprate = Integer.parseInt(poop.substring(0, 1));
            }
            uprate = uprate + 1;

            SQL_rate_update = "update picture set " + btn + " = " + uprate + " where idpicture = " + imgid;
        }
        
        try (Connection connection = datasrc.getConnection();
                PreparedStatement statement  = connection.prepareStatement(SQL_rate_update)) {
                   
            statement.executeUpdate();
            
        } catch (SQLException ex) {
           throw new ServletException("Whoopsi bei Rating");
        }
        
        response.sendRedirect("/picturerate/detailaufruf?id=" + imgid);
    }

}
