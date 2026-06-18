package com.auramind.controller;

import com.auramind.dao.AdminDAO;
import com.auramind.model.User;
import com.auramind.dao.QuestionDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null){
            response.sendRedirect("admin-login.jsp");
            return;
        }

        AdminDAO dao =
                new AdminDAO();

        int totalUsers =
                dao.getTotalUsers();

        int totalQuestions =
                dao.getTotalQuestions();

        int totalMoodEntries =
                dao.getTotalMoodEntries();

        int totalTests =
                dao.getTotalPersonalityTests();

        List<User> users =
                dao.getAllUsers();

        request.setAttribute(
                "totalUsers",
                totalUsers);

        request.setAttribute(
                "totalQuestions",
                totalQuestions);

        request.setAttribute(
                "totalMoodEntries",
                totalMoodEntries);

        request.setAttribute(
                "totalTests",
                totalTests);

        request.setAttribute(
                "users",
                users);
List<String> questions =
        dao.getAllQuestions();

request.setAttribute(
        "questions",
        questions);QuestionDAO qdao = new QuestionDAO();

request.setAttribute(
        "questionList",
        qdao.getAllQuestions()
);
        
        request.getRequestDispatcher(
                "admin-dashboard.jsp")
                .forward(request,response);
    }
}