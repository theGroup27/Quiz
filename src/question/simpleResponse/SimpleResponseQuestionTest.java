package question.simpleResponse;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import question.Answer;

import java.util.ArrayList;

/**
 * Created by luka on 23-Jun-17.
 */
public class SimpleResponseQuestionTest {
    private SimpleResponseQuestion question;

    @BeforeEach
    public void beginning() {
        ArrayList<Answer> answers = new ArrayList<>();
        String questionText = "2 + 2 = ?";
        answers.add(new SimpleResponseAnswer("4"));
        question = new SimpleResponseQuestion(questionText, answers);
    }

    @Test
    public void test1() {
        assertTrue(question.submitAnswer(new SimpleResponseAnswer("4")) == true);
        assertTrue(question.submitAnswer(new SimpleResponseAnswer("4")) == false);
    }

    @Test
    public void test2() {
        assertEquals("2 + 2 = ?", question.getQuestionText());
        ArrayList<Answer> answers = new ArrayList<>();
        answers.add(new SimpleResponseAnswer("4"));
        assertEquals(answers, question.getAnswers());
    }
}
