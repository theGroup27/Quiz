package usersystem;

import database.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by anophoo on 7/16/17.
 */
@WebServlet("/SearchUserServlet")
public class SearchUserServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        // get user by name
        // check whether user exists or not
        // if exists, go to FriendPage.jsp
        // if not, go to some error page
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
    }
}
