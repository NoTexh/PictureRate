package de.dhbw.karlsruhe.picturerate;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbTest {
    
    public static void main(String[] args) throws SQLException{
        MysqlDataSource dataSource = DbConnection.getDataSource();
        Connection con = dataSource.getConnection();
        String query = "SELECT * FROM picture";
        PreparedStatement stmt = con.prepareStatement(query);
        ResultSet resultSet = stmt.executeQuery();
        while(resultSet.next()){
            System.out.println(resultSet.getInt("idpicture"));
            System.out.println(resultSet.getString("name"));
        }
    }
}
