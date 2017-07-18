<%@ page import="question.Score" %>
<%@ page import="database.DBConnection" %>
<%@ page import="staticstuff.StaticDAO" %>
<%@ page import="usersystem.User" %><%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 17/07/17
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title>Scores</title>
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
        #main{
            display: none;
        }
        p {
            color: #8000FF;
        }
        h3 {
            color: #8000FF;
        }
        body {
            background-color: #ECCEF5;
        }
        .well {
            background-color: #F2E0F7;
        }
    </style>
</head>
<body>
<div id="menu-placeholder"></div>
<% String id = request.getParameter("id");
    DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
    int scoreID = Integer.parseInt(id);
    Score score = (Score) StaticDAO.getObjectByID(scoreID,"quiz_scores");
    User user = (User) StaticDAO.getObjectByID(score.userID(),"users");
%>
<div class="well">
    <input name="asd" type="hidden" value=<%=request.getParameter("id") %>/>
    <h3><%= user.getUserName() %> took quiz <%= ""+score.quizID()%></h3>
    <p> score: <%=""+score.getScore() %> % </p>
    <p> elapsed: <%=""+score.getElapsed()%> seconds</p>
</div>
</body>
</html>
