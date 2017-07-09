package question;

import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

/**
 * Created by luka on 10-Jul-17.
 */
public class Quiz {
    private final String name;
    private final String description;
    private final boolean isRandom;
    private final boolean isOnePerPage;
    private final boolean isImmediateCorrection;
    private final boolean allowsPractice;
    private final Date creaationTime;
    private final ArrayList<Question> questions;
    private final Random rand;
    private int cur;

    public Quiz(String name, String description, boolean isRandom, boolean isOnePerPage,
                boolean immediateCorrection, boolean allowPractice, ArrayList<Question> questions, Date creationTime, Random rand) {
        this.name = name;
        this.description = description;
        this.isRandom = isRandom;
        this.isOnePerPage = isOnePerPage;
        this.isImmediateCorrection = immediateCorrection;
        this.allowsPractice = allowPractice;
        this.questions = questions;
        this.creaationTime = creationTime;
        this.rand = rand;
        this.cur = 0;
    }

    public void addQuestion(Question q) {
        if (isRandom) {
            int i = rand.nextInt(questions.size() + 1);
            questions.add(i, q);
        } else {
            questions.add(q);
        }
    }

    public void addToDatabase() {
     //TO-DO


        for (Question q : questions) {
            for (Answer a: q.getAnswers()) {
                String answerText = a.getAnswerText();
            }
        }
    }

    public Gson getNextQuestionData() {

        Question q = questions.get(cur);
        cur++;
        Gson gson = new Gson();
        gson.toJson(q);
        return gson;
    }


}
