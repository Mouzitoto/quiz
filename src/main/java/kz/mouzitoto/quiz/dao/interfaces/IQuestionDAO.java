package kz.mouzitoto.quiz.dao.interfaces;

import kz.mouzitoto.quiz.dao.models.Question;

import java.util.List;

/**
 * Created by ruslan.babich on 25.02.2016.
 */
public interface IQuestionDAO {

    public List<Question> getQuestionsByQuizId(Long quizId);

    public void insertQuestion(Long id, Long quizId, String questionBody);

    public Integer getQuestionCountByQuizId(Long quizId);

    public void updateQuestion(Question question);

}
