# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.18)
# Database: laravel5_blog
# Generation Time: 2017-09-01 09:24:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `column_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `locale` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
	(2,'data_types','display_name_singular',8,'en','Translation','2017-08-26 13:32:32','2017-08-26 13:32:32'),
	(3,'data_types','display_name_plural',8,'en','Translations','2017-08-26 13:32:32','2017-08-26 13:32:32'),
	(4,'data_types','display_name_singular',8,'zh_cn','显示名称','2017-08-26 13:35:10','2017-08-26 13:35:10'),
	(5,'pages','title',1,'en','','2017-08-26 13:37:36','2017-08-26 13:37:36'),
	(6,'pages','slug',1,'en','','2017-08-26 13:37:36','2017-08-26 13:37:36'),
	(7,'pages','body',1,'en','','2017-08-26 13:37:36','2017-08-26 13:37:36'),
	(8,'data_types','display_name_singular',9,'en','Link','2017-08-26 13:51:01','2017-08-26 13:51:01'),
	(9,'data_types','display_name_plural',9,'en','Links','2017-08-26 13:51:01','2017-08-26 13:51:01'),
	(10,'menu_items','title',14,'en','Links','2017-08-26 13:51:26','2017-08-29 04:36:48'),
	(11,'data_types','display_name_singular',7,'en','Permission','2017-08-26 14:17:03','2017-08-26 14:17:03'),
	(12,'data_types','display_name_plural',7,'en','Permissions','2017-08-26 14:17:03','2017-08-26 14:17:03'),
	(13,'data_types','display_name_singular',3,'en','User','2017-08-26 14:38:12','2017-08-26 14:38:12'),
	(14,'data_types','display_name_plural',3,'en','Users','2017-08-26 14:38:12','2017-08-26 14:38:12'),
	(15,'categories','name',1,'en','PHP','2017-08-26 15:06:02','2017-08-26 15:06:02'),
	(16,'data_types','display_name_singular',4,'en','Category','2017-08-26 15:07:23','2017-08-26 15:07:23'),
	(17,'data_types','display_name_plural',4,'en','Categories','2017-08-26 15:07:23','2017-08-26 15:07:23'),
	(24,'links','category_id',8,'en','','2017-08-28 05:43:51','2017-08-28 05:43:51'),
	(25,'links','description',8,'en','','2017-08-28 05:43:51','2017-08-28 05:43:51'),
	(26,'links','name',8,'en','','2017-08-28 05:43:51','2017-08-28 05:43:51'),
	(27,'categories','name',2,'en','','2017-08-29 03:02:58','2017-08-29 03:02:58'),
	(28,'data_types','display_name_singular',1,'en','Post','2017-08-29 03:09:43','2017-08-29 03:09:43'),
	(29,'data_types','display_name_plural',1,'en','Posts','2017-08-29 03:09:43','2017-08-29 03:09:43');

/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
