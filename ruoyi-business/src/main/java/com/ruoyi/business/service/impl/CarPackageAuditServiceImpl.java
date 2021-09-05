package com.ruoyi.business.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.ruoyi.business.domain.HistoryActivity;
import com.ruoyi.business.domain.ServiceItem;
import com.ruoyi.business.service.IDefinitionNodeService;
import com.ruoyi.business.service.IProcessService;
import com.ruoyi.business.service.IServiceItemService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysUserService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.CarPackageAuditMapper;
import com.ruoyi.business.domain.CarPackageAudit;
import com.ruoyi.business.service.ICarPackageAuditService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.Size;

/**
 * 审核列Service业务层处理
 * 
 * @author lcj
 * @date 2021-08-27
 */
@Service
public class CarPackageAuditServiceImpl implements ICarPackageAuditService 
{
    @Autowired
    private CarPackageAuditMapper carPackageAuditMapper;

    @Autowired
    private IProcessService processService;

    @Autowired
    private IServiceItemService serviceItemService;

    @Autowired
    private IDefinitionNodeService definitionNodeService;

    @Autowired
    private ISysUserService sysUserService;
    /**
     * 查询审核列
     * 
     * @param id 审核列ID
     * @return 审核列
     */
    @Override
    public CarPackageAudit selectCarPackageAuditById(Long id)
    {
        return carPackageAuditMapper.selectCarPackageAuditById(id);
    }

    /**
     * 查询审核列列表
     * 
     * @param carPackageAudit 审核列
     * @return 审核列
     */
    @Override
    public List<CarPackageAudit> selectCarPackageAuditList(CarPackageAudit carPackageAudit) {
        List<CarPackageAudit> carPackageAudits = carPackageAuditMapper.selectCarPackageAuditList(carPackageAudit);
        Task task = null;
        for (CarPackageAudit packageAudit : carPackageAudits) {
            packageAudit.setServiceItem(JSON.parseObject(packageAudit.getServiceItemInfo(), ServiceItem.class));

            task = processService.selectTaskByInstanceId(packageAudit.getInstanceId());
            if (task != null) {
                packageAudit.setTaskId(task.getId());
                packageAudit.setTaskName(task.getName());
            } else {
                packageAudit.setTaskName("已结束");
            }
        }
        return carPackageAudits;
    }

    /**
     * 新增审核列
     * 
     * @param carPackageAudit 审核列
     * @return 结果
     */
    @Override
    public int insertCarPackageAudit(CarPackageAudit carPackageAudit)
    {
        carPackageAudit.setCreateTime(DateUtils.getNowDate());
        return carPackageAuditMapper.insertCarPackageAudit(carPackageAudit);
    }

    /**
     * 修改审核列
     * 
     * @param carPackageAudit 审核列
     * @return 结果
     */
    @Override
    public int updateCarPackageAudit(CarPackageAudit carPackageAudit)
    {
        return carPackageAuditMapper.updateCarPackageAudit(carPackageAudit);
    }

    /**
     * 删除审核列对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCarPackageAuditByIds(String ids)
    {
        return carPackageAuditMapper.deleteCarPackageAuditByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除审核列信息
     * 
     * @param id 审核列ID
     * @return 结果
     */
    @Override
    public int deleteCarPackageAuditById(Long id)
    {
        return carPackageAuditMapper.deleteCarPackageAuditById(id);
    }

    @Override
    public void cancelApply(Long id) {
        CarPackageAudit audit = carPackageAuditMapper.selectCarPackageAuditById(id);
        if (audit.getStatus() == CarPackageAudit.STATUS_CANCEL) {
            throw new BusinessException("撤销状态不能再撤销！");
        }
        //修改养修服务项对象的状态
        ServiceItem serviceItem = JSON.parseObject(audit.getServiceItemInfo(), ServiceItem.class);
        serviceItemService.updateServiceItemStatus(serviceItem.getId(),ServiceItem.AUDITSTATUS_INIT);
        //修改记录对象的状态及当前审核人
        audit.setStatus(CarPackageAudit.STATUS_CANCEL);
        audit.setAuditors("");
        carPackageAuditMapper.updateCarPackageAudit(audit);
        //删除流程实例
        processService.deleteProcessInstance(audit.getInstanceId(),"用户撤销");
    }

