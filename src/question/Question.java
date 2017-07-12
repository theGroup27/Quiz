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
    void submitAnswer(String answer, boolean isCorrect);

    /**
     * Retruns the type ID of the question.
     * @return
     */
    String getType();



    List<Answer> getAnswers();

    String getQuestionText();
}
