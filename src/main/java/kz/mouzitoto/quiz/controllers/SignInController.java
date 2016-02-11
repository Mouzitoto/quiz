package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by ruslan.babich on 10.02.2016.
 */

@Controller
public class SignInController {

    @Autowired
    private UserService userService;

    //index page (authorization)
    @RequestMapping(value = "/")
    public String getSignInPage() {
        return "signIn";
    }


    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String getHomePage() {
        return "home";
    }

    //when we press "login" on sign in page
//    @RequestMapping(value = "/home", method = RequestMethod.POST)
//    public ModelAndView getHomePage(@RequestParam(value = "login") String login,
//                                    @RequestParam(value = "password") String password) {
//        ModelAndView mav = new ModelAndView();
//        if (userService.checkUserByLoginAndPassword(login, password)) {
//            mav.setViewName("home");
//            mav.addObject("user", userService.getUserByLoginAndPassword(login, password));
//
//
//            return mav;
//        }
//
//        mav.setViewName("signIn");
//        return mav;
//    }

    @RequestMapping(value = "/home", method = RequestMethod.POST)
    public String getHomePage(@RequestParam(value = "login") String login,
                              @RequestParam(value = "password") String password,
                              HttpSession session) {
        if (userService.checkUserByLoginAndPassword(login, password)) {
            session.setAttribute("user", userService.getUserByLoginAndPassword(login, password));
            return "home";
        }

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
        userService.insertUser(login, email, password, name);

        return "signIn";

    }


}
