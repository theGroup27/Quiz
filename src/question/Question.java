package question;

import java.util.List;

/**
 * Created by luka on 23-Jun-17.
 */
public interface Question {

    /**
     * Processes an answer and return whether it is true or not.
     * Submitting a correct answer more than once should return false
     * on calls other than the first.
     * @param answer
     * @return
     */
    boolean submitAnswer(Answer answer);

    /**
     * Retruns the type ID of the question.
     * @return
     */
    int getTypeId();

    List<Answer> getAnswers();

    String getQuestionText();
}
