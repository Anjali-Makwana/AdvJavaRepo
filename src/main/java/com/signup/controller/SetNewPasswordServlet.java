package com.signup.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.signup.dao.UserDao;
import com.signup.model.User;

@WebServlet("/SetNewPasswordServlet")
public class SetNewPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();  
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword == null || confirmPassword == null || !newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match or are empty.");
            request.getRequestDispatcher("set_new_password.jsp").forward(request, response);
            return;
        }

        try {
            User user = userDao.getUserByEmail(email);

            if (user != null) {
                userDao.updatePassword(user.getEmail(), newPassword);
                request.setAttribute("errorMessage", "Password has been updated successfully. Please login with your new password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "User not found.");
                request.getRequestDispatcher("set_new_password.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the password.");
            request.getRequestDispatcher("set_new_password.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
    }
    
   
}