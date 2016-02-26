package kz.mouzitoto.quiz.services;

import kz.mouzitoto.quiz.dao.JDBCCustomOperations;
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

    @Autowired
    private JDBCCustomOperations jdbcCustomOperations;

    public User getUserById(Long id) {
        return jdbcUserDAO.getUserById(id);
    }


    public void registerUser(String login, String email, String password, String fullName) {
        User user = new User();
        user.setId(jdbcCustomOperations.getNextValFromMainSec());
        user.setLogin(login);
        user.setPasswordHash(password);
        user.setEmail(email);
        user.setFullName(fullName);
        user.setActive(true);

        jdbcUserDAO.insertUser(user);
        //Little hardcode here... 10 = role.name = "user"
        //TODO: Change this hardcode to smth good
        jdbcCustomOperations.insertRoleToUser(user.getId(), 10L);
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
