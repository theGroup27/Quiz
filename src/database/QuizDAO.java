package database;

import question.*;

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

//    public Object getObjectByID(int id, String table) {
//        String qr = "select * from " + table + " as x where x.id = ?";
//        try {
//            PreparedStatement selectStmt = con.prepareStatement(qr);
//            selectStmt.setInt(1,id);
//            try {
//                ResultSet rs = selectStmt.executeQuery();
//                if (rs.next()) {
//                    if (table.equals("quizzes"))
//                        return getQuizFromRes(rs);
//                    else if (table.equals("questions"))
//                        return getQuestionFromRes(rs);
//                    else if (table.equals("answers"))
//                        return getAnswerFromRes(rs);
//                } else {
//                    return null;
//                }
//            } catch (SQLException ex){
//                ex.printStackTrace();
//            }
//            con.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//
//    private Quiz getQuizFromRes(ResultSet res) throws SQLException {
//        int id = res.getInt("id");
//        String name = res.getString("quiz_name");
//        String desc = res.getString("description");
//        String cat = res.getString("category");
//        boolean isRand = res.getBoolean("is_random");
//        boolean isOne = res.getBoolean("is_one_page");
//        boolean isCorr = res.getBoolean("is_correction");
//        int creatorID = res.getInt("creator_id");
//        Quiz quiz = new Quiz(name,desc,cat,isRand,isOne,isCorr);
//        quiz.setID(id);
//
//        return quiz;
//    }
//
//    private BasicQuestion getQuestionFromRes(ResultSet res) throws SQLException {
//        int id = res.getInt("id");
//        String type = res.getString("q_type");
//        String text = res.getString("q_text");
//        BasicQuestion quest = new BasicQuestion(text,type);
//        quest.setID(id);
//        return quest;
//    }
//
//    private BasicAnswer getAnswerFromRes(ResultSet res) throws SQLException {
//        int id = res.getInt("id");
//        String type = res.getString("a_type");
//        String text = res.getString("answer");
//        Boolean isCorrect = res.getBoolean("is_correct");
//        BasicAnswer answer = new BasicAnswer(text, type, isCorrect);
//        answer.setID(id);
//        return answer;
//    }


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

//    public List<Integer> getParentIDs(int parentID, String table) {
//        String parentCol = "";
//        //get parentRow instead
//        if (table.equals("quizzes"))
//            parentCol = "quiz_id";
//        else if (table.equals("question_id"))
//            parentCol = "quiz_id";
//        String qr = "select * from " + table + " as x where x."+ parentCol +" = ?";
//        try {
//            PreparedStatement selectStmt = con.prepareStatement(qr);
//            selectStmt.setInt(1,parentID);
//            try {
//                ResultSet rs = selectStmt.executeQuery();
//                if (rs.next()) {
//                    return getChildIDs(rs);
//                } else {
//                    return null;
//                }
//            } catch (SQLException ex){
//                ex.printStackTrace();
//            }
//            con.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

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
}
