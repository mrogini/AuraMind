package com.auramind.controller;

import java.io.IOException;

import com.auramind.dao.QuestionOptionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addOption")
public class OptionManagementServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int questionId =
                Integer.parseInt(
                        request.getParameter("questionId"));

        String optionText =
                request.getParameter("optionText");

        String personalityType =
                request.getParameter("personalityType");

        QuestionOptionDAO dao =
                new QuestionOptionDAO();

        boolean status =
                dao.addOption(
                        questionId,
                        optionText,
                        personalityType);

        if (status) {
            response.sendRedirect("option-management.jsp?success=1");
        } else {
            response.sendRedirect("option-management.jsp?error=1");
        }
    }
}