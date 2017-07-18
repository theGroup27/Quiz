package question;

import database.DBConnection;
import staticstuff.SessionEssentials;
import staticstuff.StaticDAO;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
        SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");
        double maxScore = sE.getMaxScore();

        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        List<Integer> answers = db.getQuizDao().getAnswerIds(questionID);
        double thisScore = 0;

        if (type.equals("text_response")) {
            maxScore++;
            String answer = request.getParameter(type+":answer0");
            for (Integer ansID : answers) {
                BasicAnswer ans = (BasicAnswer) StaticDAO.getObjectByID(ansID,"answers");
                if (answer.length()!=0 && ans.getAnswer().equals(answer)) {
                    thisScore ++;
                }
            }
        }
        if (type.equals("multiple_answer")) {
            for (int i =0; i<answers.size(); i++) {
                BasicAnswer ans = (BasicAnswer)StaticDAO.getObjectByID(answers.get(i),"answers");
                String answer = request.getParameter(type+":answer"+i);
                if (answer.length()!=0 && ans.getAnswer().equals(answer))
                    thisScore ++;
                maxScore++;
            }
        }
        if (type.equals("multiple_choice")) {
            double eachScore = 1;
            maxScore++;
            for (int i =0; i<answers.size(); i++) {
                String check = request.getParameter(type + ":checkbox" + i);
                BasicAnswer answer = (BasicAnswer) StaticDAO.getObjectByID(answers.get(i), "answers");
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
        sE.setMaxScore(maxScore);
        sE.setCurrentScore(thisScore);

        List<Integer> questIDs = db.getQuizDao().getQuestionIdsByQuiz(sE.getCurrentQuiz());
        if (questIDs.indexOf(questionID)!=questIDs.size()-1) {
            questionID=questIDs.get(questIDs.indexOf(questionID)+1);
            rd = request.getRequestDispatcher("TakeQuestion.jsp?queID="+questionID);
        } else {
            //adds scores to database
            Date date = new Date();
            long elapsed = sE.getElapsedTime(date);
            sE.resetTime();
            double score = sE.getOverallScore()/sE.getMaxScore();
            score = 100*score;
            db.getQuizDao().addScores(score,elapsed,sE.getCurrentQuiz(),sE.getCurrentUser());

            rd = request.getRequestDispatcher("temp.jsp?id="+StaticDAO.getLastID("quiz_scores"));
        }
        rd.forward(request,response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

    }
}
