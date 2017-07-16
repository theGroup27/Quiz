<%@ page import="database.DBConnection" %>
<%@ page import="question.*" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: mariam
  Date: 15/07/17
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <input name="quID" type="hidden" value=<%=request.getParameter("quiID") %>/>
    <%
        int id = Integer.parseInt(request.getParameter("queID"));
    %>
    <title>Question <%=id%></title>
</head>
<body>
<%
    DBConnection db = (DBConnection)request.getServletContext().getAttribute("DB Connection");
    BasicQuestion question = (BasicQuestion)db.getStaticDao().getObjectByID(id,"questions");
    String questionType = question.getType();
    String text = question.getQuestion();
    List<Integer> answers = db.getQuizDao().getAnswerIds(id);
%>
<%-- checks question types and uses question text appropriately --%>
<%-- posts as text --%>
<% if (questionType.equals("text_question")) {%>
    <h3><%=text%></h3>
<%}%>
<%-- posts as picture --%>
<% if (questionType.equals("picture")) {%>
    <p><img src = "<%=text%>"></p>
<%}%>

<%-- Does the same for answers --%>
<%-- <form action = ScoringServlet> --%>
<%BasicAnswer answer = (BasicAnswer)db.getStaticDao().getObjectByID(answers.get(0),"answers");%>
    <input name="answer_type" type="hidden" value=<%=answer.getType()%>/>
<%
    if (answer.getType().equals("text_response")) {
%>
<p><input type="text" name="question-response:answer1" placeholder="enter answer"></p>
<%  }
    if (answer.getType().equals("multiple_answer")) {
        for (int i = 0; i < answers.size(); i++) {
            String name = "multiple_choice:answer"+i;
%>
<p><input type="text" name="<%=name%>" placeholder="enter answer"></p>
<%      }
    }
    if (answer.getType().equals("multiple_choice")) {
        for (int i = 0; i < answers.size(); i++) {
            BasicAnswer ans = (BasicAnswer)db.getStaticDao().getObjectByID(answers.get(i),"answers");
            String answerText = ans.getAnswer();
            String name = "multiple_choice:checkbox"+i;
%>
<p><input type="checkbox" name=<%=name%>>
<%=answerText%>
</p>
<%      }
    }
%>
<p><input type="submit" name="Next"></p>
<%-- </form> --%>
</body>
</html>
