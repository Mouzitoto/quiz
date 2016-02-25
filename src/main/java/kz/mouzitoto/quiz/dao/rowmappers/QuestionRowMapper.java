package kz.mouzitoto.quiz.dao.rowmappers;


import kz.mouzitoto.quiz.dao.models.Question;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ruslan.babich on 25.02.2016.
 */
public class QuestionRowMapper implements RowMapper {

    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Question question = new Question();

        question.setId(resultSet.getLong("id"));
        question.setBody(resultSet.getString("vbody"));
        question.setQuizId(resultSet.getLong("nquizid"));

        return question;
    }
}
