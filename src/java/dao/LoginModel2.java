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
public class LoginModel2 implements Model {

    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println("loginmodel2");
            PrintWriter out = response.getWriter();

            String em = request.getParameter("email");
            String pass = request.getParameter("password");
            //System.out.println(em);
            //System.out.println(pass);

            //creating connection with database
            MyDao md = new MyDao(request);
            Statement st = md.getConnection();
            //Select uid from user_table on the basis of email for set session attribute set.
            String z="SELECT uid FROM user_table WHERE (email='"+em+"')";
            ResultSet r=md.loadData(st, z);
            int u_id=0;
            if(r.next()){
                 u_id = r.getInt("uid");
            }

            String q1 = "SELECT email,status,user_type from login_table WHERE(password='" + pass + "')";
            ResultSet rs = md.loadData(st, q1);
            if (rs.next()) {
                String dbemail = rs.getString("email");
                int dbstatus = rs.getInt("status");
                int dbuser_type = rs.getInt("user_type");
                System.out.println(dbemail + " " + dbstatus + " " + dbuser_type);
                if (dbemail.equals(em)) {
                    if (dbstatus == 1) {
                        HttpSession sess=request.getSession(true);
                        sess.setAttribute("email", em);
                        sess.setAttribute("user_type", dbuser_type);
                        sess.setAttribute("userid", u_id);
                        if (dbuser_type == 1) {
                            String page = "contentprovider";
                            request.getRequestDispatcher("/WEB-INF/pages/" + page + ".jsp").forward(request, response); //Content provider page
                        } else {
                            String page = "contentseeker";
                            request.getRequestDispatcher("/WEB-INF/pages/" + page + ".jsp").forward(request, response); //Content Seeker page
                        }
                    } else {
                        System.out.println("plz verify your email"); //verify your email
                    }
                } else {
                    System.out.println("Wrong credential");//wrong credentials
                }
            } else {
                System.out.println("User does not exit");//user does not exist
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
