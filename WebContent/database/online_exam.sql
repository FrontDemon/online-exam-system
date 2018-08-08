/*
Navicat MySQL Data Transfer

Source Server         : MyConnection
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : online_exam

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-08-08 17:15:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `oes_mark_info`
-- ----------------------------
DROP TABLE IF EXISTS `oes_mark_info`;
CREATE TABLE `oes_mark_info` (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sno` char(12) DEFAULT NULL COMMENT '回答问题人员的用户名',
  `mark_grade` int(11) DEFAULT NULL COMMENT '考试总分数',
  `paper_id` int(11) DEFAULT NULL COMMENT '试卷信息表ID',
  PRIMARY KEY (`mark_id`),
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `sno` (`sno`) USING BTREE,
  CONSTRAINT `paper_id` FOREIGN KEY (`paper_id`) REFERENCES `oes_paper_info` (`paper_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sno` FOREIGN KEY (`sno`) REFERENCES `oes_student_info` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oes_mark_info
-- ----------------------------
INSERT INTO `oes_mark_info` VALUES ('1', '201521314321', '24', '1');
INSERT INTO `oes_mark_info` VALUES ('30', '201521314321', '14', '2');
INSERT INTO `oes_mark_info` VALUES ('41', '201521314321', '86', '26');
INSERT INTO `oes_mark_info` VALUES ('42', '201521314321', '3', '1');
INSERT INTO `oes_mark_info` VALUES ('43', '201521314321', '6', '1');
INSERT INTO `oes_mark_info` VALUES ('44', '201521314321', '0', '26');
INSERT INTO `oes_mark_info` VALUES ('45', '201521314321', '0', '26');
INSERT INTO `oes_mark_info` VALUES ('46', '201521314321', '0', '26');
INSERT INTO `oes_mark_info` VALUES ('47', '201521314321', '9', '1');

-- ----------------------------
-- Table structure for `oes_paper_info`
-- ----------------------------
DROP TABLE IF EXISTS `oes_paper_info`;
CREATE TABLE `oes_paper_info` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paper_name` varchar(255) DEFAULT NULL COMMENT '试卷名称',
  `paper_creation_of_time` datetime DEFAULT NULL COMMENT '试卷创建的时间',
  `paper_time_of_answer` int(11) DEFAULT NULL COMMENT '考生回答问题的时间',
  `sub_id` int(64) DEFAULT NULL COMMENT '科目ID',
  PRIMARY KEY (`paper_id`),
  KEY `sub_id` (`sub_id`) USING BTREE,
  CONSTRAINT `sub_id` FOREIGN KEY (`sub_id`) REFERENCES `oes_sub_info` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oes_paper_info
-- ----------------------------
INSERT INTO `oes_paper_info` VALUES ('1', 'JAVA程序设计(一)', '2018-06-11 16:59:00', '30', '1');
INSERT INTO `oes_paper_info` VALUES ('2', 'JAVA程序设计(二)', '2018-06-13 15:04:12', '15', '1');
INSERT INTO `oes_paper_info` VALUES ('3', 'JAVA应用技术', '2018-06-17 04:10:40', '60', '1');
INSERT INTO `oes_paper_info` VALUES ('4', 'JAVA编程思想', '2018-06-14 23:11:28', '60', '1');
INSERT INTO `oes_paper_info` VALUES ('5', 'JAVAWeb项目开发', '2018-06-15 23:12:09', '100', '1');
INSERT INTO `oes_paper_info` VALUES ('6', 'C编程基础', '2018-06-08 23:13:19', '50', '2');
INSERT INTO `oes_paper_info` VALUES ('7', 'JAVA进阶训练(一)', '2018-06-08 00:08:54', '50', '1');
INSERT INTO `oes_paper_info` VALUES ('8', 'JAVA进阶训练(二)', '2018-05-29 00:09:36', '40', '1');
INSERT INTO `oes_paper_info` VALUES ('9', 'JAVA注解应用', '2018-06-12 00:11:10', '70', '1');
INSERT INTO `oes_paper_info` VALUES ('10', 'Logo编程基础(一)', '2018-06-07 00:11:55', '50', '12');
INSERT INTO `oes_paper_info` VALUES ('11', 'Logo编程基础(二)', '2018-06-08 00:13:33', '100', '12');
INSERT INTO `oes_paper_info` VALUES ('12', 'Logo编程基础(三)', '2018-06-17 00:13:53', '80', '12');
INSERT INTO `oes_paper_info` VALUES ('13', 'Logo绘图(一)', '2018-06-14 00:14:23', '60', '12');
INSERT INTO `oes_paper_info` VALUES ('14', 'Logo绘图(二)', '2018-06-21 00:14:49', '40', '12');
INSERT INTO `oes_paper_info` VALUES ('15', 'Basic编程基础(一)', '2018-06-14 00:15:32', '50', '6');
INSERT INTO `oes_paper_info` VALUES ('16', 'Basic编程基础(一)', '2018-06-14 00:15:49', '100', '6');
INSERT INTO `oes_paper_info` VALUES ('17', 'Basic进阶训练(一)', '2018-06-14 00:17:14', '80', '6');
INSERT INTO `oes_paper_info` VALUES ('18', 'Basic进阶训练(二)', '2018-06-14 00:17:28', '80', '6');
INSERT INTO `oes_paper_info` VALUES ('19', 'Basic进阶训练(三)', '2018-06-22 00:18:07', '100', '6');
INSERT INTO `oes_paper_info` VALUES ('20', 'C语法基础', '2018-06-14 00:19:13', '50', '2');
INSERT INTO `oes_paper_info` VALUES ('21', 'C编程练习(一)', '2018-06-07 00:19:44', '30', '2');
INSERT INTO `oes_paper_info` VALUES ('23', 'C指针运用练习', '2018-06-04 00:20:35', '60', '2');
INSERT INTO `oes_paper_info` VALUES ('24', 'ACM练习(一)', '2018-06-08 00:21:31', '50', '2');
INSERT INTO `oes_paper_info` VALUES ('25', 'ACM练习(二)', '2018-06-13 00:21:43', '100', '2');
INSERT INTO `oes_paper_info` VALUES ('26', 'Web基础练习(一)', '2018-06-20 00:22:15', '50', '3');
INSERT INTO `oes_paper_info` VALUES ('27', 'Web基础练习(二)', '2018-06-05 00:22:32', '50', '3');
INSERT INTO `oes_paper_info` VALUES ('28', 'Web基础练习(三)', '2018-06-05 00:22:45', '100', '3');
INSERT INTO `oes_paper_info` VALUES ('29', 'Web基础练习(四)', '2018-06-07 00:22:59', '80', '3');
INSERT INTO `oes_paper_info` VALUES ('30', 'PHP语法练习(一)', '2018-06-03 00:23:28', '50', '4');
INSERT INTO `oes_paper_info` VALUES ('31', 'PHP语法练习(二)', '2018-06-03 00:23:45', '80', '4');
INSERT INTO `oes_paper_info` VALUES ('32', 'PHP数据库连接练习', '2018-06-01 00:24:08', '60', '4');
INSERT INTO `oes_paper_info` VALUES ('33', 'PHP基础练习(一)', '2018-06-17 00:24:53', '120', '4');
INSERT INTO `oes_paper_info` VALUES ('34', 'PHP基础练习(二)', '2018-06-14 00:25:09', '80', '4');

-- ----------------------------
-- Table structure for `oes_paper_que`
-- ----------------------------
DROP TABLE IF EXISTS `oes_paper_que`;
CREATE TABLE `oes_paper_que` (
  `que_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `que_name` varchar(255) DEFAULT NULL COMMENT '问题标题',
  `que_type` varchar(20) DEFAULT NULL COMMENT '问题类型',
  `que_creation_time` datetime DEFAULT NULL COMMENT '问题创建时间',
  `que_answer_code` bigint(20) DEFAULT NULL COMMENT '答案编码为正确答案的ASCII码相加之和',
  `que_grade` int(11) DEFAULT NULL COMMENT '问题考试分数',
  `paper_id` int(11) DEFAULT NULL COMMENT '试卷信息表ID',
  PRIMARY KEY (`que_id`),
  KEY `paper_id` (`paper_id`) USING BTREE,
  CONSTRAINT `que_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `oes_paper_info` (`paper_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oes_paper_que
-- ----------------------------
INSERT INTO `oes_paper_que` VALUES ('1', '关于sleep()和wait()，以下描述错误的一项是（ ）', 'radio', '2018-06-14 13:38:55', '52', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('2', '下面哪个可以改变容器的布局？（ ）', 'radio', '2018-06-13 13:48:15', '53', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('3', '下面哪个是applet传递参数的正确方式？（ ）', 'radio', '2018-06-14 13:52:56', '97', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('4', '提供Java存取数据库能力的包是（ ）', 'radio', '2018-06-19 13:57:00', '100', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('5', '能用来修饰interface的有（ ）', 'radio', '2018-06-19 16:32:11', '105', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('6', '如下哪些不是java的关键字？（ ）', 'radio', '2018-06-19 16:35:39', '100', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('7', '已知表达式 int m [ ] = {，1，2，3，4，5，6}；\r\n下面哪个表达式的值与数组下标量总数相等？（ ）', 'radio', '2018-06-19 16:40:23', '104', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('8', '方法resume()负责恢复哪些线程的执行（ ）', 'radio', '2018-06-19 16:40:26', '101', '3', '1');
INSERT INTO `oes_paper_que` VALUES ('9', '有关线程的哪些叙述是对的（ ）', 'checkbox', '2018-06-19 16:40:28', '312', '5', '1');
INSERT INTO `oes_paper_que` VALUES ('10', '下列说法错误的有（ ）', 'checkbox', '2018-06-19 16:40:31', '208', '5', '1');
INSERT INTO `oes_paper_que` VALUES ('11', '在代码说明//assignment x=a， y=b处写下如下哪几个代码是正确的？（ ）', 'checkbox', '2018-06-22 17:01:55', '207', '6', '2');
INSERT INTO `oes_paper_que` VALUES ('12', '关于运算符>>和>>>描述正确的是（ ）', 'radio', '2018-06-21 17:02:41', '107', '4', '2');
INSERT INTO `oes_paper_que` VALUES ('13', '选择Java语言中的基本数据类型（ ）', 'checkbox', '2018-06-21 17:03:28', '316', '6', '2');
INSERT INTO `oes_paper_que` VALUES ('14', '从下列选项中选择正确的Java表达式（ ）', 'checkbox', '2018-06-21 17:48:05', '321', '6', '2');
INSERT INTO `oes_paper_que` VALUES ('15', 'Java I/O程序设计中，下列描述正确的是（ ）', 'radio', '2018-06-21 17:48:42', '109', '4', '2');
INSERT INTO `oes_paper_que` VALUES ('18', '在HTML中，标记pre的作用是（）', 'radio', '2018-06-24 15:51:37', '103', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('19', 'HTML语言中的转行标记是（）', 'radio', '2018-06-24 16:10:08', '107', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('20', '加入一条水平线的HTML代码是（）', 'radio', '2018-06-24 17:03:49', '110', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('21', '要创建一个Email地址的链接，下面正确的句法是（）', 'radio', '2018-06-24 17:05:43', '105', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('22', '下面不是组成一个HTML文件基本结构标记的是（）', 'radio', '2018-06-24 17:08:25', '111', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('25', '在HTML中，标题字体标记<hx>中x的最大取值是（）', 'radio', '2018-06-24 17:40:03', '145', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('26', '设置页面属性包括（）', 'checkbox', '2018-06-24 17:41:22', '443', '6', '26');
INSERT INTO `oes_paper_que` VALUES ('27', 'CSS可能改变的性质有（）', 'checkbox', '2018-06-24 17:43:00', '606', '6', '26');
INSERT INTO `oes_paper_que` VALUES ('28', '可通过（）调整图层的大小', 'checkbox', '2018-06-24 17:43:16', '300', '6', '26');
INSERT INTO `oes_paper_que` VALUES ('29', '下列选项中不是插入图像的快捷键是（）', 'checkbox', '2018-06-24 17:43:40', '452', '6', '26');
INSERT INTO `oes_paper_que` VALUES ('30', '下列元素中，为行内元素的是（）', 'radio', '2018-06-24 18:33:28', '154', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('31', '下列HTML代码中，能在新窗口中打开新浪首页的是（）', 'radio', '2018-06-24 18:35:30', '150', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('32', '需要创建一个多选框，且和文本关联起来（单击文本就像单击核选框一样）。下列 HTML 代码中，正确的是', 'radio', '2018-06-24 18:36:42', '155', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('33', '下列方法中，能让网页中第5个div隐藏的是（）', 'radio', '2018-06-24 18:38:12', '149', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('34', '下列引用外部样式表 style1.css 的语句中，正确的是（）', 'radio', '2018-06-24 18:39:14', '154', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('35', '下列哪个样式定义后,行级(非块状)元素可以定义宽度和高度（）', 'radio', '2018-06-24 18:48:11', '157', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('36', '下列哪种方式是用类选择器定义样式的（）', 'radio', '2018-06-24 19:00:52', '151', '4', '26');
INSERT INTO `oes_paper_que` VALUES ('38', '下列哪些是设置有关边框的属性（）', 'checkbox', '2018-06-24 19:05:21', '459', '8', '26');
INSERT INTO `oes_paper_que` VALUES ('39', '在html文件中应用abc.css文件中的样式的方法有（）', 'checkbox', '2018-06-24 19:05:30', '307', '8', '26');
INSERT INTO `oes_paper_que` VALUES ('40', '以下JavaScript变量名不合法的有（）', 'checkbox', '2018-06-24 19:05:34', '474', '8', '26');
INSERT INTO `oes_paper_que` VALUES ('41', '测试问题', 'radio', '2018-06-27 16:22:06', '152', '6', '14');

-- ----------------------------
-- Table structure for `oes_que_answer`
-- ----------------------------
DROP TABLE IF EXISTS `oes_que_answer`;
CREATE TABLE `oes_que_answer` (
  `ans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ans_content` varchar(255) DEFAULT NULL COMMENT '答案内容',
  `ans_creation_time` datetime DEFAULT NULL COMMENT '答案创建时间',
  `que_id` int(11) DEFAULT NULL COMMENT '问题表ID',
  PRIMARY KEY (`ans_id`),
  KEY `que_id` (`que_id`) USING BTREE,
  CONSTRAINT `que_id` FOREIGN KEY (`que_id`) REFERENCES `oes_paper_que` (`que_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oes_que_answer
-- ----------------------------
INSERT INTO `oes_que_answer` VALUES ('1', 'A. sleep是线程类（Thread）的方法，wait是Object类的方法', '2018-06-14 13:49:17', '1');
INSERT INTO `oes_que_answer` VALUES ('2', 'B. sleep不释放对象锁，wait放弃对象锁', '2018-06-14 14:49:36', '1');
INSERT INTO `oes_que_answer` VALUES ('3', 'C. sleep暂停线程、但监控状态仍然保持，结束后会自动恢复', '2018-06-14 15:49:50', '1');
INSERT INTO `oes_que_answer` VALUES ('4', 'D. wait后进入等待锁定池，只有针对此对象发出notify方法后获得对象锁进入运行状态', '2018-06-15 13:50:07', '1');
INSERT INTO `oes_que_answer` VALUES ('5', 'A. setLayout(aLayoutManager', '2018-06-15 13:50:19', '2');
INSERT INTO `oes_que_answer` VALUES ('6', 'B. addLayout(aLayoutManager', '2018-06-15 13:50:51', '2');
INSERT INTO `oes_que_answer` VALUES ('7', 'C. layout(aLayoutManager', '2018-06-15 13:51:10', '2');
INSERT INTO `oes_que_answer` VALUES ('8', 'D. setLayoutManager(aLayoutManager', '2018-06-15 14:51:23', '2');
INSERT INTO `oes_que_answer` VALUES ('9', 'A. applet code=Test.class age=33 width=1 height=1', '2018-06-16 13:53:45', '3');
INSERT INTO `oes_que_answer` VALUES ('10', 'B. param name=age value=33', '2018-06-16 13:54:01', '3');
INSERT INTO `oes_que_answer` VALUES ('11', 'C. applet code=Test.class name=age value=33 width=1 height=1', '2018-06-16 13:54:33', '3');
INSERT INTO `oes_que_answer` VALUES ('12', 'D. applet Test 33', '2018-06-19 13:55:36', '3');
INSERT INTO `oes_que_answer` VALUES ('13', 'A．java.sql', '2018-06-08 16:30:52', '4');
INSERT INTO `oes_que_answer` VALUES ('14', 'B．java.awt', '2018-06-19 16:31:02', '4');
INSERT INTO `oes_que_answer` VALUES ('15', 'C．java.lang', '2018-06-19 16:31:16', '4');
INSERT INTO `oes_que_answer` VALUES ('16', 'D．java.swing', '2018-06-19 16:31:33', '4');
INSERT INTO `oes_que_answer` VALUES ('17', 'A．private', '2018-06-19 16:34:15', '5');
INSERT INTO `oes_que_answer` VALUES ('18', 'B．public', '2018-06-19 16:34:08', '5');
INSERT INTO `oes_que_answer` VALUES ('19', 'C．protected', '2018-06-19 16:34:04', '5');
INSERT INTO `oes_que_answer` VALUES ('20', 'D．static', '2018-06-19 16:34:02', '5');
INSERT INTO `oes_que_answer` VALUES ('21', 'A.const', '2018-06-19 16:37:07', '6');
INSERT INTO `oes_que_answer` VALUES ('22', 'B.NULL', '2018-06-19 16:37:20', '6');
INSERT INTO `oes_que_answer` VALUES ('23', 'C.this', '2018-06-19 16:37:18', '6');
INSERT INTO `oes_que_answer` VALUES ('24', 'D.native', '2018-06-19 16:37:15', '6');
INSERT INTO `oes_que_answer` VALUES ('25', 'A .m.length()', '2018-06-19 16:38:10', '7');
INSERT INTO `oes_que_answer` VALUES ('26', 'B.m.length', '2018-06-19 16:38:15', '7');
INSERT INTO `oes_que_answer` VALUES ('27', 'C.m.length()+1', '2018-06-19 16:38:18', '7');
INSERT INTO `oes_que_answer` VALUES ('28', 'D.m.length+1', '2018-06-19 16:38:22', '7');
INSERT INTO `oes_que_answer` VALUES ('29', 'A.通过调用stop()方法而停止的线程', '2018-06-19 16:39:23', '8');
INSERT INTO `oes_que_answer` VALUES ('30', 'B.通过调用sleep()方法而停止的线程', '2018-06-19 16:39:26', '8');
INSERT INTO `oes_que_answer` VALUES ('31', 'C.通过调用wait()方法而停止的线程', '2018-06-19 16:39:29', '8');
INSERT INTO `oes_que_answer` VALUES ('32', 'D.通过调用suspend()方法而停止的线程', '2018-06-19 16:39:32', '8');
INSERT INTO `oes_que_answer` VALUES ('33', 'A.一旦一个线程被创建，它就立即开始运行', '2018-06-19 16:39:34', '9');
INSERT INTO `oes_que_answer` VALUES ('34', 'B.使用start()方法可以使一个线程成为可运行的，但是它不一定立即开始运行', '2018-06-19 16:39:37', '9');
INSERT INTO `oes_que_answer` VALUES ('35', 'C.当一个线程因为抢先机制而停止运行，它被放在可运行队列的前面', '2018-06-19 16:39:40', '9');
INSERT INTO `oes_que_answer` VALUES ('36', 'D.一个线程可能因为不同的原因停止并进入就绪状态', '2018-06-19 16:39:42', '9');
INSERT INTO `oes_que_answer` VALUES ('37', 'A． 在类方法中可用this来调用本类的类方法', '2018-06-19 16:39:45', '10');
INSERT INTO `oes_que_answer` VALUES ('38', 'B． 在类方法中调用本类的类方法时可直接调用', '2018-06-19 16:39:48', '10');
INSERT INTO `oes_que_answer` VALUES ('39', 'C． 在类方法中只能调用本类中的类方法', '2018-06-19 16:39:51', '10');
INSERT INTO `oes_que_answer` VALUES ('40', 'D． 在类方法中绝对不能调用实例方法', '2018-06-19 16:39:54', '10');
INSERT INTO `oes_que_answer` VALUES ('41', 'A.Base(a， b)；', '2018-06-21 17:34:24', '11');
INSERT INTO `oes_que_answer` VALUES ('42', 'B.x=a， y=b；', '2018-06-21 17:35:23', '11');
INSERT INTO `oes_que_answer` VALUES ('43', 'C.x=a； y=b；', '2018-06-21 17:35:41', '11');
INSERT INTO `oes_que_answer` VALUES ('44', 'D.this(a，b)；', '2018-06-21 17:35:55', '11');
INSERT INTO `oes_que_answer` VALUES ('45', 'A.>>执行移动', '2018-06-21 17:36:47', '12');
INSERT INTO `oes_que_answer` VALUES ('46', 'B.>>执行翻转', '2018-06-21 17:37:28', '12');
INSERT INTO `oes_que_answer` VALUES ('47', 'C.>>执行有符号左移，>>>执行无符号左移', '2018-06-21 17:37:45', '12');
INSERT INTO `oes_que_answer` VALUES ('48', 'D.>>执行无符号左移，>>>执行有符号左移', '2018-06-21 17:37:59', '12');
INSERT INTO `oes_que_answer` VALUES ('49', 'A.byte', '2018-06-21 17:38:56', '13');
INSERT INTO `oes_que_answer` VALUES ('50', 'B.Integer', '2018-06-21 17:39:06', '13');
INSERT INTO `oes_que_answer` VALUES ('51', 'C.String', '2018-06-21 17:39:18', '13');
INSERT INTO `oes_que_answer` VALUES ('52', 'D.char', '2018-06-21 17:40:08', '13');
INSERT INTO `oes_que_answer` VALUES ('53', 'E.long', '2018-06-21 17:40:25', '13');
INSERT INTO `oes_que_answer` VALUES ('54', 'A.int k=new String(“aa”)', '2018-06-21 17:58:51', '14');
INSERT INTO `oes_que_answer` VALUES ('55', 'B.String str=String(“bb”)', '2018-06-21 17:58:55', '14');
INSERT INTO `oes_que_answer` VALUES ('56', 'C.char c=74;', '2018-06-21 17:59:20', '14');
INSERT INTO `oes_que_answer` VALUES ('57', 'D.long j=8888;', '2018-06-21 17:59:32', '14');
INSERT INTO `oes_que_answer` VALUES ('58', 'A. OutputStream用于写操作', '2018-06-21 18:09:07', '15');
INSERT INTO `oes_que_answer` VALUES ('59', 'B. InputStream用于写操作', '2018-06-21 18:09:10', '15');
INSERT INTO `oes_que_answer` VALUES ('60', 'C. I/O库不支持对文件可读可写API', '2018-06-21 18:09:14', '15');
INSERT INTO `oes_que_answer` VALUES ('69', 'A.标题标记', '2018-06-24 15:51:37', '18');
INSERT INTO `oes_que_answer` VALUES ('70', 'B.预排版标记', '2018-06-24 15:51:37', '18');
INSERT INTO `oes_que_answer` VALUES ('71', 'C.转行标记', '2018-06-24 15:51:37', '18');
INSERT INTO `oes_que_answer` VALUES ('72', 'D.文字效果标记', '2018-06-24 15:51:37', '18');
INSERT INTO `oes_que_answer` VALUES ('73', 'A.<html>', '2018-06-24 16:10:09', '19');
INSERT INTO `oes_que_answer` VALUES ('74', 'B.<br>', '2018-06-24 16:10:09', '19');
INSERT INTO `oes_que_answer` VALUES ('75', 'C.<title>', '2018-06-24 16:10:09', '19');
INSERT INTO `oes_que_answer` VALUES ('76', 'D.<p>', '2018-06-24 16:10:09', '19');
INSERT INTO `oes_que_answer` VALUES ('77', 'A. <hr>', '2018-06-24 17:03:49', '20');
INSERT INTO `oes_que_answer` VALUES ('78', 'B. <img src=\"name\" border=?> ', '2018-06-24 17:03:49', '20');
INSERT INTO `oes_que_answer` VALUES ('79', 'C. <img src=\"name\" align=?>', '2018-06-24 17:03:49', '20');
INSERT INTO `oes_que_answer` VALUES ('80', 'D. <img src=\"name\">', '2018-06-24 17:03:49', '20');
INSERT INTO `oes_que_answer` VALUES ('81', 'A. <a href=“mailto:mirror@263.net”>与我联系</a>', '2018-06-24 17:05:43', '21');
INSERT INTO `oes_que_answer` VALUES ('82', 'B. <a href=“files:mirror@263.net”>与我联系</a>', '2018-06-24 17:05:43', '21');
INSERT INTO `oes_que_answer` VALUES ('83', 'C. <a href=“http:mirror@263.net”>与我联系</a>', '2018-06-24 17:05:43', '21');
INSERT INTO `oes_que_answer` VALUES ('84', 'D. <a href=“usenet:mirror@263.net”>与我联系</a>', '2018-06-24 17:05:43', '21');
INSERT INTO `oes_que_answer` VALUES ('85', 'A.<HTML></HTML>', '2018-06-24 17:08:25', '22');
INSERT INTO `oes_que_answer` VALUES ('86', 'B.<HEAD></HEAD>', '2018-06-24 17:08:25', '22');
INSERT INTO `oes_que_answer` VALUES ('87', 'C.<FORM></FORM>', '2018-06-24 17:08:25', '22');
INSERT INTO `oes_que_answer` VALUES ('88', 'D.<BODY></BODY>', '2018-06-24 17:08:25', '22');
INSERT INTO `oes_que_answer` VALUES ('97', 'A.4', '2018-06-24 17:40:04', '25');
INSERT INTO `oes_que_answer` VALUES ('98', 'B.5', '2018-06-24 17:40:04', '25');
INSERT INTO `oes_que_answer` VALUES ('99', 'C.6', '2018-06-24 17:40:03', '25');
INSERT INTO `oes_que_answer` VALUES ('100', 'D.7', '2018-06-24 17:40:04', '25');
INSERT INTO `oes_que_answer` VALUES ('101', 'A. 改变页面标题', '2018-06-24 17:46:07', '26');
INSERT INTO `oes_que_answer` VALUES ('102', 'B. 段落设置', '2018-06-24 17:46:08', '26');
INSERT INTO `oes_que_answer` VALUES ('103', 'C.选择颜色', '2018-06-24 17:46:11', '26');
INSERT INTO `oes_que_answer` VALUES ('104', 'D.添加背景图案', '2018-06-24 17:46:14', '26');
INSERT INTO `oes_que_answer` VALUES ('105', 'A. 字体', '2018-06-24 17:47:08', '27');
INSERT INTO `oes_que_answer` VALUES ('106', 'B. 文字间的空间', '2018-06-24 17:47:11', '27');
INSERT INTO `oes_que_answer` VALUES ('107', 'C.列表', '2018-06-24 17:47:14', '27');
INSERT INTO `oes_que_answer` VALUES ('108', 'D. 颜色', '2018-06-24 17:47:16', '27');
INSERT INTO `oes_que_answer` VALUES ('109', 'A.手工调整', '2018-06-24 17:47:19', '28');
INSERT INTO `oes_que_answer` VALUES ('110', 'B. 属性面板', '2018-06-24 17:47:21', '28');
INSERT INTO `oes_que_answer` VALUES ('111', 'C. 控制面板', '2018-06-24 17:47:24', '28');
INSERT INTO `oes_que_answer` VALUES ('112', 'D.以上都对', '2018-06-24 17:47:27', '28');
INSERT INTO `oes_que_answer` VALUES ('113', 'A. Ctrl+ALT+A', '2018-06-24 17:47:30', '29');
INSERT INTO `oes_que_answer` VALUES ('114', 'B. Ctrl+ALT+I', '2018-06-24 17:47:34', '29');
INSERT INTO `oes_que_answer` VALUES ('115', 'C. Ctrl+ALT+L', '2018-06-24 17:47:37', '29');
INSERT INTO `oes_que_answer` VALUES ('116', 'D. Ctrl+A', '2018-06-24 17:47:39', '29');
INSERT INTO `oes_que_answer` VALUES ('117', 'A.div', '2018-06-24 18:33:28', '30');
INSERT INTO `oes_que_answer` VALUES ('118', 'B.span', '2018-06-24 18:33:28', '30');
INSERT INTO `oes_que_answer` VALUES ('119', 'C.p ', '2018-06-24 18:33:28', '30');
INSERT INTO `oes_que_answer` VALUES ('120', 'D.h3', '2018-06-24 18:33:28', '30');
INSERT INTO `oes_que_answer` VALUES ('121', 'A. <a src=\"http://www.sina.com.cn\">新浪</a> ', '2018-06-24 18:35:31', '31');
INSERT INTO `oes_que_answer` VALUES ('122', 'B. <a src=\"www.sina.com.cn\" target=\"_blank\">新浪</a>', '2018-06-24 18:35:31', '31');
INSERT INTO `oes_que_answer` VALUES ('123', 'C. <a href=\"http://www.sina.com.cn\" target=\"_blank\">新浪</a>', '2018-06-24 18:35:31', '31');
INSERT INTO `oes_que_answer` VALUES ('124', 'D. <a href=\"http://www.sina.com.cn\">新浪</a>', '2018-06-24 18:35:31', '31');
INSERT INTO `oes_que_answer` VALUES ('125', 'A.<input type=\"checkbox\" /><label>记住我</label>', '2018-06-24 18:36:42', '32');
INSERT INTO `oes_que_answer` VALUES ('126', 'B.<input type=\"checkbox\" /><label for=\"checkbox\">记住我</label>', '2018-06-24 18:36:42', '32');
INSERT INTO `oes_que_answer` VALUES ('127', 'C.<input type=\"checkbox\" id=\"c1\" /><label>记住我</label>', '2018-06-24 18:36:42', '32');
INSERT INTO `oes_que_answer` VALUES ('128', 'D.<input type=\"checkbox\" id=\"c1\" /><label for=\"c1\">记住我</label>', '2018-06-24 18:36:42', '32');
INSERT INTO `oes_que_answer` VALUES ('129', 'A.$(\"div:5th-child\").hide()', '2018-06-24 18:38:12', '33');
INSERT INTO `oes_que_answer` VALUES ('130', 'B.$(\"div:5th-child\").hidden()', '2018-06-24 18:38:12', '33');
INSERT INTO `oes_que_answer` VALUES ('131', 'C.$(\"div:nth-child(5)\").hide()', '2018-06-24 18:38:12', '33');
INSERT INTO `oes_que_answer` VALUES ('132', 'D.$(\"div:nth-child(5)\").hidden()', '2018-06-24 18:38:12', '33');
INSERT INTO `oes_que_answer` VALUES ('133', 'A.<link src=\"style1.css\" type=\"text/css\" rel=\"stylesheet\" />', '2018-06-24 18:39:14', '34');
INSERT INTO `oes_que_answer` VALUES ('134', 'B.<link href=\"style1.css\" type=\"css\"  />', '2018-06-24 18:39:14', '34');
INSERT INTO `oes_que_answer` VALUES ('135', 'C.<link src=\"style1.css\" type=\"text/css\"  />', '2018-06-24 18:39:14', '34');
INSERT INTO `oes_que_answer` VALUES ('136', 'D.<link href=\"style1.css\" type=\"text/css\" rel=\"stylesheet\" />', '2018-06-24 18:39:14', '34');
INSERT INTO `oes_que_answer` VALUES ('137', 'A. display:inline', '2018-06-24 18:48:11', '35');
INSERT INTO `oes_que_answer` VALUES ('138', 'B. display:none', '2018-06-24 18:48:11', '35');
INSERT INTO `oes_que_answer` VALUES ('139', 'C. display:block', '2018-06-24 18:48:12', '35');
INSERT INTO `oes_que_answer` VALUES ('140', 'D. display:inheric', '2018-06-24 18:48:12', '35');
INSERT INTO `oes_que_answer` VALUES ('141', 'A、p{color:red;}', '2018-06-24 19:00:52', '36');
INSERT INTO `oes_que_answer` VALUES ('142', 'B、.one{color:red;}', '2018-06-24 19:00:52', '36');
INSERT INTO `oes_que_answer` VALUES ('143', 'C、#two{color:red;}', '2018-06-24 19:00:52', '36');
INSERT INTO `oes_que_answer` VALUES ('144', 'D、p,h1{color:red;}', '2018-06-24 19:00:52', '36');
INSERT INTO `oes_que_answer` VALUES ('149', 'A、border-color', '2018-06-24 19:04:01', '38');
INSERT INTO `oes_que_answer` VALUES ('150', 'B、border-style', '2018-06-24 19:07:28', '38');
INSERT INTO `oes_que_answer` VALUES ('151', 'C、border-width', '2018-06-24 19:07:30', '38');
INSERT INTO `oes_que_answer` VALUES ('152', 'D、border-back', '2018-06-24 19:07:33', '38');
INSERT INTO `oes_que_answer` VALUES ('153', 'A、<link href=\"abc.css\" type=\"text/css\" rel=\"stylesheet\">', '2018-06-24 19:07:35', '39');
INSERT INTO `oes_que_answer` VALUES ('154', 'B、<style type=\"text/css\">@import  url(abc.css);</style>', '2018-06-24 19:07:37', '39');
INSERT INTO `oes_que_answer` VALUES ('155', 'C、<style type=\"text/css\">@import (abc.css);</style>', '2018-06-24 19:07:40', '39');
INSERT INTO `oes_que_answer` VALUES ('156', 'D、<style type=\"text/css\">import  url (abc.css);</style>', '2018-06-24 19:07:43', '39');
INSERT INTO `oes_que_answer` VALUES ('157', 'A、4Myvariable', '2018-06-24 19:07:52', '40');
INSERT INTO `oes_que_answer` VALUES ('158', 'B、My@variable', '2018-06-24 19:07:55', '40');
INSERT INTO `oes_que_answer` VALUES ('159', 'C、function', '2018-06-24 19:07:59', '40');
INSERT INTO `oes_que_answer` VALUES ('160', 'D、Myvariable4', '2018-06-24 19:08:02', '40');
INSERT INTO `oes_que_answer` VALUES ('161', 'A', '2018-06-27 16:22:06', '41');
INSERT INTO `oes_que_answer` VALUES ('162', 'B', '2018-06-27 16:22:06', '41');
INSERT INTO `oes_que_answer` VALUES ('163', 'C', '2018-06-27 16:22:06', '41');
INSERT INTO `oes_que_answer` VALUES ('164', 'D', '2018-06-27 16:22:06', '41');

-- ----------------------------
-- Table structure for `oes_student_info`
-- ----------------------------
DROP TABLE IF EXISTS `oes_student_info`;
CREATE TABLE `oes_student_info` (
  `sno` char(12) NOT NULL COMMENT '主键，学生学号',
  `student_psw` varchar(20) DEFAULT NULL COMMENT '登录密码',
  `student_name` varchar(25) DEFAULT NULL COMMENT '学生真实姓名',
  `student_email` varchar(25) DEFAULT NULL COMMENT '学生邮箱',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oes_student_info
-- ----------------------------
INSERT INTO `oes_student_info` VALUES ('201521314001', '123456', '詹姆斯', '000000@qq.com');
INSERT INTO `oes_student_info` VALUES ('201521314002', '123456', '库里', '123@163.com');
INSERT INTO `oes_student_info` VALUES ('201521314330', '123456', 'sss', '82268991@qq.com');
INSERT INTO `oes_student_info` VALUES ('201521314345', '123456', 'bbb', '123498760@qq.com');
INSERT INTO `oes_student_info` VALUES ('201521314354', '123456', '453', '523543@qq.com');
INSERT INTO `oes_student_info` VALUES ('201521314360', '123456', '123', '123456@qq.com');
INSERT INTO `oes_student_info` VALUES ('201521314389', '123456', '夏天', '1234@qq.com');
INSERT INTO `oes_student_info` VALUES ('201521314555', '123456', '小明', '123@qq.com');

-- ----------------------------
-- Table structure for `oes_sub_info`
-- ----------------------------
DROP TABLE IF EXISTS `oes_sub_info`;
CREATE TABLE `oes_sub_info` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sub_name` varchar(64) DEFAULT NULL COMMENT '科目名称',
  `sub_creation_time` datetime DEFAULT NULL COMMENT '科目创建时间',
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oes_sub_info
-- ----------------------------
INSERT INTO `oes_sub_info` VALUES ('1', 'JAVA', '2018-06-10 15:59:43');
INSERT INTO `oes_sub_info` VALUES ('2', 'C', '2018-06-13 19:26:51');
INSERT INTO `oes_sub_info` VALUES ('3', 'Web', '2018-06-12 17:59:43');
INSERT INTO `oes_sub_info` VALUES ('4', 'PHP', '2018-06-22 00:26:45');
INSERT INTO `oes_sub_info` VALUES ('5', '.NET', '2018-06-14 19:59:43');
INSERT INTO `oes_sub_info` VALUES ('6', 'Basic', '2018-06-22 00:38:58');
INSERT INTO `oes_sub_info` VALUES ('7', 'python', '2018-06-22 00:39:41');
INSERT INTO `oes_sub_info` VALUES ('8', 'JavaScript', '2018-06-16 20:17:50');
INSERT INTO `oes_sub_info` VALUES ('9', 'Ruby', '2018-06-17 20:18:09');
INSERT INTO `oes_sub_info` VALUES ('10', 'Delphi', '2018-06-18 17:18:34');
INSERT INTO `oes_sub_info` VALUES ('11', 'SAS', '2018-06-19 20:19:56');
INSERT INTO `oes_sub_info` VALUES ('12', 'Logo', '2018-06-15 14:45:06');
INSERT INTO `oes_sub_info` VALUES ('15', '111', '2018-06-22 00:48:00');
INSERT INTO `oes_sub_info` VALUES ('22', '222', '2018-06-22 01:09:00');
INSERT INTO `oes_sub_info` VALUES ('23', '333', '2018-06-22 01:16:25');
INSERT INTO `oes_sub_info` VALUES ('24', '444', '2018-06-22 01:17:07');
INSERT INTO `oes_sub_info` VALUES ('25', '555', '2018-06-22 01:30:26');
INSERT INTO `oes_sub_info` VALUES ('37', '666', '2018-06-24 13:40:48');

-- ----------------------------
-- Table structure for `oes_teacher_info`
-- ----------------------------
DROP TABLE IF EXISTS `oes_teacher_info`;
CREATE TABLE `oes_teacher_info` (
  `tno` char(6) NOT NULL,
  `teacher_psw` varchar(20) DEFAULT NULL,
  `teacher_name` varchar(25) DEFAULT NULL,
  `teacher_email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oes_teacher_info
-- ----------------------------
INSERT INTO `oes_teacher_info` VALUES ('100000', '123456', '侯老师', '10000000@qq.com');
INSERT INTO `oes_teacher_info` VALUES ('100001', '123456', '吴老师', '10000001@qq.com');
INSERT INTO `oes_teacher_info` VALUES ('100002', '123456', '杨老师', '10000002@qq.com');
INSERT INTO `oes_teacher_info` VALUES ('100003', '123456', '庄老师', '10000003@qq.com');
INSERT INTO `oes_teacher_info` VALUES ('100004', '123456', '张老师', '10000004@qq.com');
