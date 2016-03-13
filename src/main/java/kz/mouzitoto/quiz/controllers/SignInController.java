package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.services.QuizService;
import kz.mouzitoto.quiz.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by ruslan.babich on 10.02.2016.
 */

@Controller
public class SignInController {

    @Autowired
    private UserService userService;

    @Autowired
    private QuizService quizService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getIndexPage() {
        return "home";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView getHomePageAfterAuthorization(
            @RequestParam(value = "isAuthorized", required = false, defaultValue = "false") Boolean isAuthorized) {

        if(isAuthorized) {
            userService.putUserIntoHttpSession();
            quizService.cleanUserUnfinishedResults();
        }

        List<Quiz> quizes = quizService.getQuizesByName("");

        ModelAndView mav = new ModelAndView();
        mav.setViewName("home");
        mav.addObject("quizes", quizes);

        return mav;
    }

    @RequestMapping(value = "/signIn")
    public String getSignInPage(){
        return "signIn";
    }

    //registration
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView getRegistrationPage(@RequestParam(value = "userUniqueCode", required = false, defaultValue = "0") int userUniqueCode) {
        //TODO: little bit ugly, think about it in future
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registration");
        mav.addObject("errorMsg", "");
        mav.addObject("errorBlockClass", "hide");

        if (userUniqueCode == 1) {
            mav.addObject("errorMsg", "That login is already exists");
            mav.addObject("errorBlockClass", "");
        } else if (userUniqueCode == 2) {
            mav.addObject("errorMsg", "That email is already exists");
            mav.addObject("errorBlockClass", "");
        } else if (userUniqueCode == 3) {
            mav.addObject("errorMsg", "That login and email are already exists");
            mav.addObject("errorBlockClass", "");
        }

        return mav;
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam(value = "login") String login,
                           @RequestParam(value = "name") String name,
                           @RequestParam(value = "email") String email,
                           @RequestParam(value = "password") String password) {
        //check login and email for unique
        int userUniqueCode = userService.checkUserLoginAndEmail(login, email);
        if(userUniqueCode > 0)
            return "redirect:/registration?userUniqueCode=" + userUniqueCode;

        userService.registerUser(login, email, password, name);

        return "signIn";
    }
}


//      JSON
//    @RequestMapping(value = "/countries", method = RequestMethod.GET,headers="Accept=application/json")
//    public User getUserJSON() {
//        User user = new User();
//
//        user.setId(5L);
//        user.setFullName("1Andrew");
//        user.setLogin("1dron");
//        user.setPasswordHash("1331356k");
//        user.setEmail("1droncheg@mail.ru");
//
//        return user;
//    }