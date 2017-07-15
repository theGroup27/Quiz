package question;

//import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by luka on 10-Jul-17.
 */
public class Quiz {
    int id = 0;
    private String name;
    private String category;
    private String description;
    private boolean isRandom;
    private boolean isOnePerPage;
    private boolean isImmediateCorrection;
    private Date creationTime = new Date();
    private List<Question> questions;
    private Random rand = new Random();
    private int cur;

    public Quiz(String name, String description, String category, boolean isRandom, boolean isOnePerPage,
                boolean immediateCorrection) {
        this.name = name;
        this.description = description;
        this.category = category;
        this.isRandom = isRandom;
        this.isOnePerPage = isOnePerPage;
        this.isImmediateCorrection = immediateCorrection;
        //this.creationTime = creationTime;
        this.cur = 0;
    }

    public void addQuestion(Question q) {
//        if (isRandom) {
//            int i = rand.nextInt(questions.size() + 1);
//            questions.add(i, q);
//        } else {
            questions.add(q);
        //}
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getID() {
        return id;
    }

    //creator id

    public List <Question> getQuestions () {
        return this.questions;
    }

    public String getName() {
        return this.name;
    }

    public String getCategory() {
        return this.category;
    }

    public String getDescription() {
        return this.description;
    }

    public boolean isOnePerPage() {
        return this.isOnePerPage;
    }

    public boolean isImmediateCorrection() {
        return this.isImmediateCorrection;
    }

    public boolean isRandom() {
        return this.isRandom;
    }


//    public void addToDatabase() {
//     //TO-DO
//
//
//        for (Question q : questions) {
//            for (Answer a: q.getAnswers()) {
//                String answerText = a.getAnswerText();
//            }
//        }
//    }

/*    public Gson getNextQuestionData() {

        Question q = questions.get(cur);
        cur++;
        Gson gson = new Gson();
        gson.toJson(q);
        return gson;
    }*/
}
