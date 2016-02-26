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
        var divCheckBoxA = document.createElement("div");
        var divCheckBoxB = document.createElement("div");
        var divCheckBoxC = document.createElement("div");
        var divCheckBoxD = document.createElement("div");
        var labelCheckboxA = document.createElement("label");
        var labelCheckboxB = document.createElement("label");
        var labelCheckboxC = document.createElement("label");
        var labelCheckboxD = document.createElement("label");
        var inputCheckboxA = document.createElement("input");
        var inputCheckboxB = document.createElement("input");
        var inputCheckboxC = document.createElement("input");
        var inputCheckboxD = document.createElement("input");
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

        divCheckBoxA.setAttribute("class", "checkbox");
        divCheckBoxB.setAttribute("class", "checkbox");
        divCheckBoxC.setAttribute("class", "checkbox");
        divCheckBoxD.setAttribute("class", "checkbox");

        inputCheckboxA.setAttribute("type", "checkbox");
        inputCheckboxB.setAttribute("type", "checkbox");
        inputCheckboxC.setAttribute("type", "checkbox");
        inputCheckboxD.setAttribute("type", "checkbox");
        inputCheckboxA.setAttribute("name", "isCorrectA");
        inputCheckboxB.setAttribute("name", "isCorrectB");
        inputCheckboxC.setAttribute("name", "isCorrectC");
        inputCheckboxD.setAttribute("name", "isCorrectD");

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

        cancelButton.setAttribute("type", "button");
        cancelButton.setAttribute("value", "Cancel");
        cancelButton.setAttribute("onclick", "location.href = '/editQuiz/" + quizId + "'");

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

        divAnswerA.appendChild(divCheckBoxA);
        divAnswerA.appendChild(answerA);

        divAnswerB.appendChild(divCheckBoxB);
        divAnswerB.appendChild(answerB);

        divAnswerC.appendChild(divCheckBoxC);
        divAnswerC.appendChild(answerC);

        divAnswerD.appendChild(divCheckBoxD);
        divAnswerD.appendChild(answerD);

        divCheckBoxA.appendChild(labelCheckboxA);
        divCheckBoxB.appendChild(labelCheckboxB);
        divCheckBoxC.appendChild(labelCheckboxC);
        divCheckBoxD.appendChild(labelCheckboxD);

        labelCheckboxA.appendChild(inputCheckboxA);
        labelCheckboxB.appendChild(inputCheckboxB);
        labelCheckboxC.appendChild(inputCheckboxC);
        labelCheckboxD.appendChild(inputCheckboxD);

        labelCheckboxA.innerHTML += "Answer A";
        labelCheckboxB.innerHTML += "Answer B";
        labelCheckboxC.innerHTML += "Answer C";
        labelCheckboxD.innerHTML += "Answer D";

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