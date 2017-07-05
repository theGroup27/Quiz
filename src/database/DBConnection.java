package database;

import staticstuff.Hashing;
import usersystem.*;

import javax.xml.bind.annotation.adapters.HexBinaryAdapter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jiiok on 6/16/2017.
 */
public class DBConnection {

    //returns list of all users from database
//    private List<User> getAllUsers(){
//        List<User> res = new ArrayList<User>();
//
//        connection conn = new connection();
//
//        conn.call();
//        conn.sendStatement("Select * from users");
//
//        while(conn.isNext())
//            res.add(new User(Integer.parseInt(conn.getString(1)), conn.getString(2), conn.getString(3)));
//
//        return res;
//    }

//    /*
//    inner class to connect to mysql, send statements and to keep track of result set
//     */
//    class connection {
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
                Connection con = DriverManager.getConnection("jdbc:mysql://" + server, username, password);

                Statement stmt = (Statement) con.createStatement();
                stmt.executeQuery("USE " + database);
            } catch (SQLException | ClassNotFoundException e) {
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




    ///temp methods ##########################################

    public User getUserByUsername(String username) throws SQLException{
        String table ="users";
        String qr = "select * from " + table + " as x where x.username = ?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + server, this.username, password);

            Statement stmt = (Statement) con.createStatement();
            stmt.executeQuery("USE " + database);

            PreparedStatement selectStmt = con.prepareStatement(qr);

            try {
                selectStmt.setString(1,username);
                ResultSet rs = selectStmt.executeQuery();
                System.out.println(rs.toString());
                if (rs.next()) {
                    return getUserFromRes(rs);
                } else {
                    return null;
                }
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserFromRes(ResultSet res) throws SQLException {
        int id = res.getInt("id");
        String name = res.getString("username");
        String password = res.getString("user_password");
        String salt = res.getString("salt");

        User user = new User(id,name,password,Hashing.hexToArray(salt));
        return user;
    }


    public void addInputUsers(String name, String passHash, byte[] salt) {
        String qr = "insert into users (username, user_password, salt)" +
                    " values " + "(?,?,?);";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + server, username, password);

            Statement stmt = (Statement) con.createStatement();
            stmt.executeQuery("USE " + database);

            PreparedStatement insertStmt = con.prepareStatement(qr);
            insertStmt.setString(1,name);
            insertStmt.setString(2,passHash);
            insertStmt.setString(3,Hashing.hexToString(salt));
            try {

                //System.out.println(passBytes.length+"===============" + insertStmt.toString());

                insertStmt.executeUpdate();


            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //temp ######################################################



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
//    }
}
