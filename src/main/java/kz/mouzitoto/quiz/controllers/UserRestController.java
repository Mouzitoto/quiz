package kz.mouzitoto.quiz.controllers;

import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/**
 * Created by ruslan.babich on 29.01.2016.
 */

@RestController
public class UserRestController {

    @RequestMapping(value = "/countries", method = RequestMethod.GET,headers="Accept=application/json")
    public User getUserJSON() {
        User user = new User();

        user.setId(5L);
        user.setFullName("1Andrew");
        user.setLogin("1dron");
        user.setPasswordHash("1331356k");
        user.setEmail("1droncheg@mail.ru");

        return user;
    }
}
