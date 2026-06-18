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
<title>Edit Question</title>

<style>

body{
    background:#f5f7ff;
    font-family:Segoe UI;
}

.container{
    width:700px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:15px;
}

input{
    width:100%;
    padding:12px;
    margin-top:10px;
    margin-bottom:20px;
}

.btn{
    background:#6C63FF;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:8px;
    cursor:pointer;
}

</style>
</head>

<body>

<div class="container">

<h2>Edit Question</h2>
<form action="update-question" method="post">

<input type="hidden"
       name="questionId"
       value="<%=question.getQuestionId()%>">

<label>Question</label>

<input type="text"
       name="questionText"
       value="<%=question.getQuestionText()%>">

<br><br>

<%
for(QuestionOption option : options){
%>

<input type="hidden"
       name="optionId"
       value="<%=option.getOptionId()%>">

<label>Option</label>

<input type="text"
       name="optionText"
       value="<%=option.getOptionText()%>">

<label>Personality Type</label>

<select name="personalityType">

<option value="Introvert"
<%=option.getPersonalityType().equals("Introvert")?"selected":""%>>
Introvert
</option>

<option value="Extrovert"
<%=option.getPersonalityType().equals("Extrovert")?"selected":""%>>
Extrovert
</option>

<option value="Ambivert"
<%=option.getPersonalityType().equals("Ambivert")?"selected":""%>>
Ambivert
</option>

</select>

<br><br>

<%
}
%>

<button type="submit">
Update Question
</button>

</form>

</div>

</body>
</html>