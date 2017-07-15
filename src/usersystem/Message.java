package usersystem;

import java.sql.Timestamp;

/**
 * Created by kdufla on 7/15/17.
 */
public class Message{

	private int senderId;
	private int recieverId;
	private String messageText;
	private Timestamp timestamp;

	public Message(int senderId, int recieverId, String messageText, Timestamp timestamp){
		this.senderId=senderId;
		this.recieverId=recieverId;
		this.messageText=messageText;
		this.timestamp=timestamp;
	}

	public int getSenderId(){
		return senderId;
	}

	public int getRecieverId(){
		return recieverId;
	}

	public String getMessageText(){
		return messageText;
	}

	public Timestamp getTimestamp(){
		return timestamp;
	}
}
