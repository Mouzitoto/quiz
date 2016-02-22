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

</head>
<body>

<%@ include file="panels/header.jsp" %>


<div class="container">
    <h1>Click the filter icon
        <small>(<i class="glyphicon glyphicon-filter"></i>)</small>
    </h1>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Developers</h3>

                    <div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter"
                                  data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
                    </div>
                </div>
                <div class="panel-body">
                    <input type="text" class="form-control" id="dev-table-filter" data-action="filter"
                           data-filters="#dev-table" placeholder="Filter Developers"/>
                </div>
                <table class="table table-hover" id="dev-table">
                    <thead>
                    <tr>
                        <th>Quiz Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userQuizes}" var="uQ" varStatus="status">
                        <tr>
                            <td>${uQ.name}</td>
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
