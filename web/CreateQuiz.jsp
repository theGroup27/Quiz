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
    <title>Create Quiz</title>
    <style>
        #quiz-description {
            resize: none;
        }
    </style>
</head>
<body>
<h2>Choose main Properties for your quiz</h2>
<form name = "quiz-general-options-form">
    Quiz name:<br>
    <input type="text" size="48" name="quiz-name" id="quiz-name"> <br>
    Quiz description:<br>
    <textarea rows = "4" cols="50" name="quiz-description" id="quiz-description"> </textarea> <br>
    Randomize question order. <input type="checkbox" name="quiz-is-random"> <br>
    One question per page. <input type="checkbox" name="one-per-page"> <br>
    Immediate correction. <input type="checkbox" name="imediate-correction"> <br>
    Allow practice mode. <input type="checkbox" name="allow-practice-mode"> <br>
    <input type="submit" name="create-quiz" value = "Create quiz">
</form>
<a href="Question.jsp">test question</a>

</body>
</html>
