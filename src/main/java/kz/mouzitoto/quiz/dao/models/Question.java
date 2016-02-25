package kz.mouzitoto.quiz.dao.models;

import java.util.List;

/**
 * Created by ruslan.babich on 25.02.2016.
 */
public class Question {
    private Long id;
    private String body;
    private Long quizId;
    private List<Answer> answers;



    //Getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }
}
