package question.simpleResponse;

import question.Answer;

/**
 * Created by luka on 23-Jun-17.
 */
public class SimpleResponseAnswer implements Answer {
    private final String answerText;

    @Override
    public String getAnswerText() {
        return answerText;
    }

    @Override
    public boolean equals(Object o) {
        if (((SimpleResponseAnswer)o).answerText.equals(this.answerText))
            return true;
        else
            return false;
    }

    public SimpleResponseAnswer(String answer) {
        this.answerText = answer;
    }
}
