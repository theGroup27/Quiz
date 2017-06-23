package question.multipleChoiceSingleAnswer;

import question.Answer;
import question.Question;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by luka on 23-Jun-17.
 */
public class MultipleChoiceSingleAnswerQuestion implements Question {

    private final String question;

    private transient ArrayList<String> correctAnswers;
    @Override
    public boolean submitAnswer(Answer answer) {
        return false;
    }

    @Override
    public int getTypeId() {
        return 0;
    }

    @Override
    public List<Answer> getAnswers() {
        return null;
    }

    @Override
    public String getQuestionText() {
        return null;
    }

    public MultipleChoiceSingleAnswerQuestion(String question, ArrayList<Answer> answers) {
        this.question = question;
    }
}
