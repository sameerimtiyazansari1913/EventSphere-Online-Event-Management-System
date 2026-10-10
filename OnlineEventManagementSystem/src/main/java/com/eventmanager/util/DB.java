package com.eventmanager.util;
import java.sql.*;
public class DB {
 private static final String URL = "jdbc:mysql://localhost:3306/event_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
 private static final String USER="root";
 private static final String PASSWORD="root"; // Change this to your MySQL password.
 static { try { Class.forName("com.mysql.cj.jdbc.Driver"); } catch(Exception e){ throw new RuntimeException(e); } }
 public static Connection getConnection() throws SQLException { return DriverManager.getConnection(URL,USER,PASSWORD); }
}
