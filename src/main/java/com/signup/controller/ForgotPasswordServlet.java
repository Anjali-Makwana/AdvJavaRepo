package com.signup.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.signup.dao.UserDao;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String email = request.getParameter("email");

        if (!userDao.isEmailRegistered(email)) {
            request.setAttribute("message", "Email not registered!");
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        } else {
            String otp = generateOtp();

            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("email", email);

            try {
                sendOtpEmail(email, otp);
                request.setAttribute("message", "OTP has been sent to your email.");
                request.getRequestDispatcher("verify_otp.jsp").forward(request, response);
            } catch (MessagingException e) {
                e.printStackTrace();
                request.setAttribute("message", "Failed to send OTP. Please try again.");
                request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
            }
        }
    }

    private String generateOtp() {
        return String.valueOf((int)(Math.random() * 9000) + 1000);
    }
    
    private void sendOtpEmail(String recipientEmail, String otp) throws MessagingException {
        // Sender's email credentials
        final String senderEmail = "makwanaanjali331@gmail.com";
        final String senderPassword = "123456";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); 

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail)); 
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail)); 
        message.setSubject("Your OTP Code"); // Email subject
        message.setText("Dear user,\n\nYour OTP code is: " + otp + "\n\nRegards,\nYour Company"); 

        Transport.send(message);
    }

    
}