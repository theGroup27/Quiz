package staticstuff;

import java.sql.Time;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * Created by mariam on 17/07/17.
 */
public class SessionEssentials {
    private int quizID = 0;
    private int userID = 0;
    private double currScore = 0;
    private double ovScore = 0;
    private long initial;
    private double max;

    public void setCurrentUser(int id) {
        userID = id;
    }
    public int getCurrentUser() {
        return userID;
    }
    public void setCurrentQuiz(int id) {
        quizID = id;
    }
    public int getCurrentQuiz() {
        return quizID;
    }
    public void setCurrentScore(double score) {
        currScore = score;
        ovScore += score;
    }
    public double getCurrentScore() {
        return currScore;
    }
    public double getOverallScore() {
        return ovScore;
    }
    public void resetOverallScore() {
        ovScore = 0;
    }
    public double getMaxScore() {
        return max;
    }
    public void setMaxScore(double score) {
        max = score;
    }
    public void resetTime() {
        initial = 0;
    }
    public void setBeginning(Date time) {
       initial = time.getTime();
    }
    public long getElapsedTime(Date time) {
        long elapsed = time.getTime() - initial;
        return TimeUnit.MILLISECONDS.toSeconds(elapsed);
    }
}
