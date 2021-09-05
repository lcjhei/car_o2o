package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 审核列对象 t_car_package_audit
 * 
 * @author lcj
 * @date 2021-08-27
 */
public class CarPackageAudit extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    public static final String DEFINITION_KEY = "carPackageAudit";//汽车套餐流程key
    public static final Integer STATUS_IN_ROGRESS = 0;//审核中
    public static final Integer STATUS_REJECT = 1;//审核拒绝
    public static final Integer STATUS_PASS = 2;//审核通过
    public static final Integer STATUS_CANCEL = 3;//审核撤销


    /** $column.columnComment */
    private Long id;

    private ServiceItem serviceItem = new ServiceItem();
    /** 服务项信息(JSON格式) */
    @Excel(name = "服务项信息(JSON格式)")
    private String serviceItemInfo;

    /** 状态【进行中0/审核拒绝1/审核通过2/审核撤销3】 */
    @Excel(name = "状态【进行中0/审核拒绝1/审核通过2/审核撤销3】")
    private Integer status;

    /** 流程实例ID */
    @Excel(name = "流程实例ID")
    private String instanceId;

    /** 当前节点审核人 */
    @Excel(name = "当前节点审核人")
    private String auditors;

    /** 流程定义ID */
    @Excel(name = "流程定义ID")
    private String processDefinitionId;

    /** 任务ID */
    private String taskId;
    /** 任务名称 */
    private String taskName;
    /** 申请人 */
    private String createByName;
    /** 任务完成时间*/
    private Date doneTime;

    public void setDoneTime(Date doneTime) {
        this.doneTime = doneTime;
    }

    public Date getDoneTime() {
        return doneTime;
    }

    public ServiceItem getServiceItem() {
        return serviceItem;
    }

    public void setServiceItem(ServiceItem serviceItem) {
        this.serviceItem = serviceItem;
    }

    public void setCreateByName(String createByName) {
        this.createByName = createByName;
    }

    public String getCreateByName() {
        return createByName;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setServiceItemInfo(String serviceItemInfo) 
    {
        this.serviceItemInfo = serviceItemInfo;
    }

    public String getServiceItemInfo() 
    {
        return serviceItemInfo;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setInstanceId(String instanceId) 
    {
        this.instanceId = instanceId;
    }

    public String getInstanceId() 
    {
        return instanceId;
    }
    public void setAuditors(String auditors) 
    {
        this.auditors = auditors;
    }

    public String getAuditors() 
    {
        return auditors;
    }
    public void setProcessDefinitionId(String processDefinitionId) 
    {
        this.processDefinitionId = processDefinitionId;
    }

    public String getProcessDefinitionId() 
    {
        return processDefinitionId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("serviceItemInfo", getServiceItemInfo())
            .append("status", getStatus())
            .append("instanceId", getInstanceId())
            .append("auditors", getAuditors())
            .append("processDefinitionId", getProcessDefinitionId())
            .toString();
    }
}
