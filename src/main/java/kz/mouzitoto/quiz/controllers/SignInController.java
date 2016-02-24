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

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getIndexPage() {
        return "home";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String getHomePageAfterAuthorization(
            @RequestParam(value = "isAuthorized", required = false) Boolean isAuthorized) {

        if(isAuthorized)
            userService.putUserIntoHttpSession();

        return "home";
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
        userService.insertUser(login, email, password, name);

        return "home";

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