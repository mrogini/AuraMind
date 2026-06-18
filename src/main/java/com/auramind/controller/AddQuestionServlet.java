package com.auramind.controller;

import java.io.IOException;

import com.auramind.dao.QuestionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String question =
                request.getParameter("question");

        QuestionDAO dao = new QuestionDAO();

        boolean result =
                dao.addQuestion(question);

        if(result){
           response.sendRedirect(
        "admin-dashboard");
        } else {
           response.sendRedirect(
        "admin-dashboard");
        }
    }
}