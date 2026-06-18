package com.auramind.controller;

import com.auramind.dao.UserDAO;
import com.auramind.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Enumeration;

@WebServlet("/submit-test")
public class SubmitPersonalityTestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int introvert = 0;
        int extrovert = 0;
        int ambivert = 0;

        Enumeration<String> names =
                request.getParameterNames();

        while (names.hasMoreElements()) {

            String param = names.nextElement();

            if (param.startsWith("question_")) {

                String value =
                        request.getParameter(param);

                if ("Introvert".equals(value)) {
                    introvert++;
                }
                else if ("Extrovert".equals(value)) {
                    extrovert++;
                }
                else if ("Ambivert".equals(value)) {
                    ambivert++;
                }
            }
        }

        String personality;

        if (introvert >= extrovert &&
                introvert >= ambivert) {

            personality = "Introvert";

        } else if (extrovert >= introvert &&
                extrovert >= ambivert) {

            personality = "Extrovert";

        } else {

            personality = "Ambivert";
        }

        HttpSession session =
                request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        UserDAO dao = new UserDAO();

        if (userId != null) {

            dao.updatePersonalityType(
                    userId,
                    personality
            );
        }

        User user =
                (User) session.getAttribute("user");

        if (user != null) {

            user.setPersonalityType(
                    personality
            );

            session.setAttribute(
                    "user",
                    user
            );
        }

        session.setAttribute(
                "personalityType",
                personality
        );

        response.sendRedirect(
                "result.jsp"
        );
    }
}