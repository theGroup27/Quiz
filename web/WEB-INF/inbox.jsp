<%@ page import="usersystem.User" %>
<%@ page import="usersystem.UserListener" %>
<%@ page import="java.util.List" %>
<%@ page import="database.MessageDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database.ConnectionPoolMaker" %>
<%@ page import="database.ConnectionPool" %>
<%@ page import="usersystem.Message" %>
<%@ page import="database.*" %>
<%--
  Created by IntelliJ IDEA.
  User: kdufla
  Date: 7/15/17
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        ConnectionPool p= ConnectionPoolMaker.getConnetionPool(100,200);
        Connection c=p.get();
        User user = (User) request.getSession().getAttribute(UserListener.sessionOwnerUser);
        MessageDAO dao =new MessageDAO(c);
        UserDAO userDAO=new database.UserDAO(c);
    %>
    <title>Title</title>
</head>
<body>
    <%

        List list = dao.getLastMessages(50);

        for (Object message:list){
        	int i=((Message)message).getSenderId();
            out.println("<a href=\"MessageView.jsp?username=" + ((Message)message).getMessageText() + "\"><h3>You have Message from "
                    +i+"</h3></a>");
        }

    %>

</body>
</html>
