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

    private boolean isPartEmpty(Part part) throws IOException{
        return (part.getInputStream().read() == -1);
    }
    
    private boolean isStringEmpty(String name){
        return (name == "" || name.isEmpty());
    }
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String SQL_UPLOAD = "INSERT INTO picture(data, name, uploaddate) VALUES (?,?,NOW())";
        PrintWriter out = response.getWriter();
        int result = 0;

        Part part = request.getPart("image");
        String name = request.getParameter("name");

        MysqlDataSource dataSource = DbConnection.getDataSource();

        if (isPartEmpty(part) && isStringEmpty(name)) {
            request.setAttribute("error", "ErrorBoth");
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        }else if(isStringEmpty(name)){
            request.setAttribute("error", "ErrorName");
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        }else if(isPartEmpty(part)){
            request.setAttribute("error", "ErrorPicture");
            request.getRequestDispatcher("/upload.jsp").forward(request, response);
        } 
        else {
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
                    request.setAttribute("error", "Sucess");
                    request.getRequestDispatcher("/upload.jsp").forward(request, response);
                    //response.sendRedirect("/picturerate/uploadinput");

                } else {
                    is.close();
                    statement.close();
                    connection.close();
                    out.println("<h1>Image wasnt inserted sucessfully -> Please check DB Connection</h1>");
                }
            } catch (SQLException e) {
                out.println(e);
            }
        }
    }
}
