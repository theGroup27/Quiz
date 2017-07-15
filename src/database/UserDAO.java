package database;

import staticstuff.Hashing;
import usersystem.Password;
import usersystem.User;

import javax.sql.*;
import java.sql.*;
import java.sql.SQLException;

/**
 * Created by mariam on 03/07/17.
 */
public class UserDAO {

    private final String table ="users";
    private Connection con;

    public UserDAO(Connection con) {
        this.con = con;
    }

    public User getUserByUsername(String username) throws SQLException{
        String table ="users";
        String qr = "select * from " + table + " as x where x.username = ?";
            try {
                PreparedStatement selectStmt = con.prepareStatement(qr);
                selectStmt.setString(1,username);
                try {
                    ResultSet rs = selectStmt.executeQuery();
                    if (rs.next()) {
                        return getUserFromRes(rs);
                    } else {
                        return null;
                    }
                } catch (SQLException ex){
                    ex.printStackTrace();
                }
                con.close();
            } catch (SQLException e) {
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
            PreparedStatement insertStmt = con.prepareStatement(qr);
            insertStmt.setString(1, name);
            insertStmt.setString(2, passHash);
            insertStmt.setString(3, Hashing.hexToString(salt));
            try {
                insertStmt.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
                e.printStackTrace();
            }
    }
}
