package kz.mouzitoto.quiz.dao.impls;

import kz.mouzitoto.quiz.dao.interfaces.IUserDAO;
import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.dao.rowmappers.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.util.List;

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

    @Autowired
    HttpSession session;

    public User getUserById(Long id) {
        String query = "select * from t_users where id = :id";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("id", id);

        return jdbcTemplate.queryForObject(query, params, new UserRowMapper());
    }




    public void insertUser(User user) {
        String query = "insert into t_users (id, vlogin, vfullname, vemail, vpasswordhash)" +
                "values (nextval('main_seq'), :login, :fullname, :email, :passwordhash)";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("login", user.getLogin());
        params.addValue("fullname", user.getFullName());
        params.addValue("email", user.getEmail());
        params.addValue("passwordhash", user.getPasswordHash());

        jdbcTemplate.update(query, params);
    }



    public List<User> getAllUsers() {
        String query = "select * from t_users";

        return jdbcTemplate.query(query, new UserRowMapper());
    }


    public Integer getUserCount(){
        String query = "select count(*) from t_users";

        return jdbcTemplate.getJdbcOperations().queryForObject(query, Integer.class);
    }

    public User getUserByLogin(String login) {
        String query = "select * from t_users where vlogin = :login";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("login", login);

        return jdbcTemplate.queryForObject(query, params, new UserRowMapper());
    }

    public void putUserIntoHttpSession() {
        String userName = ((org.springframework.security.core.userdetails.User)
                SecurityContextHolder.getContext().getAuthentication().getPrincipal())
                .getUsername();
        User user = getUserByLogin(userName);

        session.setAttribute("user", user);
    }


}
