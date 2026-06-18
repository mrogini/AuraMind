<%@ page contentType="text/html;charset=UTF-8" %>

<%
String personality =
(String)session.getAttribute("personalityType");

if(personality == null){
personality = "Not Available";
}

String description = "";
String strengths = "";
String recommendation = "";

if("Introvert".equals(personality)){


description =
"You enjoy calm environments and recharge by spending time alone.";

strengths =
"Focused, Independent, Thoughtful, Good Listener";

recommendation =
"Reading, Journaling, Meditation, Solo Projects";

}
else if("Extrovert".equals(personality)){


description =
"You gain energy from social interaction and enjoy teamwork.";

strengths =
"Outgoing, Confident, Energetic, Social";

recommendation =
"Networking, Team Activities, Public Speaking";

}
else if("Ambivert".equals(personality)){


description =
"You balance both introvert and extrovert traits depending on the situation.";

strengths =
"Flexible, Adaptable, Balanced, Versatile";

recommendation =
"Mix of Social Activities and Personal Reflection";

}
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Personality Result</title>

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
    margin:0;
    padding:40px;
}

.result-card{
    max-width:800px;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 3px 15px rgba(0,0,0,0.15);
}

h1{
    color:#2c3e50;
}

.type{
    font-size:32px;
    color:#4CAF50;
    font-weight:bold;
}

.section{
    margin-top:25px;
}

.btn{
    display:inline-block;
    margin-top:25px;
    background:#4CAF50;
    color:white;
    text-decoration:none;
    padding:12px 20px;
    border-radius:8px;
}

.btn:hover{
    background:#45a049;
}

</style>

</head>

<body>

<div class="result-card">

<h1>Personality Assessment Result</h1>

<div class="type">
<%= personality %>
</div>

<div class="section">
<h3>Description</h3>
<p><%= description %></p>
</div>

<div class="section">
<h3>Strengths</h3>
<p><%= strengths %></p>
</div>

<div class="section">
<h3>Recommended Activities</h3>
<p><%= recommendation %></p>
</div>

<a href="dashboard.jsp" class="btn">
Back To Dashboard
</a>

</div>

</body>
</html>
