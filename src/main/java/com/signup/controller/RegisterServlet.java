package com.signup.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.signup.dao.UserDao;
import com.signup.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setAddress(address);
        user.setGender(gender);
        user.setPassword(password);

        if (userDao.isEmailRegistered(email)) {
            request.setAttribute("message", "Email already registered!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            userDao.saveUser(user);
            request.setAttribute("message", "Registration successful!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}