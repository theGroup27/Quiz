package usersystem;

import staticstuff.Hashing;

import java.security.*;

/**
 * Created by mariam on 14/06/17.
 */
public class Password {

    public Password () {

    }
    /*
    My code
    Gets the hash value of given string using SHA algorithm
    */
    public String getHashValue(String password, byte[] salt) {

        MessageDigest sh;
        try {
            sh = MessageDigest.getInstance("SHA-256");
            byte[] pass = password.getBytes();
            byte[] both = attachTwoArrays(pass,salt);
            sh.update(both);
            byte[] hash = sh.digest();
            return Hashing.hexToString(hash);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }


    private byte[] attachTwoArrays(byte[] first, byte[] second) {
        byte[] both = new byte[first.length+second.length];
        System.arraycopy(first,0,both,0, first.length);
        System.arraycopy(second,0,both,first.length, second.length);
        return both;
    }

    public byte[] generateSalt() {
        //copied from oracle docs
        SecureRandom random = new SecureRandom();
        byte bytes[] = new byte[20];
        random.nextBytes(bytes);
        //
        return bytes;
    }


}