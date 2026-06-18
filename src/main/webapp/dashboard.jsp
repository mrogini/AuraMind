<%@ page import="java.util.List" %>
<%@ page import="com.auramind.dao.QuestionDAO" %>
<%@ page import="com.auramind.dao.OptionDAO" %>
<%@ page import="com.auramind.model.Question" %>
<%@ page import="com.auramind.model.QuestionOption" %>

<%@ page import="com.auramind.model.User" %>
<%@ page import="com.auramind.dao.MoodDAO" %>
<%@ page import="com.auramind.model.Mood" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
User user = (User) session.getAttribute("user");

if(user == null){
response.sendRedirect("login.jsp");
return;
}

MoodDAO moodDAO = new MoodDAO();
List<Mood> moodHistory =
        moodDAO.getMoodHistory(user.getId());
    java.util.Map<String,Integer> stats =
        moodDAO.getMoodStatistics(
                user.getId());

String labels = "";
String values = "";

for(java.util.Map.Entry<String,Integer> entry
        : stats.entrySet()){

    labels += "'" +
            entry.getKey() +
            "',";

    values +=
            entry.getValue() +
            ",";
}

if(labels.length() > 0){
    labels =
            labels.substring(
                    0,
                    labels.length()-1);
}

if(values.length() > 0){
    values =
            values.substring(
                    0,
                    values.length()-1);
}

String todayMood = moodDAO.getTodayMood(user.getId());
int totalEntries =
moodDAO.getTotalMoodEntries(user.getId());

double avgScore =
moodDAO.getAverageMoodScore(user.getId());

String frequentMood =
moodDAO.getMostFrequentMood(user.getId());

if(todayMood == null){
todayMood = "No Mood Recorded";
}
%>
<%
QuestionDAO qdao = new QuestionDAO();
OptionDAO odao = new OptionDAO();

List<Question> questions =
qdao.getAllQuestions();

for(Question q : questions){


List<QuestionOption> options =
        odao.getOptionsByQuestionId(
                q.getQuestionId());

q.setOptions(options);


}
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>AuraMind Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:
        "Segoe UI Emoji",
        "Noto Color Emoji",
        "Apple Color Emoji",
        Arial,
        sans-serif;
}

body{
    background:#f4f6f9;
}

.sidebar{
    width:250px;
    height:100vh;
    background:#2c3e50;
    position:fixed;
    left:0;
    top:0;
    color:white;
}

.sidebar h2{
    text-align:center;
    padding:20px;
    border-bottom:1px solid rgba(255,255,255,0.2);
}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    padding:15px 20px;
}

.sidebar a:hover{
    background:#34495e;
}

.main{
    margin-left:250px;
    padding:20px;
}

