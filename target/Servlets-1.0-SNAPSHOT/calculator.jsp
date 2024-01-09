<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
        }

        h1 {
            color: #009688;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"], input[type="submit"], select {
            padding: 10px;
            margin: 5px;
            border: 1px solid #009688;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #009688;
            color: white;
            cursor: pointer;
        }

        h2 {
            color: #009688;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>Calculator</h1>
<form action="Calculate" method="get">
    Enter 1st number: <input type="text" name="num1">
    <br> Enter 2nd number: <input type="text" name="num2">
    <br> Select operation:
    <select name="operation">
        <option value="add">Addition</option>
        <option value="subtract">Subtraction</option>
        <option value="multiply">Multiplication</option>
        <option value="divide">Division</option>
    </select>
    <br> <input type="submit" value="Calculate">
</form>

    <%
    // Check if result is present in the request attribute
    Object resultObject = request.getAttribute("result");
    if (resultObject != null) {
        if (resultObject instanceof Integer) {
            // If the result is an integer, convert it to a string
            String result = String.valueOf(resultObject);
%>
<h2>Result: <%= result %></h2>
    <%
        } else {
            // If the result is already a string, display it directly
%>
<h2>Result: <%= resultObject %></h2>
    <%
        }
    }
%>
