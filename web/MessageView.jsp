<%@ page import="usersystem.UserListener" %>
<%@ page import="usersystem.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database.*" %><%--
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
        User user = (User) request.getSession().getAttribute(UserListener.sessionOwnerUser);
        //got daos from DBConnection
        DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
        MessageDAO msgDao = db.getMsgDao();
        UserDAO userDao = db.getUserDao();
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
