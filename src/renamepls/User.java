package renamepls;

import java.security.*;

/**
 * Created by anophoo on 6/12/17.
 */
public class User {
    private String id;
    private byte[] passBytes;
    private String userName;
    private Password hashing = new Password();

    public User(String id, String userName, String password) {
        this.id = id;
        this.userName = userName;
        String hash = hashing.getHashValue(password);
        this.passBytes = hashing.hexToArray(hash);
        //update database
    }

    public String getPassword() {
        String hash = hashing.hexToString(this.passBytes);
        return hash;
    }

    public void addAchievement(String achievement) {
        // update
    }

    public String getUserName() {
        return userName;
    }

    // User identifier can be changed
    public void sendFriendRequest(String friendUserName) {
        // update database
    }

    public void respondToFriendRequest(String friendUserName) {
        // respond
    }
}
