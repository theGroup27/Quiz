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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--code from https://www.w3schools.com-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>

        .container-fluid {
            background-color: #F5ECCE;
        }


    </style>
</head>
<body>


<div class="container text-center">
    <div class="well" style="background: #F3E2A9;">
        <div class="row">
            <div class="col-sm-6">
                <div class="well" style="background: #F5ECCE;">
                    <form action="RegisterServlet" method="post">
                        <div class="container-fluid text-center">
                            <h1>Register</h1>
                            <p><input type="text" name="username" placeholder="username"></p>
                            <p><input type="password" name="password" placeholder="password"></p>
                            <p><input type="password" name="verify" placeholder="verify password"></p>
                            <p><input type="submit" class="btn btn-warning" value="Sign Up"></p>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="well" style="background: #F5ECCE;">
                    <form action="LoginServlet" method="post">
                        <div class="container-fluid text-center">
                            <h1>Sign In</h1>
                            <p><input type="text" name="username" placeholder="username"></p>
                            <p><input type="password" name="password" placeholder="password"></p>
                            <p><input type="submit" class="btn btn-warning" value="Sign In"></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<%--<form action="LoginServlet" method="post">
    <div class="container-fluid bg-1 text-center">
        <h1>Sign In</h1>
        <p><input type="text" name="username" placeholder="username"></p>
        <p><input type="password" name="password" placeholder="password"></p>
        <p><input type="submit" class="btn btn-danger" value="Sign In"></p>
        <p><a href="UserRegister.jsp">register</a></p>
    </div>
</form>--%>
</body>
</html>
