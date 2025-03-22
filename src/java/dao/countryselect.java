/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.*;
import org.json.simple.JSONObject;

/**
 *
 * @author hussain
 */
public class countryselect implements Model {

    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {

        try (PrintWriter out = response.getWriter()) {
            MyDao md = new MyDao(request);
            Statement st = md.getConnection();
            String q = "SELECT country_code,country_name FROM country_master";
            ResultSet rs = md.loadData(st,q);
            JSONObject obj = new JSONObject();
            while (rs.next()) {
                String s1 = (rs.getString("country_code"));
                String s2 = (rs.getString("country_name"));
                obj.put(s1,s2);
            }
            JSONObject ob = new JSONObject();
            ob.put("countries", obj);
            out.println(ob.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