    @Override
    public List<CarPackageAudit> selectTodoList(CarPackageAudit carPackageAudit) {
        //1.查询当前登录用户关于汽车审核所有的待办任务总数
        long count = processService.selectTodoTaskCount(CarPackageAudit.DEFINITION_KEY, ShiroUtils.getUserId().toString());
        if (count > 0) {
            PageDomain pageDomain = TableSupport.buildPageRequest();
            Integer pageNum = pageDomain.getPageNum();
            Integer pageSize = pageDomain.getPageSize();

            List<Task> tasks = processService.selectTasksByCandidateId(
                    ShiroUtils.getUserId().toString(),
                    CarPackageAudit.DEFINITION_KEY,
                    (pageNum - 1) * pageSize,
                    pageSize);

            List<CarPackageAudit> audits = new ArrayList<>();
            CarPackageAudit audit;
            for (Task task : tasks) {
                String instanceId = task.getProcessInstanceId();
                audit = carPackageAuditMapper.selectCarPackageAuditByInstanceId(instanceId);
                audit.setTaskId(task.getId());
                audit.setTaskName(task.getName());
                ServiceItem serviceItem = JSON.parseObject(audit.getServiceItemInfo(), ServiceItem.class);
                audit.setServiceItem(serviceItem);
                audits.add(audit);
            }

            //封装成Page对象返回
            Page<CarPackageAudit> list = new Page<>();
            list.setTotal(count);
            list.setPageNum(pageNum);
            list.setPageSize(pageSize);
            list.addAll(audits);
            return list;
        } else {
            return Collections.EMPTY_LIST;
        }
    }

    @Override
    @Transactional
    public void complete(String taskId, String auditStatus, String comment) {
        boolean auditStatusBoolean = Boolean.parseBoolean(auditStatus);
        String commentStr = auditStatusBoolean ? "【同意】":"【拒绝】";
        if (StringUtils.isNotEmpty(comment)) {
            commentStr += comment;
        }
        //审批通过
        //审批不通过

        //获取当前任务节点
        Task task = processService.selectTaskById(taskId);
        //获取流程实例
        ProcessInstance instance = processService.getProcessInstanceById(task.getProcessInstanceId());
        //设置参数，审核结果，审核备注,领取任务，执行任务
        processService.claimAndCompleteTask(task,auditStatusBoolean, commentStr);
        //获取下一个任务节点
        Task nextTask = processService.selectTaskByInstanceId(task.getProcessInstanceId());

        CarPackageAudit audit = carPackageAuditMapper.selectCarPackageAuditByInstanceId(instance.getId());
        if (nextTask != null) {  //不为null，表示有下一个任务节点
            List<String> auditors = new ArrayList<>();
            if (auditStatusBoolean) {   //审核通过
                //设置候选人
                List<SysUser> auditorList = definitionNodeService.queryAuditorsByTaskDefinitionKey(nextTask.getTaskDefinitionKey());
                for (SysUser auditor : auditorList) {
                    processService.addCandidateUser(nextTask.getId(),auditor.getUserId().toString());
                    auditors.add(auditor.getUserName());
                }
            } else {    //审核不通过
                //设置发起人为负责人
                String userId = audit.getCreateBy();
                processService.addCandidateUser(nextTask.getId(), userId);
                //修改审核记录对象的状态为审核拒接
                audit.setStatus(CarPackageAudit.STATUS_REJECT);
                auditors.add(audit.getCreateByName());
            }
            //更新审核对象
            audit.setAuditors(JSON.toJSONString(auditors));
            carPackageAuditMapper.updateCarPackageAudit(audit);
        } else {    //null，表示流程已经结束
            CarPackageAudit carPackageAudit = carPackageAuditMapper.selectCarPackageAuditByInstanceId(instance.getId());
            ServiceItem serviceItem = JSON.parseObject(carPackageAudit.getServiceItemInfo(), ServiceItem.class);
            //修改套餐对象的状态为审核通过
            serviceItemService.updateServiceItemStatus(serviceItem.getId(),ServiceItem.AUDITSTATUS_APPROVED);
            //修改审核记录对象的状态为审核通过
            carPackageAudit.setStatus(CarPackageAudit.STATUS_PASS);
            carPackageAuditMapper.updateCarPackageAudit(carPackageAudit);
        }
    }

    @Override
    @Transactional
    public void updateServiceItem(Long carPackageAuditId, ServiceItem serviceItem) {
        //修改表单
        //修改养修套餐对象
        serviceItemService.updateServiceItemNoVersion(serviceItem);
        //修改审核记录对象
        CarPackageAudit audit = carPackageAuditMapper.selectCarPackageAuditById(carPackageAuditId);
        audit.setServiceItemInfo(JSON.toJSONString(serviceItem));
        carPackageAuditMapper.updateCarPackageAudit(audit);
    }

