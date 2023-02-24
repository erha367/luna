/*
 Navicat Premium Data Transfer

 Source Server         : tidb-13
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 10.0.13.229:61106
 Source Schema         : eo_osfile

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 23/02/2023 11:43:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __del_eeo_goods_folder_relations
-- ----------------------------
DROP TABLE IF EXISTS `__del_eeo_goods_folder_relations`;
CREATE TABLE `__del_eeo_goods_folder_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) DEFAULT NULL COMMENT '商品id',
  `is_pub_mall` tinyint(1) DEFAULT NULL COMMENT '是否上架',
  `folder_id` int(11) DEFAULT NULL COMMENT '文件夹',
  `uptime` int(11) DEFAULT NULL COMMENT '更新时间',
  `addtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `isdel` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `i_ef_folder_id` (`folder_id`),
  KEY `i_ef_goodid` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=37138;

-- ----------------------------
-- Table structure for demo_posts
-- ----------------------------
DROP TABLE IF EXISTS `demo_posts`;
CREATE TABLE `demo_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_type` varchar(20) NOT NULL DEFAULT 'post' COMMENT '文章类型,post:帖子,article:文章,page:页面',
  `post_uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `post_title` text NOT NULL COMMENT '文章标题',
  `post_content` longtext NOT NULL COMMENT '文章内容',
  `post_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '文章状态,1:草稿,2:发布',
  `post_create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '文章创建时间',
  `post_update_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '文章更新时间',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `post_title` (`post_title`(191)),
  KEY `post_type` (`post_type`),
  KEY `post_uid` (`post_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for demo_sms
-- ----------------------------
DROP TABLE IF EXISTS `demo_sms`;
CREATE TABLE `demo_sms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sms_uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `sms_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `sms_tmpl_id` varchar(255) NOT NULL DEFAULT '' COMMENT '短信模板id',
  `sms_content` text NOT NULL COMMENT '短信内容',
  `sms_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文章状态,1:已创建,2:已发出,3:发送失败',
  `sms_result` text NOT NULL COMMENT '发送请求结果',
  `sms_create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `sms_tmpl_id` (`sms_tmpl_id`),
  KEY `sms_uid` (`sms_uid`),
  KEY `sms_mobile` (`sms_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for demo_users
-- ----------------------------
DROP TABLE IF EXISTS `demo_users`;
CREATE TABLE `demo_users` (
  `id` bigint(0) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '账号',
  `user_pass` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `user_nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `user_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `user_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `user_create_time` bigint(0) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `user_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_user_login` (`user_login`),
  KEY `idx_nickname` (`user_nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=90001 COMMENT='用户表';

-- ----------------------------
-- Table structure for eeo_course_files
-- ----------------------------
DROP TABLE IF EXISTS `eeo_course_files`;
CREATE TABLE `eeo_course_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sid` bigint(20) NOT NULL DEFAULT '0' COMMENT '机构id',
  `course_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '群id',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传用户id',
  `file_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '文件id',
  `folder_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属文件夹id',
  `file_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `user_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '上传人名称',
  `file_size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小(单位是KB)',
  `file_extension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件格式',
  `file_name_py` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字拼音',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(在我的网盘里不显示)',
  `exp1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '扩展字段',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文件类型 0课件1试卷 2作业',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `i_course_id` (`course_id`),
  KEY `i_file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=873358 COMMENT='群文件关系表';

-- ----------------------------
-- Table structure for eeo_course_folders
-- ----------------------------
DROP TABLE IF EXISTS `eeo_course_folders`;
CREATE TABLE `eeo_course_folders` (
  `folder_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sid` bigint(20) NOT NULL DEFAULT '0' COMMENT '机构id',
  `course_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '群id',
  `folder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目录名',
  `folder_node` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文件层级',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级id',
  `folder_path` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目录结构',
  `exp1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '备用字段',
  `operate_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作级别（0 自己创建可以随意删除复制移动，1系统创建不可删除、移动、复制、重命名、分享）',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0没删除 1删除)',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人name',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人uid',
  PRIMARY KEY (`folder_id`) /*T![clustered_index] CLUSTERED */,
  KEY `i_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=931228 COMMENT='群目录系表';

-- ----------------------------
-- Table structure for eeo_edoc_auths
-- ----------------------------
DROP TABLE IF EXISTS `eeo_edoc_auths`;
CREATE TABLE `eeo_edoc_auths` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '协作文档id',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被授权人id',
  `course_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被授权群id',
  `edoc_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文档权限 0无 1读 2写',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除 0否 1是',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `i_file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=811568 COMMENT='动态文档权限表';

