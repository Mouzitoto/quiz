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
    <%--custom sign in css--%>
    <link href="/resources/css/smartquiz.css" rel="stylesheet">


</head>
<body>

<%--HEADER--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <%--Logo--%>
        <div class="navbar-header">
            <a href="#" class="pull-left"><img class="logo" src="/resources/img/logo-gray.png"></a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%--middle menu--%>
            <ul class="nav navbar-nav middle-menu">
                <li><a href="#">My quizes</a></li>
                <li><a href="#">Create quiz</a></li>
                <li><a href="#">My results</a></li>
                <li><a href="#">Best results</a></li>
            </ul>
            <%--right menu--%>
            <ul class="nav navbar-nav navbar-right">
                <li><span class="logged-user-menu-block">Logged in as <a>${user.fullName}</a></span></li>
                <li><a href="#">Log out</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<%--SEARCH BOX--%>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div id="imaginary_container">
                <div class="input-group stylish-input-group">
                    <input type="text" class="form-control"  placeholder="Search for quiz" >
                    <span class="input-group-addon">
                        <button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
