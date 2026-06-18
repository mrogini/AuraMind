<%@ page import="java.util.*" %>
<%@ page import="com.auramind.model.Mood" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Mood History</title>

<style>

body{
    font-family:Arial;
    background:#f4f6f9;
    padding:20px;
}

.container{
    max-width:900px;
    margin:auto;
}

.card{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

table{
    width:100%;
    border-collapse:collapse;
}

th,td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

th{
    background:#4CAF50;
    color:white;
}

.btn{
    display:inline-block;
    padding:10px 15px;
    background:#4CAF50;
    color:white;
    text-decoration:none;
    border-radius:5px;
    margin-top:15px;
}

</style>

</head>

<body>

<div class="container">

<div class="card">

<h2>Mood History</h2>

<table>

<tr>
<th>Date</th>
<th>Mood</th>
<th>Score</th>
</tr>

<%

List<Mood> moods =
(List<Mood>)request.getAttribute("moods");

if(moods != null){

for(Mood mood : moods){
%>

<tr>

<td>
<%= mood.getEntryDate() %>
</td>

<td>
<%= mood.getMood() %>
</td>

<td>
<%= mood.getMoodScore() %>
</td>

</tr>

<%
}
}
%>

</table>

<br>

<a class="btn"
href="dashboard.jsp">

Back to Dashboard

</a>

</div>

</div>

</body>
</html>