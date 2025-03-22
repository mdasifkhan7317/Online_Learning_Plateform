/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import java.sql.*;
import java.io.PrintWriter;

/**
 *
 * @author hussain
 */
public class getcategory implements Model{
    public void requestProcessor(HttpServletRequest request, HttpServletResponse response){
        try{
            System.out.println("getcategory");
            PrintWriter out= response.getWriter();
            MyDao md = new MyDao(request);
            Statement st = md.getConnection();
            String q= "SELECT category_id,category_name FROM category_table";
            ResultSet rs = md.loadData(st,q);
            JSONObject usertypeObj = new JSONObject();
            while (rs.next()) {
                String id = rs.getString("category_id");
                String name = rs.getString("category_name");
                //String permission = rs.getString("permission");
                usertypeObj.put(id, name);
            }
            JSONObject finalObj = new JSONObject();
            finalObj.put("category", usertypeObj);
            out.println(finalObj.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
    

