package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.FollowUpRecord;

/**
 * 跟进记录Mapper接口
 * 
 * @author lcj
 * @date 2021-09-01
 */
public interface FollowUpRecordMapper 
{
    /**
     * 查询跟进记录
     * 
     * @param id 跟进记录ID
     * @return 跟进记录
     */
    public FollowUpRecord selectFollowUpRecordById(Long id);

    /**
     * 查询跟进记录列表
     * 
     * @param followUpRecord 跟进记录
     * @return 跟进记录集合
     */
    public List<FollowUpRecord> selectFollowUpRecordList(FollowUpRecord followUpRecord);

    /**
     * 新增跟进记录
     * 
     * @param followUpRecord 跟进记录
     * @return 结果
     */
    public int insertFollowUpRecord(FollowUpRecord followUpRecord);

    /**
     * 修改跟进记录
     * 
     * @param followUpRecord 跟进记录
     * @return 结果
     */
    public int updateFollowUpRecord(FollowUpRecord followUpRecord);

    /**
     * 删除跟进记录
     * 
     * @param id 跟进记录ID
     * @return 结果
     */
    public int deleteFollowUpRecordById(Long id);

    /**
     * 批量删除跟进记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteFollowUpRecordByIds(String[] ids);

    List<FollowUpRecord> selectFollowUpRecordByCustomerId(Long customerId);
}
