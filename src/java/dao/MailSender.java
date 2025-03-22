/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.util.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;
/**
 *
 * @author hussain
 */
public class MailSender {
    public void sendMail(String email, String text){
        String from="mdasifkhan3775@gmail.com";
        final String username="mdasifkhan3775@gmail.com";
        final String password="xdinztvstwbdjdwl";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.host","smtp.gmail.com");
        props.put("mail.smtp.port","587");
        props.put("mail.smtp.ssl.trust","smtp.gmail.com");
        Session sess = Session.getInstance(props,new jakarta.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username,password);
            }
        });
        try{
            Message msg = new MimeMessage(sess);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            msg.setSubject("Email Vrification Link");
            msg.setText(text);
            Transport.send(msg);
        }catch(MessagingException e){
            e.printStackTrace();
        }
    }
}
