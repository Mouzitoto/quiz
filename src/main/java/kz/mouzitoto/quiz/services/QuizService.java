package kz.mouzitoto.quiz.services;

import kz.mouzitoto.quiz.dao.impls.JDBCQuizDAO;
import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


/**
 * Created by ruslan.babich on 11.02.2016.
 */

@Component
public class QuizService {

    @Autowired
    JDBCQuizDAO jdbcQuizDAO;

    @Autowired
    HttpSession session;

    public void insertQuiz(String name) {
        java.sql.Date currentDate = new java.sql.Date(new Date().getTime());
        User user = (User) session.getAttribute("user");

        jdbcQuizDAO.insertQuiz(name, user, currentDate);
    }

    public List<Quiz> getQuizesByUser(){
        User user = (User) session.getAttribute("user");
        return jdbcQuizDAO.getQuizesByUser(user);
    }
}
