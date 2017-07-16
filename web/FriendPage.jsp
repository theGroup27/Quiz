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
        $("#addButton").hide();
        $("#cancelButton").show();
    }
    function updateToAdd() {
        $("#cancelButton").hide();
        $("#addButton").show();
    }
</script>
    <p>You are seeing <%=request.getParameter("friendname") %>'s page</p>
    <form action="/AddFriendServlet" method="post">
        <button id="addButton" type="button" onclick="alert('Request has been sent!'), updateToCancel()">Add Friend</button>
        <button id="cancelButton" type="button" onclick="alert('Request has been canceled!'), updateToAdd()">Cancel Friend Request</button>
    </form>
</body>
</html>
