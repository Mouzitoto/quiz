<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ruslan.babich
  Date: 27.01.2016
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/signIn.css" rel="stylesheet">


</head>
<body>
<div class="container">
    <div class="login-container">
        <div id="output"></div>
        <div class="avatar"></div>
        <div class="form-box">
            <form action="/home" method="post">
                <input name="username" type="text" placeholder="username">
                <input name="password" type="password" placeholder="password">
                <button class="btn btn-info btn-block login" type="submit">Login</button>
            </form>
            <br/>
            <a href="/registration">Registration</a>
        </div>
    </div>
</div>
</body>
</html>
