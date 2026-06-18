package com.auramind.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.auramind.util.DBConnection;

public class QuestionOptionDAO {

    public boolean addOption(
            int questionId,
            String optionText,
            String personalityType) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO question_options(question_id, option_text, personality_type) VALUES(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, questionId);
            ps.setString(2, optionText);
            ps.setString(3, personalityType);

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}