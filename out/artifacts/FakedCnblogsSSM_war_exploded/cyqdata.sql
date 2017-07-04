/*
Navicat MySQL Data Transfer

Source Server         : fd
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : cyqdata

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-06-24 07:13:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_class
-- ----------------------------
DROP TABLE IF EXISTS `blog_class`;
CREATE TABLE `blog_class` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `PKey` varchar(500) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `Count` int(11) DEFAULT '0',
  `IsVisible` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_class
-- ----------------------------

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ContentUserID` int(11) DEFAULT '0',
  `ContentID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT '0',
  `NickName` varchar(50) DEFAULT NULL,
  `Body` longtext,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_content`;
CREATE TABLE `blog_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Body` longtext,
  `Abstract` varchar(4000) DEFAULT NULL,
  `Tag` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `Icon` varchar(255) DEFAULT NULL,
  `ViewLevel` tinyint(3) unsigned DEFAULT '0',
  `ViewPassword` varchar(50) DEFAULT NULL,
  `CommentLevel` tinyint(3) unsigned DEFAULT '2',
  `CommentCount` int(11) DEFAULT '0',
  `EditTime` datetime DEFAULT NULL,
  `Hits` int(11) DEFAULT '0',
  `IsRss` bit(1) DEFAULT b'1',
  `IsPub` bit(1) DEFAULT b'0',
  `IsTop` bit(1) DEFAULT b'0',
  `IsMain` bit(1) DEFAULT b'1',
  `SysClassID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_content
-- ----------------------------

-- ----------------------------
-- Table structure for blog_file
-- ----------------------------
DROP TABLE IF EXISTS `blog_file`;
CREATE TABLE `blog_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `Size` bigint(20) DEFAULT '0',
  `CreateTime` datetime DEFAULT NULL,
  `IsTemp` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_file
-- ----------------------------


-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `NickName` varchar(50) DEFAULT NULL,
  `Password` varchar(500) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HeadUrl` varchar(400) DEFAULT NULL,
  `Bulletin` varchar(4000) DEFAULT '暂无公告',
  `Enabled` bit(1) DEFAULT b'1',
  `SpaceName` varchar(300) DEFAULT NULL,
  `SpaceIntro` varchar(600) DEFAULT NULL,
  `Sign` varchar(600) DEFAULT NULL,
  `CustomCss` varchar(4000) DEFAULT NULL,
  `ArticleListSize` int(11) DEFAULT '10',
  `PhotoListSize` int(11) DEFAULT '24',
  `Amount` int(11) DEFAULT '0',
  `VisitCount` int(11) DEFAULT '0',
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_user
-- ----------------------------


