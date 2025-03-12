package com.helper;

import com.entity.User;

public class App {
    public static void main(String[] args) {
        // Create a User object with the recipient email
        User user = new User(null, "John Doe", "subhbarata2003@gmail.com", "1234567890", "userPassword", 
                             new java.sql.Date(System.currentTimeMillis()));

        // Create an instance of the email sender
        GEmailSender gEmailSender = new GEmailSender();

        // Retrieve the recipient email from the User entity
        String to = user.getEmail();
        // The sender email must match your authenticated Gmail account
        String from = "jyotijrs9404j@gmail.com";
        String subject = "Sending email using GMail";

        // Generate OTP and prepare the email text
        String otpMessage = OTP.generateOTP(5);
        String text = "Your OTP is: " + otpMessage;
        
        // Print the OTP to the console
        System.out.println("Generated OTP (console): " + otpMessage);

        // Automatically send the email and log the result
        boolean isSent = gEmailSender.sendEmail(to, from, subject, text);
        if (isSent) {
            System.out.println("Email is sent successfully");
        } else {
            System.out.println("There is a problem in sending email");
        }
    }
}
