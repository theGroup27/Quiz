<%--
  Created by IntelliJ IDEA.
  User: anophoo
  Date: 7/8/17
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Question</title>
</head>
<body>
<form action="/QuestionServlet" method="post">
    <br>Select question type:<br>

    <select name="Question Type">
        <option value="question-response" selected>Question-Response</option>
        <option value="fill">Fill in the Blank</option>
        <option value="multiple">Multiple Choice</option>
        <option value="picture">Picture-Response</option>
    </select>

    <br>Input your question:<br>
    <input type="text" name="question">

    <br>Input image URL (optional):<br>
    <input type="text" name="imageURL">

    <br>Enter answer:<br>
    <input type="text" name="answer">

    <br><br>
    <input type="submit" name="next-question" value="Next Question">
    <input type="submit" name="submit-all" value="Submit and Finish">

</form>
</body>
</html>
