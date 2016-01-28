<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ruslan.babich
  Date: 28.01.2016
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select All Users</title>
</head>
<body>
<h1>User count: ${userCount}</h1>
<table>
    <tr>
        <th>id</th>
        <th>Login</th>
        <th>Email</th>
        <th>Full name</th>
        <th>Password</th>
    </tr>
    <c:forEach items="${list}" var="item">
        <tr>
            <td><c:out value="${item.id}"/></td>
            <td><c:out value="${item.login}"/></td>
            <td><c:out value="${item.email}"/></td>
            <td><c:out value="${item.fullName}"/></td>
            <td><c:out value="${item.passwordHash}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
