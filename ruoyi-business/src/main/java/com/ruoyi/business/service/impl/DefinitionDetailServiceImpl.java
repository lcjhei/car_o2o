package com.ruoyi.business.service.impl;

import java.io.FileNotFoundException;
import java.util.List;

import com.ruoyi.business.domain.DefinitionInfo;
import com.ruoyi.business.service.IProcessService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.DefinitionDetailMapper;
import com.ruoyi.business.domain.DefinitionDetail;
import com.ruoyi.business.service.IDefinitionDetailService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

/**
 * 流程定义明细Service业务层处理
 * 
 * @author lcj
 * @date 2021-08-26
 */
@Service
public class DefinitionDetailServiceImpl implements IDefinitionDetailService 
{
    @Autowired
    private DefinitionDetailMapper definitionDetailMapper;

    @Autowired
    private IProcessService processService;

    /**
     * 查询流程定义明细
     * 
     * @param definitionInfoId 流程定义明细ID
     * @return 流程定义明细
     */
    @Override
    public DefinitionDetail selectDefinitionDetailById(Long definitionInfoId)
    {
        return definitionDetailMapper.selectDefinitionDetailById(definitionInfoId);
    }

    /**
     * 查询流程定义明细列表
     * 
     * @param definitionDetail 流程定义明细
     * @return 流程定义明细
     */
    @Override
    public List<DefinitionDetail> selectDefinitionDetailList(DefinitionDetail definitionDetail)
    {
        return definitionDetailMapper.selectDefinitionDetailList(definitionDetail);
    }

    /**
     * 新增流程定义明细
     * 
     * @param definitionDetail 流程定义明细
     * @return 结果
     */
    @Override
    public int insertDefinitionDetail(DefinitionDetail definitionDetail)
    {
        return definitionDetailMapper.insertDefinitionDetail(definitionDetail);
    }

    /**
     * 修改流程定义明细
     * 
     * @param definitionDetail 流程定义明细
     * @return 结果
     */
    @Override
    public int updateDefinitionDetail(DefinitionDetail definitionDetail)
    {
        return definitionDetailMapper.updateDefinitionDetail(definitionDetail);
    }

    /**
     * 删除流程定义明细对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteDefinitionDetailByIds(String ids)
    {
        return definitionDetailMapper.deleteDefinitionDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除流程定义明细信息
     * 
     * @param definitionInfoId 流程定义明细ID
     * @return 结果
     */
    @Override
    public int deleteDefinitionDetailById(Long definitionInfoId)
    {
        return definitionDetailMapper.deleteDefinitionDetailById(definitionInfoId);
    }

    @Override
    @Transactional
    public void saveProcessDefinition(Long definitionId, String filePath) throws FileNotFoundException {
        Deployment deployment = processService.deploy(filePath);
        ProcessDefinition processDefinition = processService.selectProcessDefinitionByDeploymentId(deployment.getId());

        DefinitionDetail definitionDetail = new DefinitionDetail();
        definitionDetail.setDefinitionInfoId(definitionId);
        definitionDetail.setDeploymentId(deployment.getId());
        definitionDetail.setDeployTime(deployment.getDeploymentTime());
        definitionDetail.setDeployKey(deployment.getKey());
        definitionDetail.setVersion(processDefinition.getVersion() + 0L);
        definitionDetailMapper.insertDefinitionDetail(definitionDetail);

    }
}
