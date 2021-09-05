package com.ruoyi.business.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.FollowUpRecord;
import com.ruoyi.business.service.IFollowUpRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 跟进记录Controller
 * 
 * @author lcj
 * @date 2021-09-01
 */
@Controller
@RequestMapping("/business/followUpRecord")
public class FollowUpRecordController extends BaseController
{
    private String prefix = "business/followUpRecord";

    @Autowired
    private IFollowUpRecordService followUpRecordService;

    @RequiresPermissions("business:followUpRecord:view")
    @GetMapping()
    public String followUpRecord()
    {
        return prefix + "/followUpRecord";
    }

    /**
     * 查询跟进记录列表
     */
    @RequiresPermissions("business:followUpRecord:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(FollowUpRecord followUpRecord)
    {
        startPage();
        List<FollowUpRecord> list = followUpRecordService.selectFollowUpRecordList(followUpRecord);
        return getDataTable(list);
    }

    /**
     * 导出跟进记录列表
     */
    @RequiresPermissions("business:followUpRecord:export")
    @Log(title = "跟进记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(FollowUpRecord followUpRecord)
    {
        List<FollowUpRecord> list = followUpRecordService.selectFollowUpRecordList(followUpRecord);
        ExcelUtil<FollowUpRecord> util = new ExcelUtil<FollowUpRecord>(FollowUpRecord.class);
        return util.exportExcel(list, "跟进记录数据");
    }

    /**
     * 新增跟进记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存跟进记录
     */
    @RequiresPermissions("business:followUpRecord:add")
    @Log(title = "跟进记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(FollowUpRecord followUpRecord)
    {
        return toAjax(followUpRecordService.insertFollowUpRecord(followUpRecord));
    }

    /**
     * 修改跟进记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        FollowUpRecord followUpRecord = followUpRecordService.selectFollowUpRecordById(id);
        mmap.put("followUpRecord", followUpRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存跟进记录
     */
    @RequiresPermissions("business:followUpRecord:edit")
    @Log(title = "跟进记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(FollowUpRecord followUpRecord)
    {
        return toAjax(followUpRecordService.updateFollowUpRecord(followUpRecord));
    }

    /**
     * 删除跟进记录
     */
    @RequiresPermissions("business:followUpRecord:remove")
    @Log(title = "跟进记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(followUpRecordService.deleteFollowUpRecordByIds(ids));
    }
}
