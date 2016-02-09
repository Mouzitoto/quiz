<%--
  Created by IntelliJ IDEA.
  User: ruslan.babich
  Date: 27.01.2016
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index Page</title>
</head>
<body>
<form action="/select">
    <input type="submit" value="Select"/>
</form>

<br/>
<br/>
<br/>
<form action="/selectAll">
    <input type="submit" value="Select All"/>
</form>
<br/>
<br/>
<br/>
<form action="/insert">
    <label>Login: </label>
    <input type="text" name="login"/>
    <label>FullName: </label>
    <input type="text" name="fullname"/>
    <label>Email: </label>
    <input type="text" name="email"/>
    <label>Password: </label>
    <input type="text" name="password"/>
    <input type="submit" value="Insert"/>
</form>
<br/>
<br/>
<br/>
<form action="/signIn">
    <input type="submit" value="Sign in"/>
</form>
</body>
</html>
