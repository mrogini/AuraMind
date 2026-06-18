package com.auramind.controller;

import com.auramind.dao.MoodDAO;
import com.auramind.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Map;

@WebServlet("/weekly-mood")
public class WeeklyMoodServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
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

        MoodDAO dao = new MoodDAO();

        Map<String,Integer> weeklyData =
                dao.getWeeklyMoodStats(
                        user.getId());

        request.setAttribute(
                "weeklyData",
                weeklyData);

        request.getRequestDispatcher(
                "/weekly-mood.jsp")
                .forward(request,response);
    }
}