package question;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.net.URL;

/**
 * Created by anophoo on 7/8/17.
 */
@WebServlet("/QuestionServlet")
public class QuestionServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

        String type = request.getParameter("Question Type");
        String num = request.getParameter("numID");
        num = num.substring(0,num.length()-1);
        RequestDispatcher rd;

        int count = Integer.parseInt(num);
        count ++;
        rd = request.getRequestDispatcher("Question.jsp?id="+count);
        rd.forward(request,response);



}
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

    }
}
