package com.ruoyi.business.mapper;

import java.util.Date;
import java.util.List;
import com.ruoyi.business.domain.PotentialCustomer;
import org.apache.ibatis.annotations.Param;

/**
 * 潜在客户Mapper接口
 * 
 * @author lcj
 * @date 2021-09-01
 */
public interface PotentialCustomerMapper 
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
     * @param potentialCustomer 潜在客户
     * @return 潜在客户集合
     */
    public List<PotentialCustomer> selectPotentialCustomerList(PotentialCustomer potentialCustomer);

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
     * 删除潜在客户
     * 
     * @param id 潜在客户ID
     * @return 结果
     */
    public int deletePotentialCustomerById(Long id);

    /**
     * 批量删除潜在客户
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePotentialCustomerByIds(String[] ids);

    PotentialCustomer checkCustomer(String phone);

    void updateLastFollowUpTime(@Param("id") Long id, @Param("nowDate") Date nowDate);

    public List<PotentialCustomer> selectPotentialCustomerListByUserId(@Param("userId") Long userId, @Param("potentialCustomer") PotentialCustomer potentialCustomer);


}
