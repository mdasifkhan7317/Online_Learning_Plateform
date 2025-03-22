/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.*;
import java.io.PrintWriter;
import java.sql.*;
import org.json.simple.JSONObject;

/**
 *
 * @author asif
 */
public class topicselectormodel implements Model {

    @Override
    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println("TopicSelectorModel");
            PrintWriter out = response.getWriter();

            String topic_id = request.getParameter("topicid");
            int n = Integer.parseInt(topic_id);
            System.out.println(n);

            MyDao md = new MyDao(request);
            Statement st = md.getConnection();

            String q = "SELECT topic_id, topic_name FROM topic_table WHERE(subcategory_id='" + n + "')";
            ResultSet rs = md.loadData(st, q);

            JSONObject topicObj = new JSONObject();

            while (rs.next()) {
                String topic_idd = (rs.getString("topic_id"));
                int s2=Integer.parseInt(topic_idd);
                String s1 = (rs.getString("topic_name"));

                System.out.println(s2 + " " + s1);

                topicObj.put(s2, s1);
            }
            JSONObject finalObject = new JSONObject();
            finalObject.put("topic", topicObj);
            out.println(finalObject.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}