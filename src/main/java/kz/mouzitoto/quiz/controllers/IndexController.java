package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.impls.JDBCUserDAO;
import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by ruslan.babich on 27.01.2016.
 */

@Controller
public class IndexController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/")
    public String getIndex() {
        return "index";
    }

    @RequestMapping(value = "/select")
    public ModelAndView getSelect() {
        User user = userService.getUserById(1L);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("select");
        mav.addObject("user", user);

        return mav;
    }

    @RequestMapping(value = "/insert")
    public String getInsert(@RequestParam(value = "login") String login,
                          @RequestParam(value = "password") String password,
                          @RequestParam(value = "email") String email,
                          @RequestParam(value = "fullname") String fullName) {
        userService.insertUser(login, email, password, fullName);

        return "index";
    }

    @RequestMapping(value = "/selectAll")
    public ModelAndView getSelectAll() {
        List<User> list = userService.getAllUsers();
        Integer userCount = userService.getUserCount();

        ModelAndView mav = new ModelAndView();
        mav.addObject("list", list);
        mav.addObject("userCount", userCount);
        mav.setViewName("selectAll");

        return mav;
    }

    @RequestMapping(value = "/signIn")
    public String getSignIn(){
        return "signIn";
    }


}
