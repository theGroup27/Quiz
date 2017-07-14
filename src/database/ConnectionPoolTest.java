package database;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Created by kdufla on 7/14/17.
 */
class ConnectionPoolTest{
	ConnectionPool p;
	ConnectionForPool c;
	@BeforeEach
	void setUp() throws InterruptedException{
		p=new ConnectionPool(5,10);
		c= (ConnectionForPool)p.get();
	}

	@Test
	void get() throws InterruptedException{
		c= (ConnectionForPool)p.get();
	}

	@Test
	void setConnectionFree(){
		p.setConnectionFree(c);
	}

	@Test
	void cleanPool() throws InterruptedException{
		p.setConnectionFree(c);
		p.cleanPool();
	}

}