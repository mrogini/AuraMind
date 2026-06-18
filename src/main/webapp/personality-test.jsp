<%@page import="java.util.*"%>
<%@page import="com.auramind.model.Question"%>
<%@page import="com.auramind.model.QuestionOption"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personality Assessment</title>
</head>

<body>

<h2>Personality Assessment Test</h2>

<form action="submit-test" method="post">

<%
List<Question> questions =
(List<Question>)request.getAttribute("questions");

if(questions != null){

for(Question q : questions){
%>

<div>

<h3><%= q.getQuestionText() %></h3>

<%
if(q.getOptions()!=null){

for(QuestionOption option : q.getOptions()){
%>

<label>

<input type="radio"
       name="question_<%= q.getQuestionId() %>"
value="<%= option.getPersonalityType() %>"       required>

<%= option.getOptionText() %>

</label>

<br><br>

<%
}
}
%>

<hr>

</div>

<%
}
}
%>

<input type="submit" value="Submit Personality Test">

</form>

</body>
</html>