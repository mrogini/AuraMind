package com.auramind.controller;

import com.auramind.dao.OptionDAO;
import com.auramind.dao.QuestionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/update-question")
public class UpdateQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int questionId =
                    Integer.parseInt(
                            request.getParameter("questionId"));

            String questionText =
                    request.getParameter("questionText");

            QuestionDAO questionDAO =
                    new QuestionDAO();

            OptionDAO optionDAO =
                    new OptionDAO();

            // Update Question
            boolean questionUpdated =
                    questionDAO.updateQuestion(
                            questionId,
                            questionText);

            // Update Options

            String[] optionIds =
                    request.getParameterValues("optionId");

            String[] optionTexts =
                    request.getParameterValues("optionText");

            String[] personalityTypes =
                    request.getParameterValues("personalityType");

            if(optionIds != null){

                for(int i = 0; i < optionIds.length; i++){

                    optionDAO.updateOption(

                            Integer.parseInt(optionIds[i]),

                            optionTexts[i],

                            personalityTypes[i]
                    );
                }
            }

            if(questionUpdated){

                response.setContentType("text/html");

                response.getWriter().println(
                        "<script>" +
                        "alert('Question Updated Successfully!');" +
                        "window.location='admin-dashboard';" +
                        "</script>"
                );

            }else{

                response.setContentType("text/html");

                response.getWriter().println(
                        "<script>" +
                        "alert('Update Failed!');" +
                        "history.back();" +
                        "</script>"
                );
            }

        } catch(Exception e){

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<script>" +
                    "alert('Something Went Wrong!');" +
                    "history.back();" +
                    "</script>"
            );
        }
    }
}