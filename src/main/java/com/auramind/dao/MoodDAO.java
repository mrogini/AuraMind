package com.auramind.dao;

import com.auramind.model.Mood;
import com.auramind.util.DBConnection;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.HashMap;

public class MoodDAO {

    public boolean saveMood(Mood mood) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "INSERT INTO daily_moods(user_id,mood,mood_score,entry_date) VALUES(?,?,?,CURDATE())";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, mood.getUserId());
            ps.setString(2, mood.getMood());
            ps.setInt(3, mood.getMoodScore());

            status = ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public String getTodayMood(int userId) {

    String mood = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
"SELECT mood FROM daily_moods WHERE user_id=? AND entry_date=CURDATE() ORDER BY mood_id DESC LIMIT 1";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            mood = rs.getString("mood");
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return mood;
}
public java.util.List<Mood> getMoodHistory(int userId) {

    java.util.List<Mood> list =
            new java.util.ArrayList<>();

    try {

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT * FROM daily_moods WHERE user_id=? ORDER BY entry_date DESC";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()) {

            Mood mood = new Mood();

            mood.setMoodId(
                    rs.getInt("mood_id"));

            mood.setUserId(
                    rs.getInt("user_id"));

            mood.setMood(
                    rs.getString("mood"));

            mood.setMoodScore(
                    rs.getInt("mood_score"));

            mood.setEntryDate(
                    rs.getString("entry_date"));

            list.add(mood);
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return list;
}
public java.util.Map<String,Integer> getMoodStatistics(int userId){

    java.util.Map<String,Integer> map =
            new java.util.HashMap<>();

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT mood,COUNT(*) total FROM daily_moods WHERE user_id=? GROUP BY mood";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1,userId);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()){

            map.put(
                    rs.getString("mood"),
                    rs.getInt("total")
            );
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return map;
}
public int getTotalMoodEntries(int userId){

    int total = 0;

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT COUNT(*) total FROM daily_moods WHERE user_id=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1,userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){

            total =
                    rs.getInt("total");
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return total;
}
public double getAverageMoodScore(int userId){

    double avg = 0;

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT AVG(mood_score) avg_score FROM daily_moods WHERE user_id=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1,userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){

            avg =
                    rs.getDouble("avg_score");
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return avg;
}
public String getMostFrequentMood(int userId){

    String mood = "N/A";

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT mood,COUNT(*) total FROM daily_moods WHERE user_id=? GROUP BY mood ORDER BY total DESC LIMIT 1";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1,userId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()){

            mood =
                    rs.getString("mood");
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return mood;
}
public Map<String,Integer> getWeeklyMoodStats(int userId){

    Map<String,Integer> map =
            new LinkedHashMap<>();

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT DAYNAME(entry_date) day, AVG(mood_score) score " +
        "FROM daily_moods " +
        "WHERE user_id=? " +
        "AND entry_date >= DATE_SUB(CURDATE(), INTERVAL 6 DAY) " +
        "GROUP BY entry_date " +
        "ORDER BY entry_date";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1,userId);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()){

            map.put(
                    rs.getString("day"),
                    rs.getInt("score")
            );
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return map;
}
public Map<Integer,String> getMonthlyMoodCalendar(
        int userId,
        int month,
        int year){

    Map<Integer,String> map =
            new HashMap<>();

    try{

        Connection con =
                DBConnection.getConnection();

        String sql =
        "SELECT DAY(entry_date) day,mood " +
        "FROM daily_moods " +
        "WHERE user_id=? " +
        "AND MONTH(entry_date)=? " +
        "AND YEAR(entry_date)=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1,userId);
        ps.setInt(2,month);
        ps.setInt(3,year);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()){

            map.put(
                rs.getInt("day"),
                rs.getString("mood")
            );
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return map;
}
}