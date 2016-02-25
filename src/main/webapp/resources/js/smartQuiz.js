/**
 * Created by ruslan.babich on 12.02.2016.
 */

var isQAFormAdded = false;

//add new question + answers form to EditQuiz Page
function addQAForm(){
    if(!isQAFormAdded) {
        isQAFormAdded = true;

        //declare elements
        var divRow = document.createElement("div");
        var form = document.createElement("form");
        var divQuestion = document.createElement("div");
        var divAnswerA = document.createElement("div");
        var divAnswerB = document.createElement("div");
        var divAnswerC = document.createElement("div");
        var divAnswerD = document.createElement("div");
        var divSaveButton = document.createElement("div");
        var divCancelButton = document.createElement("div");
        var question = document.createElement("input");
        var answerA = document.createElement("input");
        var answerB = document.createElement("input");
        var answerC = document.createElement("input");
        var answerD = document.createElement("input");
        var saveButton = document.createElement("input");
        var cancelButton = document.createElement("input");



        //set attributes
        divRow.setAttribute("class", "row bg-info");
        form.setAttribute("action", "/editQuiz/" + quizId);
        form.setAttribute("method", "POST");
        divQuestion.setAttribute("class", "form-group col-md-12 add-question-first");
        divAnswerA.setAttribute("class", "form-group col-md-6");
        divAnswerB.setAttribute("class", "form-group col-md-6");
        divAnswerC.setAttribute("class", "form-group col-md-6");
        divAnswerD.setAttribute("class", "form-group col-md-6");
        divSaveButton.setAttribute("class", "form-group col-md-6");
        divCancelButton.setAttribute("class", "form-group col-md-6");

        question.setAttribute("type", "text");
        question.setAttribute("name", "question");
        question.setAttribute("class", "form-control");

        answerA.setAttribute("type", "text");
        answerA.setAttribute("name", "answerA");
        answerA.setAttribute("class", "form-control");

        answerB.setAttribute("type", "text");
        answerB.setAttribute("name", "answerB");
        answerB.setAttribute("class", "form-control");

        answerC.setAttribute("type", "text");
        answerC.setAttribute("name", "answerC");
        answerC.setAttribute("class", "form-control");

        answerD.setAttribute("type", "text");
        answerD.setAttribute("name", "answerD");
        answerD.setAttribute("class", "form-control");

        saveButton.setAttribute("type", "submit");
        saveButton.setAttribute("value", "Save question");

        cancelButton.setAttribute("type", "submit");
        cancelButton.setAttribute("value", "Cancel");

        //appending elements to their parents

        divRow.appendChild(form);

        form.appendChild(divQuestion);
        form.appendChild(divAnswerA);
        form.appendChild(divAnswerB);
        form.appendChild(divAnswerC);
        form.appendChild(divAnswerD);
        form.appendChild(divSaveButton);
        form.appendChild(divCancelButton);

        divQuestion.appendChild(document.createTextNode("Question"));
        divQuestion.appendChild(question);

        divAnswerA.appendChild(document.createTextNode("Answer A"));
        divAnswerA.appendChild(answerA);

        divAnswerB.appendChild(document.createTextNode("Answer B"));
        divAnswerB.appendChild(answerB);

        divAnswerC.appendChild(document.createTextNode("Answer C"));
        divAnswerC.appendChild(answerC);

        divAnswerD.appendChild(document.createTextNode("Answer D"));
        divAnswerD.appendChild(answerD);

        divSaveButton.appendChild(saveButton);
        divCancelButton.appendChild(cancelButton);

        var questionsContainer = document.getElementById("questionsContainer");
        questionsContainer.parentNode.insertBefore(divRow, questionsContainer.nextSibling);

        //var formContainer = document.getElementById("qAFormContainer");
        //formContainer.appendChild(form);
    }
}

function addQuestionToDB(){
    isQAFormAdded = false;
}