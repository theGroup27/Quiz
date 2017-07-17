package question;

import database.DBConnection;

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
@WebServlet(name = "ScoringServlet")
public class ScoringServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        String type = request.getParameter("answer_type");
        int questionID = Integer.parseInt(request.getParameter("quID"));

        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        BasicQuestion quest = (BasicQuestion)db.getStaticDao().getObjectByID(questionID,"questions");
        List<Integer> answers = db.getQuizDao().getAnswerIds(questionID);

        if (type.equals("text_question")) {
            String answer = request.getParameter(type+":answer1");
            //if equals any - from answers (that are correct)
            //else - incorrect
        }
        if (type.equals("multiple_answer")) {
            List<String> inputs = new ArrayList<>();
            for (int i =0; i<answers.size(); i++) {
                String answer = request.getParameter(type+":answer1");
                inputs.add(answer);
            }
            //if list isn't empty
                //if ordered
                    //compare first of both lists, remove both
                //if unordered
                    //compare first from answers to all from inputs
                    //if equals remove both
        }
        if (type.equals("multiple_choice")) {
            List<Boolean> inputs = new ArrayList<>();
            for (int i =0; i<answers.size(); i++) {
                String check = request.getParameter(type+":checkbox"+i);
                inputs.add(!check.equals(null));
            }
            for (int i =0; i<answers.size(); i++) {
                BasicAnswer answer = (BasicAnswer)db.getStaticDao().getObjectByID(answers.get(i),"answers");
                if (inputs.get(i) && answer.isCorrectAnswer()) {
                    //+1 questionScore
                }
                if (!inputs.get(i) && !answer.isCorrectAnswer()) {
                    //+1 questionScore
                }
            }
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

    }
}