    @Override
    public void reApply(String taskId, Long carPackageAuditId) {
        CarPackageAudit audit = carPackageAuditMapper.selectCarPackageAuditById(carPackageAuditId);
        ServiceItem serviceItem = JSON.parseObject(audit.getServiceItemInfo(), ServiceItem.class);
        //重新提交申请
        //获取当前任务对象
        Task task = processService.selectTaskById(taskId);
        //设置参数，领取任务，执行任务
        processService.setVariable(taskId,"money",serviceItem.getDiscountPrice().longValue());
        processService.claimAndCompleteTask(task,true,"重新提交申请");
        //获取下一个任务对象
        Task nextTask = processService.selectTaskByInstanceId(task.getProcessInstanceId());
        //设置候选人
        List<SysUser> auditorList = definitionNodeService
                .queryAuditorsByTaskDefinitionKey(nextTask.getTaskDefinitionKey());
        for (SysUser auditor : auditorList) {
            processService.addCandidateUser(nextTask.getId(),auditor.getUserId().toString());
        }
        //更新审核对象
        audit.setStatus(CarPackageAudit.STATUS_IN_ROGRESS);
        List<String> auditors = auditorList
                .stream()
                .map(sysUser -> sysUser.getUserName())
                .collect(Collectors.toList());
        audit.setAuditors(JSON.toJSONString(auditors));
        carPackageAuditMapper.updateCarPackageAudit(audit);
    }

    @Override
    public List<CarPackageAudit> selectDoneList() {
        //1.查询当前登录用户关于汽车审核所有的待办任务总数
        long count = processService.selectDoneTaskCount(CarPackageAudit.DEFINITION_KEY, ShiroUtils.getUserId().toString());
        if (count > 0) {
            PageDomain pageDomain = TableSupport.buildPageRequest();
            Integer pageNum = pageDomain.getPageNum();
            Integer pageSize = pageDomain.getPageSize();

            List<HistoricTaskInstance> tasks = processService.selectDoneTaskList(
                    ShiroUtils.getUserId().toString(),
                    CarPackageAudit.DEFINITION_KEY,
                    (pageNum - 1) * pageSize,
                    pageSize);

            List<CarPackageAudit> audits = new ArrayList<>();
            CarPackageAudit audit;
            for (HistoricTaskInstance task : tasks) {
                String instanceId = task.getProcessInstanceId();

                //每个流程实例对应 t_car_package_audit 表中只有一条数据 所以也可以使用该方法查询出carPackageAudit的对象
                audit = carPackageAuditMapper.selectCarPackageAuditByInstanceId(instanceId);

                //通过拿到历史流程实例，再通过历史流程实例的businessKey去获取carPackageAudit对象
                /*HistoricProcessInstance historicProcessInstance = processService
                                                .getHistoricProcessInstanceById(task.getProcessInstanceId());
                String businessKey = historicProcessInstance.getBusinessKey();
                audit = carPackageAuditMapper.getCarPackageAudit(businessKey);*/
                audit.setTaskId(task.getId());
                audit.setTaskName(task.getName());
                audit.setDoneTime(task.getEndTime());
                ServiceItem serviceItem = JSON.parseObject(audit.getServiceItemInfo(), ServiceItem.class);
                audit.setServiceItem(serviceItem);
                audits.add(audit);
            }

            //封装成Page对象返回
            Page<CarPackageAudit> list = new Page<>();
            list.setTotal(count);
            list.setPageNum(pageNum);
            list.setPageSize(pageSize);
            list.addAll(audits);
            return list;
        } else {
            return Collections.EMPTY_LIST;
        }
    }

    @Override
    public List<HistoryActivity> selectHistoryList(String instanceId) {
        List<HistoryActivity> historyActivities = new ArrayList<>();
        //可以查询历史任务表，更方便些
        List<HistoricActivityInstance> historicActivityInstances = processService.selectHistoricActivityInstance(instanceId);
        for (HistoricActivityInstance instance : historicActivityInstances) {
            HistoryActivity historyActivity = new HistoryActivity();
            BeanUtils.copyProperties(instance,historyActivity);

            //添加备注
            historyActivity.setComment(processService.getCommentByTaskId(instance.getTaskId()));

            //添加审核人名称
            SysUser user = sysUserService.selectUserById(Long.parseLong(instance.getAssignee()));
            if (user != null) {
                historyActivity.setAssigneeName(user.getUserName());
            }
            historyActivities.add(historyActivity);
        }
        return historyActivities;
    }
}
