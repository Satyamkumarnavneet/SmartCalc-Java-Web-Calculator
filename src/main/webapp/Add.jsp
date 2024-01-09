<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Add Numbers</title>
</head>
<body>
<h1>Add Numbers</h1>
<form action="Add" method="get">
    Enter 1st number: <input type="text" name="num1">
    <br> Enter 2nd number: <input type="text" name="num2">
    <br> <input type="submit" value="Add">
</form>

<%
    // Check if result is present in the request attribute
    String result = (String) request.getAttribute("result");
    if (result != null) {
%>
<h2>Result: <%= result %></h2>
<%
    }
%>

</body>
</html>
