<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--Bootstrap core CSS--%>
    <link href="/resources/frameworks/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--custom css--%>
    <link href="/resources/css/smartQuiz.css" rel="stylesheet">
    <title>TMP Page</title>
</head>
<body>
<div class="container-fluid">
    <div class="container">
        <div class="col-md-6 no-float center-block">

            <form action="">
                <div class="form-group col-md-12">
                    <label>Question</label>
                    <input type="text" name="question" class="form-control">
                </div>

                <div class="form-group col-md-6">
                    <label>Answer A</label>
                    <input type="text" name="answerA" class="form-control">
                </div>

                <div class="form-group col-md-6">
                    <label>Answer B</label>
                    <input type="text" name="answerB" class="form-control">
                </div>

                <div class="form-group col-md-6">
                    <label>Answer C</label>
                    <input type="text" name="answerC" class="form-control">
                </div>

                <div class="form-group col-md-6">
                    <label>Answer D</label>
                    <input type="text" name="answerD" class="form-control">
                </div>
                <div class="form-group col-md-6">
                    <input type="submit" value="Save question" onclick="addQuestionToDB()"/>
                </div>
                <div class="form-group col-md-6">
                    <a href="">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>