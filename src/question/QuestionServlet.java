package question;

import database.DBConnection;
import staticstuff.SessionEssentials;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by anophoo on 7/8/17.
 */
@WebServlet("/QuestionServlet")
public class QuestionServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

        String type = request.getParameter("QuestionType");
        String num = request.getParameter("numID");
        String quest = "";
        if (type.equals("fill")) {
            String quest1 = request.getParameter(type + ":question1");
            String quest2 = request.getParameter(type + ":question2");
                quest = quest1 + "____" + quest2;
        } else {
            quest = request.getParameter(type + ":question");
        }

        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");

        BasicQuestion question = new BasicQuestion(quest, type);
        List<String> answers = new ArrayList<>();
        SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");

        if (quest != "")
            db.getQuizDao().addQuestions(question,sE.getCurrentQuiz());
        //lock
        int id = db.getStaticDao().getLastID("questions");
        question.setID(id);
        //unlock
        int maxCount = 3;
        if (type.equals("multiple_answer")||type.equals("multiple_choice"))
            maxCount = 5;



        for (int i =1; i<=maxCount; i++) {
            String par = type+":answer"+i;
            String ans = request.getParameter(par);
            if (ans != "") {
                answers.add(ans);
                boolean bool = true;
                if (type.equals("multiple_choice")) {
                    String s = type+":checkbox"+i;
                    if (request.getParameter(s)!=null)
                        bool = true;
                    else bool = false;
                }
                BasicAnswer answer = new BasicAnswer(ans,type,bool);
                db.getQuizDao().addAnswers(answer, question.getID());
            }
        }

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
