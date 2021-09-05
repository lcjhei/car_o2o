package com.ruoyi.business.service.impl;

import com.alibaba.fastjson.JSON;
import com.ruoyi.business.domain.CarPackageAudit;
import com.ruoyi.business.domain.ServiceItem;
import com.ruoyi.business.mapper.ServiceItemMapper;
import com.ruoyi.business.service.ICarPackageAuditService;
import com.ruoyi.business.service.IDefinitionNodeService;
import com.ruoyi.business.service.IProcessService;
import com.ruoyi.business.service.IServiceItemService;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.service.ISysUserService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 养修服务项Service业务层处理
 * 
 * @author wolfcode
 * @date 2021-05-14
 */
@Service
public class ServiceItemServiceImpl implements IServiceItemService
{
    @Autowired
    private ServiceItemMapper serviceItemMapper;

    @Autowired
    private IProcessService processService;

    @Autowired
    private ICarPackageAuditService carPackageAuditService;

    @Autowired
    private IDefinitionNodeService definitionNodeService;
    /**
     * 查询养修服务项
     * 
     * @param id 养修服务项ID
     * @return 养修服务项
     */
    @Override
    public ServiceItem selectServiceItemById(Long id)
    {
        return serviceItemMapper.selectServiceItemById(id);
    }

    /**
     * 查询养修服务项列表
     * 
     * @param serviceItem 养修服务项
     * @return 养修服务项
     */
    @Override
    public List<ServiceItem> selectServiceItemList(ServiceItem serviceItem)
    {

        return serviceItemMapper.selectServiceItemList(serviceItem);
    }

    /**
     * 新增养修服务项
     * 
     * @param serviceItem 养修服务项
     * @return 结果
     */
    @Override
    public int insertServiceItem(ServiceItem serviceItem)
    {
        serviceItem.setCreateTime(DateUtils.getNowDate());
        if(ServiceItem.CARPACKAGE_YES.equals(serviceItem.getCarPackage())){
            serviceItem.setAuditStatus(ServiceItem.AUDITSTATUS_INIT);//设置初始化
        }
        return serviceItemMapper.insertServiceItem(serviceItem);
    }

    /**
     * 修改养修服务项
     * 
     * @param serviceItem 养修服务项
     * @return 结果
     */
    @Override
    public int updateServiceItem(ServiceItem serviceItem)
    {
        ServiceItem oldObj = selectServiceItemById(serviceItem.getId());
        //处于上架状态的商品不能修改
        if(ServiceItem.SALESTATUS_ON.equals(oldObj.getSaleStatus())){
            throw new BusinessException("上架服务项目不能修改，请下架后再修改");
        }else if(ServiceItem.AUDITSTATUS_AUDITING.equals(oldObj.getAuditStatus())){
            throw new BusinessException("服务项目正在审核中,不可修改");
        }
        //如果是审核通过，此时修改，需要将其状态变更为初始化
        if(ServiceItem.AUDITSTATUS_APPROVED.equals(oldObj.getAuditStatus())){
            serviceItem.setAuditStatus(ServiceItem.AUDITSTATUS_INIT);
        }
        serviceItem.setVersion(oldObj.getVersion());
        return serviceItemMapper.updateServiceItem(serviceItem);
    }
    /**
     * 删除养修服务项对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteServiceItemByIds(String ids)
    {
        return serviceItemMapper.deleteServiceItemByIds(Convert.toStrArray(ids));
    }
    /**
     * 下架
     *
     * @param id 需要下架的服务项ID
     * @return
     */
    @Override
    public int saleOff(Long id) {
        return serviceItemMapper.changeSaleStatus(id,ServiceItem.SALESTATUS_OFF);
    }
    /**
     * 上架
     * @param id 需要上架的服务ID
     * @return
     */
    @Override
    public int saleOn(Long id) {
        ServiceItem serviceItem = selectServiceItemById(id);
        //如果不是套餐，可以直接上架
        //如果是套餐，只有审核成功才能上架
        if(ServiceItem.CARPACKAGE_YES.equals(serviceItem.getCarPackage())
                && !ServiceItem.AUDITSTATUS_APPROVED.equals(serviceItem.getAuditStatus())){
            throw new BusinessException("套餐服务项需要审核通过之后才能上架");
        }
        return serviceItemMapper.changeSaleStatus(id,ServiceItem.SALESTATUS_ON);
    }
    /**
     * 查询上家的养修服务项列表
     *
     * @param serviceItem 养修服务项
     * @return 养修服务项集合
     */
    @Override
    public List<ServiceItem> selectAllSaleOnList(ServiceItem serviceItem) {
        return serviceItemMapper.selectAllSaleOnList(serviceItem);
    }

