package renamepls;

/**
 * Created by mariam on 14/06/17.
 */
public class UserManager {
    public boolean isPassowrd(String username, String password) {
        Password hashing = new Password();
        String passHash = hashing.getHashValue(password);
        if (passHash.equals(userByUsername(username).getPassword()))
            return true;
        return false;
    }

    public User userByUsername(String username) {
        return null;
    }

    public boolean usernameExists(String username) {
        return false;
    }

    public boolean isAppropriateInput(String username, String password){
        return false;
    }
}
