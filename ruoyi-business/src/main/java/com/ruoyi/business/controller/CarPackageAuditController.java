package com.ruoyi.business.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.ruoyi.business.domain.HistoryActivity;
import com.ruoyi.business.domain.ServiceItem;
import com.ruoyi.business.service.IProcessService;
import com.ruoyi.common.utils.ShiroUtils;
import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.xpath.operations.Mod;
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
import com.ruoyi.business.domain.CarPackageAudit;
import com.ruoyi.business.service.ICarPackageAuditService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.servlet.http.HttpServletResponse;

/**
 * 审核列Controller
 * 
 * @author lcj
 * @date 2021-08-27
 */
@Controller
@RequestMapping("/business/carPackageAudit")
public class CarPackageAuditController extends BaseController
{
    private String prefix = "business/carPackageAudit";

    @Autowired
    private ICarPackageAuditService carPackageAuditService;

    @Autowired
    private IProcessService processService;

    @RequiresPermissions("business:carPackageAudit:view")
    @GetMapping()
    public String carPackageAudit()
    {
        return prefix + "/carPackageAudit";
    }

    /**
     * 查询审核列列表
     */
    @RequiresPermissions("business:carPackageAudit:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CarPackageAudit carPackageAudit)
    {
        startPage();
        carPackageAuditService.selectCarPackageAuditById(ShiroUtils.getUserId());
        List<CarPackageAudit> list = carPackageAuditService.selectCarPackageAuditList(carPackageAudit);
        return getDataTable(list);
    }

    /**
     * 导出审核列列表
     */
    @RequiresPermissions("business:carPackageAudit:export")
    @Log(title = "审核列", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CarPackageAudit carPackageAudit)
    {
        List<CarPackageAudit> list = carPackageAuditService.selectCarPackageAuditList(carPackageAudit);
        ExcelUtil<CarPackageAudit> util = new ExcelUtil<CarPackageAudit>(CarPackageAudit.class);
        return util.exportExcel(list, "审核列数据");
    }

    /**
     * 新增审核列
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存审核列
     */
    @RequiresPermissions("business:carPackageAudit:add")
    @Log(title = "审核列", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CarPackageAudit carPackageAudit)
    {
        return toAjax(carPackageAuditService.insertCarPackageAudit(carPackageAudit));
    }

    /**
     * 修改审核列
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        CarPackageAudit carPackageAudit = carPackageAuditService.selectCarPackageAuditById(id);
        mmap.put("carPackageAudit", carPackageAudit);
        return prefix + "/edit";
    }

    /**
     * 修改保存审核列
     */
    @RequiresPermissions("business:carPackageAudit:edit")
    @Log(title = "审核列", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CarPackageAudit carPackageAudit)
    {
        return toAjax(carPackageAuditService.updateCarPackageAudit(carPackageAudit));
    }

    /**
     * 删除审核列
     */
    @RequiresPermissions("business:carPackageAudit:remove")
    @Log(title = "审核列", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(carPackageAuditService.deleteCarPackageAuditByIds(ids));
    }

    //显示当前审核进度的流程图
    //@RequiresPermissions("business:carPackageAudit:showProcessImgDialog")
    @RequestMapping( "/showProcessImgDialog")
    @ResponseBody
    public void showProcessImgDialog(Long id, HttpServletResponse response) throws IOException {
        CarPackageAudit audit = carPackageAuditService.selectCarPackageAuditById(id);
        InputStream inputStream = null;
        if (audit.getStatus() == CarPackageAudit.STATUS_IN_ROGRESS || audit.getStatus() == CarPackageAudit.STATUS_REJECT) {
            List<String> activeActivityIds = processService.getActiveActivityIds(audit.getInstanceId());
            inputStream = processService.getProcessImage
                    (audit.getProcessDefinitionId(), activeActivityIds, Collections.EMPTY_LIST);
        } else {
            inputStream = processService.getProcessImage(audit.getProcessDefinitionId(),Collections.EMPTY_LIST,Collections.EMPTY_LIST);
        }

        IOUtils.copy(inputStream,response.getOutputStream());
    }

    /**
     * 撤销操作
     * @param id
     * @return
     */
    @RequiresPermissions("business:carPackageAudit:cancelApply")
    @RequestMapping( "/cancelApply")
    @ResponseBody
    public AjaxResult cancelApply(Long id){
        carPackageAuditService.cancelApply(id);
        return AjaxResult.success("撤销成功！");
    }


    //@RequiresPermissions("business:carPackageAudit:todoList")
    @GetMapping("/todoPage")
    public String todoList()
    {
        return prefix + "/todoPage";
    }

    /**
     * 查询代办列表
     */
    //@RequiresPermissions("business:carPackageAudit:todoList")
    @PostMapping("/todoList")
    @ResponseBody
    public TableDataInfo todoList(CarPackageAudit carPackageAudit)
    {
        carPackageAuditService.selectCarPackageAuditById(ShiroUtils.getUserId());
        List<CarPackageAudit> list = carPackageAuditService.selectTodoList(carPackageAudit);
        return getDataTable(list);
    }

    /**
     * 跳转到审批页面
     * @param taskId
     * @param mmap
     * @return
     */
    @RequestMapping("/showVerifyDialog")
    public String showVerifyDialog(String taskId, ModelMap mmap)
    {
        mmap.put("taskId",taskId);
        return prefix + "/taskVerify";
    }

    /**
     * 完成审批
     * @param taskId
     * @param auditStatus
     * @param comment
     * @return
     */
    @RequestMapping("/complete")
    @ResponseBody
    public AjaxResult complete(String taskId,String auditStatus, String comment)
    {
        carPackageAuditService.complete(taskId,auditStatus,comment);
        return AjaxResult.success("审批成功");
    }

    /**
     * 跳转到修改表单页面
     * @param carPackageAuditId
     * @param mmap
     * @return
     */
    @RequestMapping("/openServiceItemsEditPage")
    public String openServiceItemsEditPage(Long carPackageAuditId, ModelMap mmap)
    {
        CarPackageAudit audit = carPackageAuditService.selectCarPackageAuditById(carPackageAuditId);
        ServiceItem serviceItem = JSON.parseObject(audit.getServiceItemInfo(), ServiceItem.class);
        mmap.put("carPackageAuditId",carPackageAuditId);
        mmap.put("serviceItem",serviceItem);
        return prefix + "/serviceItemEdit";
    }

    /**
     * 表单修改
     * @param carPackageAuditId
     * @param serviceItem
     * @return
     */
    @RequestMapping("/serviceItemUpdate")
    @ResponseBody
    public AjaxResult serviceItemUpdate(Long carPackageAuditId, ServiceItem serviceItem)
    {
        carPackageAuditService.updateServiceItem(carPackageAuditId,serviceItem);
        return AjaxResult.success("修改成功");
    }

    /**
     * 重新提交表单
     * @param taskId
     * @param carPackageAuditId
     * @return
     */
    @RequestMapping("/reApply")
    @ResponseBody
    public AjaxResult reApply(String taskId, Long carPackageAuditId)
    {
        carPackageAuditService.reApply(taskId, carPackageAuditId);
        return AjaxResult.success("提交成功");
    }

    /**
     * 跳转到已办页面
     * @return
     */
    @RequestMapping("/donePage")
    public String donePage()
    {
        return prefix + "/donePage";
    }

    /**
     * 返回已办列表数据
     * @return
     */
    @RequestMapping("/doneList")
    @ResponseBody
    public TableDataInfo doneList()
    {
        List<CarPackageAudit> audits = carPackageAuditService.selectDoneList();
        return getDataTable(audits);
    }

    /**
     * 跳转到审批历史模态框
     * @param instanceId
     * @param mmap
     * @return
     */
    @RequestMapping("/historyList")
    public String historyList(String instanceId, ModelMap mmap)
    {
        mmap.put("instanceId",instanceId);
        return prefix + "/historyList";
    }

    /**
     * 显示审批历史数据
     * @param instanceId
     * @return
     */
    @RequestMapping("/listHistory")
    @ResponseBody
    public TableDataInfo listHistory(String instanceId)
    {
        List<HistoryActivity> historyList = carPackageAuditService.selectHistoryList(instanceId);
        return getDataTable(historyList);
    }
}
