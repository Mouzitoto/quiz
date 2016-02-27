/**
 * Created by ruslan.babich on 26.02.2016.
 */

function updateQuizName() {
    var newQuizName = document.getElementById("quizName").value;
    window.location = "/updateQuizName/" + quizId + "/" + newQuizName
}

function editQuizName() {
    enable("quizName");
    document.getElementById("editQuizName").className += " hide";
    document.getElementById("saveQuizName").className =
        document.getElementById("saveQuizName").className.replace("hide", "");
    document.getElementById("cancelQuizNameEdition").className =
        document.getElementById("cancelQuizNameEdition").className.replace("hide", "");
}

function enable(elementId) {
    //document.getElementById(elementId).removeAttribute("disabled");
    document.getElementById(elementId).disabled = false;
}

function disable(elementId) {
    document.getElementById(elementId).disable = true;
}

