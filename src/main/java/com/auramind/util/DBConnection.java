package com.auramind.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

   private static final String URL =
        "jdbc:mysql://reseau.proxy.rlwy.net:36727/auramind?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC";

private static final String USER = "root";

private static final String PASSWORD = "QhqjyCMIVsMhPiITfQYBHOHbVZnpvale";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}