<%@ page import="com.auramind.model.Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="com.auramind.model.User" %>
<%@ page import="com.auramind.model.Question" %>

<%
Admin admin = (Admin)session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("admin-login.jsp");
    return;
}

Integer totalUsers = (Integer)request.getAttribute("totalUsers");
Integer totalQuestions = (Integer)request.getAttribute("totalQuestions");
Integer totalMoodEntries = (Integer)request.getAttribute("totalMoodEntries");
Integer totalTests = (Integer)request.getAttribute("totalTests");

List<User> users = (List<User>)request.getAttribute("users");

if(totalUsers==null) totalUsers=0;
if(totalQuestions==null) totalQuestions=0;
if(totalMoodEntries==null) totalMoodEntries=0;
if(totalTests==null) totalTests=0;

List<Question> questionList = (List<Question>)request.getAttribute("questionList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuraMind Admin Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f5f7ff;
}

.container{
    display:flex;
}

/* Sidebar */

.sidebar{
    width:250px;
    height:100vh;
    background:#6C63FF;
    color:white;
    position:fixed;
}

.logo{
    text-align:center;
    padding:25px;
    font-size:24px;
    font-weight:bold;
    border-bottom:1px solid rgba(255,255,255,.2);
}

.menu{
    padding:20px;
}

.menu a{
    display:block;
    color:white;
    text-decoration:none;
    padding:15px;
    margin-bottom:10px;
    border-radius:10px;
}

.menu a:hover{
    background:rgba(255,255,255,.2);
}

/* Main Content */
.main{
    margin-left:250px;
    padding:30px;
    width:calc(100% - 250px);
    min-height:100vh;
}
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h1{
    color:#333;
}

.admin-box{
    background:white;
    padding:10px 20px;
    border-radius:10px;
    box-shadow:0 2px 8px rgba(0,0,0,.1);
}

/* Cards */

.cards{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
    margin-top:30px;
}

.card{
    background:white;
    padding:25px;
    border-radius:20px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.card h3{
    color:#666;
}

.card h2{
    margin-top:10px;
    color:#6C63FF;
}

/* Table */

.table-box{
    background:white;
    margin-top:30px;
    padding:20px;
    border-radius:20px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
    overflow-x:auto;
    width:100%;
}

.question-col{
    min-width:500px;
}

.table-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.search-box{
    width:300px;
    padding:12px;
    border:1px solid #ddd;
    border-radius:10px;
    margin-bottom:20px;
}

.add-btn{
    background:#6C63FF;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:10px;
    cursor:pointer;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#6C63FF;
    color:white;
    padding:15px;
    text-align:left;
}

table td{
    padding:12px;
    text-align:left;
    border-bottom:1px solid #eee;
}

table tr:hover{
    background:#f8f8ff;
}

.option-btn{
    background:#17a2b8;
    color:white;
    border:none;
    padding:8px 15px;
    border-radius:8px;
    cursor:pointer;
}
.view-btn{
    background:#17a2b8;
    color:white;
    border:none;
    padding:10px 15px;
    border-radius:8px;
    cursor:pointer;
}

.edit-btn{
    background:#ffc107;
    border:none;
    padding:10px 15px;
    border-radius:8px;
    cursor:pointer;
}

.delete-btn{
    background:#dc3545;
    color:white;
    border:none;
    padding:10px 15px;
    border-radius:8px;
    cursor:pointer;
}

/* Modal common */
.modal-overlay{
    display:none;
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,.5);
    z-index:1000;
}

.modal-box{
    background:white;
    width:450px;
    margin:80px auto;
    padding:25px;
    border-radius:15px;
}

.modal-box input{
    width:100%;
    margin-bottom:15px;
}

</style>
</head>

<body>

<div class="container">

    <!-- Sidebar -->

    <div class="sidebar">

        <div class="logo">
            AuraMind
        </div>

        <div class="menu">

           

            <a href="login.jsp"> Users dashboard</a>
