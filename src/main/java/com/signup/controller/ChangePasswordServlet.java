package com.signup.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.signup.dao.UserDao;
import com.signup.model.User;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!userDao.validateUser(user.getEmail(), oldPassword)) {
            request.setAttribute("message", "Old password is incorrect!");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
        } else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("message", "New passwords do not match!");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
        } else {
            userDao.updatePassword(user.getEmail(), newPassword);
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}