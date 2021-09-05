/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : car_o2o

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2021-06-24 17:39:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 't_definition_info', '流程定义', '', null, 'DefinitionInfo', 'crud', 'com.ruoyi.business', 'business', 'definitionInfo', '流程定义', 'wolfcode', '0', '/', '{\"parentMenuId\":\"1101\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"流程管理\",\"treeCode\":\"\"}', 'admin', '2021-06-07 14:36:57', '', '2021-06-07 14:47:15', '流程定义');
INSERT INTO `gen_table` VALUES ('2', 't_definition_detail', '流程定义明细', '', null, 'DefinitionDetail', 'crud', 'com.ruoyi.business', 'business', 'definitionDetail', '流程定义明细', 'wolfcode', '0', '/', '{\"parentMenuId\":\"1101\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"流程管理\",\"treeCode\":\"\"}', 'admin', '2021-06-07 15:16:04', '', '2021-06-07 16:20:27', '流程定义明细');
INSERT INTO `gen_table` VALUES ('4', 't_definition_node', '流程定义节点信息', '', null, 'DefinitionNode', 'crud', 'com.ruoyi.business', 'business', 'definitionNode', '流程定义节点信息', 'wolfcode', '0', '/', '{\"parentMenuId\":\"1101\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"流程管理\",\"treeCode\":\"\"}', 'admin', '2021-06-10 15:03:14', '', '2021-06-10 15:08:10', '流程定义节点信息');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', null, 'bigint(20)', 'Long', 'id', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-06-07 14:36:57', null, '2021-06-07 14:47:16');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'name', '流程名称', 'varchar(255)', 'String', 'name', '0', '0', null, null, null, '1', '1', 'LIKE', 'input', '', '2', 'admin', '2021-06-07 14:36:57', null, '2021-06-07 14:47:16');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'definition_key', '流程key', 'varchar(255)', 'String', 'definitionKey', '0', '0', null, null, null, '1', '1', 'LIKE', 'input', '', '3', 'admin', '2021-06-07 14:36:57', null, '2021-06-07 14:47:16');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'description', '流程描述', 'varchar(255)', 'String', 'description', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', '4', 'admin', '2021-06-07 14:36:57', null, '2021-06-07 14:47:16');
INSERT INTO `gen_table_column` VALUES ('5', '2', 'definition_info_id', '流程定义id', 'bigint(20)', 'Long', 'definitionInfoId', '1', '0', null, null, null, '1', null, 'EQ', 'input', '', '1', 'admin', '2021-06-07 15:16:04', null, '2021-06-07 16:20:27');
INSERT INTO `gen_table_column` VALUES ('6', '2', 'deployment_id', '流程部署id', 'varchar(255)', 'String', 'deploymentId', '1', '0', null, null, null, '1', null, 'EQ', 'input', '', '2', 'admin', '2021-06-07 15:16:04', null, '2021-06-07 16:20:27');
INSERT INTO `gen_table_column` VALUES ('7', '2', 'deploy_time', '部署时间', 'datetime', 'Date', 'deployTime', '0', '0', null, null, null, '1', '1', 'BETWEEN', 'datetime', '', '3', 'admin', '2021-06-07 15:16:04', null, '2021-06-07 16:20:27');
INSERT INTO `gen_table_column` VALUES ('10', '4', 'id', null, 'bigint(20)', 'Long', 'id', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-06-10 15:03:14', null, '2021-06-10 15:08:10');
INSERT INTO `gen_table_column` VALUES ('11', '4', 'definition_info_id', '流程定义ID', 'bigint(20)', 'Long', 'definitionInfoId', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '2', 'admin', '2021-06-10 15:03:14', null, '2021-06-10 15:08:10');
INSERT INTO `gen_table_column` VALUES ('12', '4', 'node_key', '节点key', 'varchar(255)', 'String', 'nodeKey', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '3', 'admin', '2021-06-10 15:03:14', null, '2021-06-10 15:08:10');
INSERT INTO `gen_table_column` VALUES ('13', '4', 'node_description', '节点描述', 'varchar(255)', 'String', 'nodeDescription', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '4', 'admin', '2021-06-10 15:03:14', null, '2021-06-10 15:08:10');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000178C3D75F1878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000178C3D75F1878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000178C3D75F1878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-GF3FDH81623754088536', '1623754590931', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-GF3FDH81623754606428', '1623754611628', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1623754610000', '-1', '5', 'PAUSED', 'CRON', '1623754606000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1623754620000', '-1', '5', 'PAUSED', 'CRON', '1623754606000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1623754620000', '-1', '5', 'PAUSED', 'CRON', '1623754606000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES ('6', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('7', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('8', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES ('9', '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-04-12 10:09:35', '', null, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', 'e店邦O2O平台', '0', '叩丁狼', '15888888888', 'admin@wolfocode.cn', '0', '0', 'admin', '2021-04-12 10:09:35', 'admin', '2021-05-27 15:32:52');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '广州店', '1', '叩丁狼', '15888888888', 'admin@wolfcode.cn', '0', '0', 'admin', '2021-04-12 10:09:35', 'admin', '2021-05-19 14:56:50');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-04-12 10:09:35', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-04-12 10:09:35', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-04-12 10:09:35', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-04-12 10:09:35', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-04-12 10:09:35', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-04-12 10:09:35', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-04-12 10:09:35', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-04-12 10:09:35', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-04-12 10:09:35', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-04-12 10:09:35', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('30', '1', '维修', '0', 'cmi_service_type', null, null, 'N', '0', 'admin', '2021-05-13 11:49:30', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('31', '1', '保养', '1', 'cmi_service_type', null, null, 'N', '0', 'admin', '2021-05-13 11:49:44', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('32', '1', '预约中', '0', 'cmi_status', '', '', 'Y', '0', 'admin', '2021-05-13 13:59:27', 'admin', '2021-05-13 13:59:32', '');
INSERT INTO `sys_dict_data` VALUES ('33', '2', '已到店', '1', 'cmi_status', null, null, 'N', '0', 'admin', '2021-05-13 13:59:44', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('34', '3', '用户取消', '2', 'cmi_status', null, null, 'N', '0', 'admin', '2021-05-13 14:00:22', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('35', '4', '超时取消', '3', 'cmi_status', null, null, 'N', '0', 'admin', '2021-05-13 14:00:38', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('36', '5', '结算单生成', '4', 'cmi_status', '', '', 'N', '0', 'admin', '2021-05-13 16:18:40', 'admin', '2021-05-19 12:01:46', '');
INSERT INTO `sys_dict_data` VALUES ('37', '1', '否', '0', 'si_car_package', null, null, 'Y', '0', 'admin', '2021-05-14 09:25:36', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('38', '2', '是', '1', 'si_car_package', null, null, 'N', '0', 'admin', '2021-05-14 09:26:18', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('39', '1', '否', '0', 'si_visible', null, null, 'Y', '0', 'admin', '2021-05-14 09:26:58', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('40', '2', '是', '1', 'si_visible', null, null, 'N', '0', 'admin', '2021-05-14 09:27:11', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('41', '1', '维修', '0', 'si_service_catalog', '', '', 'Y', '0', 'admin', '2021-05-14 09:27:45', 'admin', '2021-05-14 09:27:48', '');
INSERT INTO `sys_dict_data` VALUES ('42', '2', '保养', '1', 'si_service_catalog', null, null, 'N', '0', 'admin', '2021-05-14 09:27:57', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('43', '3', '其他', '2', 'si_service_catalog', null, null, 'N', '0', 'admin', '2021-05-14 09:28:08', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('44', '1', '初始化', '0', 'si_audit_status', null, null, 'N', '0', 'admin', '2021-05-14 09:30:22', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('45', '2', '审核中', '1', 'si_audit_status', null, null, 'N', '0', 'admin', '2021-05-14 09:30:28', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('46', '3', '审核通过', '2', 'si_audit_status', null, null, 'N', '0', 'admin', '2021-05-14 09:30:36', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('47', '4', '重新调整', '3', 'si_audit_status', '', '', 'N', '0', 'admin', '2021-05-14 09:30:50', 'admin', '2021-05-25 14:16:07', '');
INSERT INTO `sys_dict_data` VALUES ('48', '5', '无需审核', '4', 'si_audit_status', null, null, 'N', '0', 'admin', '2021-05-14 09:31:04', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('49', '1', '未上架', '0', 'si_sale_status', null, null, 'Y', '0', 'admin', '2021-05-14 09:56:54', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('50', '2', '已上架', '1', 'si_sale_status', null, null, 'N', '0', 'admin', '2021-05-14 09:57:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('51', '1', '消费中', '0', 'statement_status', null, null, 'Y', '0', 'admin', '2021-05-17 09:50:47', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('52', '2', '已支付', '1', 'statement_status', null, null, 'Y', '0', 'admin', '2021-05-17 09:50:57', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('53', '1', '进行中', '0', 'cpa_status', null, null, 'Y', '0', 'admin', '2021-05-27 11:10:36', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('54', '2', '审核拒绝', '1', 'cpa_status', '', '', 'Y', '0', 'admin', '2021-05-27 11:10:55', 'admin', '2021-05-27 11:15:21', '');
INSERT INTO `sys_dict_data` VALUES ('55', '3', '审核通过', '2', 'cpa_status', '', '', 'Y', '0', 'admin', '2021-05-27 11:11:14', 'admin', '2021-05-27 11:15:24', '');
INSERT INTO `sys_dict_data` VALUES ('56', '4', '审核撤销', '3', 'cpa_status', '', '', 'Y', '0', 'admin', '2021-05-27 11:11:28', 'admin', '2021-05-27 11:14:17', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2021-04-12 10:09:35', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2021-04-12 10:09:35', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2021-04-12 10:09:35', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2021-04-12 10:09:35', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2021-04-12 10:09:35', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2021-04-12 10:09:35', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2021-04-12 10:09:35', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2021-04-12 10:09:35', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2021-04-12 10:09:35', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2021-04-12 10:09:35', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '养修预约-服务类型', 'cmi_service_type', '0', 'admin', '2021-05-13 11:48:06', '', null, '养修预约-服务类型');
INSERT INTO `sys_dict_type` VALUES ('12', '养修预约-状态', 'cmi_status', '0', 'admin', '2021-05-13 13:58:52', '', null, '养修预约-状态');
INSERT INTO `sys_dict_type` VALUES ('13', '服务项目-是否套餐', 'si_car_package', '0', 'admin', '2021-05-14 09:25:18', '', null, '服务项目-是否套餐');
INSERT INTO `sys_dict_type` VALUES ('14', '服务项目-是否禁用', 'si_visible', '0', 'admin', '2021-05-14 09:26:47', '', null, '服务项目-是否禁用');
INSERT INTO `sys_dict_type` VALUES ('15', '服务项目-服务分类', 'si_service_catalog', '0', 'admin', '2021-05-14 09:27:35', '', null, '服务项目-服务分类');
INSERT INTO `sys_dict_type` VALUES ('16', '服务项目-审核状态', 'si_audit_status', '0', 'admin', '2021-05-14 09:28:44', 'admin', '2021-05-14 09:56:01', '服务项目-状态');
INSERT INTO `sys_dict_type` VALUES ('17', '服务项目-上架状态', 'si_sale_status', '0', 'admin', '2021-05-14 09:56:39', '', null, '服务项目-上架状态');
INSERT INTO `sys_dict_type` VALUES ('18', '结算单-结算状态', 'statement_status', '0', 'admin', '2021-05-17 09:40:25', 'admin', '2021-05-17 09:40:38', '结算单-结算状态');
INSERT INTO `sys_dict_type` VALUES ('19', '汽车套餐审核状态', 'cpa_status', '0', 'admin', '2021-05-27 11:10:17', '', null, '汽车套餐审核状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-04-12 10:09:35', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 09:46:40');
INSERT INTO `sys_logininfor` VALUES ('2', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 09:50:45');
INSERT INTO `sys_logininfor` VALUES ('3', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:18:51');
INSERT INTO `sys_logininfor` VALUES ('4', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:23:19');
INSERT INTO `sys_logininfor` VALUES ('5', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:26:09');
INSERT INTO `sys_logininfor` VALUES ('6', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:34:34');
INSERT INTO `sys_logininfor` VALUES ('7', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:36:05');
INSERT INTO `sys_logininfor` VALUES ('8', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-05-28 10:38:11');
INSERT INTO `sys_logininfor` VALUES ('9', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-05-28 10:38:14');
INSERT INTO `sys_logininfor` VALUES ('10', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:38:17');
INSERT INTO `sys_logininfor` VALUES ('11', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:41:28');
INSERT INTO `sys_logininfor` VALUES ('12', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 10:58:56');
INSERT INTO `sys_logininfor` VALUES ('13', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 11:09:08');
INSERT INTO `sys_logininfor` VALUES ('14', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-05-28 11:18:44');
INSERT INTO `sys_logininfor` VALUES ('15', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 11:22:23');
INSERT INTO `sys_logininfor` VALUES ('16', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-05-28 11:25:41');
INSERT INTO `sys_logininfor` VALUES ('17', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-05-28 11:29:11');
INSERT INTO `sys_logininfor` VALUES ('18', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-03 15:58:05');
INSERT INTO `sys_logininfor` VALUES ('19', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-03 16:46:47');
INSERT INTO `sys_logininfor` VALUES ('20', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 14:22:45');
INSERT INTO `sys_logininfor` VALUES ('21', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-07 14:55:13');
INSERT INTO `sys_logininfor` VALUES ('22', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-07 14:55:17');
INSERT INTO `sys_logininfor` VALUES ('23', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 14:55:21');
INSERT INTO `sys_logininfor` VALUES ('24', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-07 15:50:26');
INSERT INTO `sys_logininfor` VALUES ('25', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 15:50:29');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 16:03:33');
INSERT INTO `sys_logininfor` VALUES ('27', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 16:10:04');
INSERT INTO `sys_logininfor` VALUES ('28', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-07 16:23:05');
INSERT INTO `sys_logininfor` VALUES ('29', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 16:23:09');
INSERT INTO `sys_logininfor` VALUES ('30', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-07 16:23:29');
INSERT INTO `sys_logininfor` VALUES ('31', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 16:23:39');
INSERT INTO `sys_logininfor` VALUES ('32', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 17:25:17');
INSERT INTO `sys_logininfor` VALUES ('33', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 17:26:00');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 17:50:14');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 18:04:37');
INSERT INTO `sys_logininfor` VALUES ('36', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-07 18:08:00');
INSERT INTO `sys_logininfor` VALUES ('37', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 13:40:14');
INSERT INTO `sys_logininfor` VALUES ('38', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 13:59:15');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 14:00:04');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 14:00:50');
INSERT INTO `sys_logininfor` VALUES ('41', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 14:12:09');
INSERT INTO `sys_logininfor` VALUES ('42', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 14:49:18');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 14:58:30');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 15:18:51');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 15:30:17');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 15:56:06');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-10 16:01:58');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:02:01');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:31:20');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-10 16:37:16');
INSERT INTO `sys_logininfor` VALUES ('51', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:37:20');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:52:45');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 17:00:22');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 17:02:27');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 17:14:39');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 17:17:11');
INSERT INTO `sys_logininfor` VALUES ('57', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 15:22:32');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 15:27:22');
INSERT INTO `sys_logininfor` VALUES ('59', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 15:42:13');
INSERT INTO `sys_logininfor` VALUES ('60', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:01:06');
INSERT INTO `sys_logininfor` VALUES ('61', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:02:01');
INSERT INTO `sys_logininfor` VALUES ('62', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:06:50');
INSERT INTO `sys_logininfor` VALUES ('63', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:16:46');
INSERT INTO `sys_logininfor` VALUES ('64', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-11 16:19:06');
INSERT INTO `sys_logininfor` VALUES ('65', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-11 16:19:09');
INSERT INTO `sys_logininfor` VALUES ('66', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-11 16:19:13');
INSERT INTO `sys_logininfor` VALUES ('67', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:19:16');
INSERT INTO `sys_logininfor` VALUES ('68', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:25:32');
INSERT INTO `sys_logininfor` VALUES ('69', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:53:37');
INSERT INTO `sys_logininfor` VALUES ('70', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:56:12');
INSERT INTO `sys_logininfor` VALUES ('71', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 17:19:07');
INSERT INTO `sys_logininfor` VALUES ('72', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-11 17:23:46');
INSERT INTO `sys_logininfor` VALUES ('73', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 17:23:50');
INSERT INTO `sys_logininfor` VALUES ('74', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 17:46:36');
INSERT INTO `sys_logininfor` VALUES ('75', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 17:52:28');
INSERT INTO `sys_logininfor` VALUES ('76', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 17:54:04');
INSERT INTO `sys_logininfor` VALUES ('77', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 17:59:38');
INSERT INTO `sys_logininfor` VALUES ('78', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 18:06:57');
INSERT INTO `sys_logininfor` VALUES ('79', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 18:11:46');
INSERT INTO `sys_logininfor` VALUES ('80', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 09:42:52');
INSERT INTO `sys_logininfor` VALUES ('81', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:18:55');
INSERT INTO `sys_logininfor` VALUES ('82', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:21:15');
INSERT INTO `sys_logininfor` VALUES ('83', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 10:22:00');
INSERT INTO `sys_logininfor` VALUES ('84', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:22:10');
INSERT INTO `sys_logininfor` VALUES ('85', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 10:22:15');
INSERT INTO `sys_logininfor` VALUES ('86', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:22:27');
INSERT INTO `sys_logininfor` VALUES ('87', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 10:25:57');
INSERT INTO `sys_logininfor` VALUES ('88', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:26:04');
INSERT INTO `sys_logininfor` VALUES ('89', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 10:26:08');
INSERT INTO `sys_logininfor` VALUES ('90', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:26:11');
INSERT INTO `sys_logininfor` VALUES ('91', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 10:27:53');
INSERT INTO `sys_logininfor` VALUES ('92', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:27:59');
INSERT INTO `sys_logininfor` VALUES ('93', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:30:02');
INSERT INTO `sys_logininfor` VALUES ('94', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 10:30:06');
INSERT INTO `sys_logininfor` VALUES ('95', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:30:13');
INSERT INTO `sys_logininfor` VALUES ('96', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 10:50:39');
INSERT INTO `sys_logininfor` VALUES ('97', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 11:35:28');
INSERT INTO `sys_logininfor` VALUES ('98', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 11:35:37');
INSERT INTO `sys_logininfor` VALUES ('99', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 11:35:42');
INSERT INTO `sys_logininfor` VALUES ('100', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 11:36:16');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 11:36:18');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 14:00:47');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 14:02:27');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 14:25:58');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 14:34:22');
INSERT INTO `sys_logininfor` VALUES ('106', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-15 14:34:29');
INSERT INTO `sys_logininfor` VALUES ('107', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 14:34:31');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:03:41');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:18:03');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:20:07');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:33:44');
INSERT INTO `sys_logininfor` VALUES ('112', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-15 15:33:52');
INSERT INTO `sys_logininfor` VALUES ('113', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:33:55');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:37:28');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:44:52');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 15:46:04');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 16:32:56');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 16:38:03');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 16:41:51');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 16:45:32');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 16:46:29');
INSERT INTO `sys_logininfor` VALUES ('122', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 16:46:34');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-15 17:02:50');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:02:52');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:08:09');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 17:09:26');
INSERT INTO `sys_logininfor` VALUES ('127', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:09:31');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-15 17:11:15');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:11:20');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 17:15:19');
INSERT INTO `sys_logininfor` VALUES ('131', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:15:28');
INSERT INTO `sys_logininfor` VALUES ('132', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 17:16:03');
INSERT INTO `sys_logininfor` VALUES ('133', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2021-06-15 17:16:17');
INSERT INTO `sys_logininfor` VALUES ('134', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误2次', '2021-06-15 17:16:19');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:16:25');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 17:16:34');
INSERT INTO `sys_logininfor` VALUES ('137', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误3次', '2021-06-15 17:16:39');
INSERT INTO `sys_logininfor` VALUES ('138', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:16:48');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:20:27');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 17:20:30');
INSERT INTO `sys_logininfor` VALUES ('141', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:20:41');
INSERT INTO `sys_logininfor` VALUES ('142', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:26:23');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 17:57:50');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:04:25');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:08:58');
INSERT INTO `sys_logininfor` VALUES ('146', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:09:03');
INSERT INTO `sys_logininfor` VALUES ('147', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:09:23');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:09:27');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:12:08');
INSERT INTO `sys_logininfor` VALUES ('150', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:12:13');
INSERT INTO `sys_logininfor` VALUES ('151', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:13:40');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:13:44');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:16:07');
INSERT INTO `sys_logininfor` VALUES ('154', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:16:14');
INSERT INTO `sys_logininfor` VALUES ('155', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:17:25');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:17:28');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:20:23');
INSERT INTO `sys_logininfor` VALUES ('158', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:20:28');
INSERT INTO `sys_logininfor` VALUES ('159', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:23:07');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-15 18:23:10');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:23:12');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:23:29');
INSERT INTO `sys_logininfor` VALUES ('163', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:23:39');
INSERT INTO `sys_logininfor` VALUES ('164', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:23:56');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:23:59');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:25:20');
INSERT INTO `sys_logininfor` VALUES ('167', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:25:26');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:34:08');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:48:45');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:49:41');
INSERT INTO `sys_logininfor` VALUES ('171', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:49:57');
INSERT INTO `sys_logininfor` VALUES ('172', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:50:31');
INSERT INTO `sys_logininfor` VALUES ('173', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:50:35');
INSERT INTO `sys_logininfor` VALUES ('174', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:50:54');
INSERT INTO `sys_logininfor` VALUES ('175', 'xyq', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-06-15 18:51:00');
INSERT INTO `sys_logininfor` VALUES ('176', 'xyq', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-06-15 18:51:03');
INSERT INTO `sys_logininfor` VALUES ('177', 'xcq', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2021-06-15 18:51:08');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-15 18:51:17');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:51:20');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:51:43');
INSERT INTO `sys_logininfor` VALUES ('181', 'xcq', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:51:48');
INSERT INTO `sys_logininfor` VALUES ('182', 'xcq', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:52:19');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:52:25');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:52:41');
INSERT INTO `sys_logininfor` VALUES ('185', 'xcq', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:52:49');
INSERT INTO `sys_logininfor` VALUES ('186', 'xcq', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:53:00');
INSERT INTO `sys_logininfor` VALUES ('187', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-15 18:53:06');
INSERT INTO `sys_logininfor` VALUES ('188', 'wyf', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-15 18:54:00');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1118 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-04-12 10:09:35', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-04-12 10:09:35', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-04-12 10:09:35', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '叩丁狼官网', '0', '6', 'https://www.wolfcode.cn/', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2021-04-12 10:09:35', 'admin', '2021-05-21 11:07:02', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-04-12 10:09:35', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-04-12 10:09:35', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-04-12 10:09:35', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-04-12 10:09:35', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-04-12 10:09:35', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-04-12 10:09:35', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-04-12 10:09:35', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-04-12 10:09:35', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-04-12 10:09:35', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-04-12 10:09:35', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-04-12 10:09:35', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-04-12 10:09:35', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-04-12 10:09:35', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-04-12 10:09:35', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-04-12 10:09:35', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-04-12 10:09:35', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-04-12 10:09:35', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-04-12 10:09:35', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-04-12 10:09:35', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '115', '1', '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '115', '2', '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '115', '3', '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '115', '4', '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '115', '5', '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('1062', '业务功能', '0', '5', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-newspaper-o', 'admin', '2021-05-13 09:45:13', 'admin', '2021-05-21 11:06:53', '');
INSERT INTO `sys_menu` VALUES ('1063', '购车询价信息管理', '1062', '1', '#', 'menuItem', 'M', '0', '1', '', '#', 'admin', '2021-05-13 10:01:00', 'admin', '2021-05-28 09:21:00', '');
INSERT INTO `sys_menu` VALUES ('1064', '续保询价信息管理', '1062', '2', '#', 'menuItem', 'M', '0', '1', '', '#', 'admin', '2021-05-13 10:01:53', 'admin', '2021-05-28 09:21:07', '');
INSERT INTO `sys_menu` VALUES ('1065', '试驾预约信息管理', '1062', '3', '#', 'menuItem', 'M', '0', '1', '', '#', 'admin', '2021-05-13 10:02:44', 'admin', '2021-05-28 09:21:13', '');
INSERT INTO `sys_menu` VALUES ('1066', '养修预约业务', '1062', '4', '#', 'menuItem', 'M', '0', '1', '', '#', 'admin', '2021-05-13 10:03:27', 'admin', '2021-05-28 09:21:20', '');
INSERT INTO `sys_menu` VALUES ('1072', '养修信息预约', '1066', '1', '/business/carMaintenanceInfo', '', 'C', '0', '1', 'business:carMaintenanceInfo:view', '#', 'admin', '2021-05-13 11:24:37', '', null, '养修信息预约菜单');
INSERT INTO `sys_menu` VALUES ('1073', '养修信息预约查询', '1072', '1', '#', '', 'F', '0', '1', 'business:carMaintenanceInfo:list', '#', 'admin', '2021-05-13 11:24:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1074', '养修信息预约新增', '1072', '2', '#', '', 'F', '0', '1', 'business:carMaintenanceInfo:add', '#', 'admin', '2021-05-13 11:24:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1075', '养修信息预约修改', '1072', '3', '#', '', 'F', '0', '1', 'business:carMaintenanceInfo:edit', '#', 'admin', '2021-05-13 11:24:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1076', '养修信息预约删除', '1072', '4', '#', '', 'F', '0', '1', 'business:carMaintenanceIinfo:remove', '#', 'admin', '2021-05-13 11:24:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1077', '客户到店', '1072', '5', '#', 'menuItem', 'F', '0', '1', 'business:carMaintenanceInfo:arrival', '#', 'admin', '2021-05-13 11:24:37', 'admin', '2021-05-19 15:23:54', '');
INSERT INTO `sys_menu` VALUES ('1078', '养修服务项', '1066', '2', '/business/serviceItem', 'menuItem', 'C', '0', '1', 'business:serviceItem:view', '#', 'admin', '2021-05-14 10:02:32', 'admin', '2021-05-28 10:29:20', '养修服务项菜单');
INSERT INTO `sys_menu` VALUES ('1079', '养修服务项查询', '1078', '1', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:list', '#', 'admin', '2021-05-14 10:02:32', 'admin', '2021-05-28 10:19:53', '');
INSERT INTO `sys_menu` VALUES ('1080', '养修服务项新增', '1078', '2', '#', '', 'F', '0', '1', 'business:serviceItem:add', '#', 'admin', '2021-05-14 10:02:32', '', null, '');
INSERT INTO `sys_menu` VALUES ('1081', '养修服务项修改', '1078', '3', '#', '', 'F', '0', '1', 'business:serviceItem:edit', '#', 'admin', '2021-05-14 10:02:32', '', null, '');
INSERT INTO `sys_menu` VALUES ('1082', '养修服务项上架', '1078', '4', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:saleOn', '#', 'admin', '2021-05-14 10:02:32', 'admin', '2021-05-19 15:46:43', '');
INSERT INTO `sys_menu` VALUES ('1083', '养修服务项下架', '1078', '5', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:saleOff', '#', 'admin', '2021-05-14 10:02:32', 'admin', '2021-05-19 15:47:03', '');
INSERT INTO `sys_menu` VALUES ('1084', '结算单', '1066', '3', '/business/statement', 'menuItem', 'C', '0', '1', 'business:statement:view', '#', 'admin', '2021-05-17 09:29:23', 'admin', '2021-05-19 15:37:35', '结算单菜单');
INSERT INTO `sys_menu` VALUES ('1085', '结算单查询', '1084', '1', '#', '', 'F', '0', '1', 'business:statement:list', '#', 'admin', '2021-05-17 09:29:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1086', '结算单新增', '1084', '2', '#', '', 'F', '0', '1', 'business:statement:add', '#', 'admin', '2021-05-17 09:29:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1087', '结算单修改', '1084', '3', '#', '', 'F', '0', '1', 'business:statement:edit', '#', 'admin', '2021-05-17 09:29:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1088', '结算单删除', '1084', '4', '#', '', 'F', '0', '1', 'business:statement:remove', '#', 'admin', '2021-05-17 09:29:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1089', '结算单明细', '1084', '5', '#', 'menuItem', 'F', '0', '1', 'business:statement:detail', '#', 'admin', '2021-05-17 09:29:23', 'admin', '2021-05-19 15:56:25', '');
INSERT INTO `sys_menu` VALUES ('1096', '生成结算单', '1072', '7', '#', 'menuItem', 'F', '0', '1', 'business:carMaintenanceInfo:generateStatement', '#', 'admin', '2021-05-19 15:23:41', 'admin', '2021-05-19 15:24:52', '');
INSERT INTO `sys_menu` VALUES ('1097', '客户取消', '1072', '6', '#', 'menuItem', 'F', '0', '1', 'business:carMaintenanceInfo:cancel', '#', 'admin', '2021-05-19 15:24:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('1098', '结算单明细', '1066', '4', '#', 'menuItem', 'C', '1', '1', null, '#', 'admin', '2021-05-19 15:57:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1099', '明细保存', '1098', '1', '#', 'menuItem', 'F', '0', '1', 'business:statementItem:saveItems', '#', 'admin', '2021-05-19 16:00:15', '', null, '');
INSERT INTO `sys_menu` VALUES ('1100', '确认支付', '1098', '2', '#', 'menuItem', 'F', '0', '1', 'business:statementItem:payStatement', '#', 'admin', '2021-05-19 16:03:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1101', '流程管理', '0', '4', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-hourglass-start', 'admin', '2021-05-21 11:08:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('1102', '流程定义', '1101', '1', '/business/definitionInfo', 'menuItem', 'C', '0', '1', 'business:definition:view', '#', 'admin', '2021-05-21 11:15:20', 'admin', '2021-06-07 14:56:25', '流程定义菜单');
INSERT INTO `sys_menu` VALUES ('1103', '流程定义查询', '1102', '1', '#', '', 'F', '0', '1', 'business:definition:list', '#', 'admin', '2021-05-21 11:15:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('1104', '套餐审核流程', '1062', '5', '#', 'menuItem', 'M', '0', '1', '', '#', 'admin', '2021-05-25 10:28:04', 'admin', '2021-05-28 09:21:26', '');
INSERT INTO `sys_menu` VALUES ('1106', '审核列表', '1104', '1', '/business/carPackageAudit', 'menuItem', 'C', '0', '1', 'business:carPackageAudit:view', '#', 'admin', '2021-05-25 10:39:39', 'admin', '2021-06-11 15:42:57', '审核列表菜单');
INSERT INTO `sys_menu` VALUES ('1112', '我的待办', '1104', '2', '/business/carPackageAudit/todoPage', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2021-05-25 18:53:40', 'admin', '2021-06-15 09:44:54', '');
INSERT INTO `sys_menu` VALUES ('1113', '我的已办', '1104', '3', '/business/carPackageAudit/donePage', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2021-05-25 18:53:59', 'admin', '2021-06-15 09:45:04', '');
INSERT INTO `sys_menu` VALUES ('1114', '明细列表', '1098', '3', '#', 'menuItem', 'C', '0', '1', 'business:statementItem:list', '#', 'admin', '2021-06-15 18:15:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('1115', '审核列表', '1106', '1', '#', 'menuItem', 'F', '0', '1', 'business:carPackageAudit:list', '#', 'admin', '2021-06-15 18:19:21', 'admin', '2021-06-15 18:25:01', '');
INSERT INTO `sys_menu` VALUES ('1116', '养修服务项已上架集合', '1078', '6', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:selectAllSaleOnList', '#', 'admin', '2021-06-15 18:37:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('1117', '发起审核', '1078', '7', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:startAudit', '#', 'admin', '2021-06-15 18:38:16', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '操作日志', '9', 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'POST', '1', 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 09:24:00');
INSERT INTO `sys_oper_log` VALUES ('2', '登录日志', '9', 'com.ruoyi.web.controller.monitor.SysLogininforController.clean()', 'POST', '1', 'admin', '研发部门', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 09:24:11');
INSERT INTO `sys_oper_log` VALUES ('3', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1078\"],\"parentId\":[\"1066\"],\"menuType\":[\"C\"],\"menuName\":[\"养修服务项\"],\"url\":[\"/business/serviceItems\"],\"target\":[\"menuItem\"],\"perms\":[\"business:serviceItems:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:19:40');
INSERT INTO `sys_oper_log` VALUES ('4', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1079\"],\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"养修服务项查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"business:serviceItems:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:19:53');
INSERT INTO `sys_oper_log` VALUES ('5', '养修信息预约', '1', 'com.ruoyi.business.controller.CarMaintenanceInfoController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/carMaintenanceInfo/add', '127.0.0.1', '内网IP', '{\"customerName\":[\"李四\"],\"customerPhone\":[\"13088885555\"],\"appointmentTime\":[\"2021-05-28 10:25\"],\"licensePlate\":[\"粤AB6688\"],\"carSeries\":[\"别克\"],\"serviceType\":[\"1\"],\"info\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:26:44');
INSERT INTO `sys_oper_log` VALUES ('6', '养修信息预约', '2', 'com.ruoyi.business.controller.CarMaintenanceInfoController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/carMaintenanceInfo/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"customerName\":[\"李四\"],\"customerPhone\":[\"13088885555\"],\"appointmentTime\":[\"2021-05-28 10:25\"],\"licensePlate\":[\"粤AB6688\"],\"carSeries\":[\"别克\"],\"serviceType\":[\"1\"],\"info\":[\"测试\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:27:01');
INSERT INTO `sys_oper_log` VALUES ('7', '养修信息预约', '3', 'com.ruoyi.business.controller.CarMaintenanceInfoController.remove()', 'POST', '1', 'admin', '研发部门', '/business/carMaintenanceInfo/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:27:08');
INSERT INTO `sys_oper_log` VALUES ('8', '养修信息预约', '1', 'com.ruoyi.business.controller.CarMaintenanceInfoController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/carMaintenanceInfo/add', '127.0.0.1', '内网IP', '{\"customerName\":[\"李四\"],\"customerPhone\":[\"13088886666\"],\"appointmentTime\":[\"2021-05-28 10:00\"],\"licensePlate\":[\"粤AB6688\"],\"carSeries\":[\"别克\"],\"serviceType\":[\"1\"],\"info\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:27:32');
INSERT INTO `sys_oper_log` VALUES ('9', '养修信息预约', '2', 'com.ruoyi.business.controller.CarMaintenanceInfoController.cancel()', 'GET', '1', 'admin', '研发部门', '/business/carMaintenanceInfo/cancel', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:27:36');
INSERT INTO `sys_oper_log` VALUES ('10', '养修信息预约', '1', 'com.ruoyi.business.controller.CarMaintenanceInfoController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/carMaintenanceInfo/add', '127.0.0.1', '内网IP', '{\"customerName\":[\"王五\"],\"customerPhone\":[\"13033335555\"],\"appointmentTime\":[\"2021-05-28 10:10\"],\"licensePlate\":[\"粤B66666\"],\"carSeries\":[\"雪佛兰\"],\"serviceType\":[\"0\"],\"info\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:28:45');
INSERT INTO `sys_oper_log` VALUES ('11', '养修信息预约', '2', 'com.ruoyi.business.controller.CarMaintenanceInfoController.arrival()', 'GET', '1', 'admin', '研发部门', '/business/carMaintenanceInfo/arrival', '127.0.0.1', '内网IP', '{\"id\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:28:48');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1078\"],\"parentId\":[\"1066\"],\"menuType\":[\"C\"],\"menuName\":[\"养修服务项\"],\"url\":[\"/business/serviceItem\"],\"target\":[\"menuItem\"],\"perms\":[\"business:serviceItem:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:29:20');
INSERT INTO `sys_oper_log` VALUES ('13', '养修服务项', '1', 'com.ruoyi.business.controller.ServiceItemController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/add', '127.0.0.1', '内网IP', '{\"name\":[\"新车开蜡\"],\"originalPrice\":[\"288\"],\"discountPrice\":[\"188\"],\"carPackage\":[\"0\"],\"serviceCatalog\":[\"1\"],\"info\":[\"新车开蜡\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:41:49');
INSERT INTO `sys_oper_log` VALUES ('14', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"name\":[\"新车开蜡\"],\"originalPrice\":[\"288.00\"],\"discountPrice\":[\"198.00\"],\"serviceCatalog\":[\"1\"],\"info\":[\"新车开蜡\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:42:12');
INSERT INTO `sys_oper_log` VALUES ('15', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.saleOn()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/saleOn', '127.0.0.1', '内网IP', '{\"id\":[\"9\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:42:17');
INSERT INTO `sys_oper_log` VALUES ('16', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.saleOff()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/saleOff', '127.0.0.1', '内网IP', '{\"id\":[\"9\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 10:42:19');
INSERT INTO `sys_oper_log` VALUES ('17', '养修服务项', '1', 'com.ruoyi.business.controller.StatementItemController.saveItems()', 'POST', '1', 'admin', '研发部门', '/business/statementItem/saveItems', '127.0.0.1', '内网IP', '[{\"itemId\":1,\"itemName\":\"人工费(小时)\",\"itemPrice\":188,\"itemQuantity\":1,\"itemVersion\":0,\"params\":{},\"statementId\":3},{\"itemId\":2,\"itemName\":\"换机油\",\"itemPrice\":88,\"itemQuantity\":1,\"itemVersion\":2,\"params\":{},\"statementId\":3}]', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:00:48');
INSERT INTO `sys_oper_log` VALUES ('18', '养修服务项', '1', 'com.ruoyi.business.controller.StatementItemController.saveItems()', 'POST', '1', 'admin', '研发部门', '/business/statementItem/saveItems', '127.0.0.1', '内网IP', '[{\"itemId\":1,\"itemName\":\"人工费(小时)\",\"itemPrice\":188,\"itemQuantity\":1,\"itemVersion\":0,\"params\":{},\"statementId\":4},{\"itemId\":2,\"itemName\":\"换机油\",\"itemPrice\":88,\"itemQuantity\":1,\"itemVersion\":2,\"params\":{},\"statementId\":4}]', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:09:22');
INSERT INTO `sys_oper_log` VALUES ('19', '结算单', '1', 'com.ruoyi.business.controller.StatementController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/statement/add', '127.0.0.1', '内网IP', '{\"customerName\":[\"赵六\"],\"customerPhone\":[\"13077779999\"],\"actualArrivalTime\":[\"2021-05-28 11:30\"],\"licensePlate\":[\"粤C8888\"],\"carSeries\":[\"特斯拉\"],\"serviceType\":[\"1\"],\"info\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:11:18');
INSERT INTO `sys_oper_log` VALUES ('20', '养修服务项', '1', 'com.ruoyi.business.controller.StatementItemController.saveItems()', 'POST', '1', 'admin', '研发部门', '/business/statementItem/saveItems', '127.0.0.1', '内网IP', '[{\"itemId\":5,\"itemName\":\"洗车\",\"itemPrice\":68,\"itemQuantity\":1,\"itemVersion\":0,\"params\":{},\"statementId\":5},{\"itemId\":6,\"itemName\":\"米其林轮胎\",\"itemPrice\":399,\"itemQuantity\":1,\"itemVersion\":0,\"params\":{},\"statementId\":5},{\"itemId\":7,\"itemName\":\"玻璃水\",\"itemPrice\":68,\"itemQuantity\":1,\"itemVersion\":0,\"params\":{},\"statementId\":5}]', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:11:30');
INSERT INTO `sys_oper_log` VALUES ('21', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"name\":[\"美容套餐B\"],\"originalPrice\":[\"299.00\"],\"discountPrice\":[\"188.00\"],\"serviceCatalog\":[\"1\"],\"info\":[\"新车开蜡，钢圈、轮胎、保险杠翻新与底盘防腐涂胶处理\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:13:36');
INSERT INTO `sys_oper_log` VALUES ('22', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"name\":[\"车饰美容\"],\"originalPrice\":[\"6000.00\"],\"discountPrice\":[\"1500.00\"],\"serviceCatalog\":[\"1\"],\"info\":[\"车饰美容包括仪表台、顶棚、地毯。脚垫、座椅、座套、车门内饰的吸尘清洁保护，以及蒸汽杀菌、冷暖风口除臭、室内空气净化、内饰清洁、表盘上光、包真皮、车内除味等项目。\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:14:08');
INSERT INTO `sys_oper_log` VALUES ('23', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"name\":[\"车身美容\"],\"originalPrice\":[\"299.00\"],\"discountPrice\":[\"188.00\"],\"serviceCatalog\":[\"1\"],\"info\":[\"包括高压洗车，去除沥青、焦油等污物，上蜡增艳与镜面处理，新车开蜡，钢圈、轮胎、保险杠翻新与底盘防腐涂胶处理\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:14:42');
INSERT INTO `sys_oper_log` VALUES ('24', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"洗车套餐\"],\"originalPrice\":[\"3000.00\"],\"discountPrice\":[\"2100.00\"],\"serviceCatalog\":[\"1\"],\"info\":[\"无水洗车、泡沫精致洗车、全自动电脑洗车、底盘清洗\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:14:58');
INSERT INTO `sys_oper_log` VALUES ('25', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"name\":[\"车身美容\"],\"originalPrice\":[\"2990\"],\"discountPrice\":[\"1888\"],\"serviceCatalog\":[\"1\"],\"info\":[\"包括高压洗车，去除沥青、焦油等污物，上蜡增艳与镜面处理，新车开蜡，钢圈、轮胎、保险杠翻新与底盘防腐涂胶处理\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:15:12');
INSERT INTO `sys_oper_log` VALUES ('26', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:43:01');
INSERT INTO `sys_oper_log` VALUES ('27', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:43:02');
INSERT INTO `sys_oper_log` VALUES ('28', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:43:04');
INSERT INTO `sys_oper_log` VALUES ('29', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:43:05');
INSERT INTO `sys_oper_log` VALUES ('30', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:43:07');
INSERT INTO `sys_oper_log` VALUES ('31', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:43:09');
INSERT INTO `sys_oper_log` VALUES ('32', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-05-28 11:43:11');
INSERT INTO `sys_oper_log` VALUES ('33', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_definition_info\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 14:36:57');
INSERT INTO `sys_oper_log` VALUES ('34', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"t_definition_info\"],\"tableComment\":[\"流程定义\"],\"className\":[\"DefinitionInfo\"],\"functionAuthor\":[\"wolfcode\"],\"remark\":[\"流程定义\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"流程key\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"definitionKey\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"流程描述\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"description\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.business\"],\"moduleName\":[\"business\"],\"businessName\":[\"definitionInfo\"],\"functionName\":[\"流程定义\"],\"params[parentMenuId]\":[\"1101\"],\"params[parentMenuName]\":[\"流程管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 14:47:16');
INSERT INTO `sys_oper_log` VALUES ('35', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_definition_info', '127.0.0.1', '内网IP', '\"t_definition_info\"', null, '0', null, '2021-06-07 14:48:36');
INSERT INTO `sys_oper_log` VALUES ('36', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1102\"],\"parentId\":[\"1101\"],\"menuType\":[\"C\"],\"menuName\":[\"流程定义\"],\"url\":[\"/business/definitionInfo\"],\"target\":[\"menuItem\"],\"perms\":[\"business:definition:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 14:56:25');
INSERT INTO `sys_oper_log` VALUES ('37', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_definition_detail\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 15:16:05');
INSERT INTO `sys_oper_log` VALUES ('38', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_definition_detail\"],\"tableComment\":[\"流程定义明细\"],\"className\":[\"DefinitionDetail\"],\"functionAuthor\":[\"wolfcode\"],\"remark\":[\"流程定义明细\"],\"columns[0].columnId\":[\"5\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"流程定义id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"definitionInfoId\"],\"columns[0].isList\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"6\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程部署id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"deploymentId\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"7\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"部署时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deployTime\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.business\"],\"moduleName\":[\"business\"],\"businessName\":[\"definitionInfo\"],\"functionName\":[\"流程定义明细\"],\"params[parentMenuId]\":[\"1101\"],\"params[parentMenuName]\":[\"流程管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 15:21:18');
INSERT INTO `sys_oper_log` VALUES ('39', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_definition_detail', '127.0.0.1', '内网IP', '\"t_definition_detail\"', null, '0', null, '2021-06-07 15:21:31');
INSERT INTO `sys_oper_log` VALUES ('40', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_definition_detail\"],\"tableComment\":[\"流程定义明细\"],\"className\":[\"DefinitionDetail\"],\"functionAuthor\":[\"wolfcode\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"5\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"流程定义id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"definitionInfoId\"],\"columns[0].isList\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"6\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程部署id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"deploymentId\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"7\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"部署时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deployTime\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.business\"],\"moduleName\":[\"business\"],\"businessName\":[\"definitionInfo\"],\"functionName\":[\"流程定义明细\"],\"params[parentMenuId]\":[\"1101\"],\"params[parentMenuName]\":[\"流程管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 15:23:33');
INSERT INTO `sys_oper_log` VALUES ('41', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_definition_detail', '127.0.0.1', '内网IP', '\"t_definition_detail\"', null, '0', null, '2021-06-07 15:23:37');
INSERT INTO `sys_oper_log` VALUES ('42', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_definition_detail', '127.0.0.1', '内网IP', '\"t_definition_detail\"', null, '0', null, '2021-06-07 15:23:48');
INSERT INTO `sys_oper_log` VALUES ('43', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_definition_detail\"],\"tableComment\":[\"流程定义明细\"],\"className\":[\"DefinitionDetail\"],\"functionAuthor\":[\"wolfcode\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"5\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"流程定义id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"definitionInfoId\"],\"columns[0].isList\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"6\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程部署id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"deploymentId\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"7\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"部署时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deployTime\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.business\"],\"moduleName\":[\"business\"],\"businessName\":[\"definitionDetail\"],\"functionName\":[\"流程定义明细\"],\"params[parentMenuId]\":[\"1101\"],\"params[parentMenuName]\":[\"流程管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 15:26:34');
INSERT INTO `sys_oper_log` VALUES ('44', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_definition_detail', '127.0.0.1', '内网IP', '\"t_definition_detail\"', null, '0', null, '2021-06-07 15:26:37');
INSERT INTO `sys_oper_log` VALUES ('45', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_definition_detail\"],\"tableComment\":[\"流程定义明细\"],\"className\":[\"DefinitionDetail\"],\"functionAuthor\":[\"wolfcode\"],\"remark\":[\"流程定义明细\"],\"columns[0].columnId\":[\"5\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"流程定义id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"definitionInfoId\"],\"columns[0].isList\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"6\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程部署id\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"deploymentId\"],\"columns[1].isList\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"7\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"部署时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deployTime\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.business\"],\"moduleName\":[\"business\"],\"businessName\":[\"definitionDetail\"],\"functionName\":[\"流程定义明细\"],\"params[parentMenuId]\":[\"1101\"],\"params[parentMenuName]\":[\"流程管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 16:20:27');
INSERT INTO `sys_oper_log` VALUES ('46', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_definition_detail', '127.0.0.1', '内网IP', '\"t_definition_detail\"', null, '0', null, '2021-06-07 16:20:31');
INSERT INTO `sys_oper_log` VALUES ('47', '流程定义明细', '2', 'com.ruoyi.business.controller.DefinitionDetailController.upload()', 'POST', '1', 'admin', '研发部门', '/business/definitionDetail/upload', '127.0.0.1', '内网IP', '{\"definitionId\":[\"1\"]}', '{\r\n  \"msg\" : \"上传流程定义文件失败！\",\r\n  \"code\" : 500\r\n}', '0', null, '2021-06-07 17:51:17');
INSERT INTO `sys_oper_log` VALUES ('48', '流程定义明细', '2', 'com.ruoyi.business.controller.DefinitionDetailController.upload()', 'POST', '1', 'admin', '研发部门', '/business/definitionDetail/upload', '127.0.0.1', '内网IP', '{\"definitionId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-07 18:04:45');
INSERT INTO `sys_oper_log` VALUES ('49', '流程定义明细', '2', 'com.ruoyi.business.controller.DefinitionDetailController.upload()', 'POST', '1', 'admin', '研发部门', '/business/definitionDetail/upload', '127.0.0.1', '内网IP', '{\"definitionId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-10 14:01:12');
INSERT INTO `sys_oper_log` VALUES ('50', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_definition_auditor\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-10 15:02:18');
INSERT INTO `sys_oper_log` VALUES ('51', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-10 15:03:07');
INSERT INTO `sys_oper_log` VALUES ('52', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_definition_node\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-10 15:03:15');
INSERT INTO `sys_oper_log` VALUES ('53', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_definition_node\"],\"tableComment\":[\"流程定义节点信息\"],\"className\":[\"TDefinitionNode\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"10\"],\"columns[0].sort\":[\"1\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"11\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程定义ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"definitionInfoId\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"12\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"节点key\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"nodeKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"13\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"节点描述\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"nodeDescription\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"node\"],\"functionName\":[\"流程定义节点信息\"],\"params[parentMenuId]\":[\"\"],\"params[parentMenuName]\":[\"\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-10 15:07:15');
INSERT INTO `sys_oper_log` VALUES ('54', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_definition_node\"],\"tableComment\":[\"流程定义节点信息\"],\"className\":[\"DefinitionNode\"],\"functionAuthor\":[\"wolfcode\"],\"remark\":[\"流程定义节点信息\"],\"columns[0].columnId\":[\"10\"],\"columns[0].sort\":[\"1\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"11\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"流程定义ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"definitionInfoId\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"12\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"节点key\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"nodeKey\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"13\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"节点描述\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"nodeDescription\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.business\"],\"moduleName\":[\"business\"],\"businessName\":[\"definitionNode\"],\"functionName\":[\"流程定义节点信息\"],\"params[parentMenuId]\":[\"1101\"],\"params[parentMenuName]\":[\"流程管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-10 15:08:10');
INSERT INTO `sys_oper_log` VALUES ('55', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/t_definition_node', '127.0.0.1', '内网IP', '\"t_definition_node\"', null, '0', null, '2021-06-10 15:08:14');
INSERT INTO `sys_oper_log` VALUES ('56', '流程定义节点信息', '1', 'com.ruoyi.business.controller.DefinitionNodeController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/add', '127.0.0.1', '内网IP', '{\"nodeKey\":[\"shopOwnerAudit\"],\"nodeDescription\":[\"店长审批\"]}', null, '1', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'auditorIds\' evaluated to a null value.', '2021-06-10 16:32:53');
INSERT INTO `sys_oper_log` VALUES ('57', '流程定义节点信息', '1', 'com.ruoyi.business.controller.DefinitionNodeController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/add', '127.0.0.1', '内网IP', '{\"nodeKey\":[\"shopOwnerAudit\"],\"nodeDescription\":[\"店长审批\"],\"auditorIds\":[\"3,4\"],\"definitionInfoId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-10 16:37:46');
INSERT INTO `sys_oper_log` VALUES ('58', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'car_o2o.t_car_package_audit\' doesn\'t exist\r\n### The error may exist in file [E:\\demo-test\\new\\RuoYi\\ruoyi-business\\target\\classes\\mapper\\business\\CarPackageAuditMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_car_package_audit(create_by,service_item_info) values (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'car_o2o.t_car_package_audit\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'car_o2o.t_car_package_audit\' doesn\'t exist', '2021-06-11 15:22:57');
INSERT INTO `sys_oper_log` VALUES ('59', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"]}', null, '1', '', '2021-06-11 15:23:41');
INSERT INTO `sys_oper_log` VALUES ('60', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-11 15:27:38');
INSERT INTO `sys_oper_log` VALUES ('61', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1106\"],\"parentId\":[\"1104\"],\"menuType\":[\"C\"],\"menuName\":[\"审核列表\"],\"url\":[\"/business/carPackageAudit\"],\"target\":[\"menuItem\"],\"perms\":[\"business:carPackageAudit:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-11 15:42:57');
INSERT INTO `sys_oper_log` VALUES ('62', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-11 17:47:42');
INSERT INTO `sys_oper_log` VALUES ('63', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-11 17:52:55');
INSERT INTO `sys_oper_log` VALUES ('64', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-11 18:02:02');
INSERT INTO `sys_oper_log` VALUES ('65', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-11 18:07:11');
INSERT INTO `sys_oper_log` VALUES ('66', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-11 18:12:09');
INSERT INTO `sys_oper_log` VALUES ('67', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1112\"],\"parentId\":[\"1104\"],\"menuType\":[\"C\"],\"menuName\":[\"我的待办\"],\"url\":[\"/business/carPackageAudit/todoPage\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 09:44:54');
INSERT INTO `sys_oper_log` VALUES ('68', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1113\"],\"parentId\":[\"1104\"],\"menuType\":[\"C\"],\"menuName\":[\"我的已办\"],\"url\":[\"/business/carPackageAudit/donePage\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 09:45:04');
INSERT INTO `sys_oper_log` VALUES ('69', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:21:43');
INSERT INTO `sys_oper_log` VALUES ('70', '流程定义节点信息', '1', 'com.ruoyi.business.controller.DefinitionNodeController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/add', '127.0.0.1', '内网IP', '{\"nodeKey\":[\"presidentAudit\"],\"nodeDescription\":[\"总经理审批\"],\"auditorIds\":[\"2,5\"],\"definitionInfoId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:24:28');
INSERT INTO `sys_oper_log` VALUES ('71', '流程定义节点信息', '1', 'com.ruoyi.business.controller.DefinitionNodeController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/add', '127.0.0.1', '内网IP', '{\"nodeKey\":[\"financialAudit\"],\"nodeDescription\":[\"财务审批\"],\"auditorIds\":[\"7,8\"],\"definitionInfoId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:24:55');
INSERT INTO `sys_oper_log` VALUES ('72', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1098,1099,1100,1104,1106,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:25:54');
INSERT INTO `sys_oper_log` VALUES ('73', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"5\"],\"roleName\":[\"店长\"],\"roleKey\":[\"shopOwner\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1104,1106,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:26:40');
INSERT INTO `sys_oper_log` VALUES ('74', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"6\"],\"roleName\":[\"财务专员\"],\"roleKey\":[\"financial\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1104,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:27:15');
INSERT INTO `sys_oper_log` VALUES ('75', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"7\"],\"roleName\":[\"总经理\"],\"roleKey\":[\"generalManager\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1104,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:27:27');
INSERT INTO `sys_oper_log` VALUES ('76', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1098,1099,1100,1104,1106,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:27:39');
INSERT INTO `sys_oper_log` VALUES ('77', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"5\"],\"roleName\":[\"店长\"],\"roleKey\":[\"shopOwner\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1104,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 10:27:49');
INSERT INTO `sys_oper_log` VALUES ('78', '养修服务项', '1', 'com.ruoyi.business.controller.ServiceItemController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/add', '127.0.0.1', '内网IP', '{\"name\":[\"空调清洁\"],\"originalPrice\":[\"199\"],\"discountPrice\":[\"129\"],\"carPackage\":[\"0\"],\"serviceCatalog\":[\"1\"],\"info\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 15:47:54');
INSERT INTO `sys_oper_log` VALUES ('79', '养修服务项', '1', 'com.ruoyi.business.controller.ServiceItemController.addSave()', 'POST', '1', 'admin', '研发部门', '/business/serviceItem/add', '127.0.0.1', '内网IP', '{\"name\":[\"车内除味\"],\"originalPrice\":[\"99\"],\"discountPrice\":[\"69\"],\"carPackage\":[\"0\"],\"serviceCatalog\":[\"1\"],\"info\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 15:48:37');
INSERT INTO `sys_oper_log` VALUES ('80', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"8\"],\"loginName\":[\"wef\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 17:58:12');
INSERT INTO `sys_oper_log` VALUES ('81', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"7\"],\"loginName\":[\"wyf\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 17:58:20');
INSERT INTO `sys_oper_log` VALUES ('82', '流程定义节点信息', '2', 'com.ruoyi.business.controller.DefinitionNodeController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/edit', '127.0.0.1', '内网IP', '{\"auditorIds\":[\"6\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\r\n### The error may exist in file [E:\\demo-test\\new\\RuoYi\\ruoyi-business\\target\\classes\\mapper\\business\\DefinitionNodeMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.DefinitionNodeMapper.updateDefinitionNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_definition_node                    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3', '2021-06-15 18:01:23');
INSERT INTO `sys_oper_log` VALUES ('83', '流程定义节点信息', '2', 'com.ruoyi.business.controller.DefinitionNodeController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/edit', '127.0.0.1', '内网IP', '{\"auditorIds\":[\"6\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\r\n### The error may exist in file [E:\\demo-test\\new\\RuoYi\\ruoyi-business\\target\\classes\\mapper\\business\\DefinitionNodeMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.DefinitionNodeMapper.updateDefinitionNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_definition_node                    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3', '2021-06-15 18:02:28');
INSERT INTO `sys_oper_log` VALUES ('84', '流程定义节点信息', '2', 'com.ruoyi.business.controller.DefinitionNodeController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/edit', '127.0.0.1', '内网IP', '{\"auditorIds\":[\"6\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\r\n### The error may exist in file [E:\\demo-test\\new\\RuoYi\\ruoyi-business\\target\\classes\\mapper\\business\\DefinitionNodeMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.DefinitionNodeMapper.updateDefinitionNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_definition_node                    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3', '2021-06-15 18:02:43');
INSERT INTO `sys_oper_log` VALUES ('85', '流程定义节点信息', '2', 'com.ruoyi.business.controller.DefinitionNodeController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"nodeKey\":[\"presidentAudit\"],\"nodeDescription\":[\"总经理审批\"],\"auditorIds\":[\"6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:04:40');
INSERT INTO `sys_oper_log` VALUES ('86', '流程定义节点信息', '2', 'com.ruoyi.business.controller.DefinitionNodeController.editSave()', 'POST', '1', 'admin', '研发部门', '/business/definitionNode/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"nodeKey\":[\"financialAudit\"],\"nodeDescription\":[\"财务审批\"],\"auditorIds\":[\"2,5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:07:03');
INSERT INTO `sys_oper_log` VALUES ('87', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1098,1099,1100,1104,1106,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:07:31');
INSERT INTO `sys_oper_log` VALUES ('88', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1098\"],\"menuType\":[\"C\"],\"menuName\":[\"明细列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"business:statementItem:list\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:15:29');
INSERT INTO `sys_oper_log` VALUES ('89', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1098,1099,1100,1114,1104,1106,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:16:05');
INSERT INTO `sys_oper_log` VALUES ('90', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1106\"],\"menuType\":[\"C\"],\"menuName\":[\"审核列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"business:carMaintenanceInfo:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:19:21');
INSERT INTO `sys_oper_log` VALUES ('91', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1098,1099,1100,1114,1104,1106,1115,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:19:46');
INSERT INTO `sys_oper_log` VALUES ('92', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1098,1099,1100,1114,1104,1106,1115,1112,1113\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:20:15');
INSERT INTO `sys_oper_log` VALUES ('93', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1115\"],\"parentId\":[\"1106\"],\"menuType\":[\"F\"],\"menuName\":[\"审核列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"business:carMaintenanceInfo:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:23:27');
INSERT INTO `sys_oper_log` VALUES ('94', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1115\"],\"parentId\":[\"1106\"],\"menuType\":[\"F\"],\"menuName\":[\"审核列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"business:carPackageAudit:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:25:01');
INSERT INTO `sys_oper_log` VALUES ('95', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,1101,1102,1103,1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1098,1099,1100,1114,1104,1106,1115,1112,1113,4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:25:17');
INSERT INTO `sys_oper_log` VALUES ('96', '养修信息预约', '1', 'com.ruoyi.business.controller.CarMaintenanceInfoController.addSave()', 'POST', '1', 'wyf', '市场部门', '/business/carMaintenanceInfo/add', '127.0.0.1', '内网IP', '{\"customerName\":[\"赵六\"],\"customerPhone\":[\"13055558888\"],\"appointmentTime\":[\"2021-06-15 18:25\"],\"licensePlate\":[\"粤A5588\"],\"carSeries\":[\"雷克萨斯\"],\"serviceType\":[\"1\"],\"info\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:26:42');
INSERT INTO `sys_oper_log` VALUES ('97', '养修信息预约', '2', 'com.ruoyi.business.controller.CarMaintenanceInfoController.editSave()', 'POST', '1', 'wyf', '市场部门', '/business/carMaintenanceInfo/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"customerName\":[\"赵六\"],\"customerPhone\":[\"13055558888\"],\"appointmentTime\":[\"2021-06-15 18:25\"],\"licensePlate\":[\"粤A5588\"],\"carSeries\":[\"雷克萨斯\"],\"serviceType\":[\"1\"],\"info\":[\"我是备注\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:26:53');
INSERT INTO `sys_oper_log` VALUES ('98', '养修信息预约', '2', 'com.ruoyi.business.controller.CarMaintenanceInfoController.arrival()', 'GET', '1', 'wyf', '市场部门', '/business/carMaintenanceInfo/arrival', '127.0.0.1', '内网IP', '{\"id\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:26:57');
INSERT INTO `sys_oper_log` VALUES ('99', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"养修服务项已上架集合\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"business:serviceItem:selectAllSaleOnList\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:37:41');
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1078\"],\"menuType\":[\"F\"],\"menuName\":[\"发起审核\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"business:serviceItem:startAudit\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:38:16');
INSERT INTO `sys_oper_log` VALUES ('101', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"业务员\"],\"roleKey\":[\"salesman\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1062,1063,1064,1065,1066,1072,1073,1074,1075,1076,1077,1097,1096,1078,1079,1080,1081,1082,1083,1116,1117,1084,1085,1086,1087,1088,1089,1098,1099,1100,1114,1104,1106,1115,1112,1113,4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:49:05');
INSERT INTO `sys_oper_log` VALUES ('102', '流程定义明细', '2', 'com.ruoyi.business.controller.DefinitionDetailController.upload()', 'POST', '1', 'admin', '研发部门', '/business/definitionDetail/upload', '127.0.0.1', '内网IP', '{\"definitionId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:49:19');
INSERT INTO `sys_oper_log` VALUES ('103', '养修服务项', '2', 'com.ruoyi.business.controller.ServiceItemController.startAudit()', 'POST', '1', 'wyf', '市场部门', '/business/serviceItem/startAudit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:50:12');
INSERT INTO `sys_oper_log` VALUES ('104', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"xcq\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:51:33');
INSERT INTO `sys_oper_log` VALUES ('105', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"5\"],\"loginName\":[\"xch\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', '0', null, '2021-06-15 18:51:41');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2021-04-12 10:09:35', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2021-04-12 10:09:35', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '0', '0', 'admin', '2021-04-12 10:09:35', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2021-04-12 10:09:35', 'admin', '2021-05-28 09:06:25', '普通角色');
INSERT INTO `sys_role` VALUES ('3', '财务', 'caiwu', '3', '1', '0', '2', 'admin', '2021-05-12 16:49:02', '', null, null);
INSERT INTO `sys_role` VALUES ('4', '业务员', 'salesman', '3', '1', '0', '0', 'admin', '2021-05-19 15:05:29', 'admin', '2021-06-15 18:49:05', '');
INSERT INTO `sys_role` VALUES ('5', '店长', 'shopOwner', '4', '1', '0', '0', 'admin', '2021-05-28 09:09:08', 'admin', '2021-06-15 10:27:49', '');
INSERT INTO `sys_role` VALUES ('6', '财务专员', 'financial', '5', '1', '0', '0', 'admin', '2021-05-28 09:11:20', 'admin', '2021-06-15 10:27:15', '');
INSERT INTO `sys_role` VALUES ('7', '总经理', 'generalManager', '6', '1', '0', '0', 'admin', '2021-05-28 09:12:22', 'admin', '2021-06-15 10:27:27', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('2', '1061');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '1062');
INSERT INTO `sys_role_menu` VALUES ('4', '1063');
INSERT INTO `sys_role_menu` VALUES ('4', '1064');
INSERT INTO `sys_role_menu` VALUES ('4', '1065');
INSERT INTO `sys_role_menu` VALUES ('4', '1066');
INSERT INTO `sys_role_menu` VALUES ('4', '1072');
INSERT INTO `sys_role_menu` VALUES ('4', '1073');
INSERT INTO `sys_role_menu` VALUES ('4', '1074');
INSERT INTO `sys_role_menu` VALUES ('4', '1075');
INSERT INTO `sys_role_menu` VALUES ('4', '1076');
INSERT INTO `sys_role_menu` VALUES ('4', '1077');
INSERT INTO `sys_role_menu` VALUES ('4', '1078');
INSERT INTO `sys_role_menu` VALUES ('4', '1079');
INSERT INTO `sys_role_menu` VALUES ('4', '1080');
INSERT INTO `sys_role_menu` VALUES ('4', '1081');
INSERT INTO `sys_role_menu` VALUES ('4', '1082');
INSERT INTO `sys_role_menu` VALUES ('4', '1083');
INSERT INTO `sys_role_menu` VALUES ('4', '1084');
INSERT INTO `sys_role_menu` VALUES ('4', '1085');
INSERT INTO `sys_role_menu` VALUES ('4', '1086');
INSERT INTO `sys_role_menu` VALUES ('4', '1087');
INSERT INTO `sys_role_menu` VALUES ('4', '1088');
INSERT INTO `sys_role_menu` VALUES ('4', '1089');
INSERT INTO `sys_role_menu` VALUES ('4', '1096');
INSERT INTO `sys_role_menu` VALUES ('4', '1097');
INSERT INTO `sys_role_menu` VALUES ('4', '1098');
INSERT INTO `sys_role_menu` VALUES ('4', '1099');
INSERT INTO `sys_role_menu` VALUES ('4', '1100');
INSERT INTO `sys_role_menu` VALUES ('4', '1104');
INSERT INTO `sys_role_menu` VALUES ('4', '1106');
INSERT INTO `sys_role_menu` VALUES ('4', '1112');
INSERT INTO `sys_role_menu` VALUES ('4', '1113');
INSERT INTO `sys_role_menu` VALUES ('4', '1114');
INSERT INTO `sys_role_menu` VALUES ('4', '1115');
INSERT INTO `sys_role_menu` VALUES ('4', '1116');
INSERT INTO `sys_role_menu` VALUES ('4', '1117');
INSERT INTO `sys_role_menu` VALUES ('5', '1062');
INSERT INTO `sys_role_menu` VALUES ('5', '1104');
INSERT INTO `sys_role_menu` VALUES ('5', '1112');
INSERT INTO `sys_role_menu` VALUES ('5', '1113');
INSERT INTO `sys_role_menu` VALUES ('6', '1062');
INSERT INTO `sys_role_menu` VALUES ('6', '1104');
INSERT INTO `sys_role_menu` VALUES ('6', '1112');
INSERT INTO `sys_role_menu` VALUES ('6', '1113');
INSERT INTO `sys_role_menu` VALUES ('7', '1062');
INSERT INTO `sys_role_menu` VALUES ('7', '1104');
INSERT INTO `sys_role_menu` VALUES ('7', '1112');
INSERT INTO `sys_role_menu` VALUES ('7', '1113');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '管理员', '00', 'admin@wolfcode.cn', '15888888888', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-06-15 18:52:26', '2021-04-12 10:09:35', 'admin', '2021-04-12 10:09:35', '', '2021-06-15 18:52:25', '管理员');
INSERT INTO `sys_user` VALUES ('2', '104', 'xcq', '熊长青', '00', 'xcq@wolfcode.cn', '15666666666', '0', '', '3bc4191ab19247847baefafe01a0eeb5', '7dc302', '0', '0', '127.0.0.1', '2021-06-15 18:52:49', '2021-04-12 10:09:35', 'admin', '2021-04-12 10:09:35', 'admin', '2021-06-15 18:52:49', '测试员');
INSERT INTO `sys_user` VALUES ('3', '104', 'yl', '杨龙', '00', 'yl@wolfcode.cn', '13088886666', '0', '', 'a491f284859c6789cef2bd9e77319e2b', '0d0a40', '0', '0', '127.0.0.1', '2021-06-15 18:50:36', null, 'admin', '2021-05-19 15:07:32', 'admin', '2021-06-15 18:50:35', '业务员');
INSERT INTO `sys_user` VALUES ('4', '104', 'yf', '杨凤', '00', '', '13022223333', '0', '', 'e7f34aa5979e13033b54fb498373f2df', 'db94ff', '0', '0', '', null, null, 'admin', '2021-05-28 09:15:00', 'admin', '2021-05-28 09:16:21', '');
INSERT INTO `sys_user` VALUES ('5', '104', 'xch', '熊长黄', '00', '', '13022223338', '0', '', '5356b70eb3bde91e63239a9c6a56774b', '46f429', '0', '0', '', null, null, 'admin', '2021-05-28 09:17:55', '', '2021-06-15 18:51:41', null);
INSERT INTO `sys_user` VALUES ('6', '104', 'stef', '吴嘉俊', '00', '', '13022223339', '0', '', '80207361411d15943caf05ee8a0fcf8d', '4e065f', '0', '0', '', null, null, 'admin', '2021-05-28 09:18:33', '', null, null);
INSERT INTO `sys_user` VALUES ('7', '104', 'wyf', '王一飞', '00', '', '13022223331', '0', '', 'a64e1acf2a01233f7ff2b63f29d9e35f', '5904ff', '0', '0', '127.0.0.1', '2021-06-15 18:53:06', null, 'admin', '2021-05-28 09:19:39', '', '2021-06-15 18:53:06', null);
INSERT INTO `sys_user` VALUES ('8', '104', 'wef', '王二飞', '00', '', '13022223332', '0', '', '3e7b7bfb4315310d2acbf7aa0022b8d4', '3b7881', '0', '0', '', null, null, 'admin', '2021-05-28 09:20:05', '', '2021-06-15 17:58:12', null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('3', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '6');
INSERT INTO `sys_user_role` VALUES ('3', '5');
INSERT INTO `sys_user_role` VALUES ('4', '5');
INSERT INTO `sys_user_role` VALUES ('5', '6');
INSERT INTO `sys_user_role` VALUES ('6', '7');
INSERT INTO `sys_user_role` VALUES ('7', '4');
INSERT INTO `sys_user_role` VALUES ('8', '4');

-- ----------------------------
-- Table structure for t_car_maintenance_info
-- ----------------------------
DROP TABLE IF EXISTS `t_car_maintenance_info`;
CREATE TABLE `t_car_maintenance_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` bigint(11) DEFAULT NULL COMMENT '客户联系方式',
  `appointment_time` datetime DEFAULT NULL COMMENT '预约时间',
  `actual_arrival_time` datetime DEFAULT NULL COMMENT '实际到店时间',
  `license_plate` varchar(20) DEFAULT NULL COMMENT '车牌号码',
  `car_series` varchar(20) DEFAULT NULL COMMENT '汽车类型',
  `service_type` tinyint(1) DEFAULT NULL COMMENT '服务类型【维修0/保养1】',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `info` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态【预约中0/已到店1/用户取消2/超时取消3】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='养修信息预约';

-- ----------------------------
-- Records of t_car_maintenance_info
-- ----------------------------
INSERT INTO `t_car_maintenance_info` VALUES ('1', '肖战', '13088889999', '2021-05-19 15:45:00', '2021-05-19 11:49:24', '豫A66688', '宝马X5', '1', '2021-05-19 11:49:17', null, 'hello', '4');
INSERT INTO `t_car_maintenance_info` VALUES ('3', '王一博', '13088886666', '2021-05-28 10:00:00', null, '赣A55588', '特斯拉Model3', '1', '2021-05-28 10:27:32', null, '', '2');
INSERT INTO `t_car_maintenance_info` VALUES ('4', '蔡徐坤', '13033335555', '2021-05-28 10:10:00', '2021-05-28 10:28:48', '粤G88888', '迈巴赫', '0', '2021-05-28 10:28:45', null, '', '4');
INSERT INTO `t_car_maintenance_info` VALUES ('5', '易烊千玺', '13055558888', '2021-06-15 18:25:00', '2021-06-15 18:26:57', '豫B88899', '奔驰', '1', '2021-06-15 18:26:42', '2021-06-15 18:26:53', '我是备注', '4');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `car_series` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', '肖战', '豫A66688', '宝马X5');
INSERT INTO `t_customer` VALUES ('2', '王一博', '赣A55588', '特斯拉Model3');
INSERT INTO `t_customer` VALUES ('3', '蔡徐坤', '粤G88888', '迈巴赫');
INSERT INTO `t_customer` VALUES ('4', '易烊千玺', '豫B88899', '奔驰');
INSERT INTO `t_customer` VALUES ('5', '王俊凯', '黑A99888', '奥迪Q5');

-- ----------------------------
-- Table structure for t_service_item
-- ----------------------------
DROP TABLE IF EXISTS `t_service_item`;
CREATE TABLE `t_service_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '服务项名称',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '服务项原价',
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '服务项折扣价',
  `car_package` tinyint(1) DEFAULT NULL COMMENT '是否套餐【是/否】',
  `info` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `service_catalog` tinyint(1) DEFAULT NULL COMMENT '服务分类【维修/保养/其他】',
  `audit_status` tinyint(1) DEFAULT '4' COMMENT '审核状态【初始化/审核中/审核通过/审核拒绝/无需审核】',
  `sale_status` tinyint(1) DEFAULT '0' COMMENT '上架状态【已上架/未上架】',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_service_item
-- ----------------------------
INSERT INTO `t_service_item` VALUES ('1', '人工费(小时)', '188.00', '188.00', '0', '每小时人工费', '2021-05-14 10:09:36', null, '2', '4', '1', '0');
INSERT INTO `t_service_item` VALUES ('2', '换机油', '88.00', '88.00', '0', '', '2021-05-14 10:32:30', '2021-05-14 17:30:22', '0', '4', '1', '2');
INSERT INTO `t_service_item` VALUES ('3', '洗车套餐', '3000.00', '1800.00', '1', '无水洗车、泡沫精致洗车、全自动电脑洗车、底盘清洗', '2021-05-14 10:33:24', '2021-06-15 18:51:57', '1', '2', '0', '11');
INSERT INTO `t_service_item` VALUES ('4', '车身美容', '2990.00', '1888.00', '1', '包括高压洗车，去除沥青、焦油等污物，上蜡增艳与镜面处理，新车开蜡，钢圈、轮胎、保险杠翻新与底盘防腐涂胶处理', '2021-05-18 10:31:13', '2021-05-28 11:15:12', '1', '0', '0', '4');
INSERT INTO `t_service_item` VALUES ('5', '洗车', '99.00', '68.00', '0', '', '2021-05-18 10:32:48', null, '1', '4', '1', '0');
INSERT INTO `t_service_item` VALUES ('6', '米其林轮胎', '500.00', '399.00', '0', '', '2021-05-18 10:33:18', null, '0', '4', '1', '0');
INSERT INTO `t_service_item` VALUES ('7', '玻璃水', '88.00', '68.00', '0', '', '2021-05-18 10:33:48', null, '0', '4', '1', '0');
INSERT INTO `t_service_item` VALUES ('8', '车饰美容', '6000.00', '1500.00', '1', '车饰美容包括仪表台、顶棚、地毯。脚垫、座椅、座套、车门内饰的吸尘清洁保护，以及蒸汽杀菌、冷暖风口除臭、室内空气净化、内饰清洁、表盘上光、包真皮、车内除味等项目。', '2021-05-27 11:21:53', '2021-05-28 11:14:08', '1', '0', '0', '12');
INSERT INTO `t_service_item` VALUES ('9', '新车开蜡', '288.00', '198.00', '0', '新车开蜡', '2021-05-28 10:41:49', '2021-05-28 10:42:12', '1', '4', '0', '1');
INSERT INTO `t_service_item` VALUES ('10', '空调清洁', '199.00', '129.00', '0', '', '2021-06-15 15:47:54', null, '1', '4', '0', '0');
INSERT INTO `t_service_item` VALUES ('11', '车内除味', '99.00', '69.00', '0', '', '2021-06-15 15:48:37', null, '1', '4', '0', '0');

-- ----------------------------
-- Table structure for t_statement
-- ----------------------------
DROP TABLE IF EXISTS `t_statement`;
CREATE TABLE `t_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` varchar(255) DEFAULT NULL COMMENT '客户联系方式',
  `actual_arrival_time` datetime DEFAULT NULL COMMENT '实际到店时间',
  `license_plate` varchar(255) DEFAULT NULL COMMENT '车牌号码',
  `car_series` varchar(255) DEFAULT NULL COMMENT '汽车类型',
  `service_type` bigint(20) DEFAULT NULL COMMENT '服务类型【维修/保养】',
  `maintenance_id` bigint(20) DEFAULT NULL COMMENT '预约单ID【通过这个来判断是否预约用户,唯一标识】',
  `status` tinyint(1) DEFAULT '0' COMMENT '结算状态【消费中0/已支付1】',
  `pay_time` datetime DEFAULT NULL COMMENT '收款时间',
  `payee_id` bigint(11) DEFAULT NULL COMMENT '收款人id',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '总消费金额',
  `total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '服务项数量',
  `discount_amount` decimal(10,2) DEFAULT '0.00' COMMENT '折扣金额',
  `info` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `maintenance_id` (`maintenance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='结算单';

-- ----------------------------
-- Records of t_statement
-- ----------------------------
INSERT INTO `t_statement` VALUES ('1', '张三', '13088889999', '2021-05-19 11:49:24', '粤A88888', '宝马X5', '1', '1', '1', '2021-05-19 11:49:42', '1', '464.00', '3.00', '20.00', null, '2021-05-19 11:49:28', '2021-05-19 11:49:42');
INSERT INTO `t_statement` VALUES ('2', '李四', '13099998888', '2021-05-20 15:55:00', '粤A55555', '宝马X1', '0', null, '1', '2021-05-19 16:05:58', '1', '276.00', '2.00', '0.00', '', '2021-05-19 15:58:23', '2021-05-19 16:05:58');
INSERT INTO `t_statement` VALUES ('3', '王五', '13077778888', '2021-05-28 15:35:00', '粤A77788', '奔驰', '1', null, '1', '2021-05-28 11:00:51', '1', '276.00', '2.00', '10.00', '', '2021-05-27 15:38:28', '2021-05-28 11:00:51');
INSERT INTO `t_statement` VALUES ('4', '王五', '13033335555', '2021-05-28 10:28:48', '粤B66666', '雪佛兰', '0', '4', '1', '2021-05-28 11:09:24', '1', '276.00', '2.00', '0.00', null, '2021-05-28 11:09:17', '2021-05-28 11:09:24');
INSERT INTO `t_statement` VALUES ('5', '赵六', '13077779999', '2021-05-28 11:30:00', '粤C8888', '特斯拉', '1', null, '1', '2021-05-28 11:11:33', '1', '535.00', '3.00', '35.00', '', '2021-05-28 11:11:18', '2021-05-28 11:11:33');
INSERT INTO `t_statement` VALUES ('6', '赵六', '13055558888', '2021-06-15 18:26:57', '粤A5588', '雷克萨斯', '1', '5', '0', null, null, '0.00', '0.00', '0.00', null, '2021-06-15 18:27:05', null);

-- ----------------------------
-- Table structure for t_statement_item
-- ----------------------------
DROP TABLE IF EXISTS `t_statement_item`;
CREATE TABLE `t_statement_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` bigint(20) DEFAULT NULL COMMENT '结算单ID',
  `item_id` bigint(20) DEFAULT NULL COMMENT '服务项明细ID',
  `item_version` bigint(20) DEFAULT NULL COMMENT '服务项明细版本号',
  `item_name` varchar(255) DEFAULT NULL COMMENT '服务项明细名称',
  `item_price` decimal(10,2) DEFAULT NULL COMMENT '服务项价格',
  `item_quantity` decimal(10,0) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='结算单明细';

-- ----------------------------
-- Records of t_statement_item
-- ----------------------------
INSERT INTO `t_statement_item` VALUES ('1', '1', '1', '0', '人工费(小时)', '188.00', '2');
INSERT INTO `t_statement_item` VALUES ('2', '1', '2', '2', '换机油', '88.00', '1');
INSERT INTO `t_statement_item` VALUES ('3', '2', '1', '0', '人工费(小时)', '188.00', '1');
INSERT INTO `t_statement_item` VALUES ('4', '2', '2', '2', '换机油', '88.00', '1');
INSERT INTO `t_statement_item` VALUES ('5', '3', '1', '0', '人工费(小时)', '188.00', '1');
INSERT INTO `t_statement_item` VALUES ('6', '3', '2', '2', '换机油', '88.00', '1');
INSERT INTO `t_statement_item` VALUES ('7', '4', '1', '0', '人工费(小时)', '188.00', '1');
INSERT INTO `t_statement_item` VALUES ('8', '4', '2', '2', '换机油', '88.00', '1');
INSERT INTO `t_statement_item` VALUES ('9', '5', '5', '0', '洗车', '68.00', '1');
INSERT INTO `t_statement_item` VALUES ('10', '5', '6', '0', '米其林轮胎', '399.00', '1');
INSERT INTO `t_statement_item` VALUES ('11', '5', '7', '0', '玻璃水', '68.00', '1');
