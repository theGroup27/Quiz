<%--
  Created by IntelliJ IDEA.
  User: anophoo
  Date: 7/15/17
  Time: 01:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Do Quiz</title>
</head>
<body>
<p>Do it</p>
<div id=""></div>
<p>Question:</p>

<p>answers</p>
<div id="question-response">
    <h3>Question Response</h3>

    <p>Question itself</p>
    <p><input type="text" name="question-response:answer1" placeholder="enter answer"></p>
</div>
<div id="fill">
    <h3>Fill the Blank</h3>
    <p>Input your question:</p>
    <p>Question part 1</p>
    <p><input type="text" name="fill:answer" placeholder="enter answer"></p>
    <p>Question part 2</p>
</div>
<div id="multi-answer">
    <h3>Multi-Answer</h3>
    <p>Question itself</p>
    <p><input type="text" name="multi-answer:answer" placeholder="enter answer"></p>
</div>
<div id="multiple-choice">
    <h3>Multiple-Choice</h3>
    <p>Question itself</p>
    <p>ეს შესაცვლელია</p>
    <%
        for (int i = 1; i<=5; i++) {
            out.println("<p>");
            String st = "multiple-choice:answer" + i;
            String s = "multiple-choice:checkbox" + i;
            out.println("<input type=\"checkbox\" name="+ s +">");
            out.println("<input type=\"text\" name="+ st +" placeholder=\"enter answer\">");
            out.println("</p>");
        }
    %>
</div>
<div id="picture">
    <h3>Picture Response</h3>
    <p>Question itself</p>
    <img src="https://abroad.fiu.edu/_customtags/ct_Image.cfm?Image_ID=9027" alt="Deadline kills" style="width:250px;height:130px;">
    <p><input type="text" name="picture:answer1" placeholder="enter answer"></p>
</div>
<div id="matching">
    <h3>Matching</h3>
    <p>Question itself</p>
    <p>ეს შესაცვლელია:</p>
    <%
        for (int i = 1; i<=4; i++) {
            out.println("<p>");
            String first = "first-match" + Integer.toString(i);
            String second = "second-match" + Integer.toString(i);
            out.println("<input type=\"text\" name="+ first +" placeholder=\"enter first match\">");
            out.println("<input type=\"text\" name="+ second +" placeholder=\"enter second match\">");
            out.println("</p>");
        }
    %>
</div>
</body>
</html>
