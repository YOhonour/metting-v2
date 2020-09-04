/*
 Navicat Premium Data Transfer

 Source Server         : 39.108.158.74_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 39.108.158.74:3306
 Source Schema         : meeting_v2

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 05/09/2020 00:14:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for guest
-- ----------------------------
DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest`  (
  `guestid` int(11) NOT NULL AUTO_INCREMENT COMMENT '嘉宾id',
  `meetingid` int(11) NOT NULL COMMENT '对应的会议id',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '嘉宾图片地址',
  `introduction` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '嘉宾简介',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`guestid`, `meetingid`) USING BTREE,
  INDEX `g1`(`meetingid`) USING BTREE,
  CONSTRAINT `g1` FOREIGN KEY (`meetingid`) REFERENCES `meeting` (`meetingid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guest
-- ----------------------------
INSERT INTO `guest` VALUES (12, 91, 'eef3d48c-5d5e-4fe3-ada2-cb792cd39301.png', 'sdfda', 'dsa');
INSERT INTO `guest` VALUES (13, 102, 'cb54f0a0-4940-4f30-bcc5-3d1bffbbc265.png', '测试', '测试');
INSERT INTO `guest` VALUES (14, 108, '7a48ab6d-fc4b-4807-912c-646c6aa0b821.png', '嘉宾介绍', '嘉宾');

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`  (
  `meetingid` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会议名称',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地点',
  `start_time` timestamp(6) NULL DEFAULT NULL COMMENT '开始时间',
  `close_time` timestamp(6) NULL DEFAULT NULL COMMENT '结束时间',
  `introduction` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介信息',
  `schedule` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程信息',
  `needvolunteer` int(1) NULL DEFAULT NULL COMMENT '是否需要志愿者，0不需要、1需要',
  `typeid` int(8) NULL DEFAULT NULL COMMENT '会议类型的id，为meetingtype的主键',
  `organizer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主办单位',
  `hostedby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '承办单位',
  `communicate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主办方联系方式',
  PRIMARY KEY (`meetingid`) USING BTREE,
  INDEX `typeid`(`typeid`) USING BTREE,
  CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`typeid`) REFERENCES `meetingtype` (`typeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES (1, 'cccc', 'dddd', '2019-12-21 22:11:03.000000', '2019-12-28 19:01:00.000000', 'fdfdfdfd', 'fffff', 0, 1, NULL, NULL, '123123123');
INSERT INTO `meeting` VALUES (37, '测试', '第三教学楼', '2019-12-21 16:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 0, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (38, '测试', '第三教学楼', '2019-12-21 16:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (39, '测试', '逸夫楼', '2019-12-25 16:00:00.000000', '2019-12-23 16:00:00.000000', '测试', NULL, 0, 4, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (40, '测试', '测试', '2019-12-27 16:00:00.000000', '2019-12-23 16:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (41, '测试', '测试', '2019-12-23 00:00:00.000000', '2019-12-25 16:00:00.000000', '测试', '测试', 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (42, '测试', '测试', '2019-12-24 16:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 4, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (43, '测试', '测试', '2019-12-16 16:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (44, '测试', '测试', '2019-12-17 16:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (45, '测试', '测试', '2019-12-22 00:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 4, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (46, '测试', '测试', '2019-12-22 00:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (47, '测试', '测试', '2019-12-22 00:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 2, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (48, '测试', '测试', '2019-12-22 00:00:00.000000', '2019-12-24 16:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (49, '测试', '测试', '2019-12-24 00:00:00.000000', '2019-12-26 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (50, '测试', '测试', '2019-12-24 00:00:00.000000', '2019-12-26 00:00:00.000000', '测试', NULL, 0, 4, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (55, '志愿信息测试', '测试', '2019-12-24 00:00:00.000000', '2019-12-27 00:00:00.000000', '测试', NULL, 0, 3, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (88, '测试', '测试', '2019-12-25 00:00:00.000000', '2019-12-27 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (89, '测试', '测试', '2019-12-25 00:00:00.000000', '2019-12-27 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (90, '测试', '测试', '2019-12-25 00:00:00.000000', '2019-12-27 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (91, '159', 'yifu', '2019-12-28 00:00:00.000000', '2019-12-29 00:00:00.000000', 'werfxs', NULL, 0, 1, '159', '159', '155');
INSERT INTO `meeting` VALUES (92, 'ddd', 'wed', '2019-12-26 00:00:00.000000', '2019-12-26 00:00:00.000000', 'ddss', 'ssss', 0, 1, '123', '123', '447');
INSERT INTO `meeting` VALUES (93, '重庆邮电大学通信与信息工程学院YF107', '三教', '2019-12-26 00:00:00.000000', '2019-12-29 00:00:00.000000', '555555555555', '111111111111', 0, 3, '通信学院', '通信学院', '15086924104');
INSERT INTO `meeting` VALUES (94, 'se', 'yf107', '2019-12-30 00:00:00.000000', '2019-12-31 00:00:00.000000', '非常好', '8:30进入会场', 0, 4, 'cqput', 'tongxin', '18323221800');
INSERT INTO `meeting` VALUES (95, '开发者大会', '重邮', '2019-12-26 00:00:00.000000', '2019-12-27 00:00:00.000000', '这是一次测试', '测试', 0, 2, '重邮', '重邮', '123456');
INSERT INTO `meeting` VALUES (96, '犹豫，就会败北', '韦名', '2019-12-26 00:00:00.000000', '2019-12-29 00:00:00.000000', '败义父，斗剑圣', NULL, 0, 3, '韦名', '韦名', '123456');
INSERT INTO `meeting` VALUES (97, '测试', '测试', '2019-12-26 00:00:00.000000', '2019-12-28 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (98, '测试', '测试', '2019-12-26 00:00:00.000000', '2019-12-26 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (99, '测试', '按时', '2019-12-26 00:00:00.000000', '2019-12-28 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (100, '测试', '按时', '2019-12-26 00:00:00.000000', '2019-12-28 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (101, '测试', '测试', '2019-12-26 00:00:00.000000', '2019-12-28 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (102, '测试', '测试', '2020-01-10 00:00:00.000000', '2020-01-13 00:00:00.000000', '测试', NULL, 0, 3, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (103, '测试', '测试', '2020-01-10 00:00:00.000000', '2020-01-13 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (104, '测试', '测试', '2020-01-10 00:00:00.000000', '2020-01-13 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (105, '测试', '测试', '2020-01-10 00:00:00.000000', '2020-01-13 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (106, '测试', '测试', '2020-01-12 00:00:00.000000', '2020-01-13 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (107, '测试', '测试', '2020-01-11 00:00:00.000000', '2020-01-12 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (108, '测试', '测试', '2020-01-13 00:00:00.000000', '2020-01-14 00:00:00.000000', '测试', NULL, 0, 1, NULL, NULL, '123456');
INSERT INTO `meeting` VALUES (109, '第一次会议', '第三教学楼', '2019-12-22 00:00:00.000000', NULL, 'huijianjiena', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (110, 'asdasd', '测试地点', NULL, NULL, 'sddsfsdf', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (111, '第一次会议', '第三教学楼', '2019-12-22 00:00:00.000000', NULL, 'huijianjiena', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (112, 'asdasd', '测试地点', NULL, NULL, 'sddsfsdf', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (113, '第一次会议', '第三教学楼', '2019-12-22 00:00:00.000000', NULL, 'huijianjiena', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (114, '第一次会议', '第三教学楼', '2019-12-22 00:00:00.000000', NULL, 'huijianjiena', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (115, '第一次会议', '第三教学楼', '2019-12-22 00:00:00.000000', NULL, 'huijianjiena', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (116, '啊撒撒是的', '啊撒撒是的', NULL, NULL, '啊撒十大撒多少', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (117, '', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (118, 'zao测试', '', '2012-12-12 00:00:00.000000', NULL, '爱上大叔大叔大叔', '啊撒盛大速度', NULL, NULL, 'zao', NULL, '12312323');
INSERT INTO `meeting` VALUES (119, '', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (120, '', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (121, 'zasdasasdasd', 'asdasdas', '2020-12-22 00:00:00.000000', NULL, 'asdasdasd', 'asdasdasd', NULL, NULL, 'asdasd', NULL, '15002320582');
INSERT INTO `meeting` VALUES (122, 'asdasd', '测试地点', NULL, NULL, 'sddsfsdf', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (123, 'asdasd', '测试地点', NULL, NULL, 'sddsfsdf', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (124, 'asdasd', '测试地点', NULL, NULL, 'sddsfsdf', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (125, 'asdasd', '测试地点', NULL, NULL, 'sddsfsdf', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (126, 'asdasd', '测试地点', NULL, NULL, 'sddsfsdf', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `meeting` VALUES (127, '', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (128, '啊实打实的', '阿斯顿', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (129, '啊实打实的', '阿斯顿', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (130, '最新测试', '重庆邮电大学', '2020-04-16 00:00:00.000000', NULL, '无', '无', NULL, NULL, 'zao', NULL, '15002320582');
INSERT INTO `meeting` VALUES (131, '爱上大叔大叔大叔', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (132, '蓝桥杯', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (133, '蓝桥杯', '', '2020-04-29 00:00:00.000000', NULL, 'asd', '', 12, NULL, '', NULL, '');
INSERT INTO `meeting` VALUES (134, 'acm', '', '2020-04-23 00:00:00.000000', NULL, '阿桑大事大', 'asdasdasd', 12, 5, '奥迪', NULL, '1500000000');
INSERT INTO `meeting` VALUES (135, 'acm', '', NULL, NULL, '', '', NULL, 6, '', NULL, '');
INSERT INTO `meeting` VALUES (136, 'acm竞赛', '', '2020-04-29 00:00:00.000000', NULL, '爱上大叔大叔', '大苏打速度', 123, 6, 'asd', NULL, '151515115');
INSERT INTO `meeting` VALUES (137, '', '', NULL, NULL, '', '', NULL, 5, '', NULL, '');
INSERT INTO `meeting` VALUES (138, 'sadasdasd', 'asd', '2020-04-09 00:00:00.000000', NULL, 'asdasd', '', NULL, 5, '', NULL, '');
INSERT INTO `meeting` VALUES (139, 'asdasd', 'asd', '2020-04-08 00:00:00.000000', NULL, 'ads', '', NULL, 6, '', NULL, '');
INSERT INTO `meeting` VALUES (140, '测试', '重庆', '2020-05-14 00:00:00.000000', '2020-05-14 00:00:00.000000', '暂无', '无', 12, 6, 'zao', NULL, '11111111');
INSERT INTO `meeting` VALUES (141, '啊啊啊', 'aaaaaa', '2020-05-06 00:00:00.000000', '2020-05-14 00:00:00.000000', 'asdasd', 'asdasd', 10, 6, 'asd', NULL, '1515151');
INSERT INTO `meeting` VALUES (142, '啊啊啊asdasd', 'aaaaaa', '2020-05-05 00:00:00.000000', '2020-05-14 00:00:00.000000', 'asdasd', 'asdasd', 10, 6, 'asd', NULL, '1515151');
INSERT INTO `meeting` VALUES (143, 'asd', 'asdasd', '2020-06-10 00:00:00.000000', '2020-06-10 00:00:00.000000', 'asdasd', 'asdasd', 12, 6, 'asd', NULL, 'asd');
INSERT INTO `meeting` VALUES (144, 'asd', 'asdasd', '2020-06-10 00:00:00.000000', '2020-06-10 00:00:00.000000', 'asdasd', 'asdasd', 12, 6, 'asd', NULL, 'asd');
INSERT INTO `meeting` VALUES (145, 'asd', 'asd', '2020-06-11 00:00:00.000000', '2020-06-19 00:00:00.000000', 'sad', '', NULL, 6, '', NULL, '');
INSERT INTO `meeting` VALUES (146, 'asd', 'asd', '2020-06-11 00:00:00.000000', '2020-06-19 00:00:00.000000', 'sad', '', NULL, 6, '', NULL, '');
INSERT INTO `meeting` VALUES (147, 'asd', 'asd', '2020-06-11 00:00:00.000000', '2020-06-19 00:00:00.000000', 'sad', '', NULL, 6, '', NULL, '');
INSERT INTO `meeting` VALUES (148, 'asd', 'asd', '2020-06-11 00:00:00.000000', '2020-06-19 00:00:00.000000', 'sad', '', NULL, 6, '', NULL, '');
INSERT INTO `meeting` VALUES (149, '132123', 'sadasd', '2020-06-18 00:00:00.000000', NULL, 'asdasd', 'asdasdasd', NULL, 5, 'asd', NULL, 'asd');
INSERT INTO `meeting` VALUES (150, 'asdasd', 'asd', '2020-06-11 00:00:00.000000', NULL, 'asdasd', 'asd', NULL, 5, 'asda', NULL, 'asd');

-- ----------------------------
-- Table structure for meetingfile
-- ----------------------------
DROP TABLE IF EXISTS `meetingfile`;
CREATE TABLE `meetingfile`  (
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  `meetingid` int(11) NOT NULL COMMENT '会议id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  PRIMARY KEY (`fileid`) USING BTREE,
  INDEX `mf1`(`meetingid`) USING BTREE,
  CONSTRAINT `mf1` FOREIGN KEY (`meetingid`) REFERENCES `meeting` (`meetingid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meetingfile
-- ----------------------------
INSERT INTO `meetingfile` VALUES (7, 1, 'E:\\MavenDemo\\metting-v1\\meetingFile\\1\\第6章总结.png', '第6章总结.png');
INSERT INTO `meetingfile` VALUES (8, 1, 'E:\\MavenDemo\\metting-v1\\meetingFile\\1\\第6章总结.png', '第6章总结.png');
INSERT INTO `meetingfile` VALUES (12, 88, 'E:\\MavenDemo\\metting-v1\\meetingFile\\88\\重邮 移动互联网应用工程研究中心会议纪要[2018.12.21].pdf', '重邮 移动互联网应用工程研究中心会议纪要[2018.12.21].pdf');
INSERT INTO `meetingfile` VALUES (13, 91, 'E:\\MavenDemo\\metting-v1\\meetingFile\\91\\重邮 移动互联网应用工程研究中心会议纪要[2018.12.21].pdf', '重邮 移动互联网应用工程研究中心会议纪要[2018.12.21].pdf');
INSERT INTO `meetingfile` VALUES (14, 93, '/usr/local/MeetingFile/93/header.jpg', 'header.jpg');
INSERT INTO `meetingfile` VALUES (15, 1, '/usr/local/MeetingFile/1/245484 (2).jpg', '245484 (2).jpg');
INSERT INTO `meetingfile` VALUES (16, 1, '/usr/local/MeetingFile/1/245484.jpg', '245484.jpg');
INSERT INTO `meetingfile` VALUES (17, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (18, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (19, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (20, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (21, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (22, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (23, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (24, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (25, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (26, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (27, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (28, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (29, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (30, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (31, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (32, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (33, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (34, 1, '/usr/local/MeetingFile/1/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (35, 121, '/usr/local/MeetingFile/121/245484 (2).jpg', '245484 (2).jpg');
INSERT INTO `meetingfile` VALUES (36, 121, '/usr/local/MeetingFile/121/224724.png', '224724.png');
INSERT INTO `meetingfile` VALUES (37, 121, '/usr/local/MeetingFile/121/245484.jpg', '245484.jpg');
INSERT INTO `meetingfile` VALUES (38, 118, '/usr/local/MeetingFile/118/自我介绍.md', '自我介绍.md');
INSERT INTO `meetingfile` VALUES (39, 118, '/usr/local/MeetingFile/118/389474.jpg', '389474.jpg');
INSERT INTO `meetingfile` VALUES (40, 121, '/usr/local/MeetingFile/121/404.jpg', '404.jpg');
INSERT INTO `meetingfile` VALUES (41, 137, '/usr/local/MeetingFile/137/我的会议-住宿安排-导入资源.png', '我的会议-住宿安排-导入资源.png');
INSERT INTO `meetingfile` VALUES (42, 140, '/usr/local/MeetingFile/140/baidu.png', 'baidu.png');
INSERT INTO `meetingfile` VALUES (43, 140, '/usr/local/MeetingFile/140/baidu.png', 'baidu.png');
INSERT INTO `meetingfile` VALUES (44, 140, '/usr/local/MeetingFile/140/bing.png', 'bing.png');
INSERT INTO `meetingfile` VALUES (45, 140, '/usr/local/MeetingFile/140/duckduckgo.png', 'duckduckgo.png');
INSERT INTO `meetingfile` VALUES (46, 140, '/usr/local/MeetingFile/140/baidu.png', 'baidu.png');

-- ----------------------------
-- Table structure for meetingtask
-- ----------------------------
DROP TABLE IF EXISTS `meetingtask`;
CREATE TABLE `meetingtask`  (
  `id` int(11) NOT NULL,
  `meetingid` int(11) NULL DEFAULT NULL COMMENT '会议Id',
  `taskid` int(11) NULL DEFAULT NULL COMMENT '工作ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mt1`(`meetingid`) USING BTREE,
  CONSTRAINT `mt1` FOREIGN KEY (`meetingid`) REFERENCES `meeting` (`meetingid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for meetingtype
-- ----------------------------
DROP TABLE IF EXISTS `meetingtype`;
CREATE TABLE `meetingtype`  (
  `typeid` int(8) NOT NULL AUTO_INCREMENT COMMENT '会议分类id',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会议分类，具体描述',
  PRIMARY KEY (`typeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meetingtype
-- ----------------------------
INSERT INTO `meetingtype` VALUES (0, '未知类型');
INSERT INTO `meetingtype` VALUES (1, '学术');
INSERT INTO `meetingtype` VALUES (2, '分享');
INSERT INTO `meetingtype` VALUES (3, '文艺');
INSERT INTO `meetingtype` VALUES (4, '招聘');
INSERT INTO `meetingtype` VALUES (5, '科研团队');
INSERT INTO `meetingtype` VALUES (6, '学生组队');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `sendfrom` int(16) NULL DEFAULT 0 COMMENT '发送方id，默认为系统id 0',
  `sendto` int(16) NOT NULL COMMENT '接收方用户id',
  `isread` int(2) NULL DEFAULT -1 COMMENT '是否已读，-1未读、1已读',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容',
  PRIMARY KEY (`msgid`) USING BTREE,
  INDEX `m1`(`sendto`) USING BTREE,
  CONSTRAINT `m1` FOREIGN KEY (`sendto`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (5, 0, 17, -1, '[来自 测试 主办方的信息]：你好！type5');
INSERT INTO `message` VALUES (6, 0, 17, -1, '[来自 测试 主办方的信息]：你好！type5');
INSERT INTO `message` VALUES (7, 0, 17, -1, '[来自 测试 主办方的信息]：本次会议如期举行，请收到回消息');
INSERT INTO `message` VALUES (8, 0, 17, -1, '[来自 测试 主办方的信息]：本次会议测试时，请收到回消息');
INSERT INTO `message` VALUES (9, 0, 17, -1, '[来自 测试 主办方的信息]：本次会议测试时，请收到回消息');
INSERT INTO `message` VALUES (10, 0, 2, -1, '[来自 测试 主办方的信息]：段爱心短信测试测试');
INSERT INTO `message` VALUES (11, 0, 17, -1, '[来自 测试 主办方的信息]：段爱心短信测试测试1212');
INSERT INTO `message` VALUES (12, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试消息测试');
INSERT INTO `message` VALUES (13, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试消息测试');
INSERT INTO `message` VALUES (14, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试消息测试服务器测试消息');
INSERT INTO `message` VALUES (15, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试消息测试本地测试消息');
INSERT INTO `message` VALUES (16, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试消息测试本地测试消息2');
INSERT INTO `message` VALUES (17, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试1111111111111111');
INSERT INTO `message` VALUES (18, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试消息测试本地22222222222222222222消息2');
INSERT INTO `message` VALUES (19, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试88888');
INSERT INTO `message` VALUES (20, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试444444');
INSERT INTO `message` VALUES (21, 0, 2, -1, '[来自 测试 主办方的信息]：消息测试212112321地方政府士大夫');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `gender` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `emailaddr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件地址',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织名，比如:“重庆邮电大学”',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `constraint_unique`(`phone`, `emailaddr`) USING BTREE,
  UNIQUE INDEX `emailaddr`(`emailaddr`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '林进波', '波波', '男', '123@qq.cpom', '123', '重邮', '1.jpg', '123');
INSERT INTO `user` VALUES (2, '吕进豪', 'lvlvlvlv', '男', '3032155055@qq.com', '15683487907', NULL, NULL, '1212121121');
INSERT INTO `user` VALUES (17, '吕进豪', 'L J H', '男', '1083775096@qq.com', '15086924104', '重邮', '4a84a2dc-ad96-4ccf-a605-4e5624235495.png', '123456');
INSERT INTO `user` VALUES (20, NULL, 'Lurker', '男', '15540922270@163.com', '15540922270', NULL, NULL, '123456');
INSERT INTO `user` VALUES (21, NULL, 'Lurker', '男', '15310610871@163.com', '15310610871', NULL, NULL, '123456');
INSERT INTO `user` VALUES (22, NULL, '121', NULL, NULL, '13658361535', NULL, NULL, '123456');
INSERT INTO `user` VALUES (24, NULL, 'hu', NULL, NULL, '18323221800', NULL, NULL, '123456');
INSERT INTO `user` VALUES (25, NULL, '邓书慧', NULL, NULL, '18225189933', NULL, NULL, '159357');
INSERT INTO `user` VALUES (27, NULL, '韩bobo', NULL, NULL, '15823489504', NULL, NULL, '13638308789?');
INSERT INTO `user` VALUES (28, NULL, 'zao2', '男', '10642160641@qq.com', '15002320582', NULL, NULL, '123456789');
INSERT INTO `user` VALUES (36, NULL, 'lyl', '女', '619281245@qq.com', '15123928465', NULL, NULL, '123456789');

-- ----------------------------
-- Table structure for user_meeting
-- ----------------------------
DROP TABLE IF EXISTS `user_meeting`;
CREATE TABLE `user_meeting`  (
  `userid` int(11) NOT NULL,
  `meetingid` int(11) NOT NULL,
  `type` tinyint(3) NOT NULL COMMENT '类型：1 创建的会议；2 参加的会议；3 收藏的会议 ；4  志愿者申请中 ；5 志愿者； 6 申请志愿者失败',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `um1`(`userid`) USING BTREE,
  INDEX `um2`(`meetingid`) USING BTREE,
  CONSTRAINT `um1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `um2` FOREIGN KEY (`meetingid`) REFERENCES `meeting` (`meetingid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 359 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_meeting
-- ----------------------------
INSERT INTO `user_meeting` VALUES (17, 111, 1, 209);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 214);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 215);
INSERT INTO `user_meeting` VALUES (17, 48, 2, 216);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 218);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 219);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 220);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 221);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 222);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 223);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 226);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 227);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 228);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 229);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 231);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 232);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 233);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 234);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 235);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 237);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 238);
INSERT INTO `user_meeting` VALUES (17, 37, 2, 239);
INSERT INTO `user_meeting` VALUES (17, 113, 1, 241);
INSERT INTO `user_meeting` VALUES (17, 114, 1, 242);
INSERT INTO `user_meeting` VALUES (17, 115, 1, 243);
INSERT INTO `user_meeting` VALUES (17, 116, 1, 244);
INSERT INTO `user_meeting` VALUES (17, 117, 1, 245);
INSERT INTO `user_meeting` VALUES (17, 118, 1, 246);
INSERT INTO `user_meeting` VALUES (17, 119, 1, 247);
INSERT INTO `user_meeting` VALUES (17, 120, 1, 248);
INSERT INTO `user_meeting` VALUES (17, 121, 1, 252);
INSERT INTO `user_meeting` VALUES (17, 108, 2, 253);
INSERT INTO `user_meeting` VALUES (17, 108, 3, 254);
INSERT INTO `user_meeting` VALUES (17, 108, 2, 257);
INSERT INTO `user_meeting` VALUES (17, 108, 2, 258);
INSERT INTO `user_meeting` VALUES (17, 108, 3, 259);
INSERT INTO `user_meeting` VALUES (17, 108, 3, 263);
INSERT INTO `user_meeting` VALUES (17, 108, 3, 264);
INSERT INTO `user_meeting` VALUES (17, 118, 2, 265);
INSERT INTO `user_meeting` VALUES (17, 127, 1, 269);
INSERT INTO `user_meeting` VALUES (17, 121, 3, 272);
INSERT INTO `user_meeting` VALUES (17, 128, 1, 273);
INSERT INTO `user_meeting` VALUES (17, 129, 1, 274);
INSERT INTO `user_meeting` VALUES (17, 130, 1, 275);
INSERT INTO `user_meeting` VALUES (17, 131, 1, 276);
INSERT INTO `user_meeting` VALUES (17, 132, 1, 277);
INSERT INTO `user_meeting` VALUES (17, 133, 1, 278);
INSERT INTO `user_meeting` VALUES (17, 134, 1, 279);
INSERT INTO `user_meeting` VALUES (17, 135, 1, 280);
INSERT INTO `user_meeting` VALUES (17, 136, 1, 281);
INSERT INTO `user_meeting` VALUES (28, 137, 1, 288);
INSERT INTO `user_meeting` VALUES (28, 133, 2, 294);
INSERT INTO `user_meeting` VALUES (17, 1, 3, 301);
INSERT INTO `user_meeting` VALUES (17, 138, 1, 302);
INSERT INTO `user_meeting` VALUES (17, 139, 1, 303);
INSERT INTO `user_meeting` VALUES (17, 139, 2, 304);
INSERT INTO `user_meeting` VALUES (28, 137, 2, 306);
INSERT INTO `user_meeting` VALUES (28, 140, 1, 307);
INSERT INTO `user_meeting` VALUES (28, 141, 1, 308);
INSERT INTO `user_meeting` VALUES (28, 142, 1, 309);
INSERT INTO `user_meeting` VALUES (28, 121, 3, 330);
INSERT INTO `user_meeting` VALUES (28, 121, 2, 331);
INSERT INTO `user_meeting` VALUES (17, 143, 1, 332);
INSERT INTO `user_meeting` VALUES (17, 144, 1, 333);
INSERT INTO `user_meeting` VALUES (17, 145, 1, 334);
INSERT INTO `user_meeting` VALUES (17, 146, 1, 335);
INSERT INTO `user_meeting` VALUES (17, 147, 1, 336);
INSERT INTO `user_meeting` VALUES (17, 148, 1, 339);
INSERT INTO `user_meeting` VALUES (17, 145, 3, 340);
INSERT INTO `user_meeting` VALUES (17, 149, 1, 342);
INSERT INTO `user_meeting` VALUES (17, 96, 2, 348);
INSERT INTO `user_meeting` VALUES (28, 150, 1, 354);
INSERT INTO `user_meeting` VALUES (28, 149, 2, 355);
INSERT INTO `user_meeting` VALUES (28, 149, 3, 356);
INSERT INTO `user_meeting` VALUES (28, 150, 2, 357);
INSERT INTO `user_meeting` VALUES (28, 150, 3, 358);

-- ----------------------------
-- Table structure for volunt
-- ----------------------------
DROP TABLE IF EXISTS `volunt`;
CREATE TABLE `volunt`  (
  `meetid` int(11) NOT NULL COMMENT '志愿活动服务的会议编号',
  `introduction` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '志愿者要求介绍，不超过1024字',
  `number` int(11) NULL DEFAULT NULL COMMENT '需求人数',
  `isproof` int(1) NULL DEFAULT NULL COMMENT '是否提供时长证明  1提供，-1不提供',
  `full` int(3) NULL DEFAULT 1 COMMENT '是否需要停止招募，1 继续，-1 停止招募',
  PRIMARY KEY (`meetid`) USING BTREE,
  UNIQUE INDEX `meetingIdUnique`(`meetid`) USING BTREE,
  CONSTRAINT `vo1` FOREIGN KEY (`meetid`) REFERENCES `meeting` (`meetingid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for voluntask
-- ----------------------------
DROP TABLE IF EXISTS `voluntask`;
CREATE TABLE `voluntask`  (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `meetid` int(11) NOT NULL COMMENT '工作对应的会议ID',
  `taskinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作的描述',
  `workingtime` int(11) NULL DEFAULT NULL COMMENT '工作时长',
  `numbers` int(11) NULL DEFAULT NULL COMMENT '需要的志愿者人数',
  PRIMARY KEY (`taskid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voluntask
-- ----------------------------
INSERT INTO `voluntask` VALUES (-1, 75, '志愿活动', 10, 10);
INSERT INTO `voluntask` VALUES (1, 21, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (2, 21, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (3, 22, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (4, 22, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (5, 23, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (6, 23, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (7, 24, '会场管理', 8, 10);
INSERT INTO `voluntask` VALUES (8, 24, '机场迎接嘉宾', 8, 2);
INSERT INTO `voluntask` VALUES (9, 1, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (10, 1, '测试是的 的的的的', 8, 2);
INSERT INTO `voluntask` VALUES (11, 54, '测试', 8, 2);
INSERT INTO `voluntask` VALUES (12, 54, '测试', 8, 2);
INSERT INTO `voluntask` VALUES (13, 56, '志愿者一', 10, 10);
INSERT INTO `voluntask` VALUES (14, 56, '志愿二', 12, 12);
INSERT INTO `voluntask` VALUES (15, 57, '志愿者一', 10, 10);
INSERT INTO `voluntask` VALUES (16, 57, '志愿二', 12, 12);
INSERT INTO `voluntask` VALUES (17, 62, '志愿活动1', 12, 12);
INSERT INTO `voluntask` VALUES (18, 78, '测试', 12, 12);
INSERT INTO `voluntask` VALUES (19, 82, '志愿活动', 2, 1);
INSERT INTO `voluntask` VALUES (20, 83, '志愿活动一', 10, 10);
INSERT INTO `voluntask` VALUES (21, 84, '志愿活动一', 10, 10);
INSERT INTO `voluntask` VALUES (22, 88, '一', 1, 1);
INSERT INTO `voluntask` VALUES (23, 91, 'adffs', 5, 10);
INSERT INTO `voluntask` VALUES (24, 93, '引导嘉宾', 2, 5);
INSERT INTO `voluntask` VALUES (25, 93, '指导参会', 5, 5);
INSERT INTO `voluntask` VALUES (26, 96, '永真', 8, 1);

-- ----------------------------
-- Table structure for voluntinfo
-- ----------------------------
DROP TABLE IF EXISTS `voluntinfo`;
CREATE TABLE `voluntinfo`  (
  `userid` int(11) NOT NULL,
  `meetingid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL COMMENT '工作内容对应的ID',
  `studentid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `personid` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`userid`, `meetingid`, `taskid`) USING BTREE,
  INDEX `vi2`(`taskid`) USING BTREE,
  CONSTRAINT `vi1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vi2` FOREIGN KEY (`taskid`) REFERENCES `voluntask` (`taskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voluntinfo
-- ----------------------------
INSERT INTO `voluntinfo` VALUES (2, 24, 7, '2017210000', '123111111');
INSERT INTO `voluntinfo` VALUES (17, 21, 2, '2017210403', '5222661998');
INSERT INTO `voluntinfo` VALUES (17, 24, 8, '123123', '500226218651');

SET FOREIGN_KEY_CHECKS = 1;