.card{
    background:white;
    border-radius:12px;
    padding:20px;
    margin-bottom:20px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.cards{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.small-card{
    flex:1;
    min-width:220px;
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.btn{
    background:#4CAF50;
    color:white;
    border:none;
    padding:10px 15px;
    border-radius:5px;
    cursor:pointer;
}
.modal{
    display:none;
    position:fixed;
    z-index:9999;
    left:0;
    top:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.5);
}
.modal-content{
    background:white;
    width:80%;
    max-height:85vh;
    overflow-y:auto;
    margin:3% auto;
    padding:25px;
    border-radius:10px;
}

.close{
    float:right;
    font-size:30px;
    cursor:pointer;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<div class="sidebar">


<h2>AuraMind</h2>

<a href="#" onclick="openMoodModal()">Track Mood</a>

<%
boolean testCompleted =
user.getPersonalityType() != null &&
!user.getPersonalityType().trim().isEmpty();
%>

<% if(!testCompleted){ %>

<a href="#" onclick="openPersonalityModal()">
Personality Test
</a>

<% } else { %>

<div class="submenu">

    <a href="#" onclick="togglePersonalityMenu()">
        Personality Test ▼
    </a>

    <div id="personalitySubmenu"
         style="display:none;
                padding-left:20px;">

        <a href="result.jsp">
            View Result
        </a>

       

        <a href="#" onclick="openPersonalityModal()">
            Retake Test
        </a>

    </div>

</div>

<% } %>

<a href="#" onclick="openHistoryModal()">Mood History</a>



<a href="weekly-mood">
Weekly Analysis
</a>

<a href="monthly-mood">
Monthly Analysis
</a>





<a href="logout">Logout</a>



</div>

<div class="main">


<div class="card">

    <h2>Welcome, <%= user.getName() %></h2>

    <br>

    <p>
    <strong>Email:</strong>
    <%= user.getEmail() %>
    </p>

    <br>

    <p>
    <strong>Personality:</strong>
    <%= user.getPersonalityType() == null ?
    "Not Yet Calculated" :
    user.getPersonalityType() %>
    </p>

</div>

<div class="cards">

    <div class="small-card">
        <h3>Today's Mood</h3>
        <br>
        <p><%= todayMood %></p>
    </div>

    <div class="small-card">
        <h3>Personality Type</h3>
        <br>
        <p>
        <%= user.getPersonalityType() == null ?
        "Not Available" :
        user.getPersonalityType() %>
        </p>
    </div>

  <div class="small-card">
    <h3>Total Entries</h3>
    <br>
    <p><%= totalEntries %></p>
</div>

<div class="small-card">
    <h3>Average Score</h3>
    <br>
    <p><%= String.format("%.1f",avgScore) %>/5</p>
</div>

<div class="small-card">
    <h3>Most Frequent Mood</h3>
    <br>
    <p><%= frequentMood %></p>
</div>

</div>


</div>

<!-- Analytics Modal -->

<div id="analyticsModal" class="modal">


<div class="modal-content">

    <span class="close"
          onclick="closeAnalyticsModal()">
          &times;
    </span>

    

    <br>
<h2>Mood Analytics</h2>

<p>
Visual representation of
your mood records.
</p>

<br>
    <canvas
id="moodChart"
width="400"
height="250">
</canvas>

</div>


</div>

<!-- Profile Modal -->
<div id="personalityModal" class="modal">


<div class="modal-content">

    <span class="close"
          onclick="closePersonalityModal()">
          &times;
    </span>

    <h2>Personality Assessment Test</h2>

    <form action="submit-test" method="post">

    <%

    for(Question q : questions){

    %>

    <div style="margin-bottom:20px;">

        <h4>
            <%= q.getQuestionText() %>
        </h4>

        <%

        if(q.getOptions()!=null){

            for(QuestionOption option :
                    q.getOptions()){

        %>

        <label>

            <input type="radio"

                   name="question_<%= q.getQuestionId() %>"

                   value="<%= option.getPersonalityType() %>"

                   required>

            <%= option.getOptionText() %>

        </label>

        <br><br>

        <%

            }

        }

        %>

    </div>

    <hr>

    <%

    }

    %>

    <br>

    <button class="btn"
            type="submit">

        Submit Test

    </button>

    </form>

</div>

</div>
<div id="moodModal" class="modal">

<div class="modal-content">

<span class="close"
onclick="closeMoodModal()">
&times;
</span>

<h2>Track Today's Mood</h2>

<form action="saveMood" method="post">

<label>Select Mood</label>

<br><br>

<select name="mood" required
style="width:100%;padding:10px;">

<option value="">Choose Mood</option>

<option value="Happy">😊 Happy</option>

<option value="Excited">🤩 Excited</option>

<option value="Calm">😌 Calm</option>

<option value="Tired">😴 Tired</option>

<option value="Anxious">😟 Anxious</option>

<option value="Sad">😢 Sad</option>

<option value="Angry">😠 Angry</option>

</select>

<br><br>

<button type="submit"
class="btn">

Save Mood

</button>

</form>

</div>

</div>
<div id="historyModal" class="modal">

<div class="modal-content">

<span class="close"
onclick="closeHistoryModal()">
&times;
</span>


<h2>Mood History</h2>

<br>

<table style="width:100%;
border-collapse:collapse;">

<tr style="background:#4CAF50;
color:white;">

<th style="padding:10px;">Date</th>

<th style="padding:10px;">Mood</th>

<th style="padding:10px;">Score</th>

</tr>

<%

for(Mood mood : moodHistory){

%>

<tr>

<td style="padding:10px;
border:1px solid #ddd;">

<%= mood.getEntryDate() %>

</td>

<td style="padding:10px;
border:1px solid #ddd;">

<%= mood.getMood() %>

</td>

<td style="padding:10px;
border:1px solid #ddd;">

<%= mood.getMoodScore() %>/5

</td>

</tr>

<%

}

%>

</table>

</div>

</div>
<script>

function openAnalyticsModal(){
    document.getElementById(
    "analyticsModal").style.display="block";
}

function closeAnalyticsModal(){
    document.getElementById(
    "analyticsModal").style.display="none";
}

function openProfileModal(){}
function closeProfileModal(){}

function openMoodModal(){

document.getElementById(
"moodModal"
).style.display="block";

}

function closeMoodModal(){

document.getElementById(
"moodModal"
).style.display="none";

}
function openPersonalityModal(){
    document.getElementById(
        "personalityModal"
    ).style.display = "block";
}

function closePersonalityModal(){
    document.getElementById(
        "personalityModal"
    ).style.display = "none";
}

function openHistoryModal(){

document.getElementById(
"historyModal"
).style.display="block";

}

function closeHistoryModal(){

document.getElementById(
"historyModal"
).style.display="none";

}
window.onclick = function(event){

let personalityModal =
document.getElementById("personalityModal");

let analyticsModal =
document.getElementById("analyticsModal");

let moodModal =
document.getElementById("moodModal");

if(event.target == personalityModal){
personalityModal.style.display="none";
}

if(event.target == analyticsModal){
analyticsModal.style.display="none";
}

if(event.target == moodModal){
moodModal.style.display="none";
}
let historyModal =
document.getElementById("historyModal");

if(event.target == historyModal){
historyModal.style.display="none";
}

}
function togglePersonalityMenu(){

    let menu =
    document.getElementById(
        "personalitySubmenu"
    );

    if(menu.style.display === "none"){

        menu.style.display = "block";

    }else{

        menu.style.display = "none";
    }
}

</script>
<script>

const moodLabels =
"<%= labels %>".split(",");

const moodValues =
"<%= values %>".split(",");

const ctx =
document.getElementById(
"moodChart"
);

new Chart(ctx,{

type:'pie',

data:{

labels:moodLabels,

datasets:[{

data:moodValues,

backgroundColor:[

'#4CAF50',
'#2196F3',
'#FFC107',
'#F44336',
'#9C27B0',
'#00BCD4',
'#795548'

]

}]
}

});

</script>
</body>
</html>
