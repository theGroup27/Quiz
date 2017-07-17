package database;

import staticstuff.Hashing;
import staticstuff.StaticDAO;
import usersystem.Password;
import usersystem.User;

import javax.sql.*;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    private User getUserFromRes(ResultSet res) throws SQLException {
        int id = res.getInt("id");
        String name = res.getString("username");
        String password = res.getString("user_password");
        String salt = res.getString("salt");

        User user = new User(id,name,password,Hashing.hexToArray(salt));
        return user;
    }

    public void addInputUsers(User usr) {
        String qr = "insert into users (username, user_password, salt)" +
                " values " + "(?,?,?);";
        try {
            PreparedStatement insertStmt = con.prepareStatement(qr);
            insertStmt.setString(1, usr.getUserName());
            insertStmt.setString(2, usr.getPasswordString());
            insertStmt.setString(3, Hashing.hexToString(usr.getSalt()));
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

    public void makeAdmin(String username) {
        String qr = "update users set is_admin = true where username = ?";
        try {
            PreparedStatement makeAdminStmt = con.prepareStatement(qr);
            makeAdminStmt.setString(1, username);
            makeAdminStmt.execute();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /* adds friend request sender and receiver users into contacts database */
    public void addContacts(int senderID, int receiverID) {
        String qr = "insert into contacts (sender_id, receiver_id, are_friends)" +
                " values " + "(?,?,?);";
        try {
            PreparedStatement insertStmt = con.prepareStatement(qr);
            insertStmt.setInt(1, senderID);
            insertStmt.setInt(2, receiverID);
            insertStmt.setBoolean(3, false );
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

    /* sets are_friends true if receiver accepts sender's request */
    public void makeFriends(int senderID, int receiverID) {
        String qr = "update contacts set are_friends = true where sender_id = ? and receiver_id";
        try {
            PreparedStatement friendshipStmt = con.prepareStatement(qr);
            friendshipStmt.setInt(1,senderID);
            friendshipStmt.setInt(2,receiverID);
            friendshipStmt.execute();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /* returns friends' ids of a specific user */
    public List<Integer> getFriendsIDs(int userID) {
        String qr = "select * from contacts as x where (x.sender_id = ? or x.receiver_id = ?) and are_friends = true";
        try {
            PreparedStatement selectStmt = con.prepareStatement(qr);
            selectStmt.setInt(1,userID);
            selectStmt.setInt(2,userID);
            try {
                ResultSet rs = selectStmt.executeQuery();
                return getFriendID(rs, userID);
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private List<Integer> getFriendID(ResultSet res, int userID) throws SQLException {
        List<Integer> ids = new ArrayList<>();
        while(res.next()) {
            int id = 0;
            if (res.getInt("receiver_id") == userID)
                id = res.getInt("sender_id");
            if (res.getInt("sender_id") == userID)
                id = res.getInt("receiver_id");
            ids.add(id);
        }
        return ids;
    }
}
