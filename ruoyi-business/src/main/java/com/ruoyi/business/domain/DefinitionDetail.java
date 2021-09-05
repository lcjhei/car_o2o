package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 流程定义明细对象 t_definition_detail
 * 
 * @author lcj
 * @date 2021-08-26
 */
public class DefinitionDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private DefinitionInfo definitionInfo;

    /** 流程定义id */
    @Excel(name = "流程定义id")
    private Long definitionInfoId;

    /** 流程部署id */
    @Excel(name = "流程部署id")
    private String deploymentId;

    /** 部署的key */
    @Excel(name = "部署的key")
    private String deployKey;

    /** 版本号 */
    @Excel(name = "版本号")
    private Long version;

    /** 部署时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "部署时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deployTime;

    public DefinitionInfo getDefinitionInfo() {
        return definitionInfo;
    }

    public void setDefinitionInfo(DefinitionInfo definitionInfo) {
        this.definitionInfo = definitionInfo;
    }

    public void setDefinitionInfoId(Long definitionInfoId)
    {
        this.definitionInfoId = definitionInfoId;
    }

    public Long getDefinitionInfoId() 
    {
        return definitionInfoId;
    }
    public void setDeploymentId(String deploymentId) 
    {
        this.deploymentId = deploymentId;
    }

    public String getDeploymentId() 
    {
        return deploymentId;
    }
    public void setDeployKey(String deployKey) 
    {
        this.deployKey = deployKey;
    }

    public String getDeployKey() 
    {
        return deployKey;
    }
    public void setVersion(Long version) 
    {
        this.version = version;
    }

    public Long getVersion() 
    {
        return version;
    }
    public void setDeployTime(Date deployTime) 
    {
        this.deployTime = deployTime;
    }

    public Date getDeployTime() 
    {
        return deployTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("definitionInfoId", getDefinitionInfoId())
            .append("deploymentId", getDeploymentId())
            .append("deployKey", getDeployKey())
            .append("version", getVersion())
            .append("deployTime", getDeployTime())
            .toString();
    }
}
