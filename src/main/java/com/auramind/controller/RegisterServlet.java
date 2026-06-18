package com.auramind.controller;

import com.auramind.dao.UserDAO;
import com.auramind.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();

        user.setName(
                request.getParameter("name"));

        user.setEmail(
                request.getParameter("email"));

        user.setPassword(
                request.getParameter("password"));

        user.setAge(
                Integer.parseInt(
                        request.getParameter("age")));

        user.setGender(
                request.getParameter("gender"));

        UserDAO dao = new UserDAO();

        if (dao.registerUser(user)) {

response.setContentType("text/html");

response.getWriter().println(
    "<script>" +
    "alert('Registration Successful!');" +
    "window.location='login.jsp';" +
    "</script>"
);
        } else {

            response.getWriter()
                    .println("Registration Failed");

        }
    }
}