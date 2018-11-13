package de.dhbw.karlsruhe.picturerate;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.io.IOException;
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

    /* Img ID aus jsp auslesen und im Servlet speichern für div. Datenbankabfragen*/
    String imgid;

    public void getimgid(String imgid) {
        this.imgid = imgid;
    }


    /* Methode für Datenbankabfrage und Namensausgabe in detail.jsp*/
    MysqlDataSource detailtest;
    private String SQL_PICTURE_BY_ID = "SELECT name FROM picture WHERE idpicture = ";

    public String test() throws ServletException {
        detailtest = DbConnection.getDataSource();
        String imgname = "Kein Name gefunden";
        SQL_PICTURE_BY_ID = SQL_PICTURE_BY_ID + imgid;

        try (Connection connection = detailtest.getConnection();
                PreparedStatement statement = connection.prepareStatement(SQL_PICTURE_BY_ID)) {

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    imgname = rs.getString("name");
                }
            }
            return imgname;

        } catch (SQLException ex) {
            throw new ServletException("Abfrage ist schief gelaufen!");
        }

    }

    //Kommentarausgabe
    public String[][] comments;
    private String SQL_Com = "select datediff(now(), uploaddate) as datedif, timediff(now(), uploaddate) as timedif, idkommentar, kommentar from kommentare where idpicture = ";
    int laenge = 0;

    public int getcomments() throws ServletException {

        detailtest = DbConnection.getDataSource();
        int i = 0;
        SQL_Com = SQL_Com + imgid;

        try (Connection connection = detailtest.getConnection();
                PreparedStatement statement = connection.prepareStatement(SQL_Com)) {

            /*Länge des ResultSets auslesen*/
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    laenge++;
                }
            }
            /*Daten aus dem ResultSet auslesen*/
            try (ResultSet rs = statement.executeQuery()) {
                comments = new String[laenge][3];
                while (rs.next()) {
                    comments[i][0] = new String();
                    
                    String date = rs.getString("datedif");
                    String time = rs.getString("timedif");
                    int tag = Integer.parseInt(date);
                    
                    if (tag != 0) {
                        comments [i] [0]  = "Vor: " + tag + " Tagen";
                        if (tag == 1) {
                            comments [i] [0]  = "Vor: " + tag + " Tag";
                        }
                    } else {
                        int stunde = Integer.parseInt(time.substring(0 ,2));
                        int minute = Integer.parseInt(time.substring(3, 5));
                        int sekunde = Integer.parseInt(time.substring(6, 8));
                    
                        if (stunde != 0) {
                            comments [i] [0] = "Vor: " + stunde + " Stunden";
                            if (stunde == 1) {
                                comments [i] [0] = "Vor: " + stunde + " Stunde";
                            }
                        } else if (minute != 0) {
                            comments [i] [0] = "Vor: " + minute + " Minuten";
                            if (minute == 1) {
                                comments [i] [0] = "Vor: " + minute + " Minute";
                            }
                        } else {
                            comments [i] [0] = "Vor: " + sekunde + " Sekunden";
                            if (sekunde == 1) {
                                comments [i] [0] = "Vor: " + sekunde + " Sekunde";
                            }
                        }
                    }
                    
                    comments[i][1] = new String();
                    comments[i][1] = rs.getString("kommentar");
                    
                    comments[i][2] = new String();
                    comments[i][2] = rs.getString("idkommentar");
                    i++;
                }
                return laenge;
            }
        } catch (SQLException ex) {
            throw new ServletException("Whoopsi! Etwas ist schief gelaufen!");
        }
    }
    
    //Rating anzeigen in jsp über instanzvariable rating[]
    public String SQL_rate = "select rateheart, ratethumbup, ratethumbdown, ratepoop, ratestar from picture where idpicture=";
    public String[] rating;
    
    public void getRating() throws ServletException {
        detailtest = DbConnection.getDataSource();
        rating = new String[5];
        SQL_rate = SQL_rate + imgid;
        try (Connection connection = detailtest.getConnection();
                    PreparedStatement statement = connection.prepareStatement(SQL_rate)) {
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    rating [0] = new String();
                    rating [0] = rs.getString("rateheart");
                    rating [1] = new String();
                    rating [1] = rs.getString("ratethumbup");
                    rating [2] = new String();
                    rating [2] = rs.getString("ratethumbdown");
                    rating [3] = new String();
                    rating [3] = rs.getString("ratepoop");
                    rating [4] = new String();
                    rating [4] = rs.getString("ratestar");
                }
            }
        } catch (SQLException ex) {
            throw new ServletException("Rating abfragen ist fehlgeschlagen!");
        }
    }

    
    //Kommentar aus jsp in Datenbank speichern
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String comid = request.getParameter("comid");
        String test1 = request.getParameter("comment");
        imgid = request.getParameter("id");
        String SQL_INSERT = "insert into kommentare(idpicture, idkommentar, kommentar, uploaddate) values(?, ?, ?, NOW())";
        
        if (test1 == "") {
            response.sendRedirect("/picturerate/detailaufruf?id=" + imgid + "&input=noInput");
        }
        else {
        
            MysqlDataSource ds = DbConnection.getDataSource();
            try (Connection connection = ds.getConnection();
                    PreparedStatement statement = connection.prepareStatement(SQL_INSERT)) {
                try {
                    statement.setString(1, imgid);
                    statement.setString(2, comid);
                    statement.setString(3, test1);
                    statement.executeUpdate();
                } catch (SQLException f) {
                    throw new ServletException(SQL_INSERT);
                }

            } catch (SQLException ex) {
                throw new ServletException("Whoopsi Db Verbindung hat nicht geklappt!");
            }
            response.sendRedirect("/picturerate/detailaufruf?id=" + imgid);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
