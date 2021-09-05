package com.ruoyi.business.service;

import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface IProcessService {
    /**
     * 部署套餐审核流程
     * @param filePath
     * @return
     * @throws FileNotFoundException
     */
    Deployment deploy(String filePath) throws FileNotFoundException;

    /**
     * 通过部署id 获取流程定义
     * @param deploymentId
     * @return
     */
    ProcessDefinition selectProcessDefinitionByDeploymentId(String deploymentId);

    InputStream getResourceAsStream(String deploymentId, String resourceName);

    InputStream getProcessImage(String processDefinitionId,
                                List<String> highLightedActivities,
                                List<String> highLightedFlows);

    /**
     * 启动套餐审核流程
     * @param definitionKey
     * @param businessKey
     * @param variables
     * @return
     */
    ProcessInstance startProcessInstanceByKey(String definitionKey, String businessKey, Map<String, Object> variables);

    /**
     * 通过流程实例id 获取当前任务 节点
     * @param instanceId
     * @return
     */
    Task selectTaskByInstanceId(String instanceId);

    /**
     * 设置候选人
     * @param taskId
     * @param userId
     */
    void addCandidateUser(String taskId, String userId);

    /**
     * 获取
     * @param instanceId
     * @return
     */
    List<String> getActiveActivityIds(String instanceId);

    /**
     * 删除流程实例
     * @param instanceId
     * @param deleteReason
     */
    void deleteProcessInstance(String instanceId, String deleteReason);

    /**
     * 查询当前任务
     * @param userId
     * @param definitionKey
     * @param startNum
     * @param pageSize
     * @return
     */
    List<Task> selectTasksByCandidateId(String userId, String definitionKey, Integer startNum, Integer pageSize);

    /**
     * 查询待办任务总数
     * @param definitionKey
     * @param userId
     * @return
     */
    long selectTodoTaskCount(String definitionKey, String userId);

    /**
     * 查询当前任务
     * @param taskId
     * @return
     */
    Task selectTaskById(String taskId);

    /**
     * 查询流程实例
     * @param processInstanceId
     * @return
     */
    ProcessInstance getProcessInstanceById(String processInstanceId);

    /**
     * 设置审核参数，领取并执行任务
     * @param task
     * @param auditStatusBoolean
     * @param commentStr
     */
    void claimAndCompleteTask(Task task, Boolean auditStatusBoolean, String commentStr);

    void setVariable(String taskId, String name, Object value);

    long selectDoneTaskCount(String definitionKey, String userId);

    List<HistoricTaskInstance> selectDoneTaskList(String userId, String definitionKey, int start, Integer pageSize);

    /**
     * 查询历史活动对象
     * @param instanceId
     * @return
     */
    List<HistoricActivityInstance> selectHistoricActivityInstance(String instanceId);

    /**
     * 获取备注
     * @param taskId
     * @return
     */
    String getCommentByTaskId(String taskId);
}
