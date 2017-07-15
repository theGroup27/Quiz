package question;

import java.util.List;

/**
 * Created by mariam on 12/07/17.
 */
public class BasicAnswer {
    private String ansText;
    private String type;
    private int id = 0;
    private boolean isCorrect;

    public BasicAnswer(String ansText, String type, boolean isCorrect) {
        this.ansText = ansText;

        if (type.equals("multi-answer")||type.equals("multiple-choice")||type.equals("multiple")) {
            this.type = "multiple";
        } else this.type = "text_response";
        this.isCorrect = isCorrect;
    }

//    public List<String> getAnswer() {
//        return this.ans;
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

    public String getAnswer() {
        return this.ansText;
    }

    public Boolean isCorrectAnswer () {
        return isCorrect;
    }
}
