package usersystem;

import database.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by luka on 16-Jul-17.
 */
@WebServlet("/MakeAdminServlet")
public class MakeAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserManager usrMng = (UserManager)request.getSession().getAttribute("User Manager");
        if (usrMng.getCurrentUser() != null && usrMng.getCurrentUser().getAdminStatus() == true) {
            if (request.getParameter("target-user") != null && usrMng.usernameExists(request.getParameter("target-user"))) {
                DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
                db.getUserDao().makeAdmin(request.getParameter("target-user"));
                response.getWriter().print("Successfully made " + request.getParameter("target-user") + " am admin.");
                return;
            }
        }
        response.getWriter().print("Unable to make the user an admin");
    }
}
