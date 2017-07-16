package usersystem;

import database.DBConnection;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by anophoo on 7/16/17.
 */
@WebServlet("/AddFriendServlet")
public class AddFriendServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

        String nameInput = request.getParameter("friendname");
        String username = request.getParameter("username");

        RequestDispatcher rd;
        UserManager usrMng = (UserManager)request.getSession().getAttribute("User Manager");
        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        User user1 = null;
        User user2 = null;
        try {
            user1 = db.getUserDao().getUserByUsername(nameInput);
            user2 = db.getUserDao().getUserByUsername(username);
            user1.addFriend(user2);
            user2.addFriend(user1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // ესენი შესაცვლელია
//        request.setAttribute("friendname", nameInput);
        rd = request.getRequestDispatcher("FriendPage.jsp");
        rd.forward(request, response);

// RequestDispatcher rogor gamoviyeno aq ar vici
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
    }
}
