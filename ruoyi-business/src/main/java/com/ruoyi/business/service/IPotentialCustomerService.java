package com.ruoyi.business.service;

import java.util.List;

import com.ruoyi.business.domain.FollowUpRecord;
import com.ruoyi.business.domain.PotentialCustomer;

/**
 * 潜在客户Service接口
 * 
 * @author lcj
 * @date 2021-09-01
 */
public interface IPotentialCustomerService 
{
    /**
     * 查询潜在客户
     * 
     * @param id 潜在客户ID
     * @return 潜在客户
     */
    public PotentialCustomer selectPotentialCustomerById(Long id);

    /**
     * 查询潜在客户列表
     * 
     *
     * @param userId
     * @param potentialCustomer 潜在客户
     * @return 潜在客户集合
     */
    public List<PotentialCustomer> selectPotentialCustomerList(Long userId, PotentialCustomer potentialCustomer);

    /**
     * 新增潜在客户
     * 
     * @param potentialCustomer 潜在客户
     * @return 结果
     */
    public int insertPotentialCustomer(PotentialCustomer potentialCustomer);

    /**
     * 修改潜在客户
     * 
     * @param potentialCustomer 潜在客户
     * @return 结果
     */
    public int updatePotentialCustomer(PotentialCustomer potentialCustomer);

    /**
     * 批量删除潜在客户
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePotentialCustomerByIds(String ids);

    /**
     * 删除潜在客户信息
     * 
     * @param id 潜在客户ID
     * @return 结果
     */
    public int deletePotentialCustomerById(Long id);

    boolean checkCustomer(String phone);

    void insertFollowUpRecord(FollowUpRecord followUpRecord);
}
