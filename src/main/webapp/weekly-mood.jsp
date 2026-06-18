<%@ page import="java.util.Map" %>

<%
Map<String,Integer> weeklyData =
(Map<String,Integer>)
request.getAttribute("weeklyData");

String labels = "";
String values = "";

if(weeklyData != null){

    for(Map.Entry<String,Integer> entry :
            weeklyData.entrySet()){

        labels += "'" + entry.getKey() + "',";
        values += entry.getValue() + ",";
    }
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Weekly Mood Analysis</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

body{
    background:#f4f6f9;
    font-family:Arial;
    padding:30px;
}

.card{
    background:white;
    padding:40px;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
    width:95%;
    margin:auto;
}

h2{
    text-align:center;
    margin-bottom:30px;
}

canvas{
    max-width:900px;
    margin:auto;
}

.debug{
    background:#eee;
    padding:10px;
    margin-bottom:20px;
}

</style>

</head>

<body>

<div class="card">

<h2>Weekly Mood Analysis</h2>

<div class="debug">
Weekly Data :
<%= weeklyData %>
</div>

<div style="width:100%;height:500px;">
    <canvas id="weeklyChart"></canvas>
    <div style="
display:flex;
justify-content:center;
gap:25px;
flex-wrap:wrap;
font-size:15px;
font-weight:bold;
margin-top:20px;
">

<div>
<span style="
display:inline-block;
width:15px;
height:15px;
background:#4CAF50;
border-radius:3px;
"></span>
Happy / Excited (5)
</div>

<div>
<span style="
display:inline-block;
width:15px;
height:15px;
background:#2196F3;
border-radius:3px;
"></span>
Calm (4)
</div>

<div>
<span style="
display:inline-block;
width:15px;
height:15px;
background:#FFC107;
border-radius:3px;
"></span>
Neutral / Tired (3)
</div>

<div>
<span style="
display:inline-block;
width:15px;
height:15px;
background:#FF9800;
border-radius:3px;
"></span>
Anxious (2)
</div>

<div>
<span style="
display:inline-block;
width:15px;
height:15px;
background:#F44336;
border-radius:3px;
"></span>
Sad / Angry (1)
</div>

</div>
    
</div>

</div>
<script>

const labels = [
<%= labels %>
];

const values = [
<%= values %>
];

// Dynamic colors based on mood score
let colors = [];

values.forEach(score => {

    if(score >= 5){
        colors.push("#4CAF50"); // Happy
    }
    else if(score >= 4){
        colors.push("#2196F3"); // Calm
    }
    else if(score >= 3){
        colors.push("#FFC107"); // Neutral
    }
    else if(score >= 2){
        colors.push("#FF9800"); // Anxious
    }
    else{
        colors.push("#F44336"); // Sad/Angry
    }

});

const ctx =
document.getElementById(
"weeklyChart"
);

new Chart(ctx, {

    type: 'bar',

    data: {

        labels: labels,

        datasets: [{

            label: 'Mood Score',

            data: values,

            backgroundColor: colors,

            borderRadius: 10

        }]

    },

    options: {

        responsive: true,

        scales: {

            y: {

                beginAtZero: true,
                max: 5

            }

        }

    }

});

</script>

</body>
</html>