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
    <script src="jquery/jquery-3.2.1.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>

        $("document").ready(function () {

            $("#signUp").click(function () {
                $("#register").css('visibility','visible').hide().fadeIn(1000);
                $("#login").fadeOut(1000);
            });

            $("#signIn").click(function () {
                $("#login").css('visibility','visible').hide().fadeIn(1000);
                $("#register").fadeOut(1000);
            });

        });

    </script>

    <style>

        body{
            margin: 0;
            padding: 0;
            font-size: 12px;
        }

        .body{
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            width: auto;
            height: auto;
            background-image: url(/img/back.jpg);
            background-size: cover;
        }

        #register {
            visibility: hidden;
            position: absolute;
            top: calc(50% - 155px);
            left: calc(50% - 465px);
            height: 150px;
            width: 350px;
            padding: 10px;
        }

        .header{
            position: absolute;
            top: calc(50% - 35px);
            left: calc(50% - 200px);
        }

        .header div{
            float: left;
            color: white;
            font-size: 35px;
            font-weight: 200;
        }

        .header div span{
            color: green !important;
        }

        #login{
            visibility: visible;
            position: absolute;
            top: calc(50% - 75px);
            left: calc(50% - 5px);
            height: 150px;
            width: 350px;
            padding: 10px;
        }

        input[type=text],
        input[type=password]{
            display: block;
            box-sizing: border-box;
            background: transparent;
            width: 250px;
            height: 30px;
            border: none;
            border-bottom: 1px solid grey;
            color: white;
            padding: 4px;
            margin-bottom: 10px;
            transition: 0.2s;
        }

        input[type=text]:focus,
        input[type=password]:focus{
            outline: none;
            border-bottom: 2px solid green;
        }

        input[type=submit]{
            width: 250px;
            height: 35px;
            background: green;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            border-radius: 2px;
            color: white;
            padding: 6px;
            margin-top: 10px;
            transition: 0.2s;
        }

        input[type=submit]:hover{
            opacity: 0.8;
        }

        input[type=submit]:active{
            opacity: 0.6;
        }

        input[type=submit]:focus{
            outline: none;
        }

    </style>

</head>

<body>

<div class="body"></div>

<div id="register">
    <form action="RegisterServlet" method="post">
            <input type="text" name="name" placeholder="Full name">
            <input type="text" name="username" placeholder="Username">
            <input type="text" name="email" placeholder="E-mail">
            <input type="password" name="password" placeholder="Password">
            <input type="password" name="verify" placeholder="Verify Password">
            <input type="submit" value="Sign Up">
        <p style = "color: white">Already user? <a href="#" id = "signIn">Sign in!</a><p>
    </form>
</div>

<div class="header">
    <div>Quiz<span>Website</span></div>
</div>
<br>

<div id="login">
    <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username">
            <input type="password" name="password" placeholder="Password">
            <input type="submit" value="Sign In"><br>
            <p style = "color: white">Not user yet? <a href="#" id = "signUp">Register now!</a><p>
    </form>
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
