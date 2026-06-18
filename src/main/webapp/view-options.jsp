<%@ page import="java.util.List" %>
<%@ page import="com.auramind.model.Question" %>
<%@ page import="com.auramind.model.QuestionOption" %>

<%
Question question =
(Question)request.getAttribute("question");

List<QuestionOption> options =
(List<QuestionOption>)request.getAttribute("options");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Options</title>

<style>

body{
    font-family:Segoe UI;
    background:#f5f7ff;
    padding:30px;
}

.box{
    background:white;
    padding:30px;
    border-radius:15px;
    max-width:800px;
    margin:auto;
}

h2{
    color:#6C63FF;
}

.option{
    background:#f8f8ff;
    padding:15px;
    margin:10px 0;
    border-radius:10px;
}

.back-btn{
    background:#6C63FF;
    color:white;
    padding:10px 20px;
    border:none;
    border-radius:8px;
    text-decoration:none;
}

</style>
</head>
<body>

<div class="box">

    <h2>Question</h2>

    <p>
        <b><%= question.getQuestionText() %></b>
    </p>

    <br>

    <h3>Options</h3>

    <%
    for(QuestionOption option : options){
    %>

    <div class="option">

        <b>Option:</b>
        <%= option.getOptionText() %>

        <br>

        <b>Personality:</b>
        <%= option.getPersonalityType() %>

    </div>

    <%
    }
    %>

    <br>

    <a href="admin-dashboard"
       class="back-btn">
       Back
    </a>

</div>

</body>
</html>