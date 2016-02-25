package kz.mouzitoto.quiz.dao;

import kz.mouzitoto.quiz.dao.impls.JDBCAnswerDAO;
import kz.mouzitoto.quiz.dao.impls.JDBCQuestionDAO;
import kz.mouzitoto.quiz.dao.models.Answer;
import kz.mouzitoto.quiz.dao.models.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by ruslan.babich on 25.02.2016.
 */

@Component
public class JDBCCustomOperations {
    NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Autowired
    JDBCQuestionDAO jdbcQuestionDAO;

    @Autowired
    JDBCAnswerDAO jdbcAnswerDAO;

    public Long getNextValFromMainSec() {
        String query = "select nextval('main_seq');";
        return jdbcTemplate.getJdbcOperations().queryForObject(query, Long.class);
    }

    public void insertQuestionAndAnswers(Long quizId, String questionBody, List<Answer> answers) {
        Long questionId = getNextValFromMainSec();
        jdbcQuestionDAO.insertQuestion(questionId, quizId, questionBody);

        for (int i = 0; i < answers.size(); i++) {
            Answer answer = answers.get(i);
            Long answerId = getNextValFromMainSec();
            jdbcAnswerDAO.insertAnswer(answerId, answer.getBody(), questionId, answer.isCorrect());
        }
    }
}
