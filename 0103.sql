-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.13 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table doitwell.ads
CREATE TABLE IF NOT EXISTS `ads` (
  `ads_id` int(10) NOT NULL AUTO_INCREMENT,
  `kind` varchar(128) DEFAULT NULL,
  `content` text NOT NULL,
  `image_url` text,
  `status` varchar(2) NOT NULL DEFAULT 'Y',
  `content2` text,
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ads_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.ads: 27 rows
DELETE FROM `ads`;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` (`ads_id`, `kind`, `content`, `image_url`, `status`, `content2`, `start_time`, `end_time`, `title`) VALUES
	(22, 'recommend', '♥【L & B wedding】♥ 分享超平價的無框油畫布!!', 'http://verywed.com/forum/expexch/2481236-1.html?from=about', 'Y', NULL, NULL, NULL, NULL),
	(23, 'recommend', '♥【 W & X 】分享無框畫', 'http://verywed.com/forum/expexch/2557566-1.html', 'Y', NULL, NULL, NULL, NULL),
	(24, 'recommend', '♥【無框畫開箱文】', 'http://verywed.com/vwblog/momokids/article/63389', 'Y', NULL, NULL, NULL, NULL),
	(25, 'recommend', '♥【 L&S wedding】 ♥ 開箱文45吋正方型放大無框畫', 'http://www.wretch.cc/blog/lyd3070932ca/1880450', 'Y', NULL, NULL, NULL, NULL),
	(26, 'recommend', '♥【玥の花嫁 ♥ 婚禮小物分享】', 'http://verywed.com/forum/expexch/2379243-1.html', 'Y', NULL, NULL, NULL, NULL),
	(27, 'recommend', '♥【 D & P 分享無框放大畫】', 'http://verywed.com/forum/expexch/2460501-1.html', 'Y', NULL, NULL, NULL, NULL),
	(29, 'recommend', '♥【我們的婚禮全家福無框畫】', 'http://verywed.com/vwblog/s851959/article/68515', 'Y', NULL, NULL, NULL, NULL),
	(30, 'recommend', '♥【我的超時尚無框畫時鐘】', 'http://verywed.com/forum/expexch/2544053-1.html?from=expexch', 'Y', NULL, NULL, NULL, NULL),
	(31, 'recommend', '♥【超愛無框畫。比婚紗公司更精緻】', 'http://verywed.com/forum/expexch/2577185-1.html', 'Y', NULL, NULL, NULL, NULL),
	(32, 'recommend', '♥【我們的幸福全家福無框畫】', 'http://verywed.com/forum/expexch/2577081-1.html', 'Y', NULL, NULL, NULL, NULL),
	(3, 'slider', 'adv03', 'upload/ads_images/slider/adv03.png', 'Y', NULL, '2013-08-01', '2014-08-01', NULL),
	(1, 'slider', 'adv01', 'upload/ads_images/slider/adv01.png', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(2, 'slider', 'adv02', 'upload/ads_images/slider/adv02.png', 'Y', NULL, '2013-08-01', '2014-08-01', NULL),
	(17, 'recommend', '♥【無框畫分享】', 'http://verywed.com/forum/expexch/2553987-1.html', 'Y', NULL, NULL, NULL, NULL),
	(36, 'recommend', '測試跑馬燈最大長度QWERTYUIOPLOKJHGFDSAZXCVBNJMKJUYHTGEDWEDGTHYJUYKIMJYNHGBVED#R$%T$HY&U^J*KIYJUTHGREDWTGYHJUKIYJUTHGRR%T$^Y%&UJYNHTYGRT%$^Y&UJYTHG', '', 'N', NULL, NULL, NULL, NULL),
	(47, 'product', 'custom_prod.aspx', 'upload/ads_images/product/12026.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(48, 'product', 'custom_prod.aspx', 'upload/ads_images/product/12038.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(49, 'product', 'custom_prod.aspx', 'upload/ads_images/product/13024.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(50, 'product', 'custom_prod.aspx', 'upload/ads_images/product/13025.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(43, 'product', 'preview.html?painter_id=1381824099789&order_detail_id=1752', 'upload/ads_images/product/4.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(57, 'product', 'custom_prod.aspx', 'upload/ads_images/product/Chrysanthemum.jpg', 'N', NULL, '2013-08-01', '2015-08-28', NULL),
	(58, 'product', 'custom_prod.aspx', 'upload/ads_images/product/13024.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(59, 'product', 'custom_prod.aspx', 'upload/ads_images/product/13025.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(61, 'product', 'custom_prod.aspx', 'upload/ads_images/product/Chrysanthemum.jpg', 'N', NULL, '2013-08-01', '2015-08-28', NULL),
	(62, 'product', 'custom_prod.aspx', 'upload/ads_images/product/13025.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(63, 'product', 'custom_prod.aspx', 'upload/ads_images/product/13024.jpg', 'Y', NULL, '2013-08-01', '2015-08-28', NULL),
	(64, 'product', 'preview.html?painter_id=131016083155&order_detail_id=1754', 'upload/ads_images/product/aegeri-lake-switzerland.JPG', 'Y', NULL, '2013-09-11', '2013-09-19', NULL);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;


-- Dumping structure for table doitwell.bank_remit_record
CREATE TABLE IF NOT EXISTS `bank_remit_record` (
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remit_record` varchar(20) NOT NULL,
  `serial` varchar(3) NOT NULL DEFAULT '000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.bank_remit_record: 157 rows
DELETE FROM `bank_remit_record`;
/*!40000 ALTER TABLE `bank_remit_record` DISABLE KEYS */;
INSERT INTO `bank_remit_record` (`time_stamp`, `remit_record`, `serial`) VALUES
	('2013-09-28 14:21:44', '96289323928011', '011'),
	('2013-09-28 12:08:14', '96289323928010', '010'),
	('2013-09-27 23:01:44', '96289323927009', '009'),
	('2013-09-27 20:57:00', '96289323927008', '008'),
	('2013-09-27 20:45:44', '96289323927007', '007'),
	('2013-09-27 20:42:54', '96289323927006', '006'),
	('2013-09-27 19:50:29', '96289323927005', '005'),
	('2013-09-27 19:48:22', '96289323927004', '004'),
	('2013-09-27 19:47:58', '96289323927003', '003'),
	('2013-09-27 18:51:05', '96289323927002', '002'),
	('2013-09-27 16:13:42', '96289323927001', '001'),
	('2013-09-30 11:26:18', '96289323930012', '012'),
	('2013-09-30 11:30:56', '96289323930013', '013'),
	('2013-09-30 11:34:08', '96289323930014', '014'),
	('2013-09-30 11:40:07', '96289323930015', '015'),
	('2013-09-30 11:44:53', '96289323930016', '016'),
	('2013-09-30 11:45:51', '96289323930017', '017'),
	('2013-09-30 11:56:54', '96289323930018', '018'),
	('2013-09-30 14:17:53', '96289323930019', '019'),
	('2013-09-30 14:22:10', '96289323930020', '020'),
	('2013-09-30 14:26:14', '96289323930021', '021'),
	('2013-09-30 15:12:02', '96289323930022', '022'),
	('2013-09-30 15:14:54', '96289323930023', '023'),
	('2013-09-30 15:17:05', '96289323930024', '024'),
	('2013-09-30 15:37:01', '96289323930025', '025'),
	('2013-09-30 15:38:54', '96289323930026', '026'),
	('2013-09-30 15:39:30', '96289323930027', '027'),
	('2013-09-30 15:43:06', '96289323930028', '028'),
	('2013-09-30 15:44:30', '96289323930029', '029'),
	('2013-09-30 15:45:16', '96289323930030', '030'),
	('2013-09-30 16:30:09', '96289323930031', '031'),
	('2013-09-30 16:32:55', '96289323930032', '032'),
	('2013-09-30 16:34:36', '96289323930033', '033'),
	('2013-09-30 16:35:20', '96289323930034', '034'),
	('2013-09-30 16:45:19', '96289323930035', '035'),
	('2013-09-30 16:52:37', '96289323930036', '036'),
	('2013-09-30 16:53:28', '96289323930037', '037'),
	('2013-09-30 16:54:59', '96289323930038', '038'),
	('2013-09-30 16:56:30', '96289323930039', '039'),
	('2013-09-30 17:28:06', '96289323930040', '040'),
	('2013-10-01 11:17:10', '96289323001041', '041'),
	('2013-10-01 11:22:21', '96289323001042', '042'),
	('2013-10-01 11:23:57', '96289323001043', '043'),
	('2013-10-01 11:45:44', '96289323001044', '044'),
	('2013-10-01 11:53:21', '96289323001045', '045'),
	('2013-10-01 11:59:38', '96289323001046', '046'),
	('2013-10-01 13:11:30', '96289323001047', '047'),
	('2013-10-01 13:13:34', '96289323001048', '048'),
	('2013-10-01 13:15:54', '96289323001049', '049'),
	('2013-10-01 13:19:53', '96289323001050', '050'),
	('2013-10-01 13:23:39', '96289323001051', '051'),
	('2013-10-01 13:40:54', '96289323001052', '052'),
	('2013-10-01 13:42:11', '96289323001053', '053'),
	('2013-10-01 14:11:45', '96289323001054', '054'),
	('2013-10-01 14:20:53', '96289323001055', '055'),
	('2013-10-01 15:05:17', '96289323001056', '056'),
	('2013-10-01 15:50:13', '96289323001057', '057'),
	('2013-10-01 15:51:27', '96289323001058', '058'),
	('2013-10-01 16:01:11', '96289323001059', '059'),
	('2013-10-01 16:02:25', '96289323001060', '060'),
	('2013-10-02 13:38:29', '96289323002061', '061'),
	('2013-10-02 13:51:51', '96289323002062', '062'),
	('2013-10-02 13:53:52', '96289323002063', '063'),
	('2013-10-02 13:55:13', '96289323002064', '064'),
	('2013-10-02 14:08:13', '96289323002065', '065'),
	('2013-10-02 14:10:01', '96289323002066', '066'),
	('2013-10-02 14:10:42', '96289323002067', '067'),
	('2013-10-02 14:11:25', '96289323002068', '068'),
	('2013-10-02 14:42:32', '96289323002069', '069'),
	('2013-10-03 15:41:43', '96289323003070', '070'),
	('2013-10-03 16:27:19', '96289323003071', '071'),
	('2013-10-04 09:31:55', '96289323004072', '072'),
	('2013-10-04 09:46:57', '96289323004073', '073'),
	('2013-10-07 16:30:18', '96289323007074', '074'),
	('2013-10-07 17:14:52', '96289323007075', '075'),
	('2013-10-07 17:27:01', '96289323007076', '076'),
	('2013-10-09 22:09:38', '96289323009077', '077'),
	('2013-10-10 09:51:21', '96289323010078', '078'),
	('2013-10-10 10:00:12', '96289323010079', '079'),
	('2013-10-11 11:47:24', '96289323011080', '080'),
	('2013-10-11 11:48:24', '96289323011081', '081'),
	('2013-10-11 11:52:02', '96289323011082', '082'),
	('2013-10-11 11:54:02', '96289323011083', '083'),
	('2013-10-11 11:55:47', '96289323011084', '084'),
	('2013-10-11 15:46:34', '96289323011085', '085'),
	('2013-10-11 16:04:26', '96289323011086', '086'),
	('2013-10-14 13:28:48', '96289323014087', '087'),
	('2013-10-14 13:51:38', '96289323014088', '088'),
	('2013-10-14 14:03:22', '96289323014089', '089'),
	('2013-10-14 14:20:27', '96289323014090', '090'),
	('2013-10-15 09:29:26', '96289323015091', '091'),
	('2013-10-15 09:59:49', '96289323015092', '092'),
	('2013-10-15 10:58:15', '96289323015093', '093'),
	('2013-10-15 11:20:48', '96289323015094', '094'),
	('2013-10-15 13:41:26', '96289323015095', '095'),
	('2013-10-15 14:48:50', '96289323015096', '096'),
	('2013-10-15 15:02:04', '96289323015097', '097'),
	('2013-10-15 15:04:23', '96289323015098', '098'),
	('2013-10-15 15:05:47', '96289323015099', '099'),
	('2013-10-15 15:09:24', '96289323015100', '100'),
	('2013-10-15 15:42:29', '96289323015101', '101'),
	('2013-10-15 16:08:15', '96289323015102', '102'),
	('2013-10-16 08:32:13', '96289323016103', '103'),
	('2013-10-16 08:56:40', '96289323016104', '104'),
	('2013-10-16 11:27:04', '96289323016105', '105'),
	('2013-10-16 11:49:18', '96289323016106', '106'),
	('2013-10-18 10:54:41', '96289323018107', '107'),
	('2013-10-18 11:03:19', '96289323018108', '108'),
	('2013-10-18 11:09:24', '96289323018109', '109'),
	('2013-10-18 11:15:05', '96289323018110', '110'),
	('2013-10-23 11:11:12', '96289323023111', '111'),
	('2013-10-23 13:44:35', '96289323023112', '112'),
	('2013-10-23 14:24:02', '96289323023113', '113'),
	('2013-10-23 17:41:42', '96289323023114', '114'),
	('2013-10-24 09:17:35', '96289323024115', '115'),
	('2013-10-24 10:22:15', '96289323024116', '116'),
	('2013-10-24 13:37:34', '96289323024117', '117'),
	('2013-10-24 16:31:45', '96289323024118', '118'),
	('2013-10-25 10:23:49', '96289323025119', '119'),
	('2013-11-01 08:59:49', '96289323A01120', '120'),
	('2013-11-01 09:38:26', '96289323A01121', '121'),
	('2013-11-01 10:38:21', '96289323A01122', '122'),
	('2013-11-01 14:37:39', '96289323A01123', '123'),
	('2013-11-01 15:46:06', '96289323A01124', '124'),
	('2013-11-01 15:56:06', '96289323A01125', '125'),
	('2013-11-01 15:58:35', '96289323A01126', '126'),
	('2013-11-01 16:06:03', '96289323A01127', '127'),
	('2013-11-01 16:47:02', '96289323A01128', '128'),
	('2013-11-01 16:51:36', '96289323A01129', '129'),
	('2013-12-04 11:57:55', '96289323B04130', '130'),
	('2013-12-04 13:06:23', '96289323B04131', '131'),
	('2013-12-04 13:13:13', '96289323B04132', '132'),
	('2013-12-04 13:50:51', '96289323B04133', '133'),
	('2013-12-04 14:02:46', '96289323B04134', '134'),
	('2013-12-04 14:09:10', '96289323B04135', '135'),
	('2013-12-05 08:38:48', '96289323B05136', '136'),
	('2013-12-24 10:24:59', '96289323B24137', '137'),
	('2013-12-24 10:33:54', '96289323B24138', '138'),
	('2013-12-24 10:38:27', '96289323B24139', '139'),
	('2013-12-24 10:40:14', '96289323B24140', '140'),
	('2013-12-24 10:41:41', '96289323B24141', '141'),
	('2013-12-24 10:47:05', '96289323B24142', '142'),
	('2013-12-24 10:53:06', '96289323B24143', '143'),
	('2013-12-24 10:54:47', '96289323B24144', '144'),
	('2013-12-24 11:06:39', '96289323B24145', '145'),
	('2013-12-24 11:07:48', '96289323B24146', '146'),
	('2013-12-24 11:09:37', '96289323B24147', '147'),
	('2013-12-24 11:20:33', '96289323B24148', '148'),
	('2013-12-24 11:27:14', '96289323B24149', '149'),
	('2013-12-24 11:32:41', '96289323B24150', '150'),
	('2013-12-24 11:37:09', '96289323B24151', '151'),
	('2013-12-24 11:39:27', '96289323B24152', '152'),
	('2013-12-24 13:11:28', '96289323B24153', '153'),
	('2013-12-24 13:15:22', '96289323B24154', '154'),
	('2013-12-24 13:58:45', '96289323B24155', '155'),
	('2013-12-25 10:24:23', '96289323B25156', '156'),
	('2013-12-25 11:07:17', '96289323B25157', '157');
/*!40000 ALTER TABLE `bank_remit_record` ENABLE KEYS */;


-- Dumping structure for table doitwell.canlender
CREATE TABLE IF NOT EXISTS `canlender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `tw_month` int(11) NOT NULL,
  `tw_day` int(11) NOT NULL,
  `luni_month` int(11) DEFAULT NULL,
  `luni_day` int(11) DEFAULT NULL,
  `holiday` varchar(50) DEFAULT NULL,
  `red` varchar(50) DEFAULT NULL,
  `dow` varchar(50) NOT NULL,
  `rowIndex` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.canlender: 11 rows
DELETE FROM `canlender`;
/*!40000 ALTER TABLE `canlender` DISABLE KEYS */;
INSERT INTO `canlender` (`id`, `type`, `year`, `tw_month`, `tw_day`, `luni_month`, `luni_day`, `holiday`, `red`, `dow`, `rowIndex`) VALUES
	(3, '版型1', 2013, 1, 12, 12, 1, '十二月', 'True', 'Sunday', 0),
	(4, '版型1', 2013, 1, 11, 11, 30, '三十', 'True', 'Sunday', 0),
	(5, '版型1', 2013, 1, 11, 11, 30, '三十', 'True', 'Sunday', 0),
	(6, '版型1', 2013, 1, 4, 11, 23, '廿三', 'True', 'Sunday', 0),
	(7, '版型1', 2013, 1, 5, 11, 24, '廿四', 'True', 'Sunday', 0),
	(8, '版型1', 2013, 1, 11, 11, 30, '三十', 'False', 'Sunday', 0),
	(9, '版型1', 2013, 1, 4, 11, 23, '廿三', 'False', 'Sunday', 0),
	(10, '版型1', 2013, 1, 4, 11, 23, 'XXXXX', 'False', 'Sunday', 0),
	(11, '版型1', 2013, 1, 4, 11, 23, '3r32r32r32r', 'False', 'Sunday', 0),
	(12, '版型1', 2013, 1, 4, 11, 23, '123456', 'False', 'Sunday', 0),
	(13, '版型1', 2013, 1, 4, 11, 23, '廿三', 'False', 'Sunday', 0);
/*!40000 ALTER TABLE `canlender` ENABLE KEYS */;


-- Dumping structure for table doitwell.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  `image_url` varchar(45) DEFAULT NULL,
  `html` text,
  `status` varchar(2) DEFAULT 'Y',
  `html_status` varchar(2) DEFAULT 'N',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.category: 3 rows
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `category`, `title`, `content`, `image_url`, `html`, `status`, `html_status`) VALUES
	(30, '無框畫', '無框畫', '作品以 900 丹亮面織紋油畫布製作，其特殊之立體表面紋路，加以高解析抗UV微噴技術 ，作品略顯光澤、立體細緻，抗候性佳，室內保存至少達30年，收藏紀念、佈置展出兩相宜，讓照片也能成為藝術品。', 'upload/category_images/p1_4_2b.png', '<img alt=&#34;&#34; src=&#34;http://140.116.86.167:2688/upload/content_images/images/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7%202013-09-17%20%E4%B8%8B%E5%8D%889_05_05.png&#34; style=&#34;height:722px; width:693px&#34; /><br />\n<img alt=&#34;&#34; src=&#34;http://140.116.86.167:2688/upload/content_images/images/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7%202013-09-17%20%E4%B8%8B%E5%8D%889_05_17.png&#34; style=&#34;height:394px; width:687px&#34; /><br />\n&nbsp;', 'Y', 'Y'),
	(31, '寫真書', '寫真書', '手工打造的精裝封面，在最容易翻損及碰撞的外側書角配置皮件專用護角金屬配飾，讓封面得以更完善保護並可增添作品高貴質感', 'upload/category_images/p2_4_5b.png', '<img alt=&#34;&#34; src=&#34;http://140.116.86.167:2688/upload/content_images/images/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7%202013-09-17%20%E4%B8%8B%E5%8D%889_24_13.png&#34; style=&#34;height:674px; width:674px&#34; /><img alt=&#34;&#34; src=&#34;http://140.116.86.167:2688/upload/content_images/images/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7%202013-09-17%20%E4%B8%8B%E5%8D%889_24_24.png&#34; style=&#34;height:369px; width:669px&#34; />', 'Y', 'Y'),
	(38, '年月曆', '年月曆', '四種版型由你決定，國曆為主，農曆為輔。個人使用，公司送禮，365天都能看的到', 'upload/category_images/canlender.png', '建置中', 'Y', 'N');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for table doitwell.config
CREATE TABLE IF NOT EXISTS `config` (
  `item` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.config: 2 rows
DELETE FROM `config`;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`item`, `value`) VALUES
	('ads_product_marquee', 'Y'),
	('bank_serial_head', '9628932');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;


-- Dumping structure for table doitwell.member
CREATE TABLE IF NOT EXISTS `member` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthday_year` varchar(10) DEFAULT NULL,
  `birthday_month` varchar(10) DEFAULT NULL,
  `birthday_day` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `zipcode` int(5) DEFAULT '0',
  `city` varchar(10) DEFAULT NULL,
  `locality` varchar(10) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `active` varchar(10) NOT NULL DEFAULT 'Y',
  `discount` float(3,2) NOT NULL DEFAULT '1.00',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `starttime` timestamp NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `register_source` varchar(20) NOT NULL DEFAULT 'HOST' COMMENT 'HOST=server, FB=facebook',
  PRIMARY KEY (`user_id`),
  KEY `user_name_password_mobile_email` (`user_name`,`password`,`mobile`,`email`)
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.member: 3 rows
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`user_id`, `real_name`, `user_name`, `password`, `gender`, `birthday_year`, `birthday_month`, `birthday_day`, `telephone`, `mobile`, `email`, `zipcode`, `city`, `locality`, `address`, `active`, `discount`, `createtime`, `starttime`, `endtime`, `register_source`) VALUES
	(159, '我是測試a', 'a', 'a', '男', '1977', '7', '8', '07-1234567', '0910123456', 'amau712@gmail.com', 888, '高雄市', '苓雅區', '光華路1號', 'Y', 1.00, '2013-08-31 15:32:59', NULL, NULL, 'HOST'),
	(160, 'painter測試', 'painter', 'painter', '男', NULL, NULL, NULL, NULL, NULL, 'amau712@gmail.com', 0, NULL, NULL, NULL, 'Y', 1.00, '2013-09-26 13:39:14', NULL, NULL, 'HOST'),
	(161, '我是測試b', 'b', 'b', '男', '1980', '1', '1', '07-1234567', '0910123456', 'amau712@gmail.com', 888, '高雄市', '苓雅區', '光華路1號', 'Y', 0.70, '2013-08-31 15:32:59', NULL, NULL, 'HOST');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- Dumping structure for table doitwell.order
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `confirm_order_id` varchar(50) DEFAULT NULL,
  `receiver_name` varchar(50) DEFAULT NULL COMMENT 'user can change the name by order, default is while he/she real_name at register/',
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL COMMENT 'Default is show register mobile, but he/she can change number by order',
  `zipcode` int(5) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `locality` varchar(10) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `payment_type` varchar(128) DEFAULT NULL COMMENT 'BANK/POST/WEB ATM/CREADIT CARD',
  `bank_account` varchar(45) DEFAULT NULL COMMENT 'bank',
  `remit_total_money` int(11) DEFAULT '0',
  `order_total_money` int(11) DEFAULT '0',
  `order_discount_money` int(11) DEFAULT '0',
  `discount` float(9,2) DEFAULT '1.00' COMMENT '會員折扣',
  `use_coupon` varchar(2) DEFAULT 'N',
  `coupon_discount` float(9,2) DEFAULT '1.00',
  `status` varchar(10) DEFAULT 'open' COMMENT 'open(開單) / close(結單) / cancel(取消整張訂單) / payment(已付款) / deliver(出貨中) / return(退件)',
  `open_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `close_time` timestamp NULL DEFAULT NULL,
  `cancel_time` timestamp NULL DEFAULT NULL,
  `payment_time` timestamp NULL DEFAULT NULL,
  `deliver_time` timestamp NULL DEFAULT NULL,
  `return_time` timestamp NULL DEFAULT NULL,
  `note` text,
  `deliver_type` varchar(50) DEFAULT NULL COMMENT 'ship (寄送) / yslef (自取)',
  PRIMARY KEY (`order_id`),
  KEY `user_id_mobile` (`user_id`,`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.order: 6 rows
DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`, `user_id`, `confirm_order_id`, `receiver_name`, `email`, `telephone`, `mobile`, `zipcode`, `city`, `locality`, `address`, `payment_type`, `bank_account`, `remit_total_money`, `order_total_money`, `order_discount_money`, `discount`, `use_coupon`, `coupon_discount`, `status`, `open_time`, `close_time`, `cancel_time`, `payment_time`, `deliver_time`, `return_time`, `note`, `deliver_type`) VALUES
	(1, 161, '3B26001', '我是測試b', 'amau712@gmail.com', '07-1234567', '0910123456', 888, '高雄市', '苓雅區', '光華路1號', NULL, NULL, 0, 0, 0, 0.70, 'N', 1.00, 'open', '2013-12-26 09:20:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 159, '3B26002', '我是測試a', 'amau712@gmail.com', '07-1234567', '0910123456', 888, '高雄市', '苓雅區', '光華路1號', NULL, NULL, 0, 0, 0, 1.00, 'N', 1.00, 'delete', '2013-12-26 09:55:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 159, '3B26002', '我是測試a', 'amau712@gmail.com', '07-1234567', '0910123456', 888, '高雄市', '苓雅區', '光華路1號', NULL, NULL, 0, 0, 0, 1.00, 'N', 1.00, 'delete', '2013-12-26 09:56:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 159, '3B30002', '我是測試a', 'amau712@gmail.com', '07-1234567', '0910123456', 888, '高雄市', '苓雅區', '光華路1號', NULL, NULL, 0, 0, 0, 1.00, 'N', 1.00, 'delete', '2013-12-30 10:01:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 159, '3B30003', '我是測試a', 'amau712@gmail.com', '07-1234567', '0910123456', 888, '高雄市', '苓雅區', '光華路1號', NULL, NULL, 0, 0, 0, 1.00, 'N', 1.00, 'delete', '2013-12-30 10:02:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 159, '3B30003', '我是測試a', 'amau712@gmail.com', '07-1234567', '0910123456', 888, '高雄市', '苓雅區', '光華路1號', NULL, NULL, 0, 0, 0, 1.00, 'N', 1.00, 'delete', '2013-12-30 12:27:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


-- Dumping structure for table doitwell.order_detail
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_master_id` int(10) NOT NULL,
  `order_detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `confirm_order_detail_id` varchar(50) DEFAULT NULL,
  `product_type` varchar(128) DEFAULT NULL,
  `product_spec` text NOT NULL,
  `product_amount` int(10) NOT NULL DEFAULT '1',
  `product_price` float(9,2) NOT NULL DEFAULT '0.00',
  `product_discount` float(9,2) DEFAULT '0.00',
  `use_coupon` varchar(2) DEFAULT 'N',
  `coupon_discount` float(9,2) DEFAULT '0.00',
  `width` float NOT NULL,
  `height` float NOT NULL,
  `bleed_width` float NOT NULL,
  `bleed_height` float NOT NULL,
  `pages` int(11) DEFAULT '1',
  `note` text,
  `painter_status` varchar(50) DEFAULT 'open' COMMENT 'open(未編輯) / finish(完成製作) / close(下訂單) / edit(編輯中) / complete(完成製作for自編和委託)',
  `painter_id` varchar(50) DEFAULT NULL,
  `painter_cover` text,
  `make_type` varchar(50) DEFAULT 'painter' COMMENT 'painter (線上編輯) / user_editor (自編上傳) / boss_editor (委託編輯)',
  `status` varchar(50) DEFAULT 'open' COMMENT 'open (開單) / close (結單) / cancel(取消訂單) / checkout(下訂單) /checkout_confirm (確定下訂拿匯款帳號)',
  `user_name` varchar(50) DEFAULT NULL,
  `artist` varchar(2) DEFAULT 'N',
  `cancel_order_comment` text,
  `shelf` varchar(1) DEFAULT 'N' COMMENT '前台作品欣賞上下架設定',
  `shelf_seq` int(11) DEFAULT NULL,
  `ckfinder_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000003 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.order_detail: 12 rows
