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
    <title>Edit Quiz Page</title>

    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/smartQuiz.css" rel="stylesheet">

    <%--custom js--%>
    <script src="/resources/js/addQuestionAndAnswers.js"></script>
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
                <input type="text" id="quizName" name="quizName" class="form-control" value="${quiz.name}" readOnly/>
                <a id="editQuizName" class="" onclick="enableQuizName()">Edit</a>
                <a id="saveQuizName" class="hide" onclick="updateQuizName()">Save</a>
                <a id="cancelQuizNameEdition" class="hide" onclick="disableQuizName()">Cancel</a>
                <input type="button" onclick="addQAForm()" value="Add question" class="pull-right"/>
            </div>
            <div id="questionsContainer" class="row">
                <c:forEach items="${questions}" var="questions" varStatus="status">
                    <div id="displayQuestionBlock${questions.id}" class="">
                        <div class="col-md-12">
                            <hr class="questions-hr">
                        </div>
                        <div class="col-md-12">
                            <label>${questions.body}</label>
                            <a class="pull-right" onclick="showEditQuestionBlock(${questions.id})">Edit</a>
                        </div>
                        <c:forEach items="${questions.answers}" var="answers" varStatus="status">
                            <div class="col-md-6">
                                <span
                                        <c:if test="${answers.correct}">class="text-success bold"</c:if>>${answers.body}</span>
                            </div>
                        </c:forEach>
                    </div>
                    <%--edit question block--%>
                    <div id="editQuestionBlock${questions.id}" class="hide">
                        <div class="col-md-12">
                            <hr class="questions-hr">
                        </div>
                        <div class="col-md-12">
                            <input type="text" class="form-control question-input" id="question${questions.id}" value="${questions.body}"/>
                            <a class="pull-right" onclick="updateQuestionAndAnswers(${questions.id})">Save</a>
                            <a class="pull-right cancel-btn" onclick="hideEditQuestionBlock(${questions.id})">Cancel</a>
                        </div>
                        <c:forEach items="${questions.answers}" var="answers" varStatus="status">
                            <div class="col-md-6">
                                <input type="checkbox" id="answerIsCorrect${answers.id}" <c:if test="${answers.correct}">checked</c:if>/>
                                <input type="text" class="form-control answer-input" db-id="${answers.id}" value="${answers.body}"/>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
                <div class="col-md-12">
                    <hr class="questions-hr">
                </div>
            </div>
        </div>


    </div>
</div>


</body>
</html>
