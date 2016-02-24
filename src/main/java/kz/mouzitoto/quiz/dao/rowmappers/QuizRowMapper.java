package kz.mouzitoto.quiz.dao.rowmappers;


import kz.mouzitoto.quiz.dao.impls.JDBCUserDAO;
import kz.mouzitoto.quiz.dao.models.Quiz;
import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ruslan.babich on 27.01.2016.
 */

@Component
public class QuizRowMapper implements RowMapper<Quiz>{

    @Autowired
    JDBCUserDAO jdbcUserDAO;

    public Quiz mapRow(ResultSet rs, int i) throws SQLException {
        Quiz quiz = new Quiz();
        quiz.setId(rs.getLong("id"));
        quiz.setName(rs.getString("vname"));
        quiz.setCreateDate(rs.getDate("dcreatedate"));
        quiz.setUserId(rs.getLong("nuserid"));
        quiz.setActive(rs.getBoolean("bisactive"));

        return quiz;
    }
}
