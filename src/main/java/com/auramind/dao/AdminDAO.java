package com.auramind.dao;

import com.auramind.model.Admin;
import com.auramind.model.User;
import com.auramind.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
public Admin login(String username, String password){

    Admin admin = null;

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT * FROM admin WHERE username=? AND password=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){

            admin = new Admin();

            admin.setId(
                    rs.getInt("id"));

            admin.setUsername(
                    rs.getString("username"));

            admin.setPassword(
                    rs.getString("password"));
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return admin;
}
    public int getTotalUsers(){

        int count = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM users";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public int getTotalQuestions(){

        int count = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM personality_questions";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public int getTotalMoodEntries(){

        int count = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM daily_moods";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public int getTotalPersonalityTests(){

        int count = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM personality_details";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public List<User> getAllUsers(){

        List<User> list =
                new ArrayList<>();

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM users ORDER BY id DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                User user =
                        new User();

                user.setId(
                        rs.getInt("id"));

                user.setName(
                        rs.getString("name"));

                user.setEmail(
                        rs.getString("email"));

                user.setAge(
                        rs.getInt("age"));

                user.setGender(
                        rs.getString("gender"));

                user.setPersonalityType(
                        rs.getString("personality_type"));

                list.add(user);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
    public List<String> getAllQuestions(){

    List<String> list =
            new ArrayList<>();

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT question_text FROM personality_questions";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()){

            list.add(
            rs.getString("question_text"));
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return list;
}
}