package usersystem;

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
@WebServlet("/RegisterServlet")
public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        UserManager usrMng = new UserManager();
        String nameInput = request.getParameter("username");
        String passInput = request.getParameter("password");
        String passVerify = request.getParameter("verify");
        RequestDispatcher rd;
        if (passInput.equals(passVerify)) {
            if (usrMng.isAppropriatePassword(passInput) && usrMng.isAppropriateUsername(nameInput)) {
                rd = request.getRequestDispatcher("UserTemp.jsp?id="+nameInput);
                if(!usrMng.usernameExists(nameInput)) {
                    //add to database
                    //rd = request.getRequestDispatcher("UserTemp.jsp/id="+nameInput);
                } else {
                    rd = request.getRequestDispatcher("Error.jsp");
                }
            } else {
                rd = request.getRequestDispatcher("InappropriateInput.jsp");
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
