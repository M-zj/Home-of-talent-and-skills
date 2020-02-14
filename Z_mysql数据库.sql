/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : personnel

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2020-01-08 15:03:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告编号',
  `apicture` varchar(255) NOT NULL COMMENT '图片路径',
  `atitle` varchar(255) NOT NULL COMMENT '广告标题',
  `iid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `sidd` (`iid`),
  KEY `viddddd` (`vid`),
  CONSTRAINT `sidd` FOREIGN KEY (`iid`) REFERENCES `introduction` (`iid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `viddddd` FOREIGN KEY (`vid`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告轮播表';

-- ----------------------------
-- Records of advertisement
-- ----------------------------
INSERT INTO `advertisement` VALUES ('1', 'resource/image/advertising/advertising (1).png', '高级技工', '1', '1');
INSERT INTO `advertisement` VALUES ('2', 'resource/image/advertising/advertising (2).png', '车间技工', '2', '3');
INSERT INTO `advertisement` VALUES ('3', 'resource/image/advertising/advertising (3).png', '高级实习指导教师、技师', '6', '6');

-- ----------------------------
-- Table structure for `introduction`
-- ----------------------------
DROP TABLE IF EXISTS `introduction`;
CREATE TABLE `introduction` (
  `iid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `iname` varchar(255) NOT NULL COMMENT '姓名',
  `isex` char(255) NOT NULL COMMENT '性别',
  `iintroduction` varchar(255) NOT NULL,
  `itypename` varchar(255) NOT NULL COMMENT '简介',
  `iclick` int(11) NOT NULL COMMENT '热度',
  `iimg` varchar(255) NOT NULL COMMENT '专家照片',
  `tid` int(11) NOT NULL,
  `tpwd` varchar(255) NOT NULL,
  `tuid` varchar(255) NOT NULL,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `tuid` (`tuid`),
  KEY `tid` (`tid`),
  CONSTRAINT `tid` FOREIGN KEY (`tid`) REFERENCES `type` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='此表为专家表';

-- ----------------------------
-- Records of introduction
-- ----------------------------
INSERT INTO `introduction` VALUES ('1', '尹素明', '女', '高级职业资格', '三人行isux高级UI设计师', '36', './resource/image/expert/01.jpg', '1', '1', 'ysm');
INSERT INTO `introduction` VALUES ('2', '张永红 ', '男', '技师', '世界华人杰出管理大师之一', '66', './resource/image/expert/02.jpg', '2', '1', 'zyh');
INSERT INTO `introduction` VALUES ('3', '葛云立', '男', '讲师', '腾讯QQ会员开发总监', '40', './resource/image/expert/03.jpg', '3', '1', 'gyl');
INSERT INTO `introduction` VALUES ('4', '赵杰', '男', '高级职业资格', '腾讯公司互动娱乐事业美术副总监', '12', './resource/image/expert/04.jpg', '4', '1', 'zhaojie');
INSERT INTO `introduction` VALUES ('5', '史以非', '男', '高级职业资格', '腾讯公司互动娱乐事业美术副总监', '21', './resource/image/expert/05.jpg', '5', '1', 'syf');
INSERT INTO `introduction` VALUES ('6', '穆宝钢', '男', '技师', '腾讯公司互动娱乐事业美术副总监', '29', './resource/image/expert/06.jpg', '4', '1', 'mbg');
INSERT INTO `introduction` VALUES ('7', '张静', '女', '高级职业资格', '设计创作类目运营经理', '45', './resource/image/expert/07.jpg', '4', '1', 'zj');
INSERT INTO `introduction` VALUES ('8', '田梅', '女', '高级职业资格', '资深平面设计师', '31', './resource/image/expert/08.jpg', '4', '1', 'tm');
INSERT INTO `introduction` VALUES ('9', '冯东琴', '女', '技师', '腾讯社交网络事业在线教育高级总监', '12', './resource/image/expert/09.jpg', '4', '1', 'fdq');
INSERT INTO `introduction` VALUES ('10', '牛明', '男', '高级职业资格', '现腾讯人气FPS网络游戏《逆战》美术设计师', '56', './resource/image/expert/09.jpg', '6', '1', 'nm');
INSERT INTO `introduction` VALUES ('11', '田东东', '男', '高级职业资格', '腾讯网络媒体事业拓展中心高级总监', '69', './resource/image/expert/09.jpg', '4', '1', 'tdd');
INSERT INTO `introduction` VALUES ('12', '荆鑫', '男', '高级职业资格', '腾讯网络媒体事业拓展中心高级总监', '89', './resource/image/expert/09.jpg', '4', '1', 'xx');
INSERT INTO `introduction` VALUES ('13', '姜永平', '男', '高级实习指导教师、技师', '腾讯网络媒体事业拓展中心高级总监', '61', './resource/image/expert/09.jpg', '4', '1', 'jyp');
INSERT INTO `introduction` VALUES ('14', '陈华伟', '男', '技师', '腾讯网络媒体事业拓展中心高级总监', '12', './resource/image/expert/09.jpg', '2', '1', 'chw');
INSERT INTO `introduction` VALUES ('15', '李先东', '男', '技师', '腾讯网络媒体事业拓展中心高级总监', '13', './resource/image/expert/09.jpg', '5', '1', 'lxd');

-- ----------------------------
-- Table structure for `menuitem`
-- ----------------------------
DROP TABLE IF EXISTS `menuitem`;
CREATE TABLE `menuitem` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mtitle` varchar(255) NOT NULL,
  `murl` varchar(255) NOT NULL,
  `mhref` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menuitem
-- ----------------------------
INSERT INTO `menuitem` VALUES ('1', '视频', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576412414043&di=d5c57d4a4c58b89c0393c2039e6f5ad7&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F02%2F60%2F73%2F59fc34eb1fe02_610.jpg', 'video_column.html');
INSERT INTO `menuitem` VALUES ('2', '名师', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576412593623&di=9d50018b7d105cdf3cd6a2080a251745&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic2%2Fcover%2F00%2F32%2F40%2F5810ee9699769_610.jpg', '\r\nCelebrity_column.html');
INSERT INTO `menuitem` VALUES ('3', '更多', './resource/video/typetop/1.png', '');

-- ----------------------------
-- Table structure for `policiesandregulations`
-- ----------------------------
DROP TABLE IF EXISTS `policiesandregulations`;
CREATE TABLE `policiesandregulations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of policiesandregulations
-- ----------------------------
INSERT INTO `policiesandregulations` VALUES ('30', '《信息网络传播权保护条例》', '<ul class=\"list\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录像制作者（以下统\r\n			  称权利人）的信息网络传播权，鼓励有益于社会主义精神文明、物质文明建设\r\n			  的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称著作权法\r\n			  ），制定本条例。\r\n		  </li>\r\n		  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n<ul class=\"list\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录像制作者（以下统\r\n			  称权利人）的信息网络传播权，鼓励有益于社会主义精神文明、物质文明建设\r\n			  的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称著作权法\r\n			  ），制定本条例。\r\n		  </li>\r\n		  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n              </ul>');
INSERT INTO `policiesandregulations` VALUES ('31', '《信息网络传播权保护条例》', '<ul class=\"list\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录像制作者（以下统\r\n			  称权利人）的信息网络传播权，鼓励有益于社会主义精神文明、物质文明建设\r\n			  的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称著作权法\r\n			  ），制定本条例。\r\n		  </li>\r\n		  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n<ul class=\"list\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录像制作者（以下统\r\n			  称权利人）的信息网络传播权，鼓励有益于社会主义精神文明、物质文明建设\r\n			  的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称著作权法\r\n			  ），制定本条例。\r\n		  </li>\r\n		  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n              </ul>');
INSERT INTO `policiesandregulations` VALUES ('32', '《信息网络传播权保护条例》', '<ul class=\"list\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录像制作者（以下统\r\n			  称权利人）的信息网络传播权，鼓励有益于社会主义精神文明、物质文明建设\r\n			  的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称著作权法\r\n			  ），制定本条例。\r\n		  </li>\r\n		  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n<ul class=\"list\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录像制作者（以下统\r\n			  称权利人）的信息网络传播权，鼓励有益于社会主义精神文明、物质文明建设\r\n			  的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称著作权法\r\n			  ），制定本条例。\r\n		  </li>\r\n		  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n			  <hr style=\"border:0.5px solid #ddd\">\r\n		  <li>第一条：为保护著作权人、表演者、录音录\r\n		  像制作者（以下统称权利人）的信息网络Gainsboro传播权，鼓励有益于社会主义精神文明、\r\n		  物质文明建设的作品的创作和传播，根据《中华人民共和国著作权法》（以下简称\r\n		  著作权法），制定本条例。\r\n              </ul>');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tname` varchar(255) NOT NULL COMMENT '类型名称',
  `ticon` varchar(255) DEFAULT NULL COMMENT '类型图标路径',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='此表为类型主表';

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '美容师', './resource/video/type/Administration.png');
INSERT INTO `type` VALUES ('2', '车工', './resource/video/type/Chinese.png');
INSERT INTO `type` VALUES ('3', '数控车工', './resource/video/type/Computer.png');
INSERT INTO `type` VALUES ('4', '电工', './resource/video/type/Design.png');
INSERT INTO `type` VALUES ('5', '钳工', './resource/video/type/English.png');
INSERT INTO `type` VALUES ('6', '焊工', './resource/video/type/Law.png');

-- ----------------------------
-- Table structure for `usertable`
-- ----------------------------
DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表ID',
  `uuid` varchar(255) NOT NULL COMMENT '用户账号',
  `upwd` varchar(255) NOT NULL COMMENT '用户密码',
  `uname` varchar(255) NOT NULL COMMENT '用户姓名',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertable
-- ----------------------------
INSERT INTO `usertable` VALUES ('1', 'admin', 'admin', '山西用户');

-- ----------------------------
-- Table structure for `user_anwser`
-- ----------------------------
DROP TABLE IF EXISTS `user_anwser`;
CREATE TABLE `user_anwser` (
  `auid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户互动ID',
  `aname` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `acontent` varchar(255) NOT NULL COMMENT '用户互动内容',
  `adate` datetime NOT NULL COMMENT '用户互动时间',
  `apraise` int(11) NOT NULL COMMENT '用户互动获赞',
  `astatusid` int(11) NOT NULL COMMENT '身份ID',
  `uuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`auid`),
  KEY `userid` (`astatusid`),
  KEY `user_anwser_uuid` (`uuid`),
  CONSTRAINT `user_anwser_uuid` FOREIGN KEY (`uuid`) REFERENCES `user_interaction` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='此表为用户互动表';

-- ----------------------------
-- Records of user_anwser
-- ----------------------------
INSERT INTO `user_anwser` VALUES ('40', '普通游客', '傻逼', '2020-01-02 10:34:55', '12', '1', '28');
INSERT INTO `user_anwser` VALUES ('41', '权威专家', '我是专家，你们都是嘀嘀嘀', '2020-01-02 10:35:11', '12', '0', '28');
INSERT INTO `user_anwser` VALUES ('42', '普通游客', '该喝喝', '2020-01-02 10:38:29', '12', '1', '28');
INSERT INTO `user_anwser` VALUES ('43', '普通游客', 'wifi', '2020-01-02 12:19:46', '12', '1', '36');
INSERT INTO `user_anwser` VALUES ('44', '普通游客', '1', '2020-01-02 16:38:58', '12', '1', '37');
INSERT INTO `user_anwser` VALUES ('45', '普通游客', '<img src=\"./resource/images/comment_images/face-ico/tootha_thumb.gif\" title=\"嘻嘻]\">', '2020-01-02 16:41:34', '12', '1', '38');
INSERT INTO `user_anwser` VALUES ('46', '普通游客', '桥边姑娘真好看', '2020-01-02 17:01:00', '12', '1', '39');
INSERT INTO `user_anwser` VALUES ('47', '普通游客', '我也觉得', '2020-01-02 17:01:14', '12', '1', '39');
INSERT INTO `user_anwser` VALUES ('48', '普通游客', '22', '2020-01-02 18:02:19', '12', '1', '40');
INSERT INTO `user_anwser` VALUES ('49', '权威专家', 'ok', '2020-01-07 17:36:41', '12', '0', '41');

-- ----------------------------
-- Table structure for `user_interaction`
-- ----------------------------
DROP TABLE IF EXISTS `user_interaction`;
CREATE TABLE `user_interaction` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户互动ID',
  `uname` varchar(255) NOT NULL COMMENT '用户名称',
  `ucontent` text NOT NULL COMMENT '用户互动内容',
  `udate` datetime NOT NULL COMMENT '用户互动时间',
  `upraise` int(11) NOT NULL COMMENT '用户互动获赞',
  `ustatusid` int(11) NOT NULL COMMENT '身份表',
  `vid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `userid` (`ustatusid`),
  KEY `vvid` (`vid`),
  KEY `iiid` (`iid`),
  CONSTRAINT `iiid` FOREIGN KEY (`iid`) REFERENCES `introduction` (`iid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vvid` FOREIGN KEY (`vid`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='此表为用户互动表';

-- ----------------------------
-- Records of user_interaction
-- ----------------------------
INSERT INTO `user_interaction` VALUES ('28', '普通游客', '你是我儿子？', '2020-01-02 10:34:40', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('29', '普通游客', '你是傻逼', '2020-01-02 10:36:00', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('30', '普通游客', '啊啊', '2020-01-02 10:36:02', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('31', '普通游客', '啊啊啊<img src=\"resource/images/comment_images/face-ico/sweata_thumb.gif\" title=\"[汗]\">', '2020-01-02 10:37:48', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('32', '普通游客', '<img src=\"resource/images/comment_images/face-ico/dizzya_thumb.gif\" title=\"[晕]\"><img src=\"resource/images/comment_images/face-ico/t_thumb.gif\" title=\"[吐]\">', '2020-01-02 10:39:10', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('33', '普通游客', '<img src=\"resource/images/comment_images/face-ico/sweata_thumb.gif\" title=\"[汗]\"><img src=\"resource/images/comment_images/face-ico/ye_thumb.gif\" title=\"[耶]\">', '2020-01-02 10:39:12', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('34', '普通游客', '一个个', '2020-01-02 10:39:16', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('35', '普通游客', '发的给一个', '2020-01-02 10:39:22', '66', '1', '29', '10');
INSERT INTO `user_interaction` VALUES ('36', '普通游客', '我是十八摸', '2020-01-02 10:40:13', '66', '1', '12', '12');
INSERT INTO `user_interaction` VALUES ('37', '普通游客', 'qq', '2020-01-02 16:38:44', '66', '1', '1', '1');
INSERT INTO `user_interaction` VALUES ('38', '普通游客', '你好，专家<img src=\"resource/images/comment_images/face-ico/smilea_thumb.gif\" title=\"呵呵]\">', '2020-01-02 16:41:27', '66', '1', '5', '2');
INSERT INTO `user_interaction` VALUES ('39', '普通游客', '你好啊<img src=\"resource/images/comment_images/face-ico/smilea_thumb.gif\" title=\"呵呵]\"><img src=\"resource/images/comment_images/face-ico/smilea_thumb.gif\" title=\"呵呵]\"><img src=\"resource/images/comment_images/face-ico/smilea_thumb.gif\" title=\"呵呵]\">', '2020-01-02 17:00:32', '66', '1', '28', '1');
INSERT INTO `user_interaction` VALUES ('40', '普通游客', '11111', '2020-01-02 18:02:13', '66', '1', '6', '6');
INSERT INTO `user_interaction` VALUES ('41', '普通游客', '潘志恒是不是猪', '2020-01-07 17:36:31', '66', '1', '30', '1');
INSERT INTO `user_interaction` VALUES ('42', '普通游客', '哈哈哈', '2020-01-07 17:37:14', '66', '1', '30', '1');
INSERT INTO `user_interaction` VALUES ('43', '普通游客', '哈哈哈哈', '2020-01-07 17:38:54', '66', '1', '2', '2');
INSERT INTO `user_interaction` VALUES ('44', '普通游客', '<img src=\"resource/images/comment_images/face-ico/sweata_thumb.gif\" title=\"[汗]\">', '2020-01-07 17:38:59', '66', '1', '2', '2');
INSERT INTO `user_interaction` VALUES ('45', '普通游客', '哈哈<img src=\"resource/images/comment_images/face-ico/sweata_thumb.gif\" title=\"[汗]\">', '2020-01-07 17:39:24', '66', '1', '2', '2');

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识符',
  `vtitle` varchar(255) NOT NULL COMMENT '标题',
  `vdate` date NOT NULL,
  `vclicks` int(11) NOT NULL,
  `vurl` varchar(255) NOT NULL COMMENT '视频地址',
  `vpicture` varchar(255) NOT NULL COMMENT '视频图片路径',
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`vid`),
  KEY `sid` (`iid`),
  CONSTRAINT `sid` FOREIGN KEY (`iid`) REFERENCES `introduction` (`iid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '讲师', '2019-01-02', '23', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '1');
INSERT INTO `video` VALUES ('2', '高级职业资格', '2019-01-02', '40', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '2');
INSERT INTO `video` VALUES ('3', '高级实习指导教师、技师', '2019-01-02', '66', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '2');
INSERT INTO `video` VALUES ('4', '技师', '2019-01-02', '48', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '2');
INSERT INTO `video` VALUES ('5', '高级实习指导教师、技师', '2019-01-02', '69', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '2');
INSERT INTO `video` VALUES ('6', '讲师', '2019-01-02', '99', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '6');
INSERT INTO `video` VALUES ('7', '高级职业资格', '2019-01-02', '98', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '7');
INSERT INTO `video` VALUES ('8', '高级职业资格', '2019-01-02', '89', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '8');
INSERT INTO `video` VALUES ('9', '高级职业资格', '2019-01-02', '76', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '9');
INSERT INTO `video` VALUES ('10', '技师', '2019-01-02', '69', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '10');
INSERT INTO `video` VALUES ('11', '高级职业资格', '2019-01-02', '98', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '11');
INSERT INTO `video` VALUES ('12', '高级职业资格', '2019-01-02', '99', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '12');
INSERT INTO `video` VALUES ('13', '技师', '2019-01-02', '99', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '13');
INSERT INTO `video` VALUES ('21', '高级实习指导教师、技师', '2019-12-15', '10', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '14');
INSERT INTO `video` VALUES ('27', '444', '2019-12-31', '1', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '1');
INSERT INTO `video` VALUES ('28', '桥边姑娘', '2019-12-31', '1', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '1');
INSERT INTO `video` VALUES ('29', '家常豆腐', '2020-01-02', '1', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '10');
INSERT INTO `video` VALUES ('30', '委屈', '2020-01-07', '1', 'http://43.231.185.233/Home_of_talent_and_skills/resource/video/a.mp4', './resource/images/Screen_cover/cover.png', '1');
