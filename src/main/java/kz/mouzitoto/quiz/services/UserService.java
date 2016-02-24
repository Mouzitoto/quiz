package kz.mouzitoto.quiz.services;

import kz.mouzitoto.quiz.dao.impls.JDBCUserDAO;
import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ruslan.babich on 28.01.2016.
 */

@Component
public class UserService {

    @Autowired
    private JDBCUserDAO jdbcUserDAO;

    public User getUserById(Long id) {
        return jdbcUserDAO.getUserById(id);
    }


    public void insertUser(String login, String email, String password, String fullName) {
        User user = new User();
        user.setLogin(login);
        user.setPasswordHash(password);
        user.setEmail(email);
        user.setFullName(fullName);

        jdbcUserDAO.insertUser(user);
    }


    public List<User> getAllUsers(){
        return jdbcUserDAO.getAllUsers();
    }


    public Integer getUserCount(){
        return jdbcUserDAO.getUserCount();
    }

    public void putUserIntoHttpSession() {
        jdbcUserDAO.putUserIntoHttpSession();
    }

}
