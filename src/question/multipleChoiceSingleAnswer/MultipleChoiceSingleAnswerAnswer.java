package question.multipleChoiceSingleAnswer;

import question.Answer;

import java.io.BufferedReader;
import java.io.Reader;
import java.util.Scanner;

/**
 * Created by luka on 23-Jun-17.
 */
//public class MultipleChoiceSingleAnswerAnswer implements Answer{
//    private String answerText;
//    private final transient boolean correct;
//
//    @Override
//    public String getAnswerText() {
//        return null;
//    }
//
//    @Override
//    public boolean equals(Object o) {
//        if (((MultipleChoiceSingleAnswerAnswer) o).getAnswerText().equals(this.getAnswerText())) {
//            if (this.isCorrect())
//                return true;
//        }
//        return false;
//    }
//
//    /**
//     * Assumes the passed answer text is in specific format:
//     * first char is either 1 or 0, for the answer being correct or incorrect.
//     * The rest of the string is the answer's text description.
//     * @param text
//     */
//    public MultipleChoiceSingleAnswerAnswer(String text){
//        correct = text.charAt(0) == '1' ? true : false;
//        answerText = text.substring(1);
//
//    }
//
//    public boolean isCorrect() {
//        return correct;
//    }
//}
