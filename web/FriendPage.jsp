<%@ page import="usersystem.UserManager" %><%--
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
    var targetUser = getQueryVariable("friendname");

    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        alert('Query Variable ' + variable + ' not found');
    }
    function displayConfirmation() {
        document.mainform.action="/MakeAdminConfirmation.jsp?target-user=" + targetUser;
        document.mainform.submit();
    }
    <% UserManager ursMng = (UserManager) session.getAttribute("User Manager"); %>
    </script>
    <p>You are seeing <%=request.getParameter("friendname") %>'s page</p>
    <form action="/AddFriendServlet" method="post">
        <button id="addButton" type="button" onclick="alert('Request has been sent!'), updateToCancel()">Add Friend</button>
        <button id="cancelButton" type="button" onclick="alert('Request has been canceled!'), updateToAdd()">Cancel Friend Request</button>
    </form>
    <form action="/MakeAdminConfirmation.jsp" id="ma-conf" style="display: <% if (ursMng.getCurrentUser().getAdminStatus() == true) {
        out.print("block");
    }   else {
        out.print("none");
    }%>">
        <input type="button" value="Make Admin" onClick="displayConfirmation(); return false;" />
    </form>
    <form name="mainform" method="post" ></form>

</body>
</html>
