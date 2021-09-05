package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.FollowUpRecordMapper;
import com.ruoyi.business.domain.FollowUpRecord;
import com.ruoyi.business.service.IFollowUpRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 跟进记录Service业务层处理
 * 
 * @author lcj
 * @date 2021-09-01
 */
@Service
public class FollowUpRecordServiceImpl implements IFollowUpRecordService 
{
    @Autowired
    private FollowUpRecordMapper followUpRecordMapper;

    /**
     * 查询跟进记录
     * 
     * @param id 跟进记录ID
     * @return 跟进记录
     */
    @Override
    public FollowUpRecord selectFollowUpRecordById(Long id)
    {
        return followUpRecordMapper.selectFollowUpRecordById(id);
    }

    /**
     * 查询跟进记录列表
     * 
     * @param followUpRecord 跟进记录
     * @return 跟进记录
     */
    @Override
    public List<FollowUpRecord> selectFollowUpRecordList(FollowUpRecord followUpRecord)
    {
        return followUpRecordMapper.selectFollowUpRecordList(followUpRecord);
    }

    /**
     * 新增跟进记录
     * 
     * @param followUpRecord 跟进记录
     * @return 结果
     */
    @Override
    public int insertFollowUpRecord(FollowUpRecord followUpRecord)
    {
        return followUpRecordMapper.insertFollowUpRecord(followUpRecord);
    }

    /**
     * 修改跟进记录
     * 
     * @param followUpRecord 跟进记录
     * @return 结果
     */
    @Override
    public int updateFollowUpRecord(FollowUpRecord followUpRecord)
    {
        return followUpRecordMapper.updateFollowUpRecord(followUpRecord);
    }

    /**
     * 删除跟进记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteFollowUpRecordByIds(String ids)
    {
        return followUpRecordMapper.deleteFollowUpRecordByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除跟进记录信息
     * 
     * @param id 跟进记录ID
     * @return 结果
     */
    @Override
    public int deleteFollowUpRecordById(Long id)
    {
        return followUpRecordMapper.deleteFollowUpRecordById(id);
    }

    @Override
    public List<FollowUpRecord> selectFollowUpRecordByCustomerId(Long customerId) {
        return followUpRecordMapper.selectFollowUpRecordByCustomerId(customerId);
    }
}
