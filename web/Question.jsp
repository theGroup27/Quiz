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
    <title>Question No <%=request.getParameter("id") %></title>
    <style>
        body {background-color: powderblue;}
        /*#matching {*/
            /*margin-top: 1px;*/
            /*margin-left: 80px;*/
        /*}*/
    </style>
</head>
<body onLoad="defaultSettings()">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
    function hideAllQuestions() {
        $("#question-response").hide();
        $("#fill").hide();
        $("#multi-answer").hide();
        $("#multiple-choice").hide();
        $("#picture").hide();
        $("#matching").hide();
    }

    function updateQuestion() {
        var questionType = document.getElementById("quest-type").value;
        hideAllQuestions();
        $("#"+questionType).show();
    }
    function defaultSettings() {
        hideAllQuestions();
        updateQuestion();
        $("#question-response").show();
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

    <h2>Question No <%=request.getParameter("id") %></h2>
    <div id="question-response">
        <h3>Question Response</h3>
        <p><textarea name="question" placeholder="enter question" rows="4" cols="50"></textarea></p>
        <p><input type="text" name="answer" placeholder="enter answer"></p>
    </div>
    <div id="fill">
        <h3>Fill the Blank</h3>
        <p>Input your question:</p>
        <input type="text" name="question1">
        ________<input type="text" name="question2">
        <p><input type="text" name="answer" placeholder="enter answer"></p>
    </div>
    <div id="multi-answer">
        <h3>Multi-Answer</h3>
        <p><textarea name="question" placeholder="enter question" rows="4" cols="50"></textarea></p>
        <%
            for (int i = 0; i<5; i++) {
                out.println("<p>");
                String st = "answer"+Integer.toString(i);
                out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
                out.println("</p>");
            }
        %>
    </div>
    <div id="multiple-choice">
        <h3>Multiple-Choice</h3>
        <p><textarea name="question" placeholder="enter question" rows="4" cols="50"></textarea></p>
        <%
            for (int i = 0; i<5; i++) {
                out.println("<p>");
                String st = Integer.toString(i);
                out.println("<input type=\"checkbox\" name="+ st +">");
                out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
                out.println("</p>");
            }
        %>

        <p>
    </div>
    <div id="picture">
        <h3>Picture Response</h3>
        <p><input type="text" name="imageURL" placeholder="enter image url"></p>
        <p><input type="text" name="answer" placeholder="enter answer"></p>
    </div>
    <div id="matching">
        <h3>Matching</h3>
        <p>Enter questions and answers that match:</p>

        <%
            for (int i = 0; i<4; i++) {
                out.println("<p>");
                String first = "first-match" + Integer.toString(i);
                String second = "second-match" + Integer.toString(i);
                out.println("<input type=\"text\" name="+ first +" placeholder=\"enter first match\">");
                out.println("<input type=\"text\" name="+ second +" placeholder=\"enter second match\">");
                out.println("</p>");
            }
        %>
    </div>
    <br><br>
    <input type="submit" name="next-question" value="Next Question">
    <input name="numID" type="hidden" value=<%=request.getParameter("id") %>/>
</form>

<input type="submit" name="submit-all" value="Submit and Finish">
</body>
</html>
