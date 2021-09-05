package com.ruoyi.business.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;

import com.ruoyi.business.service.IDefinitionInfoService;
import com.ruoyi.business.service.IProcessService;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.system.service.ISysUserService;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
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
import com.ruoyi.business.domain.DefinitionDetail;
import com.ruoyi.business.service.IDefinitionDetailService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * 流程定义明细Controller
 * 
 * @author lcj
 * @date 2021-08-26
 */
@Controller
@RequestMapping("/business/definitionDetail")
public class DefinitionDetailController extends BaseController
{
    private String prefix = "business/definitionDetail";

    @Autowired
    private IDefinitionDetailService definitionDetailService;

    @Autowired
    private IProcessService processService;

    @RequiresPermissions("business:definitionDetail:view")
    @GetMapping()
    public String definitionDetail(String definitionId, ModelMap mmap) {
        mmap.put("definitionId",definitionId);
        return prefix + "/definitionDetail";
    }

    /**
     * 查询流程定义明细列表
     */
    @RequiresPermissions("business:definitionDetail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(DefinitionDetail definitionDetail)
    {
        startPage();
        List<DefinitionDetail> list = definitionDetailService.selectDefinitionDetailList(definitionDetail);
        return getDataTable(list);
    }

    /**
     * 导出流程定义明细列表
     */
    @RequiresPermissions("business:definitionDetail:export")
    @Log(title = "流程定义明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DefinitionDetail definitionDetail)
    {
        List<DefinitionDetail> list = definitionDetailService.selectDefinitionDetailList(definitionDetail);
        ExcelUtil<DefinitionDetail> util = new ExcelUtil<DefinitionDetail>(DefinitionDetail.class);
        return util.exportExcel(list, "流程定义明细数据");
    }

    /**
     * 新增流程定义明细
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存流程定义明细
     */
    @RequiresPermissions("business:definitionDetail:add")
    @Log(title = "流程定义明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(DefinitionDetail definitionDetail)
    {
        return toAjax(definitionDetailService.insertDefinitionDetail(definitionDetail));
    }

    /**
     * 修改流程定义明细
     */
    @GetMapping("/edit/{definitionInfoId}")
    public String edit(@PathVariable("definitionInfoId") Long definitionInfoId, ModelMap mmap)
    {
        DefinitionDetail definitionDetail = definitionDetailService.selectDefinitionDetailById(definitionInfoId);
        mmap.put("definitionDetail", definitionDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存流程定义明细
     */
    @RequiresPermissions("business:definitionDetail:edit")
    @Log(title = "流程定义明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(DefinitionDetail definitionDetail)
    {
        return toAjax(definitionDetailService.updateDefinitionDetail(definitionDetail));
    }

    /**
     * 删除流程定义明细
     */
    @RequiresPermissions("business:definitionDetail:remove")
    @Log(title = "流程定义明细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(definitionDetailService.deleteDefinitionDetailByIds(ids));
    }

    /**
     * 上传流程图并部署流程
     * @param definitionId
     * @param file
     * @return
     */
    @RequiresPermissions("business:definitionDetail:upload")
    @PostMapping( "/upload")
    @ResponseBody
    public AjaxResult upload(Long definitionId, MultipartFile file) {
        if (file != null && file.getSize() > 0) {
            String originalFilename = file.getOriginalFilename();
            String extension = FilenameUtils.getExtension(originalFilename);
            if ("zip".equals(extension) || "bpmn".equals(extension)) {
                try{
                    String filename = FileUploadUtils.upload(file);
                    System.out.println("filename = " + filename);
                    definitionDetailService.saveProcessDefinition(definitionId,
                            RuoYiConfig.getProfile() + filename.substring(Constants.RESOURCE_PREFIX.length() + 1));
                    return AjaxResult.success("文件上传成功");
                }catch (IOException e) {
                    e.printStackTrace();
                    return AjaxResult.error("文件上传失败");
                }
            } else {
                return AjaxResult.error("仅支持文件类型为 zip 或 bpmn 的文件");
            }
        } else {
            return AjaxResult.error("上传文件不能为空");
        }
    }
    @RequiresPermissions("business:definitionDetail:readResource")
    @RequestMapping("/readResource")
    @ResponseBody
    public void readResource(String deploymentId, String type, HttpServletResponse response) throws IOException {
        ProcessDefinition processDefinition = processService.selectProcessDefinitionByDeploymentId(deploymentId);
        InputStream inputStream = null;
        if ("xml".equals(type)) {
            inputStream = processService.getResourceAsStream(processDefinition.getDeploymentId(),processDefinition.getResourceName());
        } else if ("png".equals(type)) {
            inputStream = processService.getProcessImage(processDefinition.getId(), Collections.EMPTY_LIST,Collections.EMPTY_LIST);
        }
        IOUtils.copy(inputStream,response.getOutputStream());
    }
}
