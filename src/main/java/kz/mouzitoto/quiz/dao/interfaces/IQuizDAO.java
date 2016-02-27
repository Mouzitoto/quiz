package kz.mouzitoto.quiz.dao.interfaces;

import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.dao.models.User;


import java.sql.Date;
import java.util.List;

/**
 * Created by ruslan.babich on 11.02.2016.
 */


public interface IQuizDAO {

    public Quiz getQuizById(Long id);

    public void insertQuiz(String name, User user, Date date);

    public List<Quiz> getQuizesByUser(User user);

    public void updateQuizNameById(Long id, String name);
}
