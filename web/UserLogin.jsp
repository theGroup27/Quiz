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
</head>
<body>
<h1>Welcome</h1>
<form action="LoginServlet" method="post">
    <p>
        <input type="text" name="username" placeholder="username:">
    </p>
    <p>
        <input type="text" name="password" placeholder="password:">
    </p>
    <p>
        <input type="submit" value="Login">
        <input type="submit" value="Register">
    </p>
</form>
</body>
</html>
