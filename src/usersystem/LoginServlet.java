package usersystem;

import database.DBConnection;
import database.MyDBInfo;
import staticstuff.SessionEssentials;
//import database.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.*;

/**
 * Created by mariam on 17/06/17.
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

        String nameInput = request.getParameter("username");
        String passInput = request.getParameter("password");

        RequestDispatcher rd;

        UserManager usrMng = (UserManager)request.getSession().getAttribute("User Manager");
        SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");

        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        User user = null;
        try {
            user = db.getUserDao().getUserByUsername(nameInput);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (usrMng.isAppropriatePassword(passInput) && usrMng.isAppropriateUsername(nameInput)) {
            if (usrMng.usernameExists(nameInput) && user!=null
                    && usrMng.isPassword(user,passInput)) {
                sE.setCurrentUser(user.getID());
                //rd = request.getRequestDispatcher("UserTemp.jsp?id="+nameInput);
                //request.getSession().setAttribute(UserListener.sessionOwnerUser, user);
                rd = request.getRequestDispatcher("index.jsp");
            } else {
                rd = request.getRequestDispatcher("Error.jsp");
            }
        } else {
            rd = request.getRequestDispatcher("InappropriateInput.jsp");
        }
        rd.forward(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

    }
}
