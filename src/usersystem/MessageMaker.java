package usersystem;

import java.sql.Timestamp;

/**
 * Created by kdufla on 7/15/17.
 */
public class MessageMaker{
	public static Message getMessage(int senderId, int recieverId, String messageText, Timestamp timestamp){
		return new Message(senderId,recieverId,messageText,timestamp);
	}
}
