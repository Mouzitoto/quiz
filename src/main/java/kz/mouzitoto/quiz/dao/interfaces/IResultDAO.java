package kz.mouzitoto.quiz.dao.interfaces;

import kz.mouzitoto.quiz.dao.models.ExtendedResult;

import java.util.Date;
import java.util.List;

/**
 * Created by ruslan.babich on 01.03.2016.
 */
public interface IResultDAO {
    public Long createResult(Long quizId, Long userId, Date startDate);

    public void updateResultById(Long resultId, Date endDate, float quizResult, String answerIds);

    public List<ExtendedResult> getExtendedResultsByUserId(Long userId);

    public List<ExtendedResult> getBestResultsWithLimit(Integer limit);

    public void cleanUnfinishedResults();
}
