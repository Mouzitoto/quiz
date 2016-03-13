package kz.mouzitoto.quiz.dao.interfaces;

import kz.mouzitoto.quiz.dao.models.User;

import java.util.List;

/**
 * Created by ruslan.babich on 27.01.2016.
 */


public interface IUserDAO {
    public User getUserById(Long id);

    public void insertUser(User user);

    public User getUserByLogin(String login);

    public Integer getUserCountByLogin(String login);

    public Integer getUserCountByEmail(String email);
}
