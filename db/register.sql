-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.1.49-community - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 qy.t_register 结构
CREATE TABLE IF NOT EXISTS `t_register` (
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `gender` varchar(2) NOT NULL COMMENT '性别',
  `age` smallint(5) NOT NULL COMMENT '年龄',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  qy.t_register 的数据：~2 rows (大约)
DELETE FROM `t_register`;
/*!40000 ALTER TABLE `t_register` DISABLE KEYS */;
INSERT INTO `t_register` (`username`, `gender`, `age`, `remark`, `password`) VALUES
	('12', '男', 212, '112', '12'),
	('wc', '男', 22, '街角的祝福', 'wc');
/*!40000 ALTER TABLE `t_register` ENABLE KEYS */;


-- 导出  表 qy.t_student 结构
CREATE TABLE IF NOT EXISTS `t_student` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `gender` varchar(2) NOT NULL DEFAULT '男' COMMENT '性别',
  `age` smallint(5) NOT NULL DEFAULT '20' COMMENT '年龄',
  `remark` varchar(50) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在导出表  qy.t_student 的数据：~7 rows (大约)
DELETE FROM `t_student`;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` (`id`, `name`, `gender`, `age`, `remark`) VALUES
	(1, '乔远', '女', 20, '爱唱歌'),
	(2, 'wc', '男', 20, '爱学习'),
	(3, '乔远', '女', 20, '爱唱歌'),
	(4, '乔远远', '女', 21, '不爱笑'),
	(5, '乔远', '女', 21, '你是不是我最疼爱的人'),
	(6, 'q1', '男', 22, '122'),
	(7, '11', '男', 20, '12');
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
