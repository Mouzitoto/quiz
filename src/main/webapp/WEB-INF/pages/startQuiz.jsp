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
    <title>Start Quiz Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/smartQuiz.css" rel="stylesheet">

    <%--custom js--%>
    <script src="/resources/js/smartQuiz.js"></script>
</head>
<body>

<%@ include file="panels/header.jsp" %>

<div class="container-fluid">
    <div class="container">
        <div class="col-md-6 no-float center-block">
            <div class="row">
                <label>Quiz Name: ${quiz.name}</label>
            </div>
            <div class="row">
                <c:forEach items="${questions}" var="questions" varStatus="status">
                    <div class="col-md-12">
                        <label>${questions.body}</label>
                    </div>
                    <c:forEach items="${questions.answers}" var="answers" varStatus="status">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label><input type="checkbox" dbid="${answers.id}"/>${answers.body}</label>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-md-12">
                        <hr class="questions-hr">
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <input type="button" class="btn-info" onclick="finishQuiz()" value="FINISH" />
            </div>
        </div>
    </div>
</div>


</body>
</html>
