package com.auramind.controller;

import com.auramind.dao.OptionDAO;
import com.auramind.dao.QuestionDAO;
import com.auramind.model.Question;
import com.auramind.model.QuestionOption;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/personality-test")
public class LoadPersonalityTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        QuestionDAO qdao = new QuestionDAO();
        OptionDAO odao = new OptionDAO();

        List<Question> questions = qdao.getAllQuestions();

        for (Question q : questions) {

            List<QuestionOption> options =
                    odao.getOptionsByQuestionId(
                            q.getQuestionId());

            q.setOptions(options);
        }

        request.setAttribute("questions", questions);

        request.getRequestDispatcher("personality-test.jsp")
                .forward(request, response);
    }
}