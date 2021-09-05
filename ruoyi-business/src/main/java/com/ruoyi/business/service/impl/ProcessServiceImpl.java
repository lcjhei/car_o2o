package com.ruoyi.business.service.impl;

import com.ruoyi.business.service.IProcessService;
import com.ruoyi.business.service.IServiceItemService;
import com.ruoyi.common.utils.ShiroUtils;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.image.ProcessDiagramGenerator;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

@Service
public class ProcessServiceImpl implements IProcessService {

    @Autowired
    private IServiceItemService serviceItemService;

    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private HistoryService historyService;

    @Override
    public Deployment deploy(String filePath) throws FileNotFoundException {
        Deployment deployment = null;
        if (filePath.endsWith("zip")) {
            ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(filePath));
            deployment = repositoryService.createDeployment()
                    .addZipInputStream(zipInputStream)
                    .deploy();
        } else if (filePath.endsWith("bpmn")){
            deployment = repositoryService.createDeployment()
                    .addInputStream(filePath, new FileInputStream(filePath))
                    .deploy();
        }
        return deployment;
    }

    @Override
    public ProcessDefinition selectProcessDefinitionByDeploymentId(String deploymentId) {
        return repositoryService.createProcessDefinitionQuery().deploymentId(deploymentId).singleResult();
    }

    @Override
    public InputStream getResourceAsStream(String deploymentId, String resourceName) {
        return repositoryService.getResourceAsStream(deploymentId,resourceName);
    }

    @Override
    public InputStream getProcessImage(String processDefinitionId,
                                       List<String> highLightedActivities,
                                       List<String> highLightedFlows) {
        BpmnModel model = repositoryService.getBpmnModel(processDefinitionId);
        ProcessDiagramGenerator generator = new DefaultProcessDiagramGenerator();
        //generateDiagram(流程模型,需要高亮的节点,需要高亮的线条,后面三个参数都表示是字体)
        InputStream inputStream = generator.generateDiagram(model, highLightedActivities, highLightedFlows,"宋体","宋体","宋体");
        return inputStream;
    }

    @Override
    public ProcessInstance startProcessInstanceByKey(String definitionKey, String businessKey, Map<String, Object> variables) {
        return runtimeService.startProcessInstanceByKey(definitionKey,businessKey,variables);
    }

    @Override
    public Task selectTaskByInstanceId(String instanceId) {
        return taskService.createTaskQuery().processInstanceId(instanceId).singleResult();
    }

    @Override
    public void addCandidateUser(String taskId, String userId) {
        taskService.addCandidateUser(taskId,userId);
    }

    @Override
    public List<String> getActiveActivityIds(String instanceId) {
        Task task = taskService.createTaskQuery().processInstanceId(instanceId).singleResult();
        String executionId = task.getExecutionId();
        return runtimeService.getActiveActivityIds(executionId);
        //return runtimeService.getActiveActivityIds(instanceId);
    }

    @Override
    public void deleteProcessInstance(String instanceId, String deleteReason) {
        runtimeService.deleteProcessInstance(instanceId,deleteReason);
    }

    @Override
    public List<Task> selectTasksByCandidateId(String userId, String definitionKey, Integer startNum, Integer pageSize) {
        return taskService.createTaskQuery()
                .taskCandidateUser(userId)
                .processDefinitionKey(definitionKey)
                .listPage(startNum,pageSize);
    }

    @Override
    public long selectTodoTaskCount(String definitionKey, String userId) {
        return taskService.createTaskQuery()
                .taskCandidateUser(userId)
                .processDefinitionKey(definitionKey)
                .count();
    }

    @Override
    public Task selectTaskById(String taskId) {
        return taskService.createTaskQuery().taskId(taskId).singleResult();
    }

    @Override
    public ProcessInstance getProcessInstanceById(String processInstanceId) {
        return runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
    }

    @Override
    public void claimAndCompleteTask(Task task, Boolean auditStatusBoolean, String commentStr) {
        taskService.claim(task.getId(), ShiroUtils.getUserId().toString());
        taskService.setVariable(task.getId(),task.getTaskDefinitionKey(),auditStatusBoolean);
        taskService.addComment(task.getId(),task.getProcessInstanceId(),commentStr);
        taskService.complete(task.getId());
    }

    @Override
    public void setVariable(String taskId, String name, Object value) {
        taskService.setVariable(taskId,name,value);
    }

    @Override
    public long selectDoneTaskCount(String definitionKey, String userId) {
        return historyService.createHistoricTaskInstanceQuery()
                .processDefinitionKey(definitionKey)
                .taskAssignee(userId)
                .finished()
                .orderByHistoricTaskInstanceEndTime()
                .desc()
                .count();
    }

    @Override
    public List<HistoricTaskInstance> selectDoneTaskList(String userId, String definitionKey, int start, Integer pageSize) {
        return historyService.createHistoricTaskInstanceQuery()
                .processDefinitionKey(definitionKey)
                .taskAssignee(userId)
                .finished()
                .orderByHistoricTaskInstanceEndTime()
                .desc()
                .listPage(start,pageSize);
    }

    @Override
    public List<HistoricActivityInstance> selectHistoricActivityInstance(String instanceId) {
        return historyService.createHistoricActivityInstanceQuery()
                .processInstanceId(instanceId)
                .activityType("userTask")
                .finished()
                .list();
    }

    @Override
    public String getCommentByTaskId(String taskId) {
        List<Comment> taskComments = taskService.getTaskComments(taskId, "comment");
        if(taskComments!=null && taskComments.size()>0){
            return taskComments.get(0).getFullMessage();
        }else{
            return "";
        }
        //return taskService.getTaskComments(taskId).get(0).toString();
    }
}
