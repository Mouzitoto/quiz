/**
 * Created by ruslan.babich on 12.02.2016.
 */


//add new question + answers form to EditQuiz Page
function addQAForm(){
    var form = document.createElement("form");
    var question = document.createElement("input");
    var answer1 = document.createElement("input");
    var answer2 = document.createElement("input");
    var answer3 = document.createElement("input");
    var answer4 = document.createElement("input");
    var saveButton = document.createElement("input");
    var cancelButton = document.createElement("a");

    form.setAttribute("action", "");
    question.setAttribute("type", "text");
    answer1.setAttribute("type", "text");
    answer2.setAttribute("type", "text");
    answer3.setAttribute("type", "text");
    answer4.setAttribute("type", "text");
    saveButton.setAttribute("type", "submit");
    saveButton.setAttribute("onclick", "messItUpBro"); //TODO: save Q+A to DataBase
    cancelButton.innerHTML = "Cancel";

    form.appendChild(question);
    form.appendChild(answer1);
    form.appendChild(answer2);
    form.appendChild(answer3);
    form.appendChild(answer4);
    form.appendChild(saveButton);
    form.appendChild(cancelButton);

    var formContainer = document.getElementById("qAFormContainer");

    formContainer.appendChild(form);
}