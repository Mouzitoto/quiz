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
        return null;
    }
}
