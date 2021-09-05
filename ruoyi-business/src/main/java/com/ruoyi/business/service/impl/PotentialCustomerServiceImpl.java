package com.ruoyi.business.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.business.domain.FollowUpRecord;
import com.ruoyi.business.service.IFollowUpRecordService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.PotentialCustomerMapper;
import com.ruoyi.business.domain.PotentialCustomer;
import com.ruoyi.business.service.IPotentialCustomerService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

/**
 * 潜在客户Service业务层处理
 * 
 * @author lcj
 * @date 2021-09-01
 */
@Service
public class PotentialCustomerServiceImpl implements IPotentialCustomerService 
{
    @Autowired
    private PotentialCustomerMapper potentialCustomerMapper;

    @Autowired
    private IFollowUpRecordService followUpRecordService;
    /**
     * 查询潜在客户
     * 
     * @param id 潜在客户ID
     * @return 潜在客户
     */
    @Override
    public PotentialCustomer selectPotentialCustomerById(Long id)
    {
        return potentialCustomerMapper.selectPotentialCustomerById(id);
    }

    /**
     * 查询潜在客户列表
     * 
     *
     * @param userId
     * @param potentialCustomer 潜在客户
     * @return 潜在客户
     */
    @Override
    public List<PotentialCustomer> selectPotentialCustomerList(Long userId, PotentialCustomer potentialCustomer)
    {
        return potentialCustomerMapper.selectPotentialCustomerListByUserId(userId,potentialCustomer);
    }

    /**
     * 新增潜在客户
     * 
     * @param potentialCustomer 潜在客户
     * @return 结果
     */
    @Override
    public int insertPotentialCustomer(PotentialCustomer potentialCustomer)
    {
        potentialCustomer.setCreateTime(DateUtils.getNowDate());
        potentialCustomer.setFollowUpUser(ShiroUtils.getUserId());
        return potentialCustomerMapper.insertPotentialCustomer(potentialCustomer);
    }

    /**
     * 修改潜在客户
     * 
     * @param potentialCustomer 潜在客户
     * @return 结果
     */
    @Override
    public int updatePotentialCustomer(PotentialCustomer potentialCustomer)
    {
        return potentialCustomerMapper.updatePotentialCustomer(potentialCustomer);
    }

    /**
     * 删除潜在客户对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePotentialCustomerByIds(String ids)
    {
        return potentialCustomerMapper.deletePotentialCustomerByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除潜在客户信息
     * 
     * @param id 潜在客户ID
     * @return 结果
     */
    @Override
    public int deletePotentialCustomerById(Long id)
    {
        return potentialCustomerMapper.deletePotentialCustomerById(id);
    }

    @Override
    public boolean checkCustomer(String phone) {
        PotentialCustomer potentialCustomer = potentialCustomerMapper.checkCustomer(phone);
        return potentialCustomer==null;
    }

    @Override
    @Transactional
    public void insertFollowUpRecord(FollowUpRecord followUpRecord) {
        Date nowDate = DateUtils.getNowDate();
        followUpRecord.setFollowUpTime(nowDate);
        followUpRecord.setCustomerId(followUpRecord.getId());
        //页面上的id，暂时存储在了followUpRecord中
        potentialCustomerMapper.updateLastFollowUpTime(followUpRecord.getId(),nowDate);
        followUpRecord.setId(null);
        followUpRecordService.insertFollowUpRecord(followUpRecord);

    }
}
