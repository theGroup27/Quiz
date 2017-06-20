package database;

import usersystem.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jiiok on 6/16/2017.
 */
public class DBConnection {

    //returns list of all users from database
    private List<User> getAllUsers(){
        List<User> res = new ArrayList<User>();

        connection conn = new connection();

        conn.call();
        conn.sendStatement("Select * from users");

        while(conn.isNext())
            res.add(new User(conn.getString(1), conn.getString(2), conn.getString(3)));

        return res;
    }

    /*
    inner class to connect to mysql, send statements and to keep track of result set
     */
    class connection{
        private String server = MyDBInfo.MYSQL_DATABASE_SERVER;
        private String username = MyDBInfo.MYSQL_USERNAME;
        private String password = MyDBInfo.MYSQL_PASSWORD;
        private String database = MyDBInfo.MYSQL_DATABASE_NAME;

        private Connection con;

        private ResultSet rs;

        private Statement statement;

        public void call() {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://" + server, username, password);

                Statement stmt = (Statement) con.createStatement();
                stmt.executeQuery("USE " + database);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        public void sendStatement(String statementString) {
            try {
                statement = (Statement) con.createStatement();
                rs = statement.executeQuery(statementString);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public boolean isNext() {
            boolean isThereNext = false;
            try {
                isThereNext = rs.next();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return isThereNext;
        }

        public String getString(int index) {
            String res = null;

            try {
                res = rs.getString(index);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return res;
        }

        public void close() {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
