package usersystem;

/**
 * Created by kdufla on 7/15/17.
 */
public class UserMaker{

	public static User getUser(int id, String username, String passHash, byte[] salt){
		return new User(id,username,passHash,salt);
	}
}
