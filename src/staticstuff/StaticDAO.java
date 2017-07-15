package staticstuff;

import database.ConnectionPool;

import java.sql.*;

/**
 * Created by mariam on 14/07/17.
 */
public class StaticDAO {

    private Connection con;

    public StaticDAO(Connection con) {
        this.con = con;
    }

    public synchronized int getLastID(String table) {
        String qr = "select * from " + table + " order by id desc limit 1";
        try {
            PreparedStatement selectStmt = con.prepareStatement(qr);
            try {
                ResultSet rs = selectStmt.executeQuery();
                if (rs.next()) {
                    return rs.getInt("id");
                } else {
                    return 0;
                }
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
