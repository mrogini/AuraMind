package com.auramind.dao;

import com.auramind.model.Question;
import com.auramind.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {

    public List<Question> getAllQuestions() {

        List<Question> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM personality_questions ORDER BY question_id";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Question q = new Question();

                q.setQuestionId(
                        rs.getInt("question_id"));

                q.setQuestionText(
                        rs.getString("question_text"));

                list.add(q);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean addQuestion(String questionText) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO personality_questions(question_text) VALUES(?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, questionText);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public Question getQuestionById(int questionId) {

    Question question = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
                "SELECT * FROM personality_questions WHERE question_id=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, questionId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            question = new Question();

            question.setQuestionId(
                    rs.getInt("question_id"));

            question.setQuestionText(
                    rs.getString("question_text"));
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return question;
}
public boolean updateQuestion(int questionId,
                              String questionText) {

    boolean status = false;

    try {

        Connection con =
                DBConnection.getConnection();

        String sql =
                "UPDATE personality_questions SET question_text=? WHERE question_id=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setString(1, questionText);
        ps.setInt(2, questionId);

        status = ps.executeUpdate() > 0;

    } catch(Exception e) {
        e.printStackTrace();
    }

    return status;
}
}