package database;

import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;

import javax.sql.PooledConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/**
 * Created by kdufla on 7/12/17.
 */
public class ConnectionPool {

	private BlockingQueue<Connection> pool; // thread safe connection pool
	private int initialSize; // initial size of pool
	private int currentSize; // current size of pool
	private int maxSize; // maximal size of pool

	public ConnectionPool(int initialSize, int maxSize){

		if(initialSize<1||maxSize<1||maxSize<initialSize)
			throw new IllegalArgumentException();

		pool= new ArrayBlockingQueue <Connection>(maxSize);
		this.initialSize=initialSize;
		this.maxSize=maxSize;


		initConnections();
	}

	// put first initialSize connections in pool
	private void initConnections(){
		for(int i = 0; i < initialSize; i++){
			pool.offer(ConnectionMaker.getConnection(this));
		}
		this.currentSize=initialSize;
	}

	// get connection from pool
	// if there are no connections create one
	// and if there is no place to create than wait
	public synchronized Connection get() throws InterruptedException{
		if (pool.peek()==null && currentSize<maxSize) {
			pool.offer(ConnectionMaker.getConnection(this));
		}

		return pool.take();
	}

	// add unused connection back to pool
	public boolean setConnectionFree(Connection c){
		return pool.offer(c);
	}

	// close all connections in pool
	public synchronized void cleanPool() throws InterruptedException{
		for(int i = 0; i < currentSize; i++){
			ConnectionMaker.closeConnection((ConnectionForPool)pool.take());
		}
	}
}
