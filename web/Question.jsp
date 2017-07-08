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
<body onLoad="defaultSettings()">
<script language="javascript" type="text/javascript">
    function hideAllQuestions() {
        document.getElementById("question-response").style.visibility = "hidden";
        document.getElementById("fill").style.visibility = "hidden";
        document.getElementById("multi-answer").style.visibility = "hidden";
        document.getElementById("multiple-choice").style.visibility = "hidden";
        document.getElementById("picture").style.visibility = "hidden";
        document.getElementById("matching").style.visibility = "hidden";
    }

    function updateQuestion() {
        var questionType = document.getElementById("quest-type").value;
        hideAllQuestions();
        document.getElementById(questionType).style.visibility = "visible";
    }
    function defaultSettings() {
        hideAllQuestions();
        updateQuestion();
    }
</script>

<form action="/QuestionServlet" method="post">
    <br>Select question type:
    <select name="Question Type" id="quest-type" onclick="updateQuestion()">
        <option value="question-response" selected>Question-Response</option>
        <option value="fill">Fill in the Blank</option>
        <option value="multi-answer">Multi-Answers</option>
        <option value="multiple-choice">Multiple Choice</option>
        <option value="picture">Picture-Response</option>
        <option value="matching">Matching</option>
    </select>
    <div id="question-response">
        <h2>Question-Response</h2>
        <p>Input your question:</p>
        <input type="text" name="question">
        <br>Enter answer:<br>
        <input type="text" name="answer1">
    </div>
    <div id="fill">
        <h2>Fill the Blank</h2>
        <p>Input your question:</p>
        <input type="text" name="question1">
        ________<input type="text" name="question2">
        <br>Enter answer:
        <input type="text" name="answer1">
    </div>
    <div id="multi-answer">
        <h2>Multi-Answer</h2>
        <p>Input your question:</p>
        <input type="text" name="question">
        <br>Enter answer:
        <input type="text" name="answer1">
        <br>Enter second answer:
        <input type="text" name="answer2">
        <br>Enter third answer:
        <input type="text" name="answer3">
        <br>Enter fourth answer:
        <input type="text" name="answer4">
    </div>
    <div id="multiple-choice">
        <h2>Multiple-Choice</h2>
        Input your question:
        <input type="text" name="question">
        <br>Enter right answer:
        <input type="text" name="right-ans">
        <br>Enter wrong answer:
        <input type="text" name="answer2">
        <br>Enter wrong answer:
        <input type="text" name="answer3">
        <br>Enter wrong answer:
        <input type="text" name="answer4">
    </div>
    <div id="picture">
        <h2>Picture Response</h2>
        Input your question:
        <input type="text" name="question">
        <br>Input image URL:
        <input type="text" name="imageURL">
        <br>Enter answer:
        <input type="text" name="answer1">
    </div>
    <div id="matching">
        <h2>Matching</h2>
        <p>Enter questions and answers that match:</p>
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
