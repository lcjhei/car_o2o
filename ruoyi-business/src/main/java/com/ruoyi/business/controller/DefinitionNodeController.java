package com.ruoyi.business.controller;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
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
import com.ruoyi.business.domain.DefinitionNode;
import com.ruoyi.business.service.IDefinitionNodeService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 流程定义节点信息Controller
 * 
 * @author lcj
 * @date 2021-08-27
 */
@Controller
@RequestMapping("/business/definitionNode")
public class DefinitionNodeController extends BaseController
{
    private String prefix = "business/definitionNode";

    @Autowired
    private IDefinitionNodeService definitionNodeService;

    @Autowired
    private ISysUserService sysUserService;

    @RequiresPermissions("business:definitionNode:view")
    @GetMapping()
    public String definitionNode(String definitionId, ModelMap mmap)
    {
        mmap.put("definitionId",definitionId);
        return prefix + "/definitionNode";
    }

    /**
     * 查询流程定义节点信息列表
     */
    @RequiresPermissions("business:definitionNode:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(DefinitionNode definitionNode)
    {
        startPage();
        List<DefinitionNode> list = definitionNodeService.selectDefinitionNodeList(definitionNode);
        return getDataTable(list);
    }

    /**
     * 导出流程定义节点信息列表
     */
    @RequiresPermissions("business:definitionNode:export")
    @Log(title = "流程定义节点信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DefinitionNode definitionNode)
    {
        List<DefinitionNode> list = definitionNodeService.selectDefinitionNodeList(definitionNode);
        ExcelUtil<DefinitionNode> util = new ExcelUtil<DefinitionNode>(DefinitionNode.class);
        return util.exportExcel(list, "流程定义节点信息数据");
    }

    /**
     * 新增流程定义节点信息
     */
    @GetMapping("/add")
    public String add(String definitionId, ModelMap mmap)
    {
        List<SysUser> sysUsers = sysUserService.selectUserList(new SysUser());
        mmap.put("auditors",sysUsers);
        mmap.put("definitionId",definitionId);
        return prefix + "/add";
    }

    /**
     * 新增保存流程定义节点信息
     */
    @RequiresPermissions("business:definitionNode:add")
    @Log(title = "流程定义节点信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(DefinitionNode definitionNode)
    {
        return toAjax(definitionNodeService.insertDefinitionNode(definitionNode));
    }

    /**
     * 修改流程定义节点信息
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        List<SysUser> sysUsers = sysUserService.selectUserList(new SysUser());
        List<Long> auditorIds = definitionNodeService.selectAuditorIdsByNodeId(id);
        DefinitionNode definitionNode = definitionNodeService.selectDefinitionNodeById(id);
        mmap.put("auditorIds",auditorIds);
        mmap.put("auditors",sysUsers);
        mmap.put("definitionNode", definitionNode);
        return prefix + "/edit";
    }

    /**
     * 修改保存流程定义节点信息
     */
    @RequiresPermissions("business:definitionNode:edit")
    @Log(title = "流程定义节点信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(DefinitionNode definitionNode)
    {
        return toAjax(definitionNodeService.updateDefinitionNode(definitionNode));
    }

    /**
     * 删除流程定义节点信息
     */
    @RequiresPermissions("business:definitionNode:remove")
    @Log(title = "流程定义节点信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(definitionNodeService.deleteDefinitionNodeByIds(ids));
    }
}
