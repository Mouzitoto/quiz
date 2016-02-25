package kz.mouzitoto.quiz.dao.impls;

import kz.mouzitoto.quiz.dao.interfaces.IAnswerDAO;
import kz.mouzitoto.quiz.dao.models.Answer;
import kz.mouzitoto.quiz.dao.rowmappers.AnswerRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by ruslan.babich on 25.02.2016.
 */

@Component
public class JDBCAnswerDAO implements IAnswerDAO {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource){
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public void insertAnswer(Long id, String answerBody, Long questionId, Boolean isCorrect) {
        String query = "insert into t_answers (id, vbody, nquestionid, biscorrect) " +
                "values(:id, :answerBody, :questionId, :isCorrect)";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("id", id);
        params.addValue("answerBody", answerBody);
        params.addValue("questionId", questionId);
        params.addValue("isCorrect", isCorrect);

        jdbcTemplate.update(query, params);
    }

    public List<Answer> getAnswersByQuestionId(Long questionId) {
        String query = "select * from t_answers where nquestionid = :questionId";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("questionId", questionId);

        return jdbcTemplate.query(query, params, new AnswerRowMapper());
    }
}
