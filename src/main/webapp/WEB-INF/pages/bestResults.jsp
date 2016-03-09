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
    <title>Best Results Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/smartQuiz.css" rel="stylesheet">

</head>
<body>

<%@ include file="panels/header.jsp" %>


<div class="container">
    <div class="row">
        <div class="col-md-8 no-float center-block">
            <div class="panel panel-primary center-block">
                <div class="panel-heading">
                    <h3 class="panel-title">Best Results</h3>
                </div>

                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th>User name</th>
                        <th>Quiz name</th>
                        <th>Quiz owner</th>
                        <th>Date</th>
                        <th>Result</th>
                    </tr>
                    <c:forEach items="${bestResults}" var="br" varStatus="status">
                        <tr>
                            <td>${br.userName}</td>
                            <td>${br.quizName}</td>
                            <td>${br.quizOwnerName}</td>
                            <td>${br.endDate}</td>
                            <td>${br.result}</td>
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
