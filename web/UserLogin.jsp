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
            color: #FA58AC;
            text-align: center;
        }
    </style>
</head>
<body>
<h1>Log in</h1>
<form action="LoginServlet" method="post">
    <div align="center">
        <p><input type="text" name="username" placeholder="username"></p>
        <p><input type="password" name="password" placeholder="password"></p>
        <p><input type="submit" value="Login"></p>
        <p><a href="UserRegister.jsp">register</a></p>
    </div>
</form>
</body>
</html>
