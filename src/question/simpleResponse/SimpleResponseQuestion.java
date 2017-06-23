package question.simpleResponse;

import question.Answer;
import question.Question;

import java.util.List;
import java.util.ArrayList;

/**
 * Created by luka on 23-Jun-17.
 */
public class SimpleResponseQuestion implements Question {
    public static final transient int TYPE_ID = 1;

    private final String question;
    private transient ArrayList<Answer> answers;

    /**
     * Checks if the submitted answer matches any in the answers' list exactly.
     * This method will always return false after a correct answer is submitted.
     * @param answer
     * @return
     */
    @Override
    public boolean submitAnswer(Answer answer) {
        boolean result = false;
        if (answers.contains(answer)) {
            result = true;
            answers.clear();
        }
        return result;
    }

    @Override
    public int getTypeId() {
        return TYPE_ID;
    }

    @Override
    public List<Answer> getAnswers() {
        return answers;
    }

    @Override
    public String getQuestionText() {
        return question;
    }

    public SimpleResponseQuestion(String question, ArrayList<Answer> answers) {
        this.question = question;
        this.answers = answers;
    }
}