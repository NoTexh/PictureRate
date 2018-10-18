package de.dhbw.karlsruhe.picturerate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

public class DbConnection {
    private String hostname;
    private String port;
    private String username;
    private String password;
    private String schema;

    private Connection connection;

    public DbConnection() {
        this.hostname = "localhost";
        this.port = "3306";
        this.username = "root";
        this.password = "root";
        this.schema = "picturerate";
    }

    public DbConnection(String username, String password, String schema) {
        this.hostname = "localhost";
        this.port = "3306";
        this.username = username;
        this.password = password;
        this.schema = schema;
    }

    public DbConnection(String hostname, String username, String password, String schema) {
        this.hostname = hostname;
        this.port = "3306";
        this.username = username;
        this.password = password;
        this.schema = schema;
    }

    public DbConnection(String hostname, String port, String username, String password, String schema) {
        this.hostname = hostname;
        this.port = port;
        this.username = username;
        this.password = password;
        this.schema = schema;
    }

    /**
     * Verbindet mit der MySQL Datenbank
     */
    public void connect() {
        Properties properties = new Properties();
        properties.setProperty("user", username);
        properties.setProperty("password", password);
        properties.setProperty("useSSL", "false");

        String url = "jdbc:mysql://" + this.hostname + ":" + this.port + "/" + this.schema + "?serverTimezone=Europe/Berlin";
        try {
            this.connection = DriverManager.getConnection(url, properties);
        } catch (SQLException ex) {
            this.connection = null;
            ex.printStackTrace();
        }
    }

    public void disconnect() {
        try {
            this.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            this.connection = null;
        }
        this.connection = null;
    }

    /**
     * Bereitet das SQL-Statement vor
     *
     * @param query
     * @param values
     * @return
     * @throws SQLException
     */
    public ResultSet query(String query, ArrayList<Object> values) throws SQLException {
        if (!this.isConnected()) {
            this.connect();
        }

        PreparedStatement ps = this.connection.prepareStatement(query);
        for (int i = 1; i <= values.size(); i++) {
            ps.setObject(i, values.get(i - 1));
        }
        ps.execute();

        return ps.getResultSet();
    }

    /**
     * Führt das SQL-Statement aus
     *
     * @param query
     * @return
     * @throws SQLException
     */
    public ResultSet query(String query) throws SQLException {
        if (!this.isConnected()) {
            this.connect();
        }

        System.out.println(query);
        PreparedStatement ps = this.connection.prepareStatement(query);
        return ps.executeQuery(query);
    }

    /**
     * Führt das Update-Statement aus
     *
     * @param query
     * @return
     * @throws SQLException
     */
    public int updateQuery(String query) throws SQLException {
        if (this.isConnected()) {
            this.connect();
        }
        Statement sm = this.connection.createStatement();

        return sm.executeUpdate(query);
    }

    // Getters and setters
    public String getHostname() {
        return this.hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getPort() {
        return this.port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSchema() {
        return this.schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public java.sql.Connection getConnection() {
        return this.connection;
    }

    public boolean isConnected() {
        try {
            return this.connection != null && !this.connection.isClosed();
        } catch (SQLException e) {
            return false;
        }
    }
}
