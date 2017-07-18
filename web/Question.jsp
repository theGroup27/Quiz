<%--
  Created by IntelliJ IDEA.
  User: anophoo
  Date: 7/8/17
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Question No <%=request.getParameter("id") %></title>
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
<body onLoad="defaultSettings()">
<div id="menu-placeholder"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
    function hideAllQuestions() {
        $("#question-response").hide();
        $("#fill").hide();
        $("#multiple_answer").hide();
        $("#multiple_choice").hide();
        $("#picture").hide();
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
    $(document).ready(function(){
        var main = $(".varations");
        var button = $(".addVaration");
        var count = 2;
        $(button).click(function(e){
            e.preventDefault();
            var type = document.getElementById('quest-type').value

            var name = type + ":answer" + parseInt(count);
            var placeHolder = "enter answer";
            count++;
            $(main).append("<p><input type=\"text\" name=\" " + name + " \" placeholder = \" " + placeHolder + " \"/><a href=\"#\" class=\"remove_field\">Remove</a></p>");
        });
        $(main).on("click",".remove_field", function(e){
            e.preventDefault();
            $(this).parent('p').remove();
            count--;
        })
    });
</script>
<form action="/QuestionServlet" method="post">
    <br>Select question type:
    <select name="QuestionType" id="quest-type" onclick="updateQuestion()">
        <option value="question-response" selected>Question-Response</option>
        <option value="fill">Fill in the Blank</option>
        <option value="multiple_answer">Multi-Answers</option>
        <option value="multiple_choice">Multiple Choice</option>
        <option value="picture">Picture-Response</option>
        <option value="matching">Matching</option>
    </select>

    <h2>Question No <%=request.getParameter("id") %></h2>

    <div id="question-response">
        <h3>Question Response</h3>
        <p><textarea name="question-response:question" placeholder="enter question" rows="4" cols="50"></textarea></p>
        <p><input type="text" name="question-response:answer1" placeholder="enter answer"></p>
        <p>Add other variations of a given answer</p>
        <%
            for (int i = 2; i<=3; i++) {
                out.println("<p>");
                String st = "question-response:answer"+Integer.toString(i);
                out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
                out.println("</p>");
            }
        %>
    </div>
    <div id="fill">
        <h3>Fill the Blank</h3>
        <p>Input your question:</p>
        <input type="text" name="fill:question1">
        ________<input type="text" name="fill:question2">
        <p><input type="text" name="fill:answer1" placeholder="enter answer"></p>
        <p>Add other variations of a given answer</p>
        <%
            for (int i = 2; i<=5; i++) {
                out.println("<p>");
                String st = "fill:answer"+Integer.toString(i);
                out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
                out.println("</p>");
            }
        %>
    </div>
    <div id="multiple_answer">
        <h3>Multi-Answer</h3>
        <p><textarea name="multiple_answer:question" placeholder="enter question" rows="4" cols="50"></textarea></p>
        <%
            for (int i = 1; i<=5; i++) {
                out.println("<p>");
                String st = "multiple_answer:answer"+Integer.toString(i);
                out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
                out.println("</p>");
            }
        %>
    </div>
    <div id="multiple_choice">
        <h3>Multiple-Choice</h3>
        <p><textarea name="multiple_choice:question" placeholder="enter question" rows="4" cols="50"></textarea></p>
        <p>Check correct answers</p>
        <%
            for (int i = 1; i<=5; i++) {
                out.println("<p>");
                String st = "multiple_choice:answer" + i;
                String s = "multiple_choice:checkbox" + i;
                out.println("<input type=\"checkbox\" name="+ s +">");
                out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
                out.println("</p>");
            }
        %>

        <p>
    </div>
    <div id="picture">
        <h3>Picture Response</h3>
        <p><input type="text" name="picture:question" placeholder="enter image url"></p>
        <p><input type="text" name="picture:answer1" placeholder="enter answer"></p>
        <p>Add other variations of a given answer</p>
        <%
            for (int i = 2; i<=3; i++) {
                out.println("<p>");
                String st = "picture:answer"+Integer.toString(i);
                out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
                out.println("</p>");
            }
        %>
    </div>
    <br><br>
    <input type="submit" name="next-question" value="Next">
    <input name="numID" type="hidden" value=<%=request.getParameter("id") %>/>
</form>

<form action = "homepage.jsp">
    <input type="submit" name="submit-all" value="exit and save">
</form>
</body>
</html>
