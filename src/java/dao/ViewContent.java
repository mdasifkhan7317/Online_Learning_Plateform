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
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author ajad
 */
public class ViewContent implements Model {

    @Override
    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {
        try ( PrintWriter out = response.getWriter()) {
            String ttlid=request.getParameter("titleid");
            int tlid=Integer.parseInt(ttlid);
            System.out.println(tlid);
                        
            MyDao md = new MyDao(request);
            Statement st = md.getConnection();

            String s = "SELECT content FROM content_table WHERE(title_id='" + tlid + "')";
            ResultSet rs = md.loadData(st, s);
            JSONArray dataArray = new JSONArray();
            while(rs.next()){
                JSONObject dataobj = new JSONObject();
                String con=rs.getString("content");
                System.out.println(con);
                
                dataobj.put("contentt", con);
                dataArray.add(dataobj);
            }
            JSONObject ob = new JSONObject();
            ob.put("contentshow", dataArray);
            out.println(ob.toString());
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}