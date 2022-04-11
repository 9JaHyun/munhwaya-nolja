package com.munhwa.prj.common.entity;

import java.util.Date;

public class BaseEntity {

    private Date createdAt;
    private Date updatedAt;

    public void initCreateEntity() {
        this.createdAt = new Date();
        this.updatedAt = new Date();
    }

    public void initUpdateEntity() {
        this.createdAt = new Date();
        this.updatedAt = new Date();
    }
}
