<%@ page import="staticstuff.SessionEssentials" %><%--
  Created by IntelliJ IDEA.
  User: jiiok
  Date: 7/17/2017
  Time: 02:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>

    <style>

        .navbar {
            margin-bottom: 0;
            overflow: hidden;
            position: relative !important;
            background-color: #467b8d;
            height: 100%;
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
                <%--<a class="navbar-brand" href="#">Logo</a>--%>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <!-- Home -->
                    <li class="active" ><a href="homepage.jsp">Home</a></li>
                    <!-- About -->
                    <%SessionEssentials sE = (SessionEssentials)request.getSession().getAttribute("Session Essentials");%>
                    <li><a href="FriendPage.jsp?friendname=<%=sE.getCurrentUser()%>">My Profile</a></li>
                    <!-- Notifications -->
                    <li><a href="#">Notifications</a></li>
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
