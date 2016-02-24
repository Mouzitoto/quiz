package kz.mouzitoto.quiz.dao.models;

import java.util.Date;

/**
 * Created by ruslan.babich on 11.02.2016.
 */
public class Quiz {

    private Long id;
    private String name;
    private Long userId;
    private Date createDate;
    private Boolean isActive;


    //Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }
}

//    id numeric NOT NULL,
//    vname character varying,
//        nuserid numeric,
//        dcreatedate date,
//        bisactive boolean,
