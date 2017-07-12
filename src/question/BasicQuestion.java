package question;

import java.util.*;

/**
 * Created by mariam on 11/07/17.
 */
public class BasicQuestion {
    private String quesText;
    private String type;
    private int id = 0;
    Map<Answer,Boolean> answers;


    public BasicQuestion(String quesText, String type) {
        this.quesText = quesText;
        if (type.equals("picture"))
            this.type = "picture";
        else if (type.equals("fill"))
            this.type = "fill_in";
        else this.type = "text_question";
    }
//    public void addAnswer(String answer, boolean isCorrect) {
//        //db.addAnswer(quest,quiz_id);
//    }

    public void setID(int id) {
        this.id = id;
    }

    public int getID() {
        return id;
    }

    public String getType() {
        return this.type;
    }

    public Boolean isCorrectAnswer (String[] answers) {
        return false;
    }

    public String getQuestion() {
        return this.quesText;
    }

}
