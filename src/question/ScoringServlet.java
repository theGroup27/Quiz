package question;

import database.DBConnection;
import staticstuff.SessionEssentials;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mariam on 16/07/17.
 */
@WebServlet("/ScoringServlet")
public class ScoringServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        String type = request.getParameter("answer_type");
        type = type.substring(0,type.length()-1);
        String id = request.getParameter("queID");
        id = id.substring(0, id.length()-1);
        int questionID = Integer.parseInt(id);
        String d = "";
        RequestDispatcher rd;

        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        //BasicQuestion quest = (BasicQuestion)db.getStaticDao().getObjectByID(questionID,"questions");
        List<Integer> answers = db.getQuizDao().getAnswerIds(questionID);
        double thisScore = 0;

        if (type.equals("text_response")) {
            String answer = request.getParameter(type+":answer0");
            for (Integer ansID : answers) {
                BasicAnswer ans = (BasicAnswer)db.getStaticDao().getObjectByID(ansID,"answers");
                if (answer.length()!=0 && ans.getAnswer().equals(answer)) {
                    thisScore ++;
                }
            }
        }
        if (type.equals("multiple_answer")) {
            for (int i =0; i<answers.size(); i++) {
                BasicAnswer ans = (BasicAnswer)db.getStaticDao().getObjectByID(answers.get(i),"answers");
                String answer = request.getParameter(type+":answer"+i);
                if (answer.length()!=0 && ans.getAnswer().equals(answer))
                    thisScore ++;

            }
                //if unordered
                    //compare first from answers to all from inputs
                    //if equals remove both
        }
        if (type.equals("multiple_choice")) {
            double eachScore = 1;
            for (int i =0; i<answers.size(); i++) {
                String check = request.getParameter(type + ":checkbox" + i);
                BasicAnswer answer = (BasicAnswer) db.getStaticDao().getObjectByID(answers.get(i), "answers");
                if (check!=null) {
                    if (answer.isCorrectAnswer())
                    thisScore += eachScore;
                }
                else if (!answer.isCorrectAnswer()) {
                    thisScore += eachScore;
                }
            }
            thisScore = thisScore/(double)answers.size();
        }

        SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");
        int overall = sE.getCurrentScore();
        overall += thisScore;

        sE.addToOverallScore(overall);
        d = Double.toString(thisScore);

        //BasicAnswer ans = (BasicAnswer)db.getStaticDao().getObjectByID(answers.get(0),"answers");
//        rd = request.getRequestDispatcher("temp.jsp?id="+questionID);
//        rd.forward(request,response);
//        rd = request.getRequestDispatcher("temp.jsp?id="+request.getParameter(type+":answer0"));
//        rd.forward(request,response);
        rd = request.getRequestDispatcher("temp.jsp?id="+d);
        rd.forward(request,response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

    }
}
