package de.dhbw.karlsruhe.picturerate;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConnection {

    private static MysqlDataSource dataSource;

    public static MysqlDataSource getDataSource() {
        dataSource = new MysqlDataSource();
        dataSource.setUser("root");
        dataSource.setPassword("root");
        dataSource.setServerName("localhost");
        dataSource.setPort(3306);
        dataSource.setDatabaseName("picturerate");
        try {
            dataSource.setServerTimezone("Europe/Berlin");
        } catch (SQLException ex) {
            Logger.getLogger(PictureByIdServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dataSource;
    }
}
