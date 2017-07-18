package question;

/**
 * Created by mariam on 18/07/17.
 */
public class Score {
    private int id = 0;
    private double score;
    private long elapsed;
    private int quiz;
    private int user;
    public Score(double score, long elapsed, int quiz, int user) {
        this.score = score;
        this.elapsed = elapsed;
        this.quiz = quiz;
        this.user = user;
    }

    public double getScore() {
        return this.score;
    }

    public long getElapsed() {
        return this.elapsed;
    }

    public int quizID() {
        return quiz;
    }

    public int userID() {
        return user;
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getID() {
        return id;
    }
}
