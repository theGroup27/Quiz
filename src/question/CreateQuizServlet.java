package question;

import database.DBConnection;
import usersystem.UserManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

/**
 * Created by mariam on 09/07/17.
 */
@WebServlet("/CreateQuizServlet")
public class CreateQuizServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        String name = request.getParameter("quiz-name");
        String desc = request.getParameter("quiz-description");
        String cat = "other";
        boolean random = request.getParameter("quiz-is-random") != null;
        boolean onePerPage = request.getParameter("one-per-page") != null;
        boolean immediateCorrection = request.getParameter("immediate-correction") != null;
        boolean allowPractice = request.getParameter("allow-practice-mode") != null;
        Date date = new Date();

        Quiz quiz = new Quiz(name, desc, cat, random, onePerPage, immediateCorrection, allowPractice);
        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        //current user connecting
        UserManager usrMng = (UserManager)request.getSession().getAttribute("User Manager");
        //
        int id = usrMng.getCurrentUser().getID();
        //to be edited
        db.getQuizDao().addQuiz(quiz,1);
        //lock
        quiz.setID(db.getStaticDao().getLastID("quizzes"));
        //unlock
        int count = 1;
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("Question.jsp?id="+count);
        rd.forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

    }
}
