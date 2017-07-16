<%@ page import="question.Quiz" %>
<%@ page import="database.DBConnection" %>
<%@ page import="question.BasicQuestion" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 12/07/17
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% int id = Integer.parseInt(request.getParameter("quizID"));
    %>
    <title>Take Quiz <%=id%></title>

    <style></style>

    <!--code from https://www.w3schools.com-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>


<body>
<input name="quizID" type="hidden" value=<%=request.getParameter("quizID") %>/>

<form>
    <%
        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        Quiz quiz = (Quiz) db.getQuizDao().getObjectByID(id,"quizzes");
        List<Integer> ids = db.getQuizDao().getQuestionIdsByQuiz(quiz.getID());
    %>
    <h2><%= quiz.getName() %></h2>
    <p><%= quiz.getDescription() %></p>
    <%--<%=id%>--%>
    <a href = "TakeQuestion.jsp?queID=<%=ids.get(0)%>">Take Quiz</a>
    <%--%><p><input type="submit" class="btn btn-danger" value="Start Quiz"></p>--%>
</form>
</body>
</html>
