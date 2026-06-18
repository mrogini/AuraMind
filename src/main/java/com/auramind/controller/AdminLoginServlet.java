package com.auramind.controller;

import com.auramind.dao.AdminDAO;
import com.auramind.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        AdminDAO dao =
                new AdminDAO();

        Admin admin =
                dao.login(username,password);

        if(admin != null){

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "admin",
                    admin);

           response.sendRedirect(
        "admin-dashboard");

        }else{

            response.sendRedirect(
                    "admin-login.jsp?error=1");
        }
    }
}