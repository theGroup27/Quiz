<%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 20/06/17
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=request.getParameter("id") %></title>
</head>
<body>
    <input name="userID" type="hidden" value=<%=request.getParameter("id") %>/>
    <p> Thanks for signing up, <%=request.getParameter("id") %> </p>
</body>
</html>
