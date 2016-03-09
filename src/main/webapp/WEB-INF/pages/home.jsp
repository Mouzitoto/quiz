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
    <title>Home Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/smartQuiz.css" rel="stylesheet">


</head>
<body>

<%@ include file="panels/header.jsp" %>

<%--SEARCH BOX--%>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="row">
                <form action="/home" method="POST">
                    <div class="input-group stylish-input-group">
                        <input name="quizName" type="text" class="form-control" placeholder="Search for quiz">
                        <span class="input-group-addon">
                            <button type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Search results</h3>
                    </div>
                    <table class="table table-hover table-bordered">
                        <tbody>
                        <c:forEach items="${quizes}" var="q" varStatus="status">
                            <tr>
                                <td><a href="/quizInfo/${q.id}">
                                    <div>${q.name}</div>
                                </a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
