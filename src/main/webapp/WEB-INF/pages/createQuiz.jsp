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
    <div class="row">
        <div class="col-md-6 no-float center-block">
            <form action="/createQuiz">
                <div class="form-group">
                    <label for="quizName">Enter new quiz name: </label>
                    <input type="text" class="form-control" id="quizName" name="quizName">
                </div>
                <%--TODO: add description for quiz--%>
                <button type="submit" class="btn btn-info">Create quiz</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>
