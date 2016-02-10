package kz.mouzitoto.quiz.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ruslan.babich on 10.02.2016.
 */

@Controller
public class QuizCreationController {


    @RequestMapping(value = "/createQuiz")
    public String getCreateQuizPage(){
        return "createQuiz";
    }
}
