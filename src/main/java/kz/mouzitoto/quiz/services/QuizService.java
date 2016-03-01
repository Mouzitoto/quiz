package kz.mouzitoto.quiz.services;

import kz.mouzitoto.quiz.dao.JDBCCustomOperations;
import kz.mouzitoto.quiz.dao.impls.JDBCAnswerDAO;
import kz.mouzitoto.quiz.dao.impls.JDBCQuestionDAO;
import kz.mouzitoto.quiz.dao.impls.JDBCQuizDAO;
import kz.mouzitoto.quiz.dao.impls.JDBCResultDAO;
import kz.mouzitoto.quiz.dao.models.Answer;
import kz.mouzitoto.quiz.dao.models.Question;
import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    JDBCResultDAO jdbcResultDAO;

    @Autowired
    JDBCCustomOperations jdbcCustomOperations;

    @Autowired
    JDBCQuestionDAO jdbcQuestionDAO;

    @Autowired
    JDBCAnswerDAO jdbcAnswerDAO;

    @Autowired
    HttpSession session;

    public void insertQuiz(String name) {
        java.sql.Date currentDate = new java.sql.Date(new Date().getTime());
        User user = (User) session.getAttribute("user");

        jdbcQuizDAO.insertQuiz(name, user, currentDate);
    }

    public void updateQuizNameById(Long id, String name) {
        jdbcQuizDAO.updateQuizNameById(id, name);
    }

    public List<Quiz> getQuizesByUser() {
        User user = (User) session.getAttribute("user");
        return jdbcQuizDAO.getQuizesByUser(user);
    }

    public Quiz getQuizById(Long quizId) {
        return jdbcQuizDAO.getQuizById(quizId);
    }

    public void insertQuestionAndAnswers(
            Long quizId,
            String questionBody,
            String answerBodyA,
            String answerBodyB,
            String answerBodyC,
            String answerBodyD,
            Boolean isCorrectA,
            Boolean isCorrectB,
            Boolean isCorrectC,
            Boolean isCorrectD) {
        //check if we have any correct answer
        Boolean hasCorrectAnswer = false;
        if(isCorrectA)
            hasCorrectAnswer = true;
        if(isCorrectB)
            hasCorrectAnswer = true;
        if(isCorrectC)
            hasCorrectAnswer = true;
        if(isCorrectD)
            hasCorrectAnswer = true;

        //TODO: tell user that he didn't choose correct answer
        //do nothing if we haven't any correct answer
        if(hasCorrectAnswer) {
            List<Answer> answers = new ArrayList<Answer>();

            Answer answerA = new Answer();
            answerA.setBody(answerBodyA);
            answerA.setCorrect(isCorrectA);

            Answer answerB = new Answer();
            answerB.setBody(answerBodyB);
            answerB.setCorrect(isCorrectB);

            Answer answerC = new Answer();
            answerC.setBody(answerBodyC);
            answerC.setCorrect(isCorrectC);

            Answer answerD = new Answer();
            answerD.setBody(answerBodyD);
            answerD.setCorrect(isCorrectD);

            answers.add(answerA);
            answers.add(answerB);
            answers.add(answerC);
            answers.add(answerD);

            jdbcCustomOperations.insertQuestionAndAnswers(quizId, questionBody, answers);
        }
    }

    public List<Quiz> getQuizesByName(String name) {
        return jdbcQuizDAO.getQuizesByName(name);
    }

    public List<Question> getQuestionsByQuizId(Long quizId) {
        List<Question> questions = new ArrayList<Question>();
        questions = jdbcQuestionDAO.getQuestionsByQuizId(quizId);

        for (Question question : questions) {
            question.setAnswers(jdbcAnswerDAO.getAnswersByQuestionId(question.getId()));
        }

        return questions;
    }

    public Long createResult(Long quizId) {
        User user = (User) session.getAttribute("user");
        Date startDate = new Date();
        System.out.println("date: " + startDate);

        return jdbcResultDAO.createResult(quizId, user.getId(), startDate);
    }

    public float updateAndGetQuizResult(String answerIds) {
        int answerCount = answerIds.length() - answerIds.replace(",", "").length() + 1;
        Integer correctAnswerCount = jdbcAnswerDAO.getCorrectAnswerCount(answerIds);

        float quizResult = correctAnswerCount * 100 / answerCount;

        jdbcResultDAO.updateResultById((Long) session.getAttribute("resultId"), new Date(), quizResult, answerIds);

        return quizResult;
    }
}
