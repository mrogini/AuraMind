package com.auramind.controller;

import com.auramind.dao.MoodDAO;
import com.auramind.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;

@WebServlet("/monthly-mood")
public class MonthlyMoodServlet extends HttpServlet {

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

        LocalDate now =
                LocalDate.now();

        MoodDAO dao =
                new MoodDAO();

        Map<Integer,String> moodMap =
                dao.getMonthlyMoodCalendar(
                        user.getId(),
                        now.getMonthValue(),
                        now.getYear());

        request.setAttribute(
                "moodMap",
                moodMap);

        request.getRequestDispatcher(
                "monthly-mood.jsp")
                .forward(request,response);
    }
}