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
    <title>Registration Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/registration.css" rel="stylesheet">

    <%--password validation--%>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("password").onchange = validatePassword;
            document.getElementById("password_confirmation").onchange = validatePassword;
        }
        function validatePassword(){
            var pass2=document.getElementById("password_confirmation").value;
            var pass1=document.getElementById("password").value;
            if(pass1!=pass2)
                document.getElementById("password_confirmation").setCustomValidity("Passwords Don't Match");
            else
                //empty string means no validation error
                document.getElementById("password_confirmation").setCustomValidity('');
        }
    </script>

</head>
<body>
<div class="container">
    <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please fill the registration form
                        <small>It's free!</small>
                    </h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="/register" method="POST">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="login" id="login" class="form-control input-sm"
                                           placeholder="Login" required>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="name" id="name" class="form-control input-sm"
                                           placeholder="Name" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="email" name="email" id="email" class="form-control input-sm"
                                   placeholder="Email Address" required>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control input-sm"
                                           placeholder="Password" required>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="password_confirmation" id="password_confirmation"
                                           class="form-control input-sm" placeholder="Confirm Password" required>
                                </div>
                            </div>
                        </div>

                        <input type="submit" value="Register" class="btn btn-info btn-block">

                    </form>
                </div>
            </div>
        </div>
    </div>
    <br/>

    <%--error message block--%>
    <div class="row ${errorBlockClass}">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
            <div class="panel panel-default">
                <h4 class="text-center text-danger">${errorMsg}</h4>
            </div>
        </div>
    </div>
</div>
</body>
</html>
