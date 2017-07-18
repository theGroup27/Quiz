<%@ page import="question.Quiz" %>
<%@ page import="database.DBConnection" %>
<%@ page import="question.BasicQuestion" %>
<%@ page import="java.util.List" %>
<%@ page import="staticstuff.SessionEssentials" %>
<%@ page import="java.util.Date" %>
<%@ page import="staticstuff.StaticDAO" %><%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 12/07/17
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <% int id = Integer.parseInt(request.getParameter("quizID"));
    %>
    <title>Take Quiz <%=id%></title>

    <script>

        function put(i){
            $.get("TakePageQuestion.jsp?queID=" + i, function(data){
                $("#placeholder").replaceWith(data);
            });
        }

    </script>

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
<input name="quizID" type="hidden" value=<%=request.getParameter("quizID") %>/>

<form>
    <%
        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        Quiz quiz = (Quiz) StaticDAO.getObjectByID(id,"quizzes");
        List<Integer> questIDs = db.getQuizDao().getQuestionIdsByQuiz(quiz.getID());
        SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");
        sE.setCurrentQuiz(id);
        Date date = new Date();
        sE.setBeginning(date);
    %>
    <div id = "head">
    <h2><%= quiz.getName() %></h2>
    <p><%= quiz.getDescription() %></p>
    <%  if (!quiz.isOnePerPage()) { %>
        <a href = "#" onclick="document.getElementById('head').style.display = 'none'; document.getElementById('main').style.display = 'block'">Take Quiz</a>
        </div>
        <div id = "main">
        <%for(int i = 0; i < questIDs.size(); i++){ %>
            <div class="well">
                <div id = "placeholder"></div>
                <script>put(<%=questIDs.get(i)%>);</script>
            </div>
        <%      } %>


    </div>
           <%  } else {%>
            <a href="TakeQuestion.jsp?queID=<%=questIDs.get(0)%>">Take Quiz</a>
                <%
            }
        %>
</form>
</body>
</html>