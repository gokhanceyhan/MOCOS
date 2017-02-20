/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver.database;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gokhanceyhan
 */
public class DatabaseMain {

    public static void main(String args[]) {

        try {
            Connection connection = ConnectionManager.setUpConnection();
            //addInputDataAsUDT(connection, "MOCO");
            //showDatabaseMetaData(connection);
            //deleteUDT(connection, "MOCO","JOBINPUT");           
            //alterJobQueueTable(connection);

            connection.commit();
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DatabaseMain.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void showDatabaseMetaData(Connection con) throws SQLException {
        DatabaseMetaData md = con.getMetaData();

        // list of user defined types
        ResultSet rs = md.getUDTs(null, null, null, null);
        while (rs.next()) {
            System.out.println(rs.getString(2));
            System.out.println(rs.getString(3));
            System.out.println(rs.getString(4));
        }

    }

    public static void setUpJobQueueTable() {

    }

    public static void alterJobQueueTable(Connection con) throws SQLException {
        addColumnToTable(con, "MOCO", "JOBQUEUE", "INPUTDATA", "JOBINPUT");
    }

    public static void addColumnToTable(Connection con, String schemaName, String tableName, String columnName, String columnType) throws SQLException {

        Statement statement = con.createStatement();
        String sql = "ALTER TABLE " + schemaName + "." + tableName + " ADD COLUMN " + columnName + " " + columnType;
        statement.execute(sql);

    }

    public static void addInputDataAsUDT(Connection con, String schemaName) throws SQLException {

        Statement statement = con.createStatement();
        String sql = "CREATE TYPE JOBINPUT\n"
                + "EXTERNAL NAME 'com.solver.dataTypes.InputData'\n"
                + "LANGUAGE JAVA";
        statement.execute(sql);
    }

    public static void deleteUDT(Connection con, String schemaName, String udtName) throws SQLException {
        Statement statement = con.createStatement();
        String sql = "DROP TYPE " + schemaName + "." + udtName + " RESTRICT";
        statement.execute(sql);
    }

}
