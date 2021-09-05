package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.DefinitionNode;
import com.ruoyi.common.core.domain.entity.SysUser;

/**
 * 流程定义节点信息Service接口
 * 
 * @author lcj
 * @date 2021-08-27
 */
public interface IDefinitionNodeService 
{
    /**
     * 查询流程定义节点信息
     * 
     * @param id 流程定义节点信息ID
     * @return 流程定义节点信息
     */
    public DefinitionNode selectDefinitionNodeById(Long id);

    /**
     * 查询流程定义节点信息列表
     * 
     * @param definitionNode 流程定义节点信息
     * @return 流程定义节点信息集合
     */
    public List<DefinitionNode> selectDefinitionNodeList(DefinitionNode definitionNode);

    /**
     * 新增流程定义节点信息
     * 
     * @param definitionNode 流程定义节点信息
     * @return 结果
     */
    public int insertDefinitionNode(DefinitionNode definitionNode);

    /**
     * 修改流程定义节点信息
     * 
     * @param definitionNode 流程定义节点信息
     * @return 结果
     */
    public int updateDefinitionNode(DefinitionNode definitionNode);

    /**
     * 批量删除流程定义节点信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDefinitionNodeByIds(String ids);

    /**
     * 删除流程定义节点信息信息
     * 
     * @param id 流程定义节点信息ID
     * @return 结果
     */
    public int deleteDefinitionNodeById(Long id);

    /**
     * 查询选中的用户id
     * @param nodeId
     * @return
     */
    List<Long> selectAuditorIdsByNodeId(Long nodeId);

    /**
     * 通过taskDefinitionKey 查询当前节点任务候选人的集合
     * @param taskDefinitionKey
     * @return
     */
    List<SysUser> queryAuditorsByTaskDefinitionKey(String taskDefinitionKey);
}
