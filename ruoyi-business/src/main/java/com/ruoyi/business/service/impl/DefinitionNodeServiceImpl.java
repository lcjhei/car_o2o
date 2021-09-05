package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.DefinitionNodeMapper;
import com.ruoyi.business.domain.DefinitionNode;
import com.ruoyi.business.service.IDefinitionNodeService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流程定义节点信息Service业务层处理
 * 
 * @author lcj
 * @date 2021-08-27
 */
@Service
public class DefinitionNodeServiceImpl implements IDefinitionNodeService 
{
    @Autowired
    private DefinitionNodeMapper definitionNodeMapper;

    /**
     * 查询流程定义节点信息
     * 
     * @param id 流程定义节点信息ID
     * @return 流程定义节点信息
     */
    @Override
    public DefinitionNode selectDefinitionNodeById(Long id)
    {
        return definitionNodeMapper.selectDefinitionNodeById(id);
    }

    /**
     * 查询流程定义节点信息列表
     * 
     * @param definitionNode 流程定义节点信息
     * @return 流程定义节点信息
     */
    @Override
    public List<DefinitionNode> selectDefinitionNodeList(DefinitionNode definitionNode)
    {
        return definitionNodeMapper.selectDefinitionNodeList(definitionNode);
    }

    /**
     * 新增流程定义节点信息
     * 
     * @param definitionNode 流程定义节点信息
     * @return 结果
     */
    @Override
    @Transactional
    public int insertDefinitionNode(DefinitionNode definitionNode)
    {
        int i = definitionNodeMapper.insertDefinitionNode(definitionNode);
        if (definitionNode.getAuditorIds() != null && definitionNode.getAuditorIds().size() > 0) {
            for (Long auditorId : definitionNode.getAuditorIds()) {
                definitionNodeMapper.insertRelation(definitionNode.getId(),auditorId);
            }
        }
        return i;
    }

    /**
     * 修改流程定义节点信息
     * 
     * @param definitionNode 流程定义节点信息
     * @return 结果
     */
    @Override
    public int updateDefinitionNode(DefinitionNode definitionNode)
    {
        definitionNodeMapper.deleteRelation(definitionNode.getId());
        if (definitionNode.getAuditorIds() != null && definitionNode.getAuditorIds().size() > 0) {
            for (Long auditorId : definitionNode.getAuditorIds()) {
                definitionNodeMapper.insertRelation(definitionNode.getId(),auditorId);
            }
        }
        return definitionNodeMapper.updateDefinitionNode(definitionNode);
    }

    /**
     * 删除流程定义节点信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteDefinitionNodeByIds(String ids)
    {
        int i = definitionNodeMapper.deleteDefinitionNodeByIds(Convert.toStrArray(ids));
        for (String s : ids.split(",")) {
            definitionNodeMapper.deleteRelation(Long.parseLong(s));
        }
        return i;
    }

    /**
     * 删除流程定义节点信息信息
     * 
     * @param id 流程定义节点信息ID
     * @return 结果
     */
    @Override
    public int deleteDefinitionNodeById(Long id)
    {
        return definitionNodeMapper.deleteDefinitionNodeById(id);
    }

    @Override
    public List<Long> selectAuditorIdsByNodeId(Long nodeId) {
        return definitionNodeMapper.selectAuditorIdsByNodeId(nodeId);
    }

    @Override
    public List<SysUser> queryAuditorsByTaskDefinitionKey(String taskDefinitionKey) {
        return definitionNodeMapper.queryAuditorsByTaskDefinitionKey(taskDefinitionKey);
    }
}
