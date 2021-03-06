package kz.mouzitoto.quiz.dao.impls;

import kz.mouzitoto.quiz.dao.interfaces.IQuizDAO;
import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.dao.rowmappers.QuizRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ruslan.babich on 11.02.2016.
 */

@Component
public class JDBCQuizDAO implements IQuizDAO {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }


    public Quiz getQuizById(Long id) {
        String query = "select * from t_quizes where id = :id";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("id", id);

        return jdbcTemplate.queryForObject(query, params, new QuizRowMapper());
    }

    public void insertQuiz(String name, User user, Date date) {
        String query = "insert into t_quizes (id, vname, nuserid, dcreatedate, bisactive) " +
                "values (nextval('main_seq'), :name, :userId, :createDate, false)";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("name", name);
        params.addValue("userId", user.getId());
        params.addValue("createDate", date);

        jdbcTemplate.update(query, params);

    }

    public List<Quiz> getQuizesByUser(User user) {
        String query = "select * from t_quizes where nuserid = :userId";
        MapSqlParameterSource params = new MapSqlParameterSource("userId", user.getId());

        return jdbcTemplate.query(query, params, new QuizRowMapper());
    }

    public void updateQuizNameById(Long id, String name) {
        String query = "update t_quizes set vname = :name where id = :id";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("name", name);
        params.addValue("id", id);

        jdbcTemplate.update(query, params);
    }

    public List<Quiz> getQuizesByName(String name) {
        String query = "select * from t_quizes where lower(vname) ~ :name";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("name", name.toLowerCase());

        return jdbcTemplate.query(query, params, new QuizRowMapper());
    }
}
