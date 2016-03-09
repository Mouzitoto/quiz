package kz.mouzitoto.quiz.dao.rowmappers;

import kz.mouzitoto.quiz.dao.models.ExtendedResult;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ruslan.babich on 09.03.2016.
 */
public class ExtendedResultRowMapper implements RowMapper {
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        ExtendedResult extendedResult = new ExtendedResult();
        extendedResult.setId(resultSet.getLong("id"));
        extendedResult.setQuizId(resultSet.getLong("nquizid"));
        extendedResult.setQuizName(resultSet.getString("vname"));
        extendedResult.setQuizOwnerName(resultSet.getString("vquizownername"));
        extendedResult.setEndDate(resultSet.getDate("denddate"));
        extendedResult.setStartDate(resultSet.getDate("dstartdate"));
        extendedResult.setResult(resultSet.getFloat("fresult"));
        extendedResult.setUserId(resultSet.getLong("nuserid"));
        extendedResult.setAnswerIds(resultSet.getString("vanswerids"));
        extendedResult.setUserName(resultSet.getString("vusername"));

        return extendedResult;
    }
}
