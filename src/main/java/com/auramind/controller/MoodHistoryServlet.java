package com.auramind.controller;

import com.auramind.dao.MoodDAO;
import com.auramind.model.Mood;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/mood-history")
public class MoodHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        MoodDAO dao = new MoodDAO();

        List<Mood> moods =
                dao.getMoodHistory(userId);

        request.setAttribute(
                "moods",
                moods);

        request.getRequestDispatcher(
                "mood-history.jsp")
                .forward(request, response);
    }
}