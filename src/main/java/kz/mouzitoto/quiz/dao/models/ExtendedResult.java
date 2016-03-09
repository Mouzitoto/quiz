package kz.mouzitoto.quiz.dao.models;

import java.sql.Date;

/**
 * Created by ruslan.babich on 09.03.2016.
 */
public class ExtendedResult {
    private Long id;
    private Long quizId;
    private String quizName;
    private String quizOwnerName;
    private Long userId;
    private String userName;
    private Date startDate;
    private Date endDate;
    private float result;
    private String answerIds;

    //Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public float getResult() {
        return result;
    }

    public void setResult(float result) {
        this.result = result;
    }

    public String getAnswerIds() {
        return answerIds;
    }

    public void setAnswerIds(String answerIds) {
        this.answerIds = answerIds;
    }

    public String getQuizOwnerName() {
        return quizOwnerName;
    }

    public void setQuizOwnerName(String quizOwnerName) {
        this.quizOwnerName = quizOwnerName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
