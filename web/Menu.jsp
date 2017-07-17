<%--
  Created by IntelliJ IDEA.
  User: jiiok
  Date: 7/17/2017
  Time: 02:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>

        .navbar {
            margin-bottom: 0;
            border-radius: 0;
            overflow: hidden;
            position: relative !important;
            background-color: black;
            height: 100%;
            border: 5px solid;
        <%--style="background-color: #FA58AC; overflow: hidden;"--%>
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

</body>
</html>
