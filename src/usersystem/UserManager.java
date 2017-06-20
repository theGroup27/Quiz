package usersystem;

/**
 * Created by mariam on 14/06/17.
 */
public class UserManager {

    public UserManager() {}

    public boolean isPassowrd(User user, String password) {
        Password hashing = new Password();
        String passHash = hashing.getHashValue(password);
        String passUser = user.getPassword();
        if (passUser.equals(passHash))
            return true;
        return false;
    }


    public boolean usernameExists(String username) {
        return false;
    }

    public boolean isAppropriatePassword(String password){
        for (int i =0; i<password.length(); i++) {
            if (!Character.isLetterOrDigit(password.charAt(i))) {
                return false;
            }
        }
        return true;
    }

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
