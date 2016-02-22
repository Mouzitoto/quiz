package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    @RequestMapping(value = "/createQuiz")
    public String createQuiz(@RequestParam(value = "quizName")String name){
        quizService.insertQuiz(name);

        return "redirect:/myQuizes";
    }

    @RequestMapping(value = "/myQuizes")
    public ModelAndView getMyQuizesPage(){
        List<Quiz> userQuizes = quizService.getQuizesByUser();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("myQuizes");
        mav.addObject("userQuizes", userQuizes);

        return mav;
    }
}
