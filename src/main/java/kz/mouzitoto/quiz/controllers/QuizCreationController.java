package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.models.Question;
import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    public String getCreateQuizPage() {
        return "createQuiz";
    }

    @RequestMapping(value = "/createQuiz")
    public String createQuiz(@RequestParam(value = "quizName") String name) {
        quizService.insertQuiz(name);

        return "redirect:/myQuizes";
    }

    @RequestMapping(value = "/myQuizes")
    public ModelAndView getMyQuizesPage() {
        List<Quiz> userQuizes = quizService.getQuizesByUser();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("myQuizes");
        mav.addObject("userQuizes", userQuizes);

        return mav;
    }

    @RequestMapping(value = "/editQuiz/{quizId}", method = RequestMethod.GET)
    public ModelAndView getEditQuizPageViaGet(@PathVariable(value = "quizId") Long quizId) {
        Quiz quiz = quizService.getQuizById(quizId);
        List<Question> questions = quizService.getQuestionsByQuizId(quizId);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("editQuiz");
        mav.addObject("quiz", quiz);
        mav.addObject("questions", questions);

        return mav;
    }

    @RequestMapping(value = "/updateQuizName/{id}/{name}")
    public String updateQuizName(@PathVariable(value = "id") Long id,
                                 @PathVariable(value = "name") String name) {
        quizService.updateQuizNameById(id, name);

        return "redirect:/editQuiz/" + id;
    }

    @RequestMapping(value = "/editQuiz/{quizId}", method = RequestMethod.POST)
    public String getEditQuizPageViaPost(
            @PathVariable(value = "quizId") Long quizId,
            @RequestParam(value = "question") String question,
            @RequestParam(value = "answerA") String answerA,
            @RequestParam(value = "answerB") String answerB,
            @RequestParam(value = "answerC") String answerC,
            @RequestParam(value = "answerD") String answerD,
            @RequestParam(value = "isCorrectA", required = false, defaultValue = "false") Boolean isCorrectA,
            @RequestParam(value = "isCorrectB", required = false, defaultValue = "false") Boolean isCorrectB,
            @RequestParam(value = "isCorrectC", required = false, defaultValue = "false") Boolean isCorrectC,
            @RequestParam(value = "isCorrectD", required = false, defaultValue = "false") Boolean isCorrectD) {
        //TODO: tell user that questionBody cant be null
        if (question.length() > 0)
            quizService.insertQuestionAndAnswers(
                    quizId,
                    question,
                    answerA,
                    answerB,
                    answerC,
                    answerD,
                    isCorrectA,
                    isCorrectB,
                    isCorrectC,
                    isCorrectD);

        return "redirect:/editQuiz/" + quizId;
    }
}
