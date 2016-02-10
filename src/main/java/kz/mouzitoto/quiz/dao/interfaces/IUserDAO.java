package kz.mouzitoto.quiz.dao.interfaces;

import kz.mouzitoto.quiz.dao.models.User;

import java.util.List;

/**
 * Created by ruslan.babich on 27.01.2016.
 */


public interface IUserDAO {
    public User getUserById(Long id);

    public void insertUser(User user);

    public List<User> getAllUsers();

    public Integer getUserCount();

    public boolean checkUserByLoginAndPassword(String login, String password);

    public User getUserByLoginAndPassword(String login, String password);
}
