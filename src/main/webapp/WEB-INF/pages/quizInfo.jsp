<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ruslan.babich
  Date: 01.03.2016
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz Info Page</title>

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
            <table class="table table-bordered">
                <tr>
                    <td>Quiz name</td>
                    <td>${quiz.name}</td>
                </tr>
                <tr>
                    <td>Quiz creator</td>
                    <td>${quizCreator.fullName}</td>
                </tr>
                <tr>
                    <td>Question count</td>
                    <td>${questionCount}</td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><%--TODO: add description for quiz--%></td>
                </tr>
            </table>
            <br/>
            <a href="/startQuiz/${quiz.id}" class="btn btn-info">Start the Quiz</a>
        </div>
    </div>
</div>


</body>
</html>
