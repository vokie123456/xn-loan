/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.5.45-log : Database - xn_loan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xn_loan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xn_loan`;

/*Table structure for table `credit_audit` */

DROP TABLE IF EXISTS `credit_audit`;

CREATE TABLE `credit_audit` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `loan_type` varchar(32) DEFAULT NULL COMMENT '贷款类型',
  `loan_amount` bigint(20) DEFAULT NULL COMMENT '贷款金额',
  `user_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `relation` varchar(32) DEFAULT NULL COMMENT '关系',
  `ref_user` varchar(32) DEFAULT NULL COMMENT '所属人',
  `id_kind` varchar(32) DEFAULT NULL COMMENT '证件类型',
  `id_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `accredit_pdf` varchar(255) DEFAULT NULL COMMENT '授权书',
  `credit_result` varchar(32) DEFAULT NULL COMMENT '资信结果',
  `credit_code` varchar(32) DEFAULT NULL COMMENT '资信编号',
  `credit_descript` varchar(255) DEFAULT NULL COMMENT '资信描述',
  `court_result` varchar(32) DEFAULT NULL COMMENT '法院结果',
  `court_descript` varchar(255) DEFAULT NULL COMMENT '法院描述',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `work_unit` varchar(32) DEFAULT NULL COMMENT '工作单位',
  `work_phone` varchar(32) DEFAULT NULL COMMENT '单位电话',
  `work_address` varchar(32) DEFAULT NULL COMMENT '单位地址',
  `detail` varchar(255) DEFAULT NULL COMMENT '详情',
  `approver` varchar(32) DEFAULT NULL COMMENT '审批人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审批时间',
  `approve_note` varchar(255) DEFAULT NULL COMMENT '审批说明',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `credit_audit` */

insert  into `credit_audit`(`code`,`loan_type`,`loan_amount`,`user_name`,`relation`,`ref_user`,`id_kind`,`id_no`,`accredit_pdf`,`credit_result`,`credit_code`,`credit_descript`,`court_result`,`court_descript`,`status`,`create_datetime`,`mobile`,`work_unit`,`work_phone`,`work_address`,`detail`,`approver`,`approve_datetime`,`approve_note`,`remark`) values ('CA201612241348183252',NULL,NULL,NULL,'0',NULL,'2','2','1',NULL,NULL,NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612241359531486',NULL,NULL,'2','0','FL201612241308032846','2','2','1','1',NULL,'11','1','11','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612242123494106',NULL,NULL,'1','0','CO201612242123490478','1','1','1',NULL,NULL,NULL,NULL,NULL,'0','2016-12-24 21:23:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612251532334218',NULL,NULL,NULL,'0','CO201612251532334118','1','9099000000','oooooo',NULL,NULL,NULL,NULL,NULL,'0','2016-12-25 15:32:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612251543106502',NULL,NULL,NULL,'0','CO201612251543106373','1','330003933333333333333','http://3wefjeifef.pdf',NULL,NULL,NULL,NULL,NULL,'0','2016-12-25 15:43:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612251558057525',NULL,NULL,NULL,'0','CO201612251558057419','1','12345678090','dfdsf.pdf',NULL,NULL,NULL,NULL,NULL,'0','2016-12-25 15:58:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612251558057625',NULL,NULL,NULL,'1','CO201612251558057419','','','',NULL,NULL,NULL,NULL,NULL,'0','2016-12-25 15:58:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612251558057713',NULL,NULL,NULL,'','CO201612251558057419','','','',NULL,NULL,NULL,NULL,NULL,'0','2016-12-25 15:58:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612251610320809',NULL,NULL,NULL,'0','CO201612251610320664','1','3456789','fffll.pdf',NULL,NULL,NULL,NULL,NULL,'0','2016-12-25 16:10:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CA201612251906469746','1',1999000000000,'吴联请','0','CO201612251903148204','1','111111111111','111.pdf','1',NULL,'112.22221','1','3232','1','2016-12-25 19:06:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FL201612241243069335',NULL,NULL,NULL,'1','1','1','1','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FL201612241253275439',NULL,NULL,'1','1','1','1','1','1',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `credit_order` */

DROP TABLE IF EXISTS `credit_order`;

CREATE TABLE `credit_order` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `salesman` varchar(32) DEFAULT NULL COMMENT '业务员',
  `car` varchar(32) DEFAULT NULL COMMENT '车行',
  `jbBank` varchar(32) DEFAULT NULL COMMENT '经办银行',
  `loan_type` varchar(32) DEFAULT NULL COMMENT '贷款品种',
  `loan_amount` bigint(20) DEFAULT NULL COMMENT '贷款金额',
  `user_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `id_kind` varchar(32) DEFAULT NULL COMMENT '证件类型',
  `id_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `investigator` varchar(32) DEFAULT NULL COMMENT '调查员',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `sign_pic` varchar(32) DEFAULT NULL COMMENT '签字照',
  `home_pic` varchar(32) DEFAULT NULL COMMENT '家访照',
  `id_info` varchar(32) DEFAULT NULL COMMENT '身份资料',
  `video` varchar(32) DEFAULT NULL COMMENT '视频',
  `report` varchar(32) DEFAULT NULL COMMENT '调查报告',
  `other_data` varchar(32) DEFAULT NULL COMMENT '其他',
  `home_address` varchar(32) DEFAULT NULL COMMENT '家庭地址',
  `brand` varchar(32) DEFAULT NULL COMMENT '品牌',
  `model` varchar(32) DEFAULT NULL COMMENT '型号',
  `price` bigint(20) DEFAULT NULL COMMENT '车价',
  `first_pay` bigint(20) DEFAULT NULL COMMENT '首付',
  `real_loan_amount` bigint(20) DEFAULT NULL COMMENT '贷款额',
  `loan_term` varchar(32) DEFAULT NULL COMMENT '贷款期限',
  `sum_rate` varchar(32) DEFAULT NULL COMMENT '综合费率',
  `fee` varchar(32) DEFAULT NULL COMMENT '服务费',
  `urgency` varchar(4) DEFAULT NULL COMMENT '紧急度',
  `supply_info` varchar(255) DEFAULT NULL COMMENT '其他资料',
  `card_bank` varchar(32) DEFAULT NULL COMMENT '代扣卡开户行',
  `card_number` varchar(32) DEFAULT NULL COMMENT '代扣卡号码',
  `receipt` varchar(32) DEFAULT NULL COMMENT '发票',
  `policy` varchar(32) DEFAULT NULL COMMENT '保单',
  `certification` varchar(32) DEFAULT NULL COMMENT '合格证',
  `approver` varchar(32) DEFAULT NULL COMMENT '审批人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审批时间',
  `approve_note` varchar(32) DEFAULT NULL COMMENT '审批说明',
  `lend_other_data` varchar(255) DEFAULT NULL COMMENT '放款其他资料补充',
  `download_times` int(32) DEFAULT NULL COMMENT '下载次数',
  `lend_pdf` varchar(255) DEFAULT NULL COMMENT '放款附件',
  `cw_pdf` varchar(255) DEFAULT NULL COMMENT '请款附件',
  `play_pdf` varchar(255) DEFAULT NULL COMMENT '打款水单',
  `receipt_pdf` varchar(255) DEFAULT NULL COMMENT '收款水单',
  `receipt_amount` bigint(20) DEFAULT NULL COMMENT '收款金额',
  `receipt_datetime` datetime DEFAULT NULL COMMENT '收款时间',
  `payroll_pdf` varchar(255) DEFAULT NULL COMMENT '工资单附件',
  `remark` varchar(32) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `credit_order` */

insert  into `credit_order`(`code`,`salesman`,`car`,`jbBank`,`loan_type`,`loan_amount`,`user_name`,`id_kind`,`id_no`,`mobile`,`investigator`,`status`,`create_datetime`,`sign_pic`,`home_pic`,`id_info`,`video`,`report`,`other_data`,`home_address`,`brand`,`model`,`price`,`first_pay`,`real_loan_amount`,`loan_term`,`sum_rate`,`fee`,`urgency`,`supply_info`,`card_bank`,`card_number`,`receipt`,`policy`,`certification`,`approver`,`approve_datetime`,`approve_note`,`lend_other_data`,`download_times`,`lend_pdf`,`cw_pdf`,`play_pdf`,`receipt_pdf`,`receipt_amount`,`receipt_datetime`,`payroll_pdf`,`remark`) values ('CO201612242123490478','1','1','0','1',1,'1','1','1',NULL,NULL,NULL,'2016-12-24 21:23:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CO201612251532334118','U2016122515020761212','1','1','1',9000000,NULL,'1','9099000000',NULL,NULL,NULL,'2016-12-25 15:32:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CO201612251543106373','U2016122515020761212','1','1','1',2321000,NULL,'1','330003933333333333333',NULL,NULL,NULL,'2016-12-25 15:43:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CO201612251558057419','U2016122515020761212','1','1','1',10000000,NULL,'1','12345678090',NULL,NULL,NULL,'2016-12-25 15:58:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CO201612251610320664','U2016122515020761212','1','1','1',1222000,NULL,'1','3456789',NULL,NULL,NULL,'2016-12-25 16:10:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CO201612251801024746','U2016122515020761212','1','1','1',19092000000,'fsda','1','afsfa',NULL,NULL,NULL,'2016-12-25 18:01:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CO201612251903148204','U2016122515020761212','1','1','1',1999000000,'吴联请','1','111111111111','18888888888','U2016122515022205967','7','2016-12-25 20:29:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CO201612261429353643','U2016122515020761212','1','1','1',232322323000,'吴联请1','1','3232332232323323',NULL,NULL,NULL,'2016-12-26 14:29:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FL201612241239421438','1','1','0','1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FL201612241243095208','1','1','0','1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FL201612241253302197','1','1','0','1',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FL201612241254540594','1','1','0','1',1,'1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FL201612241308032846','1','1','0','1',1,'2','2','2','131111','13111','1',NULL,'12','12','12','12','12','12','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','12','12',NULL,NULL,NULL,NULL,113,NULL,NULL,'12','11',NULL,'2016-12-25 15:00:36',NULL,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