<a href="admin-login.jsp"> Logout</a>

        </div>

    </div>

    <!-- Main -->

    <div class="main">

        <div class="header">

            <h1>Admin Dashboard</h1>

            <div class="admin-box">
                Welcome,
                <%= admin.getUsername() %>
            </div>

        </div>

        <!-- Cards -->

        <div class="cards">

            <div class="card">
                <h3>Total Users</h3>
                <h2><%= totalUsers %></h2>
            </div>

            <div class="card">
                <h3>Mood Entries</h3>
                <h2><%= totalMoodEntries %></h2>
            </div>

            <div class="card">
                <h3>Questions</h3>
                <h2><%= totalQuestions %></h2>
            </div>

            <div class="card">
                <h3>Personality Tests</h3>
                <h2><%= totalTests %></h2>
            </div>

        </div>

        <!-- User Table -->

        <div class="table-box">

            <h2>Recent Users</h2>

            <br>

            <table>

                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tbody>

                <%
                if(users!=null){
                    for(User user : users){
                %>

                <tr>

                    <td><%= user.getId() %></td>

                    <td><%= user.getName() %></td>

                    <td><%= user.getEmail() %></td>

                    <td>

                        <button
                            class="view-btn"
                            data-name="<%= user.getName() %>"
                            data-email="<%= user.getEmail() %>"
                            data-age="<%= user.getAge() %>"
                            data-gender="<%= user.getGender() %>"
                            data-personality="<%= user.getPersonalityType() %>"
                            onclick="showUser(this)">
                            View
                        </button>

                    </td>

                </tr>

                <%
                    }
                }
                %>

                </tbody>

            </table>

        </div>


        <!-- Questions Table -->

        <div class="table-box">

            <div class="table-header">

                <h2>Personality Questions</h2>

                <button class="add-btn"
                        onclick="openQuestionModal()">
                    + Add Question
                </button>

            </div>

            <input type="text"
                   id="searchInput"
                   placeholder="Search Question..."
                   class="search-box"
                   onkeyup="filterQuestions()">

            <table>

                <thead>
                <tr>
                    <th>ID</th>
                    <th class="question-col">Question</th>
                    <th>Options</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tbody>

                <%
                int count=1;

                if(questionList!=null){
                    for(Question q : questionList){
                %>

                <tr>

                    <td><%= count++ %></td>

                    <td class="question-col">
                        <%= q.getQuestionText() %>
                    </td>

                <td>   <button class="option-btn"
        data-id="<%= q.getQuestionId() %>"
        onclick="viewOptions(this.dataset.id)">
    View Options
</button></td>
<td>
<button class="edit-btn"
        data-id="<%= q.getQuestionId() %>"
        onclick="editQuestion(this.dataset.id)">
    Edit
</button></td>
<td>
<button class="delete-btn"
        data-id="<%= q.getQuestionId() %>"
        onclick="deleteQuestion(this.dataset.id)">
    Delete
</button></td>

                </tr>

                <%
                    }
                }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>


<!-- User Details Modal -->
<div id="userModal" class="modal-overlay">

    <div class="modal-box">

        <h2>User Details</h2>
        <br>

        <p><b>Name:</b> <span id="mName"></span></p>
        <p><b>Email:</b> <span id="mEmail"></span></p>
        <p><b>Age:</b> <span id="mAge"></span></p>
        <p><b>Gender:</b> <span id="mGender"></span></p>
        <p><b>Personality:</b> <span id="mPersonality"></span></p>

        <br>

        <button class="view-btn" onclick="closeModal()">Close</button>

    </div>

</div>


<!-- Add Question Modal -->
<div id="questionModal" class="modal-overlay">

    <div class="modal-box">

        <h2>Add Question</h2>
        <br>

        <form action="add-question" method="post">

            <label>Question Text:</label>
            <input type="text" name="questionText" required>

            <label>Option 1:</label>
            <input type="text" name="option1" required>

            <label>Option 2:</label>
            <input type="text" name="option2" required>

            <label>Option 3:</label>
            <input type="text" name="option3" required>

            <label>Option 4:</label>
            <input type="text" name="option4" required>

            <button type="submit" class="add-btn">Save</button>
            <button type="button" class="delete-btn" onclick="closeQuestionModal()">Cancel</button>

        </form>

    </div>

</div>


<script>

/* ---------- User Modal ---------- */

function showUser(btn){

    document.getElementById("mName").innerHTML = btn.dataset.name;
    document.getElementById("mEmail").innerHTML = btn.dataset.email;
    document.getElementById("mAge").innerHTML = btn.dataset.age;
    document.getElementById("mGender").innerHTML = btn.dataset.gender;
    document.getElementById("mPersonality").innerHTML = btn.dataset.personality;

    document.getElementById("userModal").style.display = "block";
}

function closeModal(){
    document.getElementById("userModal").style.display = "none";
}

/* ---------- Question Modal ---------- */

function openQuestionModal(){
    document.getElementById("questionModal").style.display = "block";
}

function closeQuestionModal(){
    document.getElementById("questionModal").style.display = "none";
}

/* ---------- Question Actions ---------- */

function viewOptions(id){
    window.location = "view-options?questionId=" + id;
}

function editQuestion(id){
    window.location = "edit-question?questionId=" + id;
}

function deleteQuestion(id){
    if(confirm("Delete this question?")){
        window.location = "delete-question?questionId=" + id;
    }
}

/* ---------- Search Filter ---------- */

function filterQuestions(){
    var filter = document.getElementById("searchInput").value.toLowerCase();
    var rows = document.querySelectorAll(".table-box table tbody tr");

    rows.forEach(function(row){
        var questionText = row.cells[1] ? row.cells[1].textContent.toLowerCase() : "";
        row.style.display = questionText.includes(filter) ? "" : "none";
    });
}

/* ---------- Close modals on outside click ---------- */

window.onclick = function(event){
    var userModal = document.getElementById("userModal");
    var questionModal = document.getElementById("questionModal");

    if(event.target === userModal){
        userModal.style.display = "none";
    }
    if(event.target === questionModal){
        questionModal.style.display = "none";
    }
}

</script>

</body>
</html>
