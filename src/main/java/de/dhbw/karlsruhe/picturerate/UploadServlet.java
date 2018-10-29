package de.dhbw.karlsruhe.picturerate;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "UploadServlet", urlPatterns = {"/uploaddata"})
public class UploadServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String SQL_UPLOAD = "INSERT INTO picture(data, name, uploaddate) VALUES (?,?,NOW())";
        PrintWriter out = response.getWriter();
        int result = 0;

        Part part = request.getPart("image");
        String name = request.getParameter("name");

        MysqlDataSource dataSource = DbConnection.getDataSource();
        getUploadMessage(request, response, part, name);

            try (Connection connection = dataSource.getConnection();
                    PreparedStatement statement = connection.prepareStatement(SQL_UPLOAD)) {

                InputStream is = part.getInputStream();

                statement.setBlob(1, is);
                statement.setString(2, name);

                result = statement.executeUpdate();
                if (result > 0) {
                    is.close();
                    statement.close();
                    connection.close();
                    request.setAttribute("message", "Sucess");
                    request.getRequestDispatcher("/upload.jsp").forward(request, response);

                }
            } catch (SQLException e) {
                out.println(e);
            }
        }
    
    
    private void getUploadMessage(HttpServletRequest request, HttpServletResponse response, Part part, String name) throws IOException, ServletException{
        if (isPartEmpty(part) && isStringEmpty(name)) {
            request.setAttribute("message", "ErrorBoth");
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        }else if(isStringEmpty(name)){
            request.setAttribute("message", "ErrorName");
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        }else if(isPartEmpty(part)){
            request.setAttribute("message", "ErrorPicture");
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        } 
    }
    
    private boolean isPartEmpty(Part part) throws IOException{
        return (part.getInputStream().read() == -1);
    }
    
    private boolean isStringEmpty(String name){
        return (name == "" || name.isEmpty());
    }
}
