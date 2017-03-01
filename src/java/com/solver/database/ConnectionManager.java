/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.NamingException;
    
/**
 *
 * @author gokhanceyhan
 */
public class ConnectionManager {

    private static final String URL = "jdbc:derby://localhost:1527/mocoDB";
    private static final String DRIVER_NAME = "org.apache.derby.jdbc.EmbeddedDriver";
    private static final String USER_NAME = "moco";
    private static final String PASSWORD = "mocodb2016";

    public static Connection setUpConnection() throws SQLException, ClassNotFoundException, NamingException {

        Class.forName(DRIVER_NAME);
        Connection con = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
        return con;

    }

}
