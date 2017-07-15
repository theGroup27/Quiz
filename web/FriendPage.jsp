<%--
  Created by IntelliJ IDEA.
  User: anophoo
  Date: 7/15/17
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Friend's Page</title>
</head>
<body onLoad="updateToAdd()">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
    function updateToCancel() {
        $("#add").hide();
        $("#cancel").show();
    }
    function updateToAdd() {
        $("#cancel").hide();
        $("#add").show();
    }
</script>
    <p>You are seeing <%=request.getParameter("friendname") %>'s page</p>
    <!--<form action="/SearchUserServlet" method="post">-->
    <button id="add" type="button" onclick="alert('Request has been sent!'), updateToCancel()">Add Friend</button></body>
    <button id="cancel" type="button" onclick="alert('Request has been canceled!'), updateToAdd()">Cancel Friend Request</button></body>
</html>
