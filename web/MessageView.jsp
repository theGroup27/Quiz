<%@ page import="usersystem.UserListener" %>
<%@ page import="usersystem.User" %>
<%@ page import="database.MessageDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database.ConnectionPoolMaker" %>
<%@ page import="database.ConnectionPool" %>
<%@ page import="database.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: kdufla
  Date: 7/16/17
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        ConnectionPool p= ConnectionPoolMaker.getConnetionPool(100,200);
        Connection c=p.get();
        User user = (User) request.getSession().getAttribute(UserListener.sessionOwnerUser);
        MessageDAO dao =new MessageDAO(c);
        UserDAO userDAO=new UserDAO(c);
        String mesText = request.getParameter("username");
    %>
</head>
<body>
    <%
        out.println("<p> hello, "+user.getUserName()+"</p>");
        out.println("<p>"+mesText+"</p>");

    %>

<p>this message is from bbb</p>
</body>
</html>
