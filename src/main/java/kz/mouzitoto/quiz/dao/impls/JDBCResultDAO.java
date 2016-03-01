package kz.mouzitoto.quiz.dao.impls;

import kz.mouzitoto.quiz.dao.JDBCCustomOperations;
import kz.mouzitoto.quiz.dao.interfaces.IResultDAO;
import kz.mouzitoto.quiz.dao.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.util.Date;


/**
 * Created by ruslan.babich on 01.03.2016.
 */

@Component
public class JDBCResultDAO implements IResultDAO {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Autowired
    JDBCCustomOperations jdbcCustomOperations;


    public Long createResult(Long quizId, Long userId, Date startDate) {
        Long resultId = jdbcCustomOperations.getNextValFromMainSec();

        String query = "insert into t_results(id, nquizid, nuserid, dstartdate) " +
                "values (:resultId, :quizId, :userId, :startDate)";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("resultId", resultId);
        params.addValue("quizId", quizId);
        params.addValue("userId", userId);
        params.addValue("startDate", startDate); //TODO: change to timestamp someday...

        jdbcTemplate.update(query, params);

        return resultId;
    }

    public void updateResultById(Long resultId) {

    }

    public void cleanUnfinishedResults() {
        //TODO: DO IT SOMEDAY...
    }
}
