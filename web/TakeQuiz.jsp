<%@ page import="question.Quiz" %>
<%@ page import="database.DBConnection" %>
<%@ page import="question.BasicQuestion" %>
<%@ page import="java.util.List" %>
<%@ page import="staticstuff.SessionEssentials" %><%--
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

    <script>

        function put(i){
            $.get("TakeQuestion.jsp?queID=" + i, function(data){
                $("#placeholder").replaceWith(data);
            });
        }

    </script>

    <!--code from https://www.w3schools.com-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        #main{
            display: none;
        }

    </style>

</head>


<body>
<input name="quizID" type="hidden" value=<%=request.getParameter("quizID") %>/>

<form>
    <%
        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        Quiz quiz = (Quiz) db.getStaticDao().getObjectByID(id,"quizzes");
        List<Integer> questIDs = db.getQuizDao().getQuestionIdsByQuiz(quiz.getID());
        SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");
        sE.setCurrentQuiz(id);
    %>
    <div id = "head">
    <h2><%= quiz.getName() %></h2>
    <p><%= quiz.getDescription() %></p>
    <%--<%=id%>--%>
    <a href = "#" onclick="document.getElementById('head').style.display = 'none'; document.getElementById('main').style.display = 'block'">Take Quiz</a>
    </div>
    <div id = "main">
        <%
            if (quiz.isOnePerPage()) {
                for(int i = 0; i < questIDs.size(); i++){ %>
            <div class="well">
                <div id = "placeholder"></div>
                <script>put(<%=questIDs.get(i)%>);</script>
            </div>
        <%      }
            } else {%>
                <a href="TakeQuestion.jsp?queID=<%=questIDs.get(0)%>">start quiz</a>
        <%
            }
        %>

    </div>
    <%--%><p><input type="submit" class="btn btn-danger" value="Start Quiz"></p>--%>
</form>
</body>
</html>