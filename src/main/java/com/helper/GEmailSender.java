package com.helper;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class GEmailSender {
    public boolean sendEmail(String to, String from, String subject, String text) {
        boolean flag = false;

        // SMTP properties for Gmail
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        // Use your Gmail credentials 
        final String username = "jyotijrs9404j@gmail.com";
        final String password = "ljfg hknt bsow vcju";

        // Create a session with an authenticator
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Compose the message
            Message message = new MimeMessage(session);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setFrom(new InternetAddress(from));
            message.setSubject(subject);
            message.setText(text);

            // Send the message
            Transport.send(message);
            flag = true;
        } catch (Exception e) {
            // Log the exception (this error is generated automatically by the mail server)
            System.err.println("Error sending email: " + e.getMessage());
            e.printStackTrace();
        }
        return flag;
    }
}








//ljfg hknt bsow vcju
