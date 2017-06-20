package usersystem;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * Created by mariam on 17/06/17.
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        UserManager usrMng = new UserManager();
        String nameInput = request.getParameter("username");
        String passInput = request.getParameter("password");
        User user = null;
        RequestDispatcher rd;
        String table = "Users";
        String[] values = {"username"};
        //DB.getByColumn(table,values);
        /*
            String str = "select ";
            for (int i=0; i<values.length; i++) {
                str += "x." + values[i]
            }
            str += " from " + table + " as x;"
            PreparedStatement columnStatement = con.prepareStatement(str);
            ResultSet rs = columnStatement .executeQuery();
         */
        if (usrMng.isAppropriatePassword(passInput) && usrMng.isAppropriateUsername(nameInput)) {
            if (usrMng.usernameExists(nameInput)
                    && usrMng.isPassowrd(user,passInput)) {
                rd = request.getRequestDispatcher("Index.jsp");
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
