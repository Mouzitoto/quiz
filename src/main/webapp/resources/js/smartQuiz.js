/**
 * Created by ruslan.babich on 26.02.2016.
 */

function updateQuizName() {
    var newQuizName = document.getElementById("quizName").value;
    window.location = "/updateQuizName/" + quizId + "/" + newQuizName
}

function enableQuizName() {
    enable("quizName");
    document.getElementById("editQuizName").className += " hide";
    document.getElementById("saveQuizName").className =
        document.getElementById("saveQuizName").className.replace("hide", "");
    document.getElementById("cancelQuizNameEdition").className =
        document.getElementById("cancelQuizNameEdition").className.replace("hide", "");
}

function disableQuizName() {
    disable("quizName");
    document.getElementById("editQuizName").className =
        document.getElementById("editQuizName").className.replace("hide", "");
    document.getElementById("saveQuizName").className += " hide";
    document.getElementById("cancelQuizNameEdition").className += " hide";
}

function showEditQuestionBlock(questionId) {
    document.getElementById("displayQuestionBlock" + questionId).className += " hide";
    document.getElementById("editQuestionBlock" + questionId).className =
        document.getElementById("editQuestionBlock" + questionId).className.replace("hide", "");
}

function hideEditQuestionBlock(questionId) {
    document.getElementById("editQuestionBlock" + questionId).className += " hide";
    document.getElementById("displayQuestionBlock" + questionId).className =
        document.getElementById("displayQuestionBlock" + questionId).className.replace("hide", "");
}

function enable(elementId) {
    //document.getElementById(elementId).removeAttribute("disabled");
    document.getElementById(elementId).readOnly = false;
}

function disable(elementId) {
    document.getElementById(elementId).readOnly = true;
}

function finishQuiz() {
    var answers = [];

    var allInputs = document.getElementsByTagName("input");

    //now find checkboxes from all inputs
    for(var i = 0; i < allInputs.length; i++) {
        if (allInputs[i].type == "checkbox") {
            if (allInputs[i].checked == true) {
                answers.push(allInputs[i].getAttribute("dbid"));
                //this[answer + i] = new Object();
                //this[answer + i].id = allInputs[i].getAttribute("dbid");
            }
        }
    }

    window.location.href = "/finishQuiz/" + quizId + "/" + answers;
}

function updateQuestionAndAnswers(questionId) {
    var answers = []; //answers list

    var allInputs = document.getElementById("editQuestionBlock" + questionId).querySelectorAll("INPUT");

    for(var i = 0; i < allInputs.length; i++) {
        if(allInputs[i].getAttribute("db-id") != null) {
            var answer = new Object();
            answer.id = allInputs[i].getAttribute("db-id");
            answer.body = allInputs[i].value;
            answer.correct = document.getElementById("answerIsCorrect" + answer.id).checked;

            answers.push(answer);
        }
    }

    var question = new Object();
    question.id = questionId;
    question.body = document.getElementById("question" + questionId).value;
    question.answers = answers;

    //POST request with json inside
    var req = new XMLHttpRequest();
    var url = "/editQuestion";
    req.open("POST", url, true);
    req.setRequestHeader("Content-type", "application/json");
    req.send(JSON.stringify(question));


    //TODO: what will be when db will be overloaded? Need to take off this hardcode milliseconds and reload page after callback from db
    //database need time to update
    setTimeout(function () {
            hideEditQuestionBlock(questionId);
            window.location.reload(true);},
        500); //0.5 sec


}
