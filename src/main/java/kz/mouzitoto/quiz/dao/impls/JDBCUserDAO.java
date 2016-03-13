package kz.mouzitoto.quiz.dao.impls;

import kz.mouzitoto.quiz.dao.interfaces.IUserDAO;
import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.dao.rowmappers.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

/**
 * Created by ruslan.babich on 27.01.2016.
 */

@Component
public class JDBCUserDAO implements IUserDAO{

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public User getUserById(Long id) {
        String query = "select * from t_users where id = :id";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("id", id);

        return jdbcTemplate.queryForObject(query, params, new UserRowMapper());
    }




    public void insertUser(User user) {
        String query = "insert into t_users (id, vlogin, vfullname, vemail, vpasswordhash, bisactive)" +
                "values (:id, :login, :fullname, :email, :passwordhash, :isActive)";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("id", user.getId());
        params.addValue("login", user.getLogin());
        params.addValue("fullname", user.getFullName());
        params.addValue("email", user.getEmail());
        params.addValue("passwordhash", user.getPasswordHash());
        params.addValue("isActive", user.getActive());

        jdbcTemplate.update(query, params);
    }



    public Integer getUserCountByLogin(String login){
        String query = "select count(*) from t_users " +
                "where lower(vlogin) = ?";

        return jdbcTemplate.getJdbcOperations().queryForObject(query, Integer.class, login.toLowerCase());
    }

    public Integer getUserCountByEmail(String email){
        String query = "select count(*) from t_users " +
                "where lower(vemail) = ?";

        return jdbcTemplate.getJdbcOperations().queryForObject(query, Integer.class, email.toLowerCase());
    }

    public User getUserByLogin(String login) {
        String query = "select * from t_users where vlogin = :login";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("login", login);

        return jdbcTemplate.queryForObject(query, params, new UserRowMapper());
    }

}
