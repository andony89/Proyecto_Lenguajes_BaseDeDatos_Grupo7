import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


package main.proyectofinal_basededatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 
    private static final String USER = "ANDONY";
    private static final String PASSWORD = "Colon1289";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Driver no encontrado.");
        }
    }
}