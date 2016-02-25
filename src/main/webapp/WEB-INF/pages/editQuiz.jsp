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
    <title>My Quizes Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/smartQuiz.css" rel="stylesheet">

    <%--custom js--%>
    <script src="/resources/js/smartQuiz.js"></script>
    <%--dont know how to pass this variable to js inside js file... enjoy with this duck tape--%>
    <script>var quizId =<c:out value="${quiz.id}"/></script>
</head>
<body>

<%@ include file="panels/header.jsp" %>

<div class="container-fluid">
    <div class="container">
        <div class="col-md-6 no-float center-block">
            <div class="row">
                <label>Quiz Name</label>
                <input type="text" name="quizName" class="form-control" value="${quiz.name}"/>
                <input type="button" onclick="addQAForm()" value="Add question" class="pull-right"/>
            </div>
            <div id="questionsContainer" class="row">
                <table class="table table-hover">
                    <tbody>
                    <c:forEach items="${questions}" var="questions" varStatus="status">
                        <tr>
                            <td>${questions.body}</td>
                        </tr>

                        <tr>
                        <c:forEach items="${questions.answers}" var="answers" varStatus="status">
                            <td>${answers.body}</td>
                        </c:forEach>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </div>
</div>


</body>
</html>
