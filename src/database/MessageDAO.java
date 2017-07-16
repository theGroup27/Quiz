package database;

import usersystem.Message;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by kdufla on 7/15/17.
 */
public class MessageDAO {

	private Connection con;

	public MessageDAO(Connection con) {
		this.con = con;
	}

	public List<Message> getLastMessages(int n){
		String table = "answers";
		String qr = "select * from " + table + " order by id desc limit ?";
		try {
			PreparedStatement selectStmt = con.prepareStatement(qr);
			selectStmt.setInt(1,n);
			try {
				ResultSet rs = selectStmt.executeQuery();
				return getMsgListFromRes(rs);
			} catch (SQLException ex){
				ex.printStackTrace();
			}
				con.close();
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return null;
	}

	private List<Message> getMsgListFromRes(ResultSet res) throws SQLException{
		List<Message> messages = new ArrayList<>();
		while (res.next()) {
			int id = res.getInt("id");
			int senderID = res.getInt("sender_id");
			int receiverID = res.getInt("receiver_id");
			String text = res.getString("message");
			Timestamp timestamp = res.getTimestamp("created");
			Message msg = new Message(senderID,receiverID,text,timestamp);
			msg.setID(id);
			messages.add(msg);
		}
		return messages;
	}

	//TODO: other methods
}
