package renamepls;
import java.sql.*;

/**
 * Created by mariam on 14/06/17.
 */
public class DBConnection {
    public static final String MYSQL_USERNAME = "root";
    public static final String MYSQL_PASSWORD = "";
    public static final String MYSQL_DATABASE_SERVER = "localhost";
    public static final String MYSQL_DATABASE_NAME = "";


    /* basic database connection code */
    //my assignment code
    public DBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection
                    ("jdbc:mysql://" + MYSQL_DATABASE_SERVER, MYSQL_USERNAME,  MYSQL_PASSWORD);

            Statement stmt = con.createStatement();
            stmt.executeQuery("USE " + MYSQL_DATABASE_NAME);

            //stuff

            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
