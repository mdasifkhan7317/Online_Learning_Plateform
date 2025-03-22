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
 * @author husain
 */
public class LoginModel implements Model {
    @Override
    public void requestProcessor(HttpServletRequest request,HttpServletResponse response){
        try{
            PrintWriter out=response.getWriter();
            String s1 = request.getParameter("fname");
            String s2 = request.getParameter("lname");
            String s3 = request.getParameter("dob");
            String s4 = request.getParameter("qualification");
            //int qa = Integer.parseInt(s4);
            String s5 = request.getParameter("email");
            String s6 = request.getParameter("password");
            String s7 = request.getParameter("gender");
            String s8 = request.getParameter("user");
            int user = Integer.parseInt(s8);
            String s9 = request.getParameter("countries");
            //int city = Integer.parseInt(s9);
            System.out.println("fname is: " + s1);
            System.out.println("lname is: " + s2);
            System.out.println("DOB is: " + s3);
            System.out.println("Qualification is: " + s4);
            System.out.println("Email is: " + s5);
            System.out.println("Password is:" + s6);
            System.out.println("Gender: " + s7);
            System.out.println("Type is:" + user);
           // System.out.println("City: " + city);
           System.out.println("countries is:"+s9);
            
            
            MyDao md = new MyDao(request);
            Statement st = md.getConnection();

            int gender = 0;
            if (s7.equals("Male")) {
                gender = 1;
            } else if (s7.equals("Female")) {
                gender = 2;
            }

            String q2 = "INSERT INTO login_table(email,password,status,user_type)VALUES('" + s5 + "','" + s6 + "',0,'" + user + "')";

            md.insertData(st, q2);

            String q3 = "SELECT uid FROM user_table ORDER BY uid DESC LIMIT 1";
            ResultSet rs = (ResultSet) md.loadData(st, q3);
            if (!rs.next()) {
                String q1 = "INSERT INTO user_table(uid,fname,lname,dob,gender,hqualification,email)VALUE(1,'"+s1+"','"+s2+"','" + s3 + "','" + gender + "','" + s4 + "','" + s5 + "')";
                md.insertData(st, q1);
            } else {
                int id = rs.getInt("uid") + 1;
                String q4 = "INSERT INTO user_table(uid,fname,lname,dob,gender,hqualification,email)VALUE('" + id + "','" + s1 + "','" + s2 + "','" + s3 + "','" + gender + "','" + s4 + "','" + s5 + "')";
                md.insertData(st, q4);
            }
            String link="http://localhost:8080/olp/fc/?action=model&page=verifyemailmodel&email="+s5;
            MailSender ms=new MailSender();
            ms.sendMail(s5, link);
        }catch(Exception e){
            e.printStackTrace();
        }
    }        
}
