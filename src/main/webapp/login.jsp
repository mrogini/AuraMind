
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuraMind Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#1b2d5a,#08142f);
    overflow:hidden;
}

/* Background Circles */

.circle{
    position:absolute;
    border-radius:50%;
}

.circle1{
    width:220px;
    height:220px;
    background:#d9b3ff;
    left:180px;
    top:300px;
    box-shadow:0 0 60px #d9b3ff;
}

.circle2{
    width:250px;
    height:250px;
    background:#00bfff;
    left:350px;
    bottom:40px;
    box-shadow:0 0 60px #00bfff;
}

.circle3{
    width:300px;
    height:300px;
    background:#6fd3ff;
    right:320px;
    top:50px;
    box-shadow:0 0 60px #6fd3ff;
}

.circle4{
    width:260px;
    height:260px;
    background:#a64dff;
    right:180px;
    top:280px;
    box-shadow:0 0 60px #a64dff;
}

/* Login Box */

.login-box{

    width:500px;

    padding:50px;

    border-radius:25px;

    background:rgba(255,255,255,0.08);

    backdrop-filter:blur(15px);

    border:2px solid rgba(255,255,255,0.2);

    text-align:center;

    color:white;

    z-index:100;
}

.logo{
    font-size:28px;
    font-weight:bold;
    margin-bottom:15px;
}

h1{
    margin-bottom:30px;
    font-size:42px;
}

.input-box{
    margin-bottom:20px;
}

.input-box input{

    width:100%;

    padding:15px;

    border:none;

    border-radius:12px;

    background:#4c5c99;

    color:white;

    font-size:16px;
}

.input-box input::placeholder{
    color:#ddd;
}

.forgot{
    text-align:right;
    margin-bottom:20px;
}

.forgot a{
    color:white;
    text-decoration:none;
}

.login-btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:12px;

    background:#5f7dff;

    color:white;

    font-size:18px;

    cursor:pointer;
}

.login-btn:hover{
    background:#7690ff;
}

.signup{
    margin-top:25px;
}

.signup a{
    color:#b7c7ff;
    text-decoration:none;
    font-weight:bold;
}

/* Success Message */

.toast{
    position:fixed;
    top:20px;
    right:20px;
    background:#28a745;
    color:white;
    padding:15px 20px;
    border-radius:10px;
    z-index:999;
}

</style>
</head>

<body>

<%
String success = request.getParameter("success");
if(success != null){
%>

<div class="toast" id="toast">
Registration Successful ✓
</div>

<script>
setTimeout(function(){
document.getElementById("toast").style.display="none";
},3000);
</script>

<%
}
%>

<div class="circle circle1"></div>
<div class="circle circle2"></div>
<div class="circle circle3"></div>
<div class="circle circle4"></div>

<div class="login-box">

<div class="logo">
🧠 AuraMind
</div>

<h1>Sign In</h1>

<form action="login" method="post">

<div class="input-box">
<input type="email"
       name="email"
       placeholder="Email"
       required>
</div>

<div class="input-box">
<input type="password"
       name="password"
       placeholder="Password"
       required>
</div>

<div class="forgot">
<a href="#">Forgot Password?</a>
</div>

<button type="submit" class="login-btn">
Login
</button>

</form>

<div class="signup">
Don't have an account?
<a href="register.jsp">Sign Up</a>
</div>

</div>

</body>
</html>

