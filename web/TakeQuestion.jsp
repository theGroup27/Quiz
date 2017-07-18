<%@ page import="database.DBConnection" %>
<%@ page import="question.*" %>
<%@ page import="java.util.List" %>
<%@ page import="staticstuff.SessionEssentials" %>
<%@ page import="staticstuff.StaticDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 15/07/17
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title>Question</title>
    <!--code from https://www.w3schools.com-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $.get("Menu.jsp", function(data){
            $("#menu-placeholder").replaceWith(data);
        });
    </script>

    <style>
        body {
            background-color: #ECCEF5;
        }
        .well {
            background-color: #F2E0F7;
        }
    </style>

<% SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials"); %>
</head>
<body onLoad="defaultSettings()">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script language="javascript" type="text/javascript">

    $(document).ready(function(){
        var main = $(".scoring");
        var button = $(".show_score");
        $(button).click(function(e){
            e.preventDefault();
            $(main).append("<p>Score:"+ <%=Double.toString(sE.getOverallScore())%>+"</p>");
        });
    });
</script>

<div id="menu-placeholder"></div>
<form action = /ScoringServlet method="post">
    <input name="queID" type="hidden" value=<%=request.getParameter("queID") %>/>
<%
    int id = Integer.parseInt(request.getParameter("queID"));
    DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");

    int quizID = sE.getCurrentQuiz();
    Quiz quiz = (Quiz) StaticDAO.getObjectByID(quizID,"quizzes");
    List<Integer> questIDs = db.getQuizDao().getQuestionIdsByQuiz(quizID);
    BasicQuestion question = (BasicQuestion)StaticDAO.getObjectByID(id,"questions");
    String questionType = question.getType();
    String text = question.getQuestion();
    List<Integer> answers = db.getQuizDao().getAnswerIds(id);
%>
<div class="well">
<%-- checks question types and uses question text appropriately --%>
<%-- posts as text --%>
<% if (questionType.equals("text_question")) {%>
    <h3><%=text%></h3>
<%}%>
<%-- posts as picture --%>
<% if (questionType.equals("picture")) {%>
    <p><img src = "<%=text%>"></p>
<%}%>
<% if (questionType.equals("fill_in")) {%>
    <h3><%=text%></h3>
<%}%>

<%-- Does the same for answers --%>


<%
    BasicAnswer answer = (BasicAnswer)StaticDAO.getObjectByID(answers.get(0),"answers");%>
    <input name="answer_type" type="hidden" value=<%=answer.getType()%>/>
<%
    if (answer.getType().equals("text_response")) {
%>
<p><input type="text" name="text_response:answer0" placeholder="enter answer"></p>
<%  }
    if (answer.getType().equals("multiple_answer")) {
        for (int i = 0; i < answers.size(); i++) {
            String name = "multiple_answer:answer"+i;
%>
<p><input type="text" name="<%=name%>" placeholder="enter answer"></p>
<%      }
    }
    if (answer.getType().equals("multiple_choice")) {
        for (int i = 0; i < answers.size(); i++) {

            BasicAnswer ans = (BasicAnswer)StaticDAO.getObjectByID(answers.get(i),"answers");
            String answerText = ans.getAnswer();
            String name = "multiple_choice:checkbox"+i;
%>
<p><input type="checkbox" name=<%=name%>>
<%=answerText%>
</p>
<%      }
    }
%>
<p><input type="submit" name="Next" value ="Next"></p>
    <% if (quiz.isImmediateCorrection()) {
        Double score = sE.getOverallScore(); %>
    <p>Score So Far: <%=Double.toString(score)%></p>
    <%}%>
</form>

<%--<div class = "scoring">
    <button class = "show_score">Show Score So Far</button>
</div>--%>
    <%
        sE.setCurrentScore(0);
        if (questIDs.indexOf(id)==questIDs.size()-1) {%>
    <p><a href="homepage.jsp">finish</a></p>
    <%}%> <%--else {%>
    <p><a href="TakeQuestion.jsp?queID=<%=questIDs.get(questIDs.indexOf(id)+1)%>">next question</a></p>
    <%}%>
    </div>--%>

</body>
</html>
