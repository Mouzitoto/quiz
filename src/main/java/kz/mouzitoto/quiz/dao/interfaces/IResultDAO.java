package kz.mouzitoto.quiz.dao.interfaces;

import java.util.Date;

/**
 * Created by ruslan.babich on 01.03.2016.
 */
public interface IResultDAO {
    public Long createResult(Long quizId, Long userId, Date startDate);

    public void updateResultById(Long resultId, Date endDate, float quizResult, String answerIds);

    public void cleanUnfinishedResults();
}
