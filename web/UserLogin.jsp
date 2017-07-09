<%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 17/06/17
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userlogin</title>
    <style>
        body {background-color: #F6CEE3;}
        h1 {
            text-align: center;
            color: #FA58AC;
        }
    </style>
    <!--code from https://www.w3schools.com-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Sign In</h1>
<form action="LoginServlet" method="post">
    <div align="center">
        <p><input type="text" name="username" placeholder="username"></p>
        <p><input type="password" name="password" placeholder="password"></p>
        <p><input type="submit" class="btn btn-danger" value="Sign In"></p>
        <p><a href="UserRegister.jsp">register</a></p>
    </div>
</form>
</body>
</html>
