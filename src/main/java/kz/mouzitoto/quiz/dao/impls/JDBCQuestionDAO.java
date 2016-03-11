package kz.mouzitoto.quiz.dao.impls;

import kz.mouzitoto.quiz.dao.interfaces.IQuestionDAO;
import kz.mouzitoto.quiz.dao.models.Question;
import kz.mouzitoto.quiz.dao.rowmappers.QuestionRowMapper;
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
public class JDBCQuestionDAO implements IQuestionDAO {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }


    public List<Question> getQuestionsByQuizId(Long quizId) {
        String query = "select * from t_questions where nquizid = :quizId";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("quizId", quizId);

        return jdbcTemplate.query(query, params, new QuestionRowMapper());
    }

    public void insertQuestion(Long id, Long quizId, String questionBody) {
        String query = "insert into t_questions (id, vbody, nquizid) " +
                "values (:id, :questionBody, :quizId)";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("id", id);
        params.addValue("questionBody", questionBody);
        params.addValue("quizId", quizId);

        jdbcTemplate.update(query, params);
    }

    public Integer getQuestionCountByQuizId(Long quizId) {
        String query = "select count(*) from t_questions where nquizid = ?";

        return jdbcTemplate.getJdbcOperations().queryForObject(query, Integer.class, quizId);
    }

    public void updateQuestion(Question question) {
        String query = "update t_questions set vbody = :body where id = :id";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("body", question.getBody());
        params.addValue("id", question.getId());

        jdbcTemplate.update(query, params);
    }
}
