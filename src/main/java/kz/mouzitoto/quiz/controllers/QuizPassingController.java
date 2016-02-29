package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by RinRin on 29.02.2016.
 */

@Controller
public class QuizPassingController {

    @Autowired
    QuizService quizService;

    @RequestMapping(value = "/home", method = RequestMethod.POST)
    public ModelAndView getHomePageViaPost(@RequestParam(value = "quizName")String quizName) {
        List<Quiz> quizes = quizService.getQuizesByName(quizName);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("home");
        mav.addObject("quizes", quizes);

        return mav;

    }
}
