<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mood Tracker</title>
    <meta charset="UTF-8">
</head>
<body>

<h2>How are you feeling today?</h2>

<form action="saveMood" method="post">

    <input type="radio" name="mood" value="Happy"> 😊 Happy <br><br>

    <input type="radio" name="mood" value="Calm"> 😌 Calm <br><br>

    <input type="radio" name="mood" value="Sad"> 😔 Sad <br><br>

    <input type="radio" name="mood" value="Angry"> 😡 Angry <br><br>

    <input type="radio" name="mood" value="Anxious"> 😰 Anxious <br><br>

    <input type="radio" name="mood" value="Excited"> 🤩 Excited <br><br>

    <input type="radio" name="mood" value="Tired"> 😴 Tired <br><br>

    <button type="submit">
        Save Mood
    </button>

</form>

</body>
</html>