package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by kdufla on 7/12/17.
 */
public class ConnectionMaker{

	private static String account = MyDBInfo.MYSQL_USERNAME;
	private static String password = MyDBInfo.MYSQL_PASSWORD;
	private static String server = MyDBInfo.MYSQL_DATABASE_SERVER;
	private static String database = MyDBInfo.MYSQL_DATABASE_NAME;

	public static Connection getConnection(ConnectionPool pool){
		Connection con = null;
		ConnectionForPool c = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + server+"?autoReconnect=true&useSSL=false", account, password);
			Statement stmt = con.createStatement();
			stmt.executeQuery("USE " + database);
		}catch(SQLException e){
			e.printStackTrace();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		c = new ConnectionForPool(con, pool);
		return c;
	}

	public static boolean closeConnection(ConnectionForPool connection){
		if(connection==null)
			return false;
		try{
			connection.realClose();
		}catch(SQLException e){
			return false;
		}
		return true;
	}

	public static Connection packConnectionForPool(Connection c, ConnectionPool p){
		ConnectionForPool con = new ConnectionForPool(c,p);
		return  con;
	}

}