-- ----------------------------
-- Table structure for eeo_files
-- ----------------------------
DROP TABLE IF EXISTS `eeo_files`;
CREATE TABLE `eeo_files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `file_save_path` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_save_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件保存名字',
  `file_extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件格式',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小(单位是KB)',
  `transition_files` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转换后保存文件地址',
  `transition_data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json格式数据',
  `transition_state` tinyint(1) DEFAULT '0' COMMENT '转换状态（0.等待转换, 1.转换中 2.转换成功 3.转换失败 4需要重新转换的）',
  `moderation_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容审核状态（0.正常, 1.违规）',
  `upload_userid` bigint(20) DEFAULT '0' COMMENT '上传者id',
  `file_type` tinyint(1) DEFAULT '0' COMMENT '文件类型 （0云盘，3作业，4im聊天，5协作文档，6备课包，7微课，8eppt,10录播课，12teacherIn，13camIn，20讨论，21学习资料，22班级附件）',
  `system_del` tinyint(1) DEFAULT '0' COMMENT '系统删除(0为未删除 1为已删除)',
  `system_lock` tinyint(1) DEFAULT '0' COMMENT '系统屏蔽(0为未屏蔽可以分享 1为屏蔽禁止分享)',
  `save_num` int(11) DEFAULT NULL COMMENT '被保存次数',
  `down_num` int(11) DEFAULT NULL COMMENT '被下载次数',
  `exp1` tinyint(1) DEFAULT NULL COMMENT '扩展字段',
  `migrate_status` tinyint(1) DEFAULT '0' COMMENT '文件迁移cos状态(0为未迁移 1为已迁移 2迁移失败)',
  `migrate_time` int(11) DEFAULT '0' COMMENT '文件迁移cos时间',
  `addtime` int(11) DEFAULT NULL COMMENT '上传时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '状态更新时间',
  `transition_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `transition_start_time` int(11) DEFAULT NULL COMMENT '转换开始时间',
  `transition_longs` bigint(20) DEFAULT '0' COMMENT '转换时长,单位（秒）',
  `t_type` tinyint(1) DEFAULT NULL COMMENT '转换类型1eeoconv-ppt-big 。。。',
  `print_status` tinyint(4) DEFAULT '0' COMMENT '文件打印转换状态0待转换 1转换中 2转换成功 3转换失败',
  PRIMARY KEY (`file_id`) /*T![clustered_index] CLUSTERED */,
  KEY `eeo_files#file_extension#transition_state` (`file_extension`,`transition_state`),
  KEY `eeo_files_upload_userid` (`upload_userid`),
  KEY `i_ef_addt` (`addtime`),
  KEY `i_ef_filesize` (`file_size`),
  KEY `i_ef_t_type` (`t_type`),
  KEY `i_ef_upt` (`uptime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1835428 COMMENT='基础文件表';

-- ----------------------------
-- Table structure for eeo_files_lack
-- ----------------------------
DROP TABLE IF EXISTS `eeo_files_lack`;
CREATE TABLE `eeo_files_lack` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件ID',
  `file_save_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件保存路径',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=305788 COMMENT='文件缺失记录表';

-- ----------------------------
-- Table structure for eeo_files_nouser
-- ----------------------------
DROP TABLE IF EXISTS `eeo_files_nouser`;
CREATE TABLE `eeo_files_nouser` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `place_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归档时间',
  `del_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  UNIQUE KEY `idx_fid` (`file_id`) COMMENT '文件ID索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=60001 COMMENT='无主文件处理表';

-- ----------------------------
-- Table structure for eeo_user_files
-- ----------------------------
DROP TABLE IF EXISTS `eeo_user_files`;
CREATE TABLE `eeo_user_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件id',
  `folder_id` bigint(20) DEFAULT NULL COMMENT '所属文件夹id',
  `file_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小(单位是KB)',
  `file_extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件格式',
  `transition_state` tinyint(1) DEFAULT '0' COMMENT '转换状态（0.等待转换, 1.转换中 2.转换成功 3.转换失败 4需要重新转换的）',
  `file_name_py` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名字拼音',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '是否删除(在我的网盘里不显示)',
  `exp1` tinyint(1) DEFAULT '0' COMMENT '扩展字段',
  `addtime` int(11) DEFAULT NULL COMMENT '存入我的网盘时间',
  `uptime` int(11) DEFAULT NULL COMMENT '最后修改时间',
  `allow_operate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '授权文件是否允许操作',
  `exam_topic_sum` int(11) NOT NULL DEFAULT '0' COMMENT '试卷题数\n',
  `full_marks` int(11) NOT NULL DEFAULT '100' COMMENT '试卷满分\n',
  `version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '版本号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据类型 0=课件 1=考试 2=作业',
  `old_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '迁移前的主键id',
  `edoc_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT '在线文档权限 0未设置 1只读 2写',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `folder_id` (`folder_id`),
  KEY `eeo_user_files#user_id` (`user_id`),
  KEY `i_ef_upt` (`uptime`),
  KEY `idx_fid` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=17766010 COMMENT='用户网盘文件对应表';

-- ----------------------------
-- Table structure for eeo_user_folders
-- ----------------------------
DROP TABLE IF EXISTS `eeo_user_folders`;
CREATE TABLE `eeo_user_folders` (
  `folder_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `folder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_name_py` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件夹名称拼音',
  `folder_node` tinyint(1) DEFAULT '1' COMMENT '文件层级',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级id',
  `folder_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目录结构',
  `system_lock` tinyint(1) DEFAULT '0' COMMENT '是否可分享(根据文件夹下用户存放的文件决定的 0为可分享 1为不可分享)',
  `exp1` tinyint(1) DEFAULT '0' COMMENT '备用字段',
  `operate_level` tinyint(1) DEFAULT '0' COMMENT '操作级别（0 自己创建可以随意删除复制移动，1系统创建不可删除、移动、复制、重命名、分享）',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '是否删除(0没删除 1删除)',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `uptime` int(11) DEFAULT NULL COMMENT '最后修改时间',
  `from_id` bigint(20) DEFAULT '0' COMMENT '来自文件夹id',
  `from_parent` bigint(20) DEFAULT '0' COMMENT '原来的父级id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '目录类型：0=课件 1=考试 2=作业',
  `old_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '迁移前目录',
  `batch_operate_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '批量复制微秒时间戳',
  `pintime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '置顶时间 / 默认0为非置顶',
  `order_cate` tinyint(4) DEFAULT '0' COMMENT '云盘排序类型0文件名1时间2文件大小',
  `order_direction` tinyint(4) DEFAULT '0' COMMENT '云盘排序方向0升序1降序',
  PRIMARY KEY (`folder_id`) /*T![clustered_index] CLUSTERED */,
  KEY `folder_path` (`folder_path`(191)),
  KEY `parenter_id` (`parent_id`),
  KEY `i_batch_operate_time` (`batch_operate_time`),
  KEY `i_user_id_parent_id_isdel` (`user_id`,`parent_id`,`isdel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2047275;

-- ----------------------------
-- Table structure for eeo_user_open_file_record
-- ----------------------------
DROP TABLE IF EXISTS `eeo_user_open_file_record`;
CREATE TABLE `eeo_user_open_file_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL COMMENT '打开用户的 uId',
  `reference_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '打开文件类型  打开文件类型 具体参考代码',
  `file_extension` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '打开文件后缀',
  `file_id` bigint(20) unsigned NOT NULL COMMENT '打开文件Id',
  `file_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '打开文件名',
  `reference_id` bigint(20) unsigned NOT NULL COMMENT '根据文件类型 打开文件类型 具体参考代码',
  `course_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '班级 id',
  `share_uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分享人 Id',
  `course_file_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '班级关系 id',
  `user_file_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户关系 id',
  `upload_user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文档创建人id',
  `isdel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除 1是 0否',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_uptime` (`uptime`),
  KEY `idx_fid` (`file_id`),
  KEY `idx_ufid` (`user_file_id`),
  KEY `idx_cfid` (`course_file_id`),
  UNIQUE KEY `idx_uniq` (`uid`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=39009774 COMMENT='用户最近打开文件记录表';

-- ----------------------------
-- Table structure for eeo_user_shares
-- ----------------------------
DROP TABLE IF EXISTS `eeo_user_shares`;
CREATE TABLE `eeo_user_shares` (
  `share_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分享ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `user_resource_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分享类型（1为文件，2为文件夹,3为im聊天文件）',
  `user_resource_id` bigint(20) unsigned NOT NULL COMMENT '分享资源ID（用户文件关系ID或者文件夹ID或者im聊天文件ID）',
  `user_resource_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分享资源名字',
  `user_resource_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分享资源的类型（只有文件才有）',
  `user_resource_size` int(11) NOT NULL DEFAULT '0' COMMENT '分享资源的大小（只有文件才有）',
  `save_num` int(11) NOT NULL DEFAULT '0' COMMENT '保存次数',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除（0未删除，1删除）',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '分享时间',
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'eeo_files中的file_id',
  `old_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '试卷、考试迁移前的share_id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：0=课件、1=考试、2=作业',
  `course_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分享文件的群id',
  `sid` bigint(20) NOT NULL DEFAULT '0' COMMENT '分享文件的机构id',
  PRIMARY KEY (`share_id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=766126 COMMENT='用户云盘分享表';

SET FOREIGN_KEY_CHECKS = 1;
