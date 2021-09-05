package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 流程定义节点信息对象 t_definition_node
 * 
 * @author lcj
 * @date 2021-08-27
 */
public class DefinitionNode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 流程定义ID */
    private Long definitionInfoId;

    /** 节点key */
    @Excel(name = "节点key")
    private String nodeKey;

    /** 节点描述 */
    @Excel(name = "节点描述")
    private String nodeDescription;

    /** 审核人 */
    private List<Long> auditorIds = new ArrayList<>();

    public List<Long> getAuditorIds() {
        return auditorIds;
    }

    public void setAuditorIds(List<Long> auditorIds) {
        this.auditorIds = auditorIds;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDefinitionInfoId(Long definitionInfoId) 
    {
        this.definitionInfoId = definitionInfoId;
    }

    public Long getDefinitionInfoId() 
    {
        return definitionInfoId;
    }
    public void setNodeKey(String nodeKey) 
    {
        this.nodeKey = nodeKey;
    }

    public String getNodeKey() 
    {
        return nodeKey;
    }
    public void setNodeDescription(String nodeDescription) 
    {
        this.nodeDescription = nodeDescription;
    }

    public String getNodeDescription() 
    {
        return nodeDescription;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("definitionInfoId", getDefinitionInfoId())
            .append("nodeKey", getNodeKey())
            .append("nodeDescription", getNodeDescription())
            .toString();
    }
}
