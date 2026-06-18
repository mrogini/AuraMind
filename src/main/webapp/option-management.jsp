<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Option Management</title>
</head>
<body>

<h2>Add Question Option</h2>

<form action="addOption" method="post">

    Question ID:
    <input type="number"
           name="questionId"
           required>
    <br><br>

    Option Text:
    <input type="text"
           name="optionText"
           required>
    <br><br>

    Personality Type:

    <select name="personalityType">

        <option value="Introvert">
            Introvert
        </option>

        <option value="Extrovert">
            Extrovert
        </option>

        <option value="Ambivert">
            Ambivert
        </option>

    </select>

    <br><br>

    <button type="submit">
        Add Option
    </button>

</form>

</body>
</html>