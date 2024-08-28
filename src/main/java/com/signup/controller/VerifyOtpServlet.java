package com.signup.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String enteredOtp = request.getParameter("otp");
        String generatedOtp = (String) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");

        if (generatedOtp != null && generatedOtp.equals(enteredOtp)) {
            response.sendRedirect("new_password.jsp");
        } else {
            request.setAttribute("message", "Invalid OTP. Please try again.");
            request.getRequestDispatcher("verify_otp.jsp").forward(request, response);
        }
    }
}
