package com.auramind.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.auramind.util.DBConnection;

public class PersonalityTestDAO {

    public boolean saveAnswer(int userId,
                              int questionId,
                              int optionId,
                              String personalityType) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "INSERT INTO user_answers(user_id,question_id,option_id,personality_type) VALUES(?,?,?,?)";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, questionId);
            ps.setInt(3, optionId);
            ps.setString(4, personalityType);

            int row = ps.executeUpdate();

            if(row > 0){
                status = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
}