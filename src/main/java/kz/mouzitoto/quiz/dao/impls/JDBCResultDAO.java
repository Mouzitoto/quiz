package kz.mouzitoto.quiz.dao.impls;

import kz.mouzitoto.quiz.dao.JDBCCustomOperations;
import kz.mouzitoto.quiz.dao.interfaces.IResultDAO;
import kz.mouzitoto.quiz.dao.models.ExtendedResult;
import kz.mouzitoto.quiz.dao.models.User;
import kz.mouzitoto.quiz.dao.rowmappers.ExtendedResultRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.util.Date;
import java.util.List;


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

    public void updateResultById(Long resultId, Date endDate, float quizResult, String answerIds) {
        String query = "update t_results " +
                "set denddate = :endDate, " +
                "fresult = :quizResult, " +
                "vanswerids = :answerIds " +
                "where id = :resultId";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("endDate", endDate);
        params.addValue("quizResult", quizResult);
        params.addValue("answerIds", answerIds);
        params.addValue("resultId", resultId);

        jdbcTemplate.update(query, params);
    }

    public List<ExtendedResult> getExtendedResultsByUserId(Long userId) {
        //without "'' as vusername" rowmapper will throw error that there is no such column
        //TODO: kill this duck tape with "'' as vusername"
        String query = "select res.*, qui.vname, us.vfullname as vquizownername, '' as vusername from t_results res " +
                "inner join t_quizes qui on qui.id = res.nquizid " +
                "inner join t_users us on us.id = qui.nuserid " +
                "where res.nuserid = :userId " +
                "and res.denddate is not null " +
                "order by denddate desc";
        MapSqlParameterSource params = new MapSqlParameterSource("userId", userId);

        return jdbcTemplate.query(query, params, new ExtendedResultRowMapper());

    }

    public List<ExtendedResult> getBestResultsWithLimit(Integer limit) {
        String query = "select res.*, qui.vname, usOwner.vfullname as vquizownername, us.vfullname as vusername from t_results res " +
                "inner join t_quizes qui on qui.id = res.nquizid " +
                "inner join t_users usOwner on usOwner.id = qui.nuserid " +
                "inner join t_users us on us.id = res.nuserid " +
                "where res.denddate is not null " +
                "order by res.fresult desc, res.denddate desc " +
                "limit :limit";
        MapSqlParameterSource params = new MapSqlParameterSource("limit", limit);

        return jdbcTemplate.query(query, params, new ExtendedResultRowMapper());
    }

    public void cleanUnfinishedResults() {
        //TODO: DO IT SOMEDAY...
    }
}
