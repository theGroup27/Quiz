package usersystem;

import staticstuff.Hashing;

import java.util.*;

public class User {
    private byte[] salt;
    private int id = 0;
    private byte[] passBytes;
    private List<String> achList = new ArrayList<String>();
    private List<User> friendList = new ArrayList<User>();
    private boolean isAdmin;
    private String userName;
    private Password pass = new Password();

    public User(int id, String username, String passHash, byte[] salt) {
        this.id = id;
        this.userName = username;
        this.passBytes = Hashing.hexToArray(passHash);
        this.salt = salt;

        //update database
    }

    public boolean isPassword(String password) {
        Password pass = new Password();
        String passEntered = pass.getHashValue(password,getSalt());
        String passUser = getPasswordString();
        System.out.println(passEntered+ ",,,,,");
        if (passUser.equals(passEntered))
            return true;
        return false;
    }
    public String getPasswordString() {
        String hash = Hashing.hexToString(this.passBytes);
        return hash;
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getID() {
        return id;
    }

    public byte[] getPasswordBin() {
        return passBytes;
    }

    public String getUserName() {
        return userName;
    }


    public void addFriend(User contact) {

    }

    public void respondToFriendRequest() {
        // if receiver_id is in column, then check, what they want
        // if accept:
        // contacts insert (id, sender, receiver, true)
        // else:
        // delete this row
    }

    public List<User> getFriends() {
        return friendList;
    }

    public void setAdminStatus(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean getAdminStatus() {
        return isAdmin;
    }

    public byte[] getSalt() {
        return salt;
    }


}
