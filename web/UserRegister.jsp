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
</head>
<body>
<h1>Register</h1>
<form action="RegisterServlet" method="post">
    <p>
        <input type="text" name="username" placeholder="username">
    </p>
    <p>
        <input type="password" name="password" placeholder="password">
    </p>
    <p>
        <input type="password" name="verify" placeholder="verify password">
    </p>
    <p>
        <input type="submit" value="Sign Up">
    </p>
</form>
</body>
</html>
