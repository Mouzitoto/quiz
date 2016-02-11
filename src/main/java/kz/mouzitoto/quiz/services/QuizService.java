package kz.mouzitoto.quiz.services;

import kz.mouzitoto.quiz.dao.impls.JDBCQuizDAO;
import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import javax.servlet.http.HttpSession;
import java.util.Date;


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
        System.out.println("User from session inside service class: " + user.getFullName());

        jdbcQuizDAO.insertQuiz(name, user, currentDate);
    }
}
