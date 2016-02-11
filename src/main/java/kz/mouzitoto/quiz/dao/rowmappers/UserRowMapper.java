package kz.mouzitoto.quiz.dao.rowmappers;


import kz.mouzitoto.quiz.dao.impls.JDBCUserDAO;
import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ruslan.babich on 27.01.2016.
 */
public class UserRowMapper implements RowMapper<User>{

    public User mapRow(ResultSet rs, int i) throws SQLException {
        User user = new User();
        user.setLogin(rs.getString("vlogin"));
        user.setEmail(rs.getString("vemail"));
        user.setFullName(rs.getString("vfullname"));
        user.setId(rs.getLong("id"));
        user.setPasswordHash(rs.getString("vpasswordhash"));

        return user;
    }
}
