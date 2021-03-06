package staticstuff;

import database.ConnectionPool;
import question.BasicAnswer;
import question.BasicQuestion;
import question.Quiz;
import question.Score;
import usersystem.User;

import java.sql.*;

/**
 * Created by mariam on 14/07/17.
 */
public class StaticDAO {

    private static Connection con;

    public StaticDAO(Connection con) {
        this.con = con;
    }

    public synchronized static int getLastID(String table) {
        String qr = "select * from " + table + " order by id desc limit 1";
        try {
            PreparedStatement selectStmt = con.prepareStatement(qr);
            try {
                ResultSet rs = selectStmt.executeQuery();
                if (rs.next()) {
                    return rs.getInt("id");
                } else {
                    return 0;
                }
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    public static Object getObjectByID(int id, String table) {
        String qr = "select * from " + table + " as x where x.id = ?";
        try {
            PreparedStatement selectStmt = con.prepareStatement(qr);
            selectStmt.setInt(1,id);
            try {
                ResultSet rs = selectStmt.executeQuery();
                if (rs.next()) {
                    if (table.equals("quizzes"))
                        return getQuizFromRes(rs);
                    else if (table.equals("questions"))
                        return getQuestionFromRes(rs);
                    else if (table.equals("answers"))
                        return getAnswerFromRes(rs);
                    else if (table.equals("users"))
                        return getUserFromRes(rs);
                    else if (table.equals("quiz_scores"))
                        return getScoreFromRes(rs);
                } else {
                    return null;
                }
            } catch (SQLException ex){
                ex.printStackTrace();
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Score getScoreFromRes(ResultSet res) throws SQLException {
        int id = res.getInt("id");
        double score = res.getDouble("score");
        long elapsed = res.getLong("elapsed");
        int quiz = res.getInt("quiz_id");
        int user = res.getInt("user_id");

        Score sc = new Score(score,elapsed,quiz,user);
        sc.setID(id);

        return sc;
    }

    public static User getUserFromRes(ResultSet res) throws SQLException {
        int id = res.getInt("id");
        String name = res.getString("username");
        String password = res.getString("user_password");
        String salt = res.getString("salt");
        boolean isAdmin = res.getBoolean("is_admin");

        User user = new User(id,name,password,Hashing.hexToArray(salt));
        user.setID(id);
        user.setAdminStatus(isAdmin);

        return user;
    }

    public static Quiz getQuizFromRes(ResultSet res) throws SQLException {
        int id = res.getInt("id");
        String name = res.getString("quiz_name");
        String desc = res.getString("description");
        String cat = res.getString("category");
        boolean isRand = res.getBoolean("is_random");
        boolean isOne = res.getBoolean("is_one_page");
        boolean isCorr = res.getBoolean("is_correction");
        int creatorID = res.getInt("creator_id");
        Quiz quiz = new Quiz(name,desc,cat,isRand,isOne,isCorr);
        quiz.setID(id);

        return quiz;
    }

    public static BasicQuestion getQuestionFromRes(ResultSet res) throws SQLException {
        int id = res.getInt("id");
        String type = res.getString("q_type");
        String text = res.getString("q_text");
        BasicQuestion quest = new BasicQuestion(text,type);
        quest.setID(id);
        return quest;
    }

    public static BasicAnswer getAnswerFromRes(ResultSet res) throws SQLException {
        int id = res.getInt("id");
        String type = res.getString("a_type");
        String text = res.getString("answer");
        Boolean isCorrect = res.getBoolean("is_correct");
        BasicAnswer answer = new BasicAnswer(text, type, isCorrect);
        answer.setID(id);
        return answer;
    }
}
