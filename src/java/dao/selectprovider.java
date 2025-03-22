/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import org.json.simple.JSONObject;

/**
 *
 * @author hussain
 */
public class selectprovider implements Model {
    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {
        try (PrintWriter out = response.getWriter()) {
            System.out.println("selectprovider");
            MyDao md = new MyDao(request);
            Statement st = md.getConnection();
            String q = "SELECT type_id,type_name,permission FROM usertype_table";
            ResultSet rs = md.loadData(st,q);
            JSONObject usertypeObj = new JSONObject();
            while (rs.next()) {
                String id = rs.getString("type_id");
                String name = rs.getString("type_name");
                //String permission = rs.getString("permission");
                usertypeObj.put(id, name);
            }
            JSONObject finalObj = new JSONObject();
            finalObj.put("user", usertypeObj);
            out.println(finalObj.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
