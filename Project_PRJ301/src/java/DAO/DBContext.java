/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class DBContext {
    public Connection conn=null;
    public DBContext(String url,String user,String pass){
         try {
            // call Driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //connect
            conn=DriverManager.getConnection(url,user,pass);
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public ResultSet getData(String sql) {
        ResultSet rs = null;
        Statement state = null;
        try {
            state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đảm bảo đóng tài nguyên sau khi sử dụng
            try {
                if (state != null) {
                    state.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rs;
    }
    public DBContext(){
      this("jdbc:sqlserver://DESKTOP-2RIC52H\\MAYAO:1433;databaseName=Phone_Project",
                    "admin","123456");
    }
    public static void main(String[] args) {
        new DBContext();
    }
}

