package com.example.btl_web_book.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnect {
    private static Connection connection = null;
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if(connection == null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/web_book","root","21022002");
            System.out.print("connected");
        }
        return connection;
    }
}
