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

@WebServlet(name = "PictureByIdServlet", urlPatterns = {"/picture/*"})
public class PictureByIdServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    MysqlDataSource dataSource;
    PrintWriter out;
    private static final String SQL_PICTURE_BY_ID = "SELECT data FROM picture WHERE idpicture = ?";
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        dataSource = DbConnection.getDataSource();
        
        String imageName = request.getPathInfo().substring(1);
        
        try (Connection connection = dataSource.getConnection(); 
                PreparedStatement statement = connection.prepareStatement(SQL_PICTURE_BY_ID)) {
            statement.setString(1, imageName);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    byte[] content = resultSet.getBytes("data");
                    response.setContentType(getServletContext().getMimeType("image/png"));
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Something failed at SQL/DB level.", e);
        }
    }
}
