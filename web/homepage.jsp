<%@ page import="java.util.List" %>
<%@ page import="database.DBConnection" %>
<%@ page import="question.Quiz" %>
<%@ page import="staticstuff.StaticDAO" %>
<%@ page import="staticstuff.SessionEssentials" %><%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 18/07/17
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title><meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $.get("Menu.jsp", function(data){
            $("#menu-placeholder").replaceWith(data);
        });
    </script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */


        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: #43bd8e;
            padding: 25px;
        }
        p {
            color: #214069;
        }
        h3 {
            color: #214069;
        }
        h4 {
            color: #214069;
        }
        body {
            background-color: #467b8d;
        }


        .well {
            background-color:  #ffffff;
        }
        .right{
            color: #e1fea4;
        }
        .left{
            color: #e1fea4;
        }

        .carousel-inner img {
            width: 100%; /* Set width to 100% */
            margin: auto;
            min-height: 200px;
        }

        /*#myCarousel {*/
        /*z-index: -1000*/
        /*}*/

        /* Hide the carousel text when the screen is less than 600 pixels wide */
        @media (max-width: 600px) {
            .carousel-caption {
                display: none;
            }
        }
    </style>
</head>
<body>

<div id="menu-placeholder"></div>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="https://s-media-cache-ak0.pinimg.com/originals/98/eb/b9/98ebb9e2431eda8207956dce67569b50.jpg">
            <div class="carousel-caption">
                <h3></h3>
            </div>
        </div>

        <div class="item">
            <img src="https://s-media-cache-ak0.pinimg.com/originals/98/eb/b9/98ebb9e2431eda8207956dce67569b50.jpg">
            <div class="carousel-caption">
                <%--<h3>Random Stuff 2</h3>--%>
            </div>
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container text-center">
    <h3>Welcome!</h3><br>
    <div class="row">
        <div class="col-sm-2">
            <div class="well">
                <h4>Recently Created</h4>
                <%
                    int n = 6;
                    DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
                    String query = "select * from quizzes order by id desc limit " + n;
                    List<Integer> ids = db.getQuizDao().getQuizzes(query);
                    for (int i = 0; i<ids.size(); i++) {
                        Quiz quiz = (Quiz) StaticDAO.getObjectByID(ids.get(i),"quizzes");
                        if (quiz!=null) {
                            out.println("<img src=\"https://placehold.it/150x80?text=IMAGE\" " +
                                    "class=\"img-responsive\" style=\"width:100%\" alt=\"Image\">");
                            out.println("<p><a href=\"TakeQuiz.jsp?quizID="+quiz.getID()+"\">quiz</a></p>");
                        }
                    }
                %>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="well">
                <p>Some text..</p>
            </div>
            <div class="well">
                <p>Some text..</p>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="well">
                <h4>Your Recent Quizzes</h4>
                <%  SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");
                    int usr = sE.getCurrentUser();
                    query = "select * from quizzes as q where q.creator_id =" + usr + " limit " + n;
                    List<Integer> ids2 = db.getQuizDao().getQuizzes(query);
                    for (int i = 0; i<ids2.size(); i++) {
                        Quiz quiz = (Quiz) StaticDAO.getObjectByID(ids2.get(i),"quizzes");
                        if (quiz!=null) {
                            out.println("<img src=\"https://placehold.it/150x80?text=IMAGE\" " +
                                    "class=\"img-responsive\" style=\"width:100%\" alt=\"Image\">");
                            out.println("<p><a href=\"TakeQuiz.jsp?quizID="+quiz.getID()+"\">quiz</a></p>");
                        }

                    }
                %>
            </div>
        </div>
    </div>
</div><br>

<footer class="container-fluid text-center">
    <p>&#169; TheGroup 2017</p>
</footer>

</body>
</html>


