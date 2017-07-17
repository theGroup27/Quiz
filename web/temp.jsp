<%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 17/07/17
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
</head>
<body>
<input name="asd" type="hidden" value=<%=request.getParameter("id") %>/>
<p> score: <%=request.getParameter("id") %> </p>
</body>
</html>