DELETE FROM `order_detail`;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`order_master_id`, `order_detail_id`, `confirm_order_detail_id`, `product_type`, `product_spec`, `product_amount`, `product_price`, `product_discount`, `use_coupon`, `coupon_discount`, `width`, `height`, `bleed_width`, `bleed_height`, `pages`, `note`, `painter_status`, `painter_id`, `painter_cover`, `make_type`, `status`, `user_name`, `artist`, `cancel_order_comment`, `shelf`, `shelf_seq`, `ckfinder_path`) VALUES
	(999999, 1, '999999', '無框畫', '輸出尺寸 40 x 40 cm<br>完成尺寸 30 x 30 cm', 1, 399.00, 0.00, 'N', 0.00, 40, 40, 30, 30, 1, NULL, 'open', '131230100148', 'http://140.116.86.167:2688/Images/user_edit.PNG', 'painter', 'delete', 'a', 'N', NULL, 'N', NULL, '/upload/painter/test1/無框畫/999999/'),
	(999999, 2, '999999', '無框畫', '輸出尺寸 90 x 60 cm<br>完成尺寸 80 x 50 cm', 1, 399.00, 0.00, 'N', 0.00, 90, 60, 80, 50, 1, NULL, 'open', '131230100148', 'http://140.116.86.167:2688/Images/user_edit.PNG', 'painter', 'delete', 'a', 'N', NULL, 'N', NULL, '/upload/painter/test1/無框畫/999999/'),
	(999999, 3, '999999', '無框畫', '輸出尺寸 60 x 90 cm<br>完成尺寸 50 x 80 cm', 1, 399.00, 0.00, 'N', 0.00, 60, 90, 50, 80, 1, NULL, 'open', '131230100148', 'http://140.116.86.167:2688/Images/user_edit.PNG', 'painter', 'delete', 'a', 'N', NULL, 'N', NULL, '/upload/painter/test1/無框畫/999999/');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;


