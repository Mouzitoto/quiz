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

        if(isAuthorized)
            userService.putUserIntoHttpSession();

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
    @RequestMapping(value = "/registration")
    public String getRegistrationPage() {
        return "registration";
    }


    @RequestMapping(value = "/register")
    public String register(@RequestParam(value = "login") String login,
                           @RequestParam(value = "name") String name,
                           @RequestParam(value = "email") String email,
                           @RequestParam(value = "password") String password) {
        userService.registerUser(login, email, password, name);

        return "/signIn";

    }




    //tmp
    @RequestMapping(value = "/tmp")
    public String getTmpPage(){
        return "tmp";
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