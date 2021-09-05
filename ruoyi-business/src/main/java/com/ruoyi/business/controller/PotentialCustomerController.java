package com.ruoyi.business.controller;

import java.util.List;

import com.ruoyi.business.domain.FollowUpRecord;
import com.ruoyi.business.service.IFollowUpRecordService;
import com.ruoyi.common.utils.ShiroUtils;
import org.apache.shiro.SecurityUtils;
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
import com.ruoyi.business.domain.PotentialCustomer;
import com.ruoyi.business.service.IPotentialCustomerService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 潜在客户Controller
 * 
 * @author lcj
 * @date 2021-09-01
 */
@Controller
@RequestMapping("/business/potentialCustomer")
public class PotentialCustomerController extends BaseController
{
    private String prefix = "business/potentialCustomer";

    @Autowired
    private IPotentialCustomerService potentialCustomerService;

    @Autowired
    private IFollowUpRecordService followUpRecordService;

    @RequiresPermissions("business:potentialCustomer:view")
    @GetMapping()
    public String potentialCustomer()
    {
        return prefix + "/potentialCustomer";
    }

    /**
     * 查询潜在客户列表
     */
    @RequiresPermissions("business:potentialCustomer:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PotentialCustomer potentialCustomer)
    {
        startPage();
        return getDataTable(potentialCustomerService.selectPotentialCustomerList
                (SecurityUtils.getSubject().hasRole("salesman") ? ShiroUtils.getUserId() : null, potentialCustomer));
    }

    /**
     * 导出潜在客户列表
     */
    @RequiresPermissions("business:potentialCustomer:export")
    @Log(title = "潜在客户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PotentialCustomer potentialCustomer)
    {
        List<PotentialCustomer> list = potentialCustomerService.selectPotentialCustomerList(ShiroUtils.getUserId(), potentialCustomer);
        ExcelUtil<PotentialCustomer> util = new ExcelUtil<PotentialCustomer>(PotentialCustomer.class);
        return util.exportExcel(list, "潜在客户数据");
    }

    /**
     * 新增潜在客户
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存潜在客户
     */
    @RequiresPermissions("business:potentialCustomer:add")
    @Log(title = "潜在客户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PotentialCustomer potentialCustomer)
    {
        return toAjax(potentialCustomerService.insertPotentialCustomer(potentialCustomer));
    }

    /**
     * 修改潜在客户
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PotentialCustomer potentialCustomer = potentialCustomerService.selectPotentialCustomerById(id);
        mmap.put("potentialCustomer", potentialCustomer);
        return prefix + "/edit";
    }

    /**
     * 修改保存潜在客户
     */
    @RequiresPermissions("business:potentialCustomer:edit")
    @Log(title = "潜在客户", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PotentialCustomer potentialCustomer)
    {
        return toAjax(potentialCustomerService.updatePotentialCustomer(potentialCustomer));
    }

    /**
     * 删除潜在客户
     */
    @RequiresPermissions("business:potentialCustomer:remove")
    @Log(title = "潜在客户", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(potentialCustomerService.deletePotentialCustomerByIds(ids));
    }

    /**
     * 检测用户是否存在
     */
    @RequiresPermissions("business:potentialCustomer:checkCustomer")
    @Log(title = "潜在客户", businessType = BusinessType.INSERT)
    @PostMapping("/checkCustomer")
    @ResponseBody
    public boolean checkCustomer(PotentialCustomer potentialCustomer)
    {
        return potentialCustomerService.checkCustomer(potentialCustomer.getPhone());
    }

    @RequiresPermissions("business:potentialCustomer:follow")
    @Log(title = "潜在客户", businessType = BusinessType.UPDATE)
    @RequestMapping("/follow")
    public String follow(Long potentialCustomerId, ModelMap mmap)
    {
        mmap.put("id",potentialCustomerId);
        return prefix + "/follow";
    }

    @RequiresPermissions("business:potentialCustomer:followSave")
    @Log(title = "潜在客户", businessType = BusinessType.UPDATE)
    @RequestMapping("/followSave")
    @ResponseBody
    public AjaxResult followSave(FollowUpRecord followUpRecord)
    {
        potentialCustomerService.insertFollowUpRecord(followUpRecord);
        return AjaxResult.success("跟进成功");
    }

    @RequiresPermissions("business:potentialCustomer:showFollowHistory")
    @Log(title = "潜在客户", businessType = BusinessType.UPDATE)
    @RequestMapping("/showFollowHistory")
    public String showFollowHistory(Long potentialCustomerId, ModelMap mmap)
    {
        mmap.put("potentialCustomerId",potentialCustomerId);
        return prefix + "/followHistory";
    }

    @RequiresPermissions("business:potentialCustomer:followHistory")
    @Log(title = "潜在客户", businessType = BusinessType.UPDATE)
    @RequestMapping("/followHistory")
    @ResponseBody
    public TableDataInfo followHistory(Long potentialCustomerId, ModelMap mmap)
    {
        List<FollowUpRecord> followUpRecords = followUpRecordService.selectFollowUpRecordByCustomerId(potentialCustomerId);
        return getDataTable(followUpRecords);
    }

    @RequiresPermissions("business:potentialCustomer:deleteFollowHistory")
    @Log(title = "潜在客户", businessType = BusinessType.DELETE)
    @RequestMapping("/deleteFollowHistory")
    @ResponseBody
    public AjaxResult deleteFollowHistory(Long id)
    {
        followUpRecordService.deleteFollowUpRecordById(id);
        return success("删除成功");
    }
}
