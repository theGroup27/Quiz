package renamepls;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by mariam on 20/06/17.
 */
@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserManager usrMng = new UserManager();
        String nameInput = request.getParameter("username");
        String passInput = request.getParameter("password");
        RequestDispatcher rd;
        if (usrMng.isAppropriatePassword(passInput) && usrMng.isAppropriateUsername(nameInput)) {
            if(!usrMng.usernameExists(nameInput)) {
                rd = request.getRequestDispatcher("Index.jsp");
            } else {
                rd = request.getRequestDispatcher("Error.jsp");
            }
        } else {
            rd = request.getRequestDispatcher("Error.jsp");
        }

        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
