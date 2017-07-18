package database;

import question.*;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mariam on 14/07/17.
 */
public class QuizDAO {

    private Connection con;

    public QuizDAO(Connection con) {
        this.con = con;
    }

    public synchronized void addQuiz(Quiz quiz, int userID) {
        String qr = "insert into quizzes (quiz_name,description,category," +
                "is_random,is_one_page,is_correction,creator_id)" +
                " values " + "(?,?,?,?,?,?,?);";

        try {
            PreparedStatement insertStmt = con.prepareStatement(qr);

            insertStmt.setString(1,quiz.getName());
            insertStmt.setString(2,quiz.getDescription());
            insertStmt.setString(3,quiz.getCategory());
            insertStmt.setBoolean(4,quiz.isRandom());
            insertStmt.setBoolean(5,quiz.isOnePerPage());
            insertStmt.setBoolean(6,quiz.isImmediateCorrection());
            insertStmt.setInt(7,userID);
            try {
                insertStmt.executeUpdate();
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getQuizzes(String query) {
        try {
            PreparedStatement selectStmt = con.prepareStatement(query);
            try {
                ResultSet rs = selectStmt.executeQuery();
                return getChildIDs(rs);
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Integer> getQuestionIdsByQuiz (int quizID) {
        String table = "questions";
        String qr = "select * from " + table + " as x where x.quiz_id = ?";
        try {
            PreparedStatement selectStmt = con.prepareStatement(qr);
            selectStmt.setInt(1,quizID);
            try {
                ResultSet rs = selectStmt.executeQuery();
                    return getChildIDs(rs);
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Integer> getAnswerIds (int queID) {
        String table = "answers";
        String qr = "select * from " + table + " as x where x.question_id = ?";
        try {
            PreparedStatement selectStmt = con.prepareStatement(qr);
            selectStmt.setInt(1,queID);
            try {
                ResultSet rs = selectStmt.executeQuery();
                return getChildAnswerIDs(rs);
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    private List<Integer> getChildIDs(ResultSet res) throws SQLException {
        List<Integer> ids = new ArrayList<>();
        while(res.next()) {
            int id = res.getInt("id");
            ids.add(id);
        }
        return ids;
    }

    private List<Integer> getChildAnswerIDs(ResultSet res) throws SQLException {
        List<Integer> ids = new ArrayList<>();
        while(res.next()) {
            int id = res.getInt("id");
            ids.add(id);
        }
        return ids;
    }


    public synchronized void addQuestions(BasicQuestion quest, int quizID) {
        String qr = "insert into questions(q_type,q_text,quiz_id) values (?,?,?);";

        try {
            PreparedStatement insertStmt = con.prepareStatement(qr);

            insertStmt.setString(1,quest.getType());
            insertStmt.setString(2,quest.getQuestion());
            insertStmt.setInt(3,quizID);
            try {
                insertStmt.executeUpdate();
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void addAnswers(BasicAnswer answer, int questID) {
        String qr = "insert into answers(a_type, answer, is_correct, question_id) values " + "(?,?,?,?);";
        try {
            PreparedStatement insertStmt = con.prepareStatement(qr);

            insertStmt.setString(1,answer.getType());
            insertStmt.setString(2,answer.getAnswer());
            insertStmt.setBoolean(3,answer.isCorrectAnswer());
            insertStmt.setInt(4,questID);
            try {
                insertStmt.executeUpdate();
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addScores(double score,long elapsed, int quizID, int userID) {
        String qr = "insert into quiz_scores(score,elapsed,quiz_id,user_id) values (?,?,?,?);";

        try {
            PreparedStatement insertStmt = con.prepareStatement(qr);
            BigDecimal dec = new BigDecimal(score);
            insertStmt.setDouble(1,score);
            insertStmt.setLong(2, elapsed);
            insertStmt.setInt(3,quizID);
            insertStmt.setInt(4,userID);
            try {
                insertStmt.executeUpdate();
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
