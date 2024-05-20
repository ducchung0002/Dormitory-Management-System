package com.southwind.util;

import java.sql.*;

public class JDBCUtil {
    private static final String driverName = "com.mysql.cj.jdbc.Driver";
    private static final String URI = "jdbc:mysql://localhost:3306/dormitory";
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "admin";

    static {
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URI, USERNAME, PASSWORD);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;

    }

    public static void release(Connection connection, Statement statement, ResultSet resultSet){
        try {
            if(connection != null){
                connection.close();
            }
            if(statement != null){
                statement.close();
            }
            if(resultSet != null){
                resultSet.close();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public static String getURI() {
        return URI;
    }
}
