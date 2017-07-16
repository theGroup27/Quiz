<%--
  Created by IntelliJ IDEA.
  User: kdufla
  Date: 6/7/17
  Time: 7:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<html>
  <head>
    <title>Homepage</title>-->
    <!--code from https://www.w3schools.com-->
    <!-- Latest compiled and minified CSS -->
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

    <!-- jQuery library -->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->

    <!-- Latest compiled JavaScript -->
    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

<!-- USING BOOTSTRAP TEMPLATE -->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Quizzes Yeah</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
        margin-bottom: 0;
        border-radius: 0;
        background-color: #B45F04;
        overflow: hidden;
        position: relative !important;
        <%--style="background-color: #FA58AC; overflow: hidden;"--%>
    }

    /* Add a gray background color and some padding to the footer */
    footer {
        background-color: #B45F04;
        padding: 25px;
    }

    p {
        color: #B45F04;
    }
    h3 {
        color: #B45F04;
    }
    h4 {
        color: #B45F04;
    }
    body {
        background-color: #F3E2A9;
    }


    .well {
        background-color: #F5ECCE;
    }
    .right{
        color: #F3E2A9;
    }
    .left{
        color: #F3E2A9;
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

<nav class="navbar navbar-inverse" >
  <div class="container-fluid" >
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
            <!-- Home -->
            <li class="active" ><a href="#">Home</a></li>
            <!-- About -->
            <li><a href="#">About</a></li>
            <!-- Notifications -->
            <li><a href="#">Notifications</a></li>
            <!-- Categories -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Maths</a></li>
                    <li><a href="#">History</a></li>
                    <li><a href="#">Misc</a></li>
                </ul>
            </li>
        </ul>
        <!-- Search bar -->
        <form class="navbar-form navbar-right" role="search" action="/SearchUserServlet" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="friendname" placeholder="Search User...">
                <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>
            </div>
        </form>
      <ul class="nav navbar-nav navbar-right">
          <!-- Create Quiz -->
          <li><a href="CreateQuiz.jsp">Create Quiz</a></li>
          <!-- <li><a href="UserLogin.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="https://s-media-cache-ak0.pinimg.com/originals/94/67/95/9467959377351995b301443f7efd06dc.jpg" alt="Image">
      <div class="carousel-caption">
        <h3>Random Stuff</h3>
      </div>
    </div>

    <div class="item">
      <img src="https://s-media-cache-ak0.pinimg.com/originals/23/55/bf/2355bf44941dff7c6c06d1b706ab916a.jpg" alt="Image">
      <div class="carousel-caption">
        <h3>Random Stuff 2</h3>
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
  <h3>MEOW</h3><br>
  <div class="row">
      <div class="col-sm-2">
          <div class="well">
              <h4>Recently Created</h4>
              <%
                  for (int i = 0; i<6; i++) {
                        out.println("<img src=\"https://placehold.it/150x80?text=IMAGE\" " +
                        "class=\"img-responsive\" style=\"width:100%\" alt=\"Image\">");
                        out.println("<p>Quiz</p>");
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
              <%
                  for (int i = 0; i<6; i++) {
                      out.println("<img src=\"https://placehold.it/150x80?text=IMAGE\" " +
                      "class=\"img-responsive\" style=\"width:100%\" alt=\"Image\">");
                      out.println("<p><a href=\"TakeQuiz.jsp?quizID=1\">quiz</a></p>");
                  }
              %>
          </div>
      </div>
  </div>
</div><br>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>