-- Dumping structure for table doitwell.painter
CREATE TABLE IF NOT EXISTS `painter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_detail_id` varchar(50) DEFAULT '0',
  `painter_id` varchar(50) NOT NULL DEFAULT '0',
  `page_id` varchar(50) NOT NULL DEFAULT '0',
  `user_name` varchar(50) NOT NULL DEFAULT '0',
  `layer_index` varchar(50) NOT NULL DEFAULT '0',
  `object_index` varchar(50) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `top` varchar(50) NOT NULL DEFAULT '0',
  `left` varchar(50) NOT NULL DEFAULT '0',
  `width` varchar(50) NOT NULL DEFAULT '0',
  `height` varchar(50) NOT NULL DEFAULT '0',
  `selectable` varchar(50) NOT NULL DEFAULT '0',
  `opacity` varchar(50) NOT NULL DEFAULT '0',
  `scaleX` varchar(50) NOT NULL DEFAULT '0',
  `scaleY` varchar(50) NOT NULL DEFAULT '0',
  `fill` varchar(50) NOT NULL DEFAULT '0',
  `radius` varchar(50) NOT NULL DEFAULT '0',
  `angle` varchar(50) NOT NULL DEFAULT '0',
  `stroke` varchar(50) NOT NULL DEFAULT '0',
  `strokeWidth` varchar(50) NOT NULL DEFAULT '0',
  `strokeDashArray` varchar(50) NOT NULL DEFAULT '0',
  `filename` varchar(300) NOT NULL DEFAULT '0',
  `action_function` varchar(50) NOT NULL DEFAULT '0',
  `step_name` varchar(50) NOT NULL DEFAULT '0',
  `isdelete` varchar(50) NOT NULL DEFAULT '0',
  `filters_type` varchar(50) NOT NULL DEFAULT '0',
  `filters_val` varchar(50) NOT NULL DEFAULT '0',
  `background_image` varchar(50) NOT NULL DEFAULT '0',
  `fontSize` varchar(50) NOT NULL DEFAULT '0',
  `fontFamily` varchar(50) NOT NULL DEFAULT '0',
  `font` varchar(50) NOT NULL DEFAULT '0',
  `before_mask_image` varchar(50) NOT NULL DEFAULT '0',
  `fontStyle` varchar(50) NOT NULL DEFAULT '0',
  `textShadow` varchar(50) NOT NULL DEFAULT '0',
  `fontWeight` varchar(50) NOT NULL DEFAULT '0',
  `textDecoration` varchar(50) NOT NULL DEFAULT '0',
  `fontText` varchar(50) NOT NULL DEFAULT '0',
  `user_add_pages` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.painter: 8 rows
