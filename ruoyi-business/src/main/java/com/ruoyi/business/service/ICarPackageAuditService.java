package com.ruoyi.business.service;

import java.io.InputStream;
import java.util.List;
import com.ruoyi.business.domain.CarPackageAudit;
import com.ruoyi.business.domain.HistoryActivity;
import com.ruoyi.business.domain.ServiceItem;

/**
 * 审核列Service接口
 * 
 * @author lcj
 * @date 2021-08-27
 */
public interface ICarPackageAuditService 
{
    /**
     * 查询审核列
     * 
     * @param id 审核列ID
     * @return 审核列
     */
    public CarPackageAudit selectCarPackageAuditById(Long id);

    /**
     * 查询审核列列表
     * 
     * @param carPackageAudit 审核列
     * @return 审核列集合
     */
    public List<CarPackageAudit> selectCarPackageAuditList(CarPackageAudit carPackageAudit);

    /**
     * 新增审核列
     * 
     * @param carPackageAudit 审核列
     * @return 结果
     */
    public int insertCarPackageAudit(CarPackageAudit carPackageAudit);

    /**
     * 修改审核列
     * 
     * @param carPackageAudit 审核列
     * @return 结果
     */
    public int updateCarPackageAudit(CarPackageAudit carPackageAudit);

    /**
     * 批量删除审核列
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCarPackageAuditByIds(String ids);

    /**
     * 删除审核列信息
     * 
     * @param id 审核列ID
     * @return 结果
     */
    public int deleteCarPackageAuditById(Long id);

    /**
     * 撤销当前审核
     * @param id
     */
    void cancelApply(Long id);

    /**
     * 查询待办列表
     * @param carPackageAudit
     * @return
     */
    List<CarPackageAudit> selectTodoList(CarPackageAudit carPackageAudit);

    /**
     * 完成审核
     * @param taskId
     * @param auditStatus
     * @param comment
     */
    void complete(String taskId, String auditStatus, String comment);

    void updateServiceItem(Long carPackageAuditId, ServiceItem serviceItem);

    void reApply(String taskId, Long carPackageAuditId);

    /**
     * 查询已办
     * @return
     */
    List<CarPackageAudit> selectDoneList();

    /**
     * 查询审批历史
     * @param instanceId
     * @return
     */
    List<HistoryActivity> selectHistoryList(String instanceId);
}
