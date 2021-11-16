/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

import java.util.Base64;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

     public boolean sendmail(String recepient, String MessageHTML) throws MessagingException {
         
        System.out.println("Mail Preparation Start..... ");
        Properties p = new Properties();
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        p.put("mail.smtp.port", "587");
        String myAccountEmail = "cjkn12345678@gmail.com";
        String password = "cjkndemo123";
        Session session = Session.getInstance(p, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(myAccountEmail));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
        message.setSubject("Health pinpoint");
        String q = MessageHTML;
        message.setContent(q, "text/html");
        Transport.send(message);
        System.out.println("Mail Send Successfully ! ");
        return  true;

    }

    public static void main(String[] args) throws MessagingException {
        String q = "<table width = 100% bgcolor= 'white' style='color:blue;'>"
                + "<tr><td><h2><center> <img width='100px' src='https://drive.google.com/uc?id=1rFCfRsOu0_fk1TrMmHMftbTFH0HAFUVN'></center> <h2><td><tr>"
                + "<tr><td><h2><center > Health pinpoint</center> <h2><td><tr>"
                + "<tr><td><center> Welcome </center> <td><tr>"
                + "<tr><td><h4><center> Your OTP is </center> <h4><td><tr></div>";
        new SendMail().sendmail("jayantprajapat1130@gmail.com", q);

    }

}
