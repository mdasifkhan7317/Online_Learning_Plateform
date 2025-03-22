/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;
import jakarta.servlet.http.*;
import java.io.PrintWriter;
import java.sql.*;

/**
 *
 * @author hussain
 */
public class verifyemailmodel implements Model{

    @Override
    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {
       try{
           System.out.println("verifyemailmodel");
           PrintWriter out = response.getWriter();
           String email = request.getParameter("email");
           MyDao md=new MyDao(request);
           Statement st=md.getConnection();
           String q5="UPDATE login_table SET status=1 WHERE(email='"+email+"')";
           md.insertData(st, q5);   
       }catch(Exception e){
           e.printStackTrace();
       }
    }
}
