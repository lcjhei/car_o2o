package com.ruoyi.business.domain;

import org.activiti.engine.impl.persistence.entity.HistoricActivityInstanceEntityImpl;

public class HistoryActivity extends HistoricActivityInstanceEntityImpl {
    private String comment;
    private String assigneeName;

    public String getAssigneeName() {
        return assigneeName;
    }

    public void setAssigneeName(String assigneeName) {
        this.assigneeName = assigneeName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}

