package database;

import question.*;
import staticstuff.Hashing;
import staticstuff.StaticDAO;
import usersystem.*;

import javax.xml.bind.annotation.adapters.HexBinaryAdapter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jiiok on 6/16/2017.
 */
public class DBConnection {

    private String server = MyDBInfo.MYSQL_DATABASE_SERVER;
    private String username = MyDBInfo.MYSQL_USERNAME;
    private String password = MyDBInfo.MYSQL_PASSWORD;
    private String database = MyDBInfo.MYSQL_DATABASE_NAME;

    private Connection con;

    private ResultSet rs;

    private Statement statement;
    UserDAO userDao;
    QuizDAO quizDao;
    StaticDAO staticDao;
    MessageDAO msgDao;


    public DBConnection() {
        ConnectionPool pool = new ConnectionPool(1, 10);
        try {
            Connection con = pool.get();
            userDao = new UserDAO(con);
            quizDao = new QuizDAO(con);
            staticDao = new StaticDAO(con);
            msgDao = new MessageDAO(con);
        } catch (InterruptedException e){
            e.printStackTrace();
        }
    }

    public UserDAO getUserDao() {
        return userDao;
    }

    public MessageDAO getMsgDao() {
        return msgDao;
    }

    public QuizDAO getQuizDao() {
        return quizDao;
    }

    public StaticDAO getStaticDao() {
        return staticDao;
    }


}

