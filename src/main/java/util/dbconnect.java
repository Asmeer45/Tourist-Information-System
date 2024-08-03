package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnect {
	private static String URL = "jdbc:mysql://localhost:3306/tourist_information";
    private static String USER = "root";
    private static String PASSWORD = "";
    private static final String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver"; 

//    public static Connection getConnection() {
//        Connection connection = null;
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return connection;
//    }
//    
//    private static final String URL = "jdbc:mysql://localhost:3306/InventoryServletWeb";
//    private static final String USER = "root";
//    private static final String PASSWORD = "Nijaadh20#";
//    private static final String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver"; 

    static {
        try {
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
        
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
