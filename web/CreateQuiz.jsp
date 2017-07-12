<%--
  Created by IntelliJ IDEA.
  User: anophoo
  Date: 6/28/17
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create question.Quiz</title>
    <style>
        #quiz-description {
            resize: none;
        }
        body {background-color: #F6CEE3;}
        h2 {color: #FA58AC;}
    </style>
</head>
<body>
<h2>Choose main Properties for your quiz</h2>
<form action="CreateQuizServlet" method="post">

    <input type="text" placeholder="quiz name" size="48" name="quiz-name" id="quiz-name">
    <br>
    <br>
    <textarea name="quiz-description" placeholder="quiz description" rows = "4" cols="50" id="quiz-description"></textarea> <br>
    Randomize question order. <input type="checkbox" name="quiz-is-random"> <br>
    One question per page. <input type="checkbox" name="one-per-page"> <br>
    Immediate correction. <input type="checkbox" name="immediate-correction"> <br>
    Allow practice mode. <input type="checkbox" name="allow-practice-mode"> <br>
    <input type="submit" name="create-quiz" value = "Create Quiz">

</form>


</body>
</html>
