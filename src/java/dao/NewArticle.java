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
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author ajad
 */
public class NewArticle implements Model {

    @Override
    public void requestProcessor(HttpServletRequest request, HttpServletResponse response) {
        try (PrintWriter out = response.getWriter()) {
            String Category = request.getParameter("category");
            String SubCategory = request.getParameter("subcategory");
            String Topic = request.getParameter("topic");
            int Topic_id = Integer.parseInt(Topic);
            String Title_name = request.getParameter("title");
            String Article = request.getParameter("article");

            out.println("<strong>" + "New Article Posted" + "<strong>" + "</br>");
            out.println(Category + "<br>");
            out.println(SubCategory + "<br>");
            out.println(Topic_id + "<br>");
            out.println(Title_name + "<br>");
            out.println(Article + "<br>");

            MyDao md = new MyDao(request);
            Statement st = md.getConnection();

            //get uid from session attribute
            HttpSession session = request.getSession();
            Integer uid_value = (Integer) session.getAttribute("userid");

            //then again select uid from user_table on the basis of uid=(uid_value)of session through geted uid. 
            String id = "SELECT uid FROM user_table WHERE(uid='" + uid_value + "')";
            ResultSet rt = md.loadData(st, id);
            int uiid = 0;
            if (rt.next()) {
                uiid = rt.getInt("uid");
            }

            //for Title_table;
            String q1 = "SELECT title_id FROM title_table ORDER BY title_id DESC LIMIT 1";
            ResultSet rs = md.loadData(st, q1);
            if (!rs.next()) {
                String qry1 = "INSERT INTO title_table(title_id,title_name,topic_id) VALUES (1,'" + Title_name + "','" + Topic_id + "')";
                md.insertData(st, qry1);

            } else {
                int tm_id = rs.getInt("title_id") + 1;
                String qry2 = "INSERT INTO title_table(title_id,title_name,topic_id) VALUES ('" + tm_id + "','" + Title_name + "','" + Topic_id + "')";
                md.insertData(st, qry2);

            }

            //after inserting title_id in title_table then select title_id from title_table for use of content_Table;
            String q2 = "SELECT title_id FROM title_table ORDER BY title_id DESC LIMIT 1";
            ResultSet ts = md.loadData(st, q2);
            int t_id = 0;
            if (ts.next()) {
                t_id = ts.getInt("title_id");
            }

            //For maximum content_id from content_table;
            String q3 = "SELECT content_id FROM content_table ORDER BY content_id DESC LIMIT 1";
            ResultSet ys = md.loadData(st, q3);
            if (!ys.next()) {
                String qry3 = "INSERT INTO content_table(content_id,content,dow,dou,uid,status,title_id) VALUES (1,'" + Article + "',NOW(),NOW(),'" + uiid + "',0,'" + t_id + "')";
                md.insertData(st, qry3);
            } else {
                int c_id = ys.getInt("content_id") + 1;
                String qry4 = "INSERT INTO content_table(content_id,content,dow,dou,uid,status,title_id) VALUES ('" + c_id + "','" + Article + "',NOW(),NOW(),'" + uiid + "',0,'" + t_id + "')";
                md.insertData(st, qry4);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
