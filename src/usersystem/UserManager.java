package usersystem;

import database.DBConnection;

import java.sql.SQLException;

/**
 * Created by mariam on 14/06/17.
 */
public class UserManager {
    User curr;
    public UserManager() {}


    public void setCurrentUser(User curr) {
        this.curr = curr;
    }

    public User getCurrentUser() {
        return this.curr;
    }
    
    public boolean isPassword(User user, String password) {
        Password pass = new Password();
        String passEntered = pass.getHashValue(password,user.getSalt());
        String passUser = user.getPasswordString();
        System.out.println(passEntered+ ",,,,,");
        if (passUser.equals(passEntered))
            return true;
        return false;
    }


    public boolean usernameExists(String username) {
        DBConnection db = new DBConnection();
        try {
            if (db.getUserDao().getUserByUsername(username) != null)
                return true;
            else return false;
        } catch (SQLException e){
            return false;
        }
    }

    //has to be letter or digit
    public boolean isAppropriatePassword(String password){
        for (int i =0; i<password.length(); i++) {
            if (!Character.isLetterOrDigit(password.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    //contains letters digits or "_" and "."
    public boolean isAppropriateUsername(String username) {
        for (int i =0; i<username.length(); i++) {
            char c = username.charAt(i);
            if (!Character.isLetterOrDigit(c) && c!='_' && c!='.') {
                return false;
            }
        }
        return true;
    }
}
