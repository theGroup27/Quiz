<%--
  Created by IntelliJ IDEA.
  User: luka
  Date: 17-Jul-17
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        var xhr = null;
        function makeAdmin() {
            document.getElementById("ma-question").innerHTML = "waiting...";
            document.getElementById("yes-button").style.display = "none";
            document.getElementById("no-button").innerHTML = "close";
            try {
                xhr = new XMLHttpRequest();
            } catch (e) {
                xhr = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var url = "MakeAdminServlet?target-user=" + document.getElementById("target-user");
            xhr.onreadystatechange = handler;
            xhr.open("GET", url, true);
            xhr.send(null);
        }

        function handler() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    document.getElementById("ma-question").innerHTML = xhr.responseText;
                }
            }
        }
    </script>
    <style>
        .make-admin-popup {
            width: 300px;
            padding: 20px;
            background-color: #7ec0ee;
            color: white;
            margin-bottom: 15px;
            text-align: center;
            border: 2px dashed #f69c55;
            position: fixed;
            top: 50%;
            left: 50%;
            margin-top: -50px;
            margin-left: -150px;
        }
        .make-admin-button {
            margin: 15px;
            color: white;
            font-weight: bold;
            font-size: 22px;
            line-height: 20px;
            cursor: pointer;
            transition: 0.3s;
        }
    </style>
</head>
<body>
<div class="make-admin-popup" role="alert">
    <p id="ma-question">Are you sure you want to make <text id="target-user"><%= request.getParameter("target-user")%></text> an admin?</p>
        <span class="make-admin-button" id="yes-button" onclick="makeAdmin(); return false">yes</span>
        <span class="make-admin-button" id="no-button" onclick="this.parentElement.style.display='none';">no</span>
</div> <!-- cd-popup -->
</body>
</html>
