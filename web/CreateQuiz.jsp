<%@ page import="staticstuff.SessionEssentials" %><%--
  Created by IntelliJ IDEA.
  User: anophoo
  Date: 6/28/17
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create question.Quiz</title>

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
        #quiz-description {
            resize: none;
        }
        p {
            color: #8000FF;
        }
        h2 {
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
<div class="well">
    <h2>Choose main Properties for your quiz</h2>
    <form action="CreateQuizServlet" method="post">
        <input type="text" placeholder="quiz name" size="48" name="quiz-name" id="quiz-name">
        <br>
        <br>
        <textarea name="quiz-description" placeholder="quiz description" rows = "4" cols="50" id="quiz-description"></textarea> <br>
        Randomize question order. <input type="checkbox" name="quiz-is-random"> <br>
        One question per page. <input type="checkbox" name="one-per-page"> <br>
        Immediate correction. <input type="checkbox" name="immediate-correction"> <br>
        <input type="submit" name="create-quiz" value = "Create Quiz">
    </form>
</div>

</body>
</html>
