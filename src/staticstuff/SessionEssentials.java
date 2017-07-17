package staticstuff;

/**
 * Created by mariam on 17/07/17.
 */
public class SessionEssentials {
    private int quizID = 0;
    private int userID = 0;
    private int currScore = 0;

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
    public void addToOverallScore(int score) {
        currScore = currScore+score;
    }
    public int getCurrentOveralScore() {
        return currScore;
    }
}
