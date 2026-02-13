/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.db.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author piyus
 */
public class DBConnection 
{
    private static Connection conn;

    public static Connection getConnection() 
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flipr_assignment","root","root");
        } 
        catch (ClassNotFoundException | SQLException e)
        {
            System.out.println(e);
        }
        return conn;
    }
}
