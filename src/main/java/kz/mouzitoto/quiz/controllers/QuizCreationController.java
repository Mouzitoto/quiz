package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Created by ruslan.babich on 10.02.2016.
 */

@Controller
public class QuizCreationController {

    @Autowired
    QuizService quizService;

    @RequestMapping(value = "/createQuizPage")
    public String getCreateQuizPage(){
        return "createQuiz";
    }

    @RequestMapping(value = "createQuiz")
    public String createQuiz(@RequestParam(value = "quizName")String name){
        quizService.insertQuiz(name);

        return "index"; //TODO: change to myQuizes.jsp later


    }
}
