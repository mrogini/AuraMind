package com.auramind.dao;

import com.auramind.model.PersonalityDetail;
import com.auramind.util.DBConnection;

import java.sql.*;

public class PersonalityDetailDAO {

    public PersonalityDetail getDetails(String type){

        PersonalityDetail detail = null;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "SELECT * FROM personality_details WHERE personality_type=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1,type);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                detail =
                        new PersonalityDetail();

                detail.setPersonalityType(
                        rs.getString("personality_type"));

                detail.setDescription(
                        rs.getString("description"));

                detail.setStrengths(
                        rs.getString("strengths"));

                detail.setRecommendations(
                        rs.getString("recommendations"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return detail;
    }
}