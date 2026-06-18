package com.auramind.util;

import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        try {

            Connection con = DBConnection.getConnection();

            if (con != null) {
                System.out.println("Database Connected Successfully!");
            } else {
                System.out.println("Connection Failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}