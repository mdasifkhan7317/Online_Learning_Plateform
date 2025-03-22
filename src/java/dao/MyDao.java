/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.sql.*;
/**
 *
 * @author hussain
 */
public class MyDao implements Serializable{
    ServletContext ctx = null;
    public MyDao(HttpServletRequest request){
        ctx = request.getServletContext();
    }
    public Statement getConnection()throws ClassNotFoundException,SQLException{
        Class.forName(ctx.getInitParameter("Driver"));
        return DriverManager.getConnection(ctx.getInitParameter("url"),ctx.getInitParameter("user"),ctx.getInitParameter("password")).createStatement();
    }
    public boolean insertData(Statement st,String query)throws SQLException{
        return st.execute(query);
    }
    public ResultSet loadData(Statement st,String query)throws SQLException{
        return st.executeQuery(query);
    }
}
