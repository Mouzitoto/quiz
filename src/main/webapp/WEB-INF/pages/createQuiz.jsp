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
    <title>Create Quiz Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/smartQuiz.css" rel="stylesheet">


</head>
<body>

<%@ include file="panels/header.jsp" %>


<div class="container">
    <form class="col-centered" action="/createQuiz">
        <div class="form-group">
            <label for="quizName">Enter quiz name: </label>
            <input type="text" class="form-control" id="quizName" name="quizName">
        </div>
        <button type="submit" class="btn btn-info">Create quiz</button>
    </form>
</div>


</body>
</html>
