/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author hussain
 */
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

/**
 *
 * @author ajad
 */
public class FetchPostedContent implements Model {

    @Override
    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Integer suid = (Integer) session.getAttribute("userid");
            //System.out.println(suid);

            MyDao md = new MyDao(request);
            Statement st = md.getConnection();

            String s = "SELECT a.title_id,a.title_name,b.dow,b.dou FROM title_table a INNER JOIN content_table b ON(a.title_id=b.title_id) WHERE(b.uid='" + suid + "')";
            ResultSet rs = md.loadData(st, s);
            JSONArray dataArray = new JSONArray();

            while (rs.next()) {
                JSONObject dataobj = new JSONObject();
                String t = rs.getString("title_name");
                String date = rs.getString("dow");
                String up = rs.getString("dou");
                int tid = Integer.parseInt(rs.getString("title_id"));
                System.out.println(t);
                System.out.println(date);
                System.out.println(up);
                System.out.println(tid);
////                HttpSession sess = request.getSession(true);
////                sess.setAttribute("tit-id", tid);

                dataobj.put("Title_Name", t);
                dataobj.put("Date_of_Write", date);
                dataobj.put("Date_of_Update", up);
                dataobj.put("titleid", tid);

                dataArray.add(dataobj);
            }
            JSONObject ob = new JSONObject();
            ob.put("post", dataArray);
            out.println(ob.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}