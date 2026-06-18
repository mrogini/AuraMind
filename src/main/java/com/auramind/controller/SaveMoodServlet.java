package com.auramind.controller;

import com.auramind.dao.MoodDAO;
import com.auramind.model.Mood;
import com.auramind.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/saveMood")
public class SaveMoodServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
HttpSession session =
        request.getSession(false);

if(session == null){
    response.sendRedirect("login.jsp");
    return;
}

User user =
        (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

int userId =
        user.getId();

        String moodText =
                request.getParameter("mood");

        int score = 3;

        switch(moodText){

            case "Happy":
            case "Excited":
                score = 5;
                break;

            case "Calm":
                score = 4;
                break;

            case "Tired":
                score = 3;
                break;

            case "Anxious":
                score = 2;
                break;

            case "Sad":
            case "Angry":
                score = 1;
                break;
        }

        Mood mood = new Mood();

        mood.setUserId(userId);
        mood.setMood(moodText);
        mood.setMoodScore(score);

        MoodDAO dao = new MoodDAO();

        if(dao.saveMood(mood)){

            response.sendRedirect(
                    "dashboard.jsp?moodSaved=true");

        }else{

            response.getWriter()
                    .println("Mood Save Failed");
        }
    }
}