DELETE FROM `painter`;
/*!40000 ALTER TABLE `painter` DISABLE KEYS */;
INSERT INTO `painter` (`id`, `order_detail_id`, `painter_id`, `page_id`, `user_name`, `layer_index`, `object_index`, `type`, `top`, `left`, `width`, `height`, `selectable`, `opacity`, `scaleX`, `scaleY`, `fill`, `radius`, `angle`, `stroke`, `strokeWidth`, `strokeDashArray`, `filename`, `action_function`, `step_name`, `isdelete`, `filters_type`, `filters_val`, `background_image`, `fontSize`, `fontFamily`, `font`, `before_mask_image`, `fontStyle`, `textShadow`, `fontWeight`, `textDecoration`, `fontText`, `user_add_pages`) VALUES
	(18, '0', '26', '0', 'b', '1', '1386726259386', 'image', '150.703703703704', '111.555555555556', '504.590163934426', '504.590163934426', 'True', '1', '0.738312082574376', '0.738312082574376', 'rgb(0,0,0)', '0', '0', '0', '1', '0', 'http://10.1.53.223:1688/upload/painter_material/%E6%A8%A3%E7%89%88%E5%9C%96%E7%A4%BA/pic01.png', '', '', 'N', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2'),
	(3, '0', '26', '2', 'b', '1', '1386141688644', 'image', '158', '166', '544.426229508197', '544.426229508197', 'True', '1', '2.68852459016393', '2.68852459016393', 'rgb(0,0,0)', '0', '0', '0', '1', '0', 'http://localhost:2787/upload/painter_material/%E6%A8%A3%E7%89%88%E5%9C%96%E7%A4%BA/pic01.png', '', '', 'N', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2'),
	(8, '0', '25', '0', 'painter', '1', '1386214997772', 'image', '105', '163', '202.5', '202.5', 'True', '1', '1', '1', 'rgb(0,0,0)', '0', '0', '0', '1', '0', 'http://10.1.53.223:1688/upload/painter_material/%E6%A8%A3%E7%89%88%E5%9C%96%E7%A4%BA/pic02.png', '', '', 'N', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
	(6, '0', '25', '1', 'b', '1', '1386206232085', 'image', '154', '74', '1223.9010989011', '611.950549450549', 'True', '1', '3.02197802197802', '3.02197802197802', 'rgb(0,0,0)', '0', '0', '0', '1', '0', 'http://localhost:2787/upload/painter_material/%E6%A8%A3%E7%89%88%E5%9C%96%E7%A4%BA/pic03.png', '', '', 'N', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
	(12, '0', '9', '0', 'painter', '1', '1386214976576', 'image', '26', '25.6666688919068', '369.180325680092', '150.819667128266', 'True', '1', '6.15300542800153', '2.51366111880443', 'rgb(0,0,0)', '0', '0', '0', '1', '0', 'http://10.1.53.223:1688/upload/painter_material/%E6%A8%A3%E7%89%88%E5%9C%96%E7%A4%BA/pic02.png', '', '', 'N', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	(9, '0', '1386134668503', '0', 'painter', '3', '1386230396940', 'image', '1.59733484797431', '646.079979445551', '140', '140', 'True', '1', '1', '1', 'rgb(0,0,0)', '0', '38.3189148629177', '0', '1', '0', 'http://10.1.53.223:1688/upload/painter_material/%E7%B4%A0%E6%9D%90/2.png', '', '', 'N', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	(10, '0', '1386134668503', '0', 'painter', '3', '1386126986196', 'image', '400', '103', '120', '60', 'False', '1', '4.71978018834041', '4.71978018834041', 'rgb(0,0,0)', '0', '0', '0', '1', '0', 'http://10.1.53.223:1688/upload/painter_material/%E6%A8%A3%E7%89%88%E5%9C%96%E7%A4%BA/pic03.png', '', '', 'N', 'undefined', 'undefined', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	(11, '0', '1386134668503', '0', 'painter', '5', '1386230396940', 'image', '1.59733484797431', '646.079979445551', '140', '140', 'true', '1', '1', '1', 'rgb(0,0,0)', '0', '38.3189148629177', '0', '1', '0', 'http://10.1.53.223:1688/upload/painter_material/%E7%B4%A0%E6%9D%90/2.png', '', '', 'N', 'undefined', 'undefined', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
/*!40000 ALTER TABLE `painter` ENABLE KEYS */;


-- Dumping structure for table doitwell.painter2
CREATE TABLE IF NOT EXISTS `painter2` (
  `painter_id` varchar(50) NOT NULL,
  `page_id` varchar(50) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.painter2: ~0 rows (approximately)
DELETE FROM `painter2`;
/*!40000 ALTER TABLE `painter2` DISABLE KEYS */;
/*!40000 ALTER TABLE `painter2` ENABLE KEYS */;


-- Dumping structure for table doitwell.painter_upload
CREATE TABLE IF NOT EXISTS `painter_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_detail_id` int(10) DEFAULT NULL,
  `painter_id` varchar(50) NOT NULL,
  `page_id` int(11) NOT NULL,
  `img_path` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `height` int(10) NOT NULL,
  `width` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.painter_upload: 24 rows
DELETE FROM `painter_upload`;
/*!40000 ALTER TABLE `painter_upload` DISABLE KEYS */;
INSERT INTO `painter_upload` (`id`, `order_detail_id`, `painter_id`, `page_id`, `img_path`, `type`, `height`, `width`) VALUES
	(1, NULL, '26', 0, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_0_.png', 'template_preview', 1511, 1511),
	(2, NULL, '26', 2, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_2_.png', 'template_preview', 1511, 1511),
	(3, NULL, '26', 2, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_2_.png', 'template_preview', 1511, 1511),
	(4, NULL, '25', 0, '/upload/painter/樣板/無框畫/輸出尺寸 50 x 50 cm 完成尺寸 40 x 40 cm/template_preview/25_0_.png', 'template_preview', 1889, 1889),
	(5, NULL, '25', 1, '/upload/painter/樣板/無框畫/輸出尺寸 50 x 50 cm 完成尺寸 40 x 40 cm/template_preview/25_1_.png', 'template_preview', 1889, 1889),
	(6, NULL, '9', 0, '/upload/painter/樣板/寫真書/21cm x 21cm (方)/template_preview/9_0_.png', 'template_preview', 793, 793),
	(7, NULL, '25', 0, '/upload/painter/樣板/無框畫/輸出尺寸 50 x 50 cm 完成尺寸 40 x 40 cm/template_preview/25_0_.png', 'template_preview', 1889, 1889),
	(8, NULL, '25', 1, '/upload/painter/樣板/無框畫/輸出尺寸 50 x 50 cm 完成尺寸 40 x 40 cm/template_preview/25_1_.png', 'template_preview', 1889, 1889),
	(9, 4, '1386134668503', 0, '/upload/painter/painter/寫真書/3B04004/21cm x 21cm (方)_4/preview/2_4_1386134668503_0_.png', 'preview', 775, 775),
	(10, 4, '1386134668503', 0, '/upload/painter/painter/寫真書/3B04004/21cm x 21cm (方)_4/preview/2_4_1386134668503_0_.png', 'preview', 775, 775),
	(11, NULL, '9', 0, '/upload/painter/樣板/寫真書/21cm x 21cm (方)/template_preview/9_0_.png', 'template_preview', 793, 793),
	(12, 4, '1386134668503', 0, '/upload/painter/painter/寫真書/3B04004/21cm x 21cm (方)_4/preview/2_4_1386134668503_0_.png', 'preview', 775, 775),
	(13, 4, '1386134668503', 1, '/upload/painter/painter/寫真書/3B04004/21cm x 21cm (方)_4/preview/2_4_1386134668503_1_.png', 'preview', 775, 775),
	(14, NULL, '26', 0, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_0_.png', 'template_preview', 1511, 1511),
	(15, NULL, '26', 0, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_0_.png', 'template_preview', 1511, 1511),
	(16, NULL, '26', 0, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_0_.png', 'template_preview', 1511, 1511),
	(17, NULL, '26', 0, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_0_.png', 'template_preview', 1511, 1511),
	(18, NULL, '26', 0, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_0_.png', 'template_preview', 1511, 1511),
	(19, 18, '1386726304610', 0, '/upload/painter/b/無框畫/3B11001/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm_18/user/butterfly.jpg', 'user', 420, 630),
	(20, NULL, '26', 0, '/upload/painter/樣板/無框畫/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm/template_preview/26_0_.png', 'template_preview', 1511, 1511),
	(21, 19, '1386726539840', 0, '/upload/painter/a/無框畫/3B11002/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm_19/user/butterfly.jpg', 'user', 420, 630),
	(22, 31, '1387851537504', 0, '/upload/painter/a/無框畫/3B24002/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm_31/preview/1_31_1387851537504_0_.png', 'preview', 1493, 1493),
	(23, 31, '1387851537504', 0, '/upload/painter/a/無框畫/3B24002/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm_31/preview/1_31_1387851537504_0_.png', 'preview', 1493, 1493),
	(24, 31, '1387851537504', 0, '/upload/painter/a/無框畫/3B24002/輸出尺寸 40 x 40 cm 完成尺寸 30 x 30 cm_31/preview/1_31_1387851537504_0_.png', 'preview', 1493, 1493);
/*!40000 ALTER TABLE `painter_upload` ENABLE KEYS */;


-- Dumping structure for table doitwell.product
CREATE TABLE IF NOT EXISTS `product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  `spec` text,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `bleed_width` float DEFAULT NULL,
  `bleed_height` float DEFAULT NULL,
  `pages` int(11) NOT NULL DEFAULT '1',
  `discount` float(3,2) NOT NULL DEFAULT '0.00',
  `price` float NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'Y',
  `default_amount` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`prod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- Dumping data for table doitwell.product: 69 rows
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`prod_id`, `category`, `spec`, `width`, `height`, `bleed_width`, `bleed_height`, `pages`, `discount`, `price`, `status`, `default_amount`) VALUES
	(1, '無框畫', '輸出尺寸 120 x 150 cm<br>完成尺寸 110 x 140 cm', 120, 150, 110, 140, 1, 0.00, 2599, 'Y', 1),
	(6, '無框畫', '輸出尺寸 120 x 90 cm<br>完成尺寸 110 x 80 cm', 120, 90, 110, 80, 1, 1.00, 1699, 'Y', 1),
	(18, '無框畫', '輸出尺寸 90 x 90 cm<br>完成尺寸 80 x 80 cm', 90, 90, 80, 80, 1, 1.00, 1299, 'Y', 1),
	(9, '寫真書', '21cm x 21cm (方)', 21, 21, 21, 21, 30, 0.00, 1699, 'Y', 1),
	(30, '寫真書', '21cm x 21cm (方)', 21, 21, 21, 21, 50, 0.00, 2199, 'Y', 1),
	(29, '寫真書', '21cm x 21cm (方)', 21, 21, 21, 21, 40, 0.00, 1899, 'Y', 1),
	(24, '無框畫', '輸出尺寸 60 x 40 cm<br>完成尺寸 50 x 30 cm', 60, 40, 50, 30, 1, 0.00, 599, 'Y', 1),
	(23, '無框畫', '輸出尺寸 60 x 60 cm<br>完成尺寸 50 x 50 cm', 60, 60, 50, 50, 1, 0.00, 699, 'Y', 1),
	(22, '無框畫', '輸出尺寸 90 x 60 cm<br>完成尺寸 80 x 50 cm', 90, 60, 80, 50, 1, 0.00, 999, 'Y', 1),
	(25, '無框畫', '輸出尺寸 50 x 50 cm<br>完成尺寸 40 x 40 cm', 50, 50, 40, 40, 1, 0.00, 599, 'Y', 1),
	(26, '無框畫', '輸出尺寸 40 x 40 cm<br>完成尺寸 30 x 30 cm', 40, 40, 30, 30, 1, 0.00, 399, 'Y', 1),
	(31, '寫真書', '21cm x 21cm (方)', 21, 21, 21, 21, 60, 0.00, 2599, 'Y', 1),
	(32, '寫真書', '22cm x 28cm (直)', 22, 28, 22, 28, 30, 0.00, 1899, 'Y', 1),
	(33, '寫真書', '22cm x 28cm (直)', 22, 28, 22, 28, 40, 0.00, 2099, 'Y', 1),
	(34, '寫真書', '22cm x 28cm (直)', 22, 28, 22, 28, 50, 0.00, 2399, 'Y', 1),
	(35, '寫真書', '22cm x 28cm (直)', 22, 28, 22, 28, 60, 0.00, 2799, 'Y', 1),
	(36, '寫真書', '28cm x 22cm (橫)', 28, 22, 28, 22, 30, 0.00, 2099, 'Y', 1),
	(37, '寫真書', '28cm x 22cm (橫)', 28, 22, 28, 22, 40, 0.00, 2399, 'Y', 1),
	(38, '寫真書', '28cm x 22cm (橫)', 28, 22, 28, 22, 50, 0.00, 2699, 'Y', 1),
	(39, '寫真書', '28cm x 22cm (橫)', 28, 22, 28, 22, 60, 0.00, 2999, 'Y', 1),
	(40, '寫真書', '24cm x 24cm (方)', 24, 24, 24, 24, 30, 0.00, 2799, 'Y', 1),
	(41, '寫真書', '24cm x 24cm (方)', 24, 24, 24, 24, 40, 0.00, 3199, 'Y', 1),
	(42, '寫真書', '24cm x 24cm (方)', 24, 24, 24, 24, 50, 0.00, 3599, 'Y', 1),
	(43, '寫真書', '24cm x 24cm (方)', 24, 24, 24, 24, 60, 0.00, 3999, 'Y', 1),
	(44, '寫真書', '24cm x 28cm (橫)', 24, 28, 24, 28, 30, 0.00, 2999, 'Y', 1),
	(45, '寫真書', '24cm x 28cm (橫)', 24, 28, 24, 28, 40, 0.00, 3399, 'Y', 1),
	(46, '寫真書', '24cm x 28cm (橫)', 24, 28, 24, 28, 50, 0.00, 3899, 'Y', 1),
	(47, '寫真書', '24cm x 28cm (橫)', 24, 28, 24, 28, 60, 0.00, 4399, 'Y', 1),
	(66, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 201~500本', 15, 18.5, 15, 18.5, 16, 0.00, 90, 'Y', 201),
	(65, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 101~200本', 15, 18.5, 15, 18.5, 16, 0.00, 93, 'Y', 101),
	(64, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 51~100本', 15, 18.5, 15, 18.5, 16, 0.00, 95, 'Y', 51),
	(63, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 31~50本', 15, 18.5, 15, 18.5, 16, 0.00, 100, 'Y', 31),
	(62, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 21~30本', 15, 18.5, 15, 18.5, 16, 0.00, 110, 'Y', 21),
	(61, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 11~20本', 15, 18.5, 15, 18.5, 16, 0.00, 115, 'Y', 11),
	(60, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 5~10本', 15, 18.5, 15, 18.5, 16, 0.00, 120, 'Y', 5),
	(59, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 2~4本', 15, 18.5, 15, 18.5, 16, 0.00, 140, 'Y', 2),
	(58, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 1本', 15, 18.5, 15, 18.5, 16, 0.00, 159, 'Y', 1),
	(67, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>單面 501 ↑ 本', 15, 18.5, 15, 18.5, 16, 0.00, 85, 'Y', 501),
	(68, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 1本', 15, 18.5, 15, 18.5, 16, 0.00, 250, 'Y', 1),
	(69, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 2~4本', 15, 18.5, 15, 18.5, 16, 0.00, 230, 'Y', 2),
	(70, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 5~10本', 15, 18.5, 15, 18.5, 16, 0.00, 195, 'Y', 5),
	(71, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 11~20本', 15, 18.5, 15, 18.5, 16, 0.00, 180, 'Y', 11),
	(72, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 21~30本', 15, 18.5, 15, 18.5, 16, 0.00, 170, 'Y', 21),
	(73, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 31~50本', 15, 18.5, 15, 18.5, 16, 0.00, 160, 'Y', 31),
	(74, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 51~100本', 15, 18.5, 15, 18.5, 16, 0.00, 150, 'Y', 51),
	(75, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 101~200本', 15, 18.5, 15, 18.5, 16, 0.00, 140, 'Y', 101),
	(76, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 201~500本', 15, 18.5, 15, 18.5, 16, 0.00, 120, 'Y', 201),
	(77, '年月曆', ' 5 x 7吋 15 x 18.5cm<br>雙面 501 ↑ 本', 15, 18.5, 15, 18.5, 16, 0.00, 110, 'Y', 501),
	(78, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 1本', 15, 18.5, 15, 18.5, 16, 0.00, 250, 'Y', 1),
	(79, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 2~4本', 15, 18.5, 15, 18.5, 16, 0.00, 200, 'Y', 2),
	(80, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 5~10本', 15, 18.5, 15, 18.5, 16, 0.00, 190, 'Y', 5),
	(81, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 11~20本', 15, 18.5, 15, 18.5, 16, 0.00, 180, 'Y', 11),
	(82, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 21~30本', 15, 18.5, 15, 18.5, 16, 0.00, 170, 'Y', 21),
	(83, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 31~50本', 15, 18.5, 15, 18.5, 16, 0.00, 150, 'Y', 31),
	(84, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 51~100本', 15, 18.5, 15, 18.5, 16, 0.00, 130, 'Y', 51),
	(85, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 101~200本', 15, 18.5, 15, 18.5, 16, 0.00, 125, 'Y', 101),
	(86, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 201~500本', 15, 18.5, 15, 18.5, 16, 0.00, 120, 'Y', 201),
	(87, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>單面 501 ↑ 本', 15, 18.5, 15, 18.5, 16, 0.00, 100, 'Y', 501),
	(88, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 1本', 15, 18.5, 15, 18.5, 16, 0.00, 350, 'Y', 1),
	(89, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 2~4本', 15, 18.5, 15, 18.5, 16, 0.00, 300, 'Y', 2),
	(90, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 5~10本', 15, 18.5, 15, 18.5, 16, 0.00, 290, 'Y', 5),
	(91, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 11~20本', 15, 18.5, 15, 18.5, 16, 0.00, 280, 'Y', 11),
	(92, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 21~30本', 15, 18.5, 15, 18.5, 16, 0.00, 250, 'Y', 21),
	(93, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 31~50本', 15, 18.5, 15, 18.5, 16, 0.00, 230, 'Y', 31),
	(94, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 51~100本', 15, 18.5, 15, 18.5, 16, 0.00, 200, 'Y', 51),
	(95, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 101~200本', 15, 18.5, 15, 18.5, 16, 0.00, 180, 'Y', 101),
	(96, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 201~500本', 15, 18.5, 15, 18.5, 16, 0.00, 170, 'Y', 201),
	(97, '年月曆', ' 6 x 8吋 17.5 x 21cm<br>雙面 501 ↑ 本', 15, 18.5, 15, 18.5, 16, 0.00, 160, 'Y', 501),
	(98, '無框畫', '輸出尺寸 60 x 90 cm<br>完成尺寸 50 x 80 cm', 60, 90, 50, 80, 1, 0.00, 999, 'Y', 1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
