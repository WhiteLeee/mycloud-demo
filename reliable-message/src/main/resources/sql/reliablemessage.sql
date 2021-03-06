DROP TABLE IF EXISTS `reliable_message` CASCADE;
CREATE TABLE `reliable_message` (
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `message_id` varchar(50) NOT NULL DEFAULT '' COMMENT '消息ID',
  `message_body` longtext NOT NULL COMMENT '消息内容',
  `message_code` varchar(50) DEFAULT NULL COMMENT '消息数据类型',
  `message_topic` varchar(100) NOT NULL DEFAULT '' COMMENT '消费队列',
  `message_group` varchar(50) DEFAULT '0' COMMENT '消息分组',
  `group_order` smallint(6) DEFAULT '1' COMMENT '消息组内顺序',
  `send_times` smallint(6) NOT NULL DEFAULT '0' COMMENT '消息重发次数',
  `next_send` datetime DEFAULT NULL COMMENT '下次发送时间',
  `is_dead` char(1) NOT NULL DEFAULT 'N' COMMENT '是否死亡:Y已死亡,N:未死亡',
  `status` varchar(20) NOT NULL DEFAULT 'CONFIRMING' COMMENT '状态:CONFIRMING待确认,SENDING:发送中',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `biz_key` varchar(50) DEFAULT NULL COMMENT '业务主键',
  `message_source` varchar(50) NOT NULL DEFAULT '' COMMENT '消息来源',
  CONSTRAINT `PK_reliable_message` PRIMARY KEY (`message_id` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='可靠消息表';