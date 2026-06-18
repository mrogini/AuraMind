
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuraMind Register</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
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
    left:120px;
    top:150px;
    box-shadow:0 0 60px #d9b3ff;
}

.circle2{
    width:260px;
    height:260px;
    background:#00bfff;
    left:250px;
    bottom:-50px;
    box-shadow:0 0 60px #00bfff;
}

.circle3{
    width:280px;
    height:280px;
    background:#6fd3ff;
    right:250px;
    top:20px;
    box-shadow:0 0 60px #6fd3ff;
}

.circle4{
    width:240px;
    height:240px;
    background:#a64dff;
    right:120px;
    top:250px;
    box-shadow:0 0 60px #a64dff;
}

/* Register Box */

.register-box{

    width:550px;

    padding:35px;

    border-radius:25px;

    background:rgba(255,255,255,0.08);

    backdrop-filter:blur(15px);

    border:2px solid rgba(255,255,255,0.2);

    color:white;

    z-index:100;
}

.logo{
    text-align:center;
    font-size:28px;
    font-weight:bold;
    margin-bottom:10px;
}

h2{
    text-align:center;
    margin-bottom:25px;
    font-size:34px;
}

.input-box{
    margin-bottom:15px;
}

.input-box input,
.input-box select{

    width:100%;

    padding:14px;

    border:none;

    border-radius:12px;

    background:#4c5c99;

    color:white;

    font-size:15px;
}

.input-box input::placeholder{
    color:#ddd;
}

.input-box select option{
    color:black;
}

.register-btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:12px;

    background:#5f7dff;

    color:white;

    font-size:18px;

    cursor:pointer;

    margin-top:10px;
}

.register-btn:hover{
    background:#7690ff;
}

.login-link{
    text-align:center;
    margin-top:20px;
}

.login-link a{
    color:#b7c7ff;
    text-decoration:none;
    font-weight:bold;
}

</style>
</head>

<body>

<div class="circle circle1"></div>
<div class="circle circle2"></div>
<div class="circle circle3"></div>
<div class="circle circle4"></div>

<div class="register-box">

<div class="logo">
🧠 AuraMind
</div>

<h2>Create Account</h2>

<form action="register" method="post">

<div class="input-box">
<input type="text"
       name="name"
       placeholder="Full Name"
       required>
</div>

<div class="input-box">
<input type="email"
       name="email"
       placeholder="Email Address"
       required>
</div>

<div class="input-box">
<input type="password"
       name="password"
       placeholder="Password"
       required>
</div>

<div class="input-box">
<input type="number"
       name="age"
       placeholder="Age"
       required>
</div>

<div class="input-box">
<select name="gender">

<option value="">Select Gender</option>
<option>Male</option>
<option>Female</option>
<option>Other</option>

</select>
</div>

<button type="submit"
        class="register-btn">
Register
</button>

</form>

<div class="login-link">
Already have an account?
<a href="login.jsp">Login</a>
</div>

</div>

</body>
</html>
