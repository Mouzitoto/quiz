<%--
  Created by IntelliJ IDEA.
  User: ruslan.babich
  Date: 11.02.2016
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>

<%--HEADER--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <%--Logo--%>
        <div class="navbar-header">
            <a href="/home" class="pull-left"><img class="logo" src="/resources/img/logo-gray.png"></a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%--middle menu--%>
            <ul class="nav navbar-nav middle-menu">
                <li><a href="/myQuizes">My quizes</a></li>
                <li><a href="/createQuizPage">Create quiz</a></li>
                <li><a href="#">My results</a></li>
                <li><a href="#">Best results</a></li>
            </ul>
            <%--right menu--%>
            <ul class="nav navbar-nav navbar-right">
                <li><span class="logged-userId-menu-block">Logged in as <a>${user.fullName}</a></span></li>
                <li><a href="/logout">Log out</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<%--END HEADER--%>