package kz.mouzitoto.quiz.dao.rowmappers;

import kz.mouzitoto.quiz.dao.models.Answer;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ruslan.babich on 25.02.2016.
 */
public class AnswerRowMapper implements RowMapper {
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Answer answer = new Answer();
        answer.setId(resultSet.getLong("id"));
        answer.setBody(resultSet.getString("vbody"));
        answer.setCorrect(resultSet.getBoolean("biscorrect"));
        answer.setQuestionId(resultSet.getLong("nquestionid"));

        return answer;
    }
}
