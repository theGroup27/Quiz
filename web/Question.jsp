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
<script language="javascript" type="text/javascript">
    function updateQuestion() {
       // document.getElementById(elementId).style.visibility = "hidden";
        var questionType = document.getElementById("quest-type").value;
        switch (questionType) {
            case "question-response":
                document.getElementById(questionType).style.visibility = "hidden";
                break;
            case "fill":
                document.getElementById(questionType).style.visibility = "hidden";
                break;
            case "multi-answer":
                document.getElementById(questionType).style.visibility = "hidden";
                break;
            case "multiple-choice":
                document.getElementById(questionType).style.visibility = "hidden";
                break;
            case "picture":
                document.getElementById(questionType).style.visibility = "hidden";
                break;
            case "matching":
                document.getElementById(questionType).style.visibility = "hidden";
        }
    }
</script>

<form action="/QuestionServlet" method="post" >
    <br>Select question type:<br>

    <select name="Question Type" id="quest-type" onclick="updateQuestion()">
        <option value="question-response" selected>Question-Response</option>
        <option value="fill">Fill in the Blank</option>
        <option value="multi-answer">Multi-Answers</option>
        <option value="multiple-choice">Multiple Choice</option>
        <option value="picture">Picture-Response</option>
        <option value="matching">Matching</option>
    </select>
    <div id="question-response">
        <p>Input your question:</p>
        <input type="text" name="question">
        <br>Enter answer:<br>
        <input type="text" name="answer1">
    </div>
    <div id="fill">
        <p>Input your question:</p>
        <input type="text" name="question1">
        ________<input type="text" name="question2">
        <br>Enter answer:<br>
        <input type="text" name="answer1">
    </div>
    <div id="multi-answer">
        <p>Input your question:</p>
        <input type="text" name="question">
        <br>Enter answer:<br>
        <input type="text" name="answer1">
        <br>Enter second answer:<br>
        <input type="text" name="answer2">
        <br>Enter third answer:<br>
        <input type="text" name="answer3">
        <br>Enter fourth answer:<br>
        <input type="text" name="answer4">
    </div>
    <div id="picture">
        <p>Input your question:</p>
        <input type="text" name="question">
        <br>Input image URL (optional):<br>
        <input type="text" name="imageURL">
        <br>Enter answer:<br>
        <input type="text" name="answer1">
    </div>
    <div id="matching">
        <br>Enter questions and answers that match<br>
        <input type="text" name="match-quest1">
        <input type="text" name="match-ans1"><br>
        <input type="text" name="match-quest2">
        <input type="text" name="match-ans2"><br>
        <input type="text" name="match-quest3">
        <input type="text" name="match-ans3"><br>
        <input type="text" name="match-quest4">
        <input type="text" name="match-ans4"><br>
    </div>
    <br><br>
    <input type="submit" name="next-question" value="Next Question">
    <input type="submit" name="submit-all" value="Submit and Finish">
</form>

</body>
</html>
