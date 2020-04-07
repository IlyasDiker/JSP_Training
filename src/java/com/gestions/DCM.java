/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gestions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ilyas
 */
public class DCM {
    public static Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            //Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", user, pass);
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "gestion", "NTIC");
            return connection;
        } catch (Exception ex) {
            Logger.getLogger(DCM.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
