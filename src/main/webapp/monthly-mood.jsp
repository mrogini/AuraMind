<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
Map<Integer,String> moodMap =
(Map<Integer,String>)request.getAttribute("moodMap");

LocalDate today = LocalDate.now();

String monthName =
today.getMonth().getDisplayName(
TextStyle.FULL,
Locale.ENGLISH);

int year = today.getYear();
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Monthly Mood Analysis</title>

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
    padding:30px;
}

.container{
    max-width:1200px;
    margin:auto;
}

.card{
    background:white;
    padding:30px;
    border-radius:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.1);
}

.month-title{
    text-align:center;
    font-size:32px;
    font-weight:bold;
    color:#2c3e50;
}

.sub-title{
    text-align:center;
    color:#7f8c8d;
    margin-bottom:25px;
}

.calendar{
    display:grid;
    grid-template-columns:repeat(7,1fr);
    gap:10px;
}

.day-header{
    background:#2c3e50;
    color:white;
    text-align:center;
    padding:12px;
    border-radius:10px;
    font-weight:bold;
}

.day{
    min-height:100px;
    border-radius:12px;
    padding:10px;
    background:#ecf0f1;
    text-align:center;
}

.day-number{
    font-weight:bold;
    margin-bottom:10px;
}

.mood{
    padding:6px;
    border-radius:8px;
    color:white;
    font-size:12px;
}

.happy{
    background:#4CAF50;
}

.calm{
    background:#2196F3;
}

.neutral{
    background:#FFC107;
    color:black;
}

.anxious{
    background:#FF9800;
}

.sad{
    background:#F44336;
}

.legend{
    margin-top:30px;
    display:flex;
    justify-content:center;
    gap:20px;
    flex-wrap:wrap;
}

.legend-item{
    display:flex;
    align-items:center;
    gap:8px;
}

.color{
    width:15px;
    height:15px;
    border-radius:4px;
}
.month-title{
    text-align:center;
    font-size:32px;
    font-weight:bold;
    color:#2c3e50;
    margin-bottom:5px;
}

.sub-title{
    text-align:center;
    color:#7f8c8d;
    margin-bottom:25px;
    font-size:15px;
}
</style>

</head>

<body>

<div class="container">

<div class="card">

<div class="month-title">
<%= monthName %> <%= year %>
</div>

<div class="sub-title">
Monthly Mood Analysis
</div>

<div class="calendar">

<div class="day-header">Sun</div>
<div class="day-header">Mon</div>
<div class="day-header">Tue</div>
<div class="day-header">Wed</div>
<div class="day-header">Thu</div>
<div class="day-header">Fri</div>
<div class="day-header">Sat</div>

<%
for(int i=1;i<=31;i++){

String mood = null;

if(moodMap != null){
mood = moodMap.get(i);
}

String cssClass="";

if("Happy".equals(mood) ||
"Excited".equals(mood)){


cssClass="happy";

}
else if("Calm".equals(mood)){


cssClass="calm";


}
else if("Tired".equals(mood)){


cssClass="neutral";


}
else if("Anxious".equals(mood)){


cssClass="anxious";


}
else if("Sad".equals(mood) ||
"Angry".equals(mood)){


cssClass="sad";


}
%>

<div class="day">

<div class="day-number">
<%= i %>
</div>

<%
if(mood != null){
%>

<div class="mood <%= cssClass %>">
<%= mood %>
</div>

<%
}
%>

</div>

<%
}
%>

</div>

<div class="legend">

<div class="legend-item">
<div class="color" style="background:#4CAF50"></div>
Happy / Excited
</div>

<div class="legend-item">
<div class="color" style="background:#2196F3"></div>
Calm
</div>

<div class="legend-item">
<div class="color" style="background:#FFC107"></div>
Tired
</div>

<div class="legend-item">
<div class="color" style="background:#FF9800"></div>
Anxious
</div>

<div class="legend-item">
<div class="color" style="background:#F44336"></div>
Sad / Angry
</div>

</div>

</div>

</div>

</body>
</html>


