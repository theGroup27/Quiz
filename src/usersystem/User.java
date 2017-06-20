package usersystem;

import java.util.*;

public class User {
    private String id;
    private byte[] passBytes;
    private List<String> achList = new ArrayList<String>();
    private List<User> friendList = new ArrayList<User>();
    private boolean isAdmin;
    private String userName;
    private Password hashing = new Password();

    public User(String id, String username, String hash) {
        this.id = id;
        this.userName = username;
        //String hash = hashing.getHashValue(password);
        this.passBytes = hashing.hexToArray(hash);
        //update database
    }

    public String getPassword() {
        String hash = hashing.hexToString(this.passBytes);
        return hash;
    }

    public String getUserName() {
        return userName;
    }

    public void addAchievement(String achievement) {
        achList.add(achievement);
    }

    public List<String> getAchievements() {
        return achList;
    }

    public void addFriend(User contact) {
        friendList.add(contact);
    }

    public List<User> getFriends() {
        return friendList;
    }

    public void setAdmin() {
        isAdmin = true;
    }

    public boolean getAdminStatus() {
        return isAdmin;
    }


//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

    // User identifier can be changed
    public void sendFriendRequest(User contact) {
        // update database
    }

    public void respondToRequest(User contact) {
        // respond
    }
}
