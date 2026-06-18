package com.auramind.controller;

import com.auramind.dao.OptionDAO;
import com.auramind.dao.QuestionDAO;
import com.auramind.model.Question;
import com.auramind.model.QuestionOption;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/view-options")
public class ViewOptionsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int questionId =
                Integer.parseInt(
                        request.getParameter("questionId"));

        QuestionDAO questionDAO =
                new QuestionDAO();

        OptionDAO optionDAO =
                new OptionDAO();

        Question question =
                questionDAO.getQuestionById(questionId);

        List<QuestionOption> options =
                optionDAO.getOptionsByQuestionId(questionId);

        request.setAttribute("question", question);
        request.setAttribute("options", options);

        request.getRequestDispatcher("view-options.jsp")
               .forward(request, response);
    }
}