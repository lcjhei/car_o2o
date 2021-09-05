package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 跟进记录对象 t_follow_up_record
 * 
 * @author lcj
 * @date 2021-09-01
 */
public class FollowUpRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    private String customerName;

    /** 客户id */
    private Long customerId;

    /** 跟进内容 */
    private String chatInformation;

    /** 跟进时间 */
    private Date followUpTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    public void setCustomerId(Long customerId)
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }
    public void setChatInformation(String chatInformation) 
    {
        this.chatInformation = chatInformation;
    }

    public String getChatInformation() 
    {
        return chatInformation;
    }
    public void setFollowUpTime(Date followUpTime) 
    {
        this.followUpTime = followUpTime;
    }

    public Date getFollowUpTime() 
    {
        return followUpTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("customerId", getCustomerId())
            .append("chatInformation", getChatInformation())
            .append("followUpTime", getFollowUpTime())
            .toString();
    }
}