    @Override
    @Transactional
    public void startAudit(Long id) {
        //判断是否满足审核状态
        ServiceItem serviceItem = serviceItemMapper.selectServiceItemById(id);
        if (!serviceItem.getAuditStatus().equals(ServiceItem.AUDITSTATUS_INIT)) {
            throw new BusinessException("只有初始状态才能发起审核");
        }
        //修改套餐状态（t_service_item）
        serviceItem.setAuditStatus(ServiceItem.AUDITSTATUS_AUDITING);
        serviceItemMapper.updateServiceItem(serviceItem);

        //创建套餐审核记录对象（t_car_package_audit）
        CarPackageAudit carPackageAudit = new CarPackageAudit();
        //设置记录各种信息
        //createby
        //获取当前登录用户对象
        carPackageAudit.setCreateBy(ShiroUtils.getUserId().toString());
        //套餐服务对象（JSON格式） service_item_info
        carPackageAudit.setServiceItemInfo(JSON.toJSONString(serviceItem));
        carPackageAuditService.insertCarPackageAudit(carPackageAudit);
        //启动activiti7 审核流程
        //设置参数money
        Map<String, Object> variables = new HashMap<>();
        variables.put("money",serviceItem.getDiscountPrice().longValue());
        //设置businessKey
        String businessKey = carPackageAudit.getId().toString();
        //启动审核流程
        ProcessInstance instance = processService
                .startProcessInstanceByKey(CarPackageAudit.DEFINITION_KEY, businessKey,variables);
        //启动流程之后，获取task节点，再由节点设置
        //获取当前task任务
        Task currentTask = processService.selectTaskByInstanceId(instance.getId());
        //设置候选人
        //通过task里面设置key, 然后以key作为条件查询t_definition_node，得到该表对应key绑定的数据
        String taskDefinitionKey = currentTask.getTaskDefinitionKey();
        List<SysUser> auditors = definitionNodeService.queryAuditorsByTaskDefinitionKey(taskDefinitionKey);
        if (auditors != null && auditors.size() > 0) {
            for (SysUser auditor : auditors) {
                processService.addCandidateUser(currentTask.getId(),auditor.getUserId().toString());
            }
        }
        //更新套餐审核记录对象（t_car_package_audit）
        //流程实例id
        carPackageAudit.setInstanceId(instance.getId());
        //流程定义id
        carPackageAudit.setProcessDefinitionId(instance.getProcessDefinitionId());
        //修改状态
        carPackageAudit.setStatus(CarPackageAudit.STATUS_IN_ROGRESS);
        //设置节点候选人 - auditors
        //在页面这样显示：["杨龙","杨凤"]
        List<String> auditorNames = auditors.stream().map(sysUser -> sysUser.getUserName()).collect(Collectors.toList());
        carPackageAudit.setAuditors(JSON.toJSONString(auditorNames));

        carPackageAuditService.updateCarPackageAudit(carPackageAudit);
    }

    @Override
    public void updateServiceItemStatus(Long itemId, Integer status) {
        serviceItemMapper.updateServiceItemStatus(itemId,status);
    }

    @Override
    public void updateServiceItemNoVersion(ServiceItem serviceItem) {
        serviceItemMapper.updateServiceItemNoVersion(serviceItem);
    }
}
