<%--
  Created by IntelliJ IDEA.
  User: anophoo
  Date: 7/16/17
  Time: 03:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User doesn't exists</title>
</head>
<body>
<h1>User "<%=request.getParameter("friendname")%>" doesn't exist</h1>
<h2>Try someone else</h2>
<form role="search" action="/SearchUserServlet" method="post">
    <div class="form-group input-group">
        <input type="text" class="form-control" name="friendname" placeholder="Search User...">
    </div>
</form>
<a id="homepage" href="index.jsp">Go Back to Homepage</a>

</body>
</html>
