package de.dhbw.karlsruhe.picturerate;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DbTest {
    
    public static void main(String[] args) throws SQLException{
        DbConnection dbConnection = new DbConnection();
        String query = "SELECT * FROM picture";
        dbConnection.connect();
        ResultSet resultSet = dbConnection.query(query);
        while(resultSet.next()){
            System.out.println(resultSet.getInt("idpicture"));
            System.out.println(resultSet.getString("name"));
        }
        dbConnection.disconnect();
    }
}
