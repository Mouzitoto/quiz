package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.models.Question;
import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by RinRin on 29.02.2016.
 */

@Controller
public class QuizPassingController {

    @Autowired
    QuizService quizService;

    @Autowired
    HttpSession session;

    @RequestMapping(value = "/home", method = RequestMethod.POST)
    public ModelAndView getHomePageViaPost(@RequestParam(value = "quizName")String quizName) {
        List<Quiz> quizes = quizService.getQuizesByName(quizName);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("home");
        mav.addObject("quizes", quizes);

        return mav;
    }

    @RequestMapping(value = "/quizInfo/{id}")
    public ModelAndView getQuizInfoPage(@PathVariable(value = "id") Long id) {
        Quiz quiz = quizService.getQuizById(id);

        ModelAndView mav = new ModelAndView();
        mav.addObject("quiz", quiz);
        mav.setViewName("quizInfo");

        return mav;
    }

    @RequestMapping(value = "startQuiz/{id}")
    public ModelAndView getStartQuizPage(@PathVariable(value = "id") Long quizId) {
        Quiz quiz = quizService.getQuizById(quizId);
        List<Question> questions = quizService.getQuestionsByQuizId(quizId);

        Long resultId = quizService.createResult(quizId);
        session.setAttribute("resultId", resultId);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("startQuiz");
        mav.addObject("quiz", quiz);
        mav.addObject("questions", questions);

        return mav;
    }
}
