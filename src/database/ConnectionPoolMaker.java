package database;

/**
 * Created by kdufla on 7/15/17.
 */
public class ConnectionPoolMaker{
	public static ConnectionPool getConnetionPool(int initialSize, int maxSize){
		return new ConnectionPool(initialSize,maxSize);
	}

}
