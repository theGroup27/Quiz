<%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 20/06/17
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserRegister</title>
    <style>
        <%--body {background-color: #F6CEE3;}--%>
        h1 {
            color: #FA58AC;
            text-align: center;
        }
        bg-1 {
            background-color: #F6CEE3;
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
<h1>Register</h1>
<form action="RegisterServlet" method="post">
    <div class="container-fluid bg-1 text-center">
        <p><input type="text" name="username" placeholder="username"></p>
        <p><input type="password" name="password" placeholder="password"></p>
        <p><input type="password" name="verify" placeholder="verify password"></p>
        <p><input type="submit" class="btn btn-danger" value="Sign Up"></p>
    </div>
</form>
</body>
</html>
