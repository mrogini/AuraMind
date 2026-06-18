package com.auramind.dao;

import java.sql.*;
import java.util.*;
import com.auramind.util.DBConnection;
import com.auramind.model.QuestionOption;

public class OptionDAO {

    public List<QuestionOption> getOptionsByQuestionId(int questionId) {

        List<QuestionOption> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM question_options WHERE question_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, questionId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                QuestionOption option =
                        new QuestionOption();

                option.setOptionId(rs.getInt("option_id"));
                option.setQuestionId(rs.getInt("question_id"));
                option.setOptionText(rs.getString("option_text"));
                option.setPersonalityType(
                        rs.getString("personality_type"));

                list.add(option);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public boolean updateOption(int optionId,
                            String optionText,
                            String personalityType){

    boolean status = false;

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "UPDATE question_options SET option_text=?, personality_type=? WHERE option_id=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setString(1, optionText);
        ps.setString(2, personalityType);
        ps.setInt(3, optionId);

        status = ps.executeUpdate() > 0;

    }catch(Exception e){
        e.printStackTrace();
    }

    return status;
}
}