package kz.mouzitoto.quiz.dao.interfaces;

import kz.mouzitoto.quiz.dao.models.Answer;

import java.util.List;

/**
 * Created by ruslan.babich on 25.02.2016.
 */
public interface IAnswerDAO {

    public void insertAnswer(Long id, String answerBody, Long questionId, Boolean isCorrect);

    public List<Answer> getAnswersByQuestionId(Long questionId);
}
