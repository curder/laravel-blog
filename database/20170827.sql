# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: laralve_blog
# Generation Time: 2017-08-27 13:16:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `color` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`, `color`)
VALUES
	(1,NULL,1,'PHP','php','2017-08-26 09:23:27','2017-08-26 15:07:38','#ccc');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data_rows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`)
VALUES
	(1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(2,1,'author_id','text','Author',1,0,1,1,0,1,NULL,2),
	(3,1,'category_id','text','Category',0,0,1,1,1,0,NULL,3),
	(4,1,'title','text','Title',1,1,1,1,1,1,'{\"validation\":{\"rule\":[\"required\",\"max:60\"]}}',4),
	(5,1,'excerpt','text_area','excerpt',0,0,1,1,1,1,'{\"validation\":{\"rule\":[\"max:200\"]}}',5),
	(6,1,'body','text_area','Body',1,0,1,1,1,1,'{\"validation\":{\"rule\":[\"required\"]}}',6),
	(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),
	(8,1,'slug','text','slug',0,0,1,1,0,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),
	(9,1,'meta_description','text_area','meta_description',0,0,1,1,1,1,NULL,9),
	(10,1,'meta_keywords','text_area','meta_keywords',0,0,1,1,1,1,NULL,10),
	(11,1,'status','select_dropdown','status',0,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),
	(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,NULL,12),
	(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,13),
	(14,2,'id','number','id',1,0,0,0,0,0,'',1),
	(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),
	(16,2,'title','text','title',1,1,1,1,1,1,'',3),
	(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),
	(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),
	(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),
	(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),
	(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),
	(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),
	(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),
	(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),
	(25,2,'image','image','image',0,1,1,1,1,1,'',12),
	(26,3,'id','number','id',1,0,0,0,0,0,NULL,1),
	(27,3,'name','text','name',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:255\"}}',2),
	(28,3,'email','text','email',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|max:255\"}}',3),
	(29,3,'password','password','password',1,0,0,1,1,0,NULL,4),
	(30,3,'remember_token','text','remember_token',0,0,0,0,0,0,NULL,5),
	(31,3,'created_at','timestamp','created_at',0,1,1,0,0,0,NULL,6),
	(32,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,7),
	(33,3,'avatar','image','avatar',0,1,1,1,1,1,NULL,8),
	(34,5,'id','number','id',1,0,0,0,0,0,'',1),
	(35,5,'name','text','name',1,1,1,1,1,1,'',2),
	(36,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),
	(37,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),
	(38,4,'id','number','id',1,0,0,0,0,0,NULL,1),
	(39,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),
	(40,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),
	(41,4,'name','text','name',1,1,1,1,1,1,NULL,4),
	(42,4,'slug','text','slug',1,1,1,1,1,1,NULL,5),
	(43,4,'created_at','timestamp','created_at',0,0,1,0,0,0,NULL,6),
	(44,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,7),
	(45,6,'id','number','id',1,0,0,0,0,0,NULL,1),
	(46,6,'name','text','Name',1,1,1,1,1,1,NULL,2),
	(47,6,'created_at','timestamp','created_at',0,0,0,0,0,0,NULL,4),
	(48,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,5),
	(49,6,'display_name','text','Display Name',1,1,1,1,1,1,NULL,3),
	(50,1,'seo_title','text','seo_title',0,1,1,1,1,1,NULL,14),
	(52,3,'role_id','text','role_id',0,1,1,1,1,1,NULL,9),
	(53,7,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),
	(54,7,'key','text','Key',1,1,1,1,1,1,NULL,2),
	(55,7,'table_name','text','Table Name',0,1,1,1,1,1,NULL,3),
	(56,7,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,4),
	(57,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,5),
	(58,7,'permission_group_id','text','Permission Group Id',0,0,0,0,0,0,NULL,6),
	(59,1,'featured','checkbox','Featured',0,1,1,1,1,1,NULL,15),
	(60,8,'id','number','Id',1,0,0,0,0,0,NULL,1),
	(61,8,'table_name','text','Table Name',1,1,1,1,1,1,NULL,2),
	(62,8,'column_name','text','Column Name',1,1,1,1,1,1,NULL,3),
	(63,8,'foreign_key','text','Foreign Key',0,1,1,1,1,1,NULL,5),
	(64,8,'locale','select_dropdown','Locale',1,1,1,1,1,1,'{\"default\":\"zh_cn\",\"options\":{\"zh_cn\":\"简体中文\",\"en\":\"English\"}}',6),
	(65,8,'value','text','Value',1,1,1,1,1,1,NULL,4),
	(66,8,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,7),
	(67,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,8),
	(68,9,'id','number','Id',1,0,0,0,0,0,NULL,1),
	(69,9,'author_id','number','Author Id',1,0,1,0,0,0,'{\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),
	(70,9,'category_id','select_dropdown','Category Id',1,1,1,1,1,0,'{\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',3),
	(71,9,'name','text','Name',1,1,1,1,1,0,'{\"validation\":{\"rule\":[\"required\",\"max:60\"]}}',4),
	(72,9,'url','text','Url',1,1,1,1,1,0,'{\"validation\":{\"rule\":[\"required\",\"active_url\"]}}',5),
	(73,9,'approved','checkbox','Approved',1,0,1,1,0,0,'{\"default\":\"YES\",\"options\":{\"0\":\"NO\",\"1\":\"YES\"}}',6),
	(74,9,'description','text_area','Description',0,1,1,1,1,1,'{\"null\":\"Nothing\"}',7),
	(75,9,'created_at','timestamp','Created At',0,1,0,0,0,0,NULL,8),
	(76,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,9),
	(77,3,'trusted','checkbox','Trusted',0,1,1,1,1,1,NULL,10),
	(78,4,'color','text','Color',0,1,1,1,1,1,NULL,8);

/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`)
VALUES
	(1,'posts','posts','Post','Posts','voyager-news','App\\Post',NULL,NULL,1,0,'2017-08-26 05:44:08','2017-08-26 11:01:21'),
	(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page','','',1,0,'2017-08-26 05:44:08','2017-08-26 05:44:08'),
	(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User',NULL,NULL,1,0,'2017-08-26 05:44:08','2017-08-26 06:24:21'),
	(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,NULL,1,0,'2017-08-26 05:44:08','2017-08-26 15:07:23'),
	(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu','','',1,0,'2017-08-26 05:44:08','2017-08-26 05:44:08'),
	(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,NULL,1,0,'2017-08-26 05:44:08','2017-08-26 06:56:08'),
	(7,'permissions','permissions','Permission','Permissions','voyager-key','\\TCG\\Voyager\\Models\\Permission',NULL,NULL,1,0,'2017-08-26 07:09:05','2017-08-26 14:17:03'),
	(8,'translations','translations','Translation','Translations','voyager-hammer','TCG\\Voyager\\Models\\Translation',NULL,NULL,1,0,'2017-08-26 12:14:54','2017-08-26 12:16:29'),
	(9,'links','links','Link','Links','voyager-wand','App\\Link',NULL,'Record some classic URLs.',1,1,'2017-08-26 13:46:51','2017-08-26 14:17:36');

/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `links`;

CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `links_category_id_index` (`category_id`),
  KEY `links_approved_index` (`approved`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;

INSERT INTO `links` (`id`, `author_id`, `category_id`, `name`, `url`, `approved`, `description`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'asd','http://blog.webfsd.com',1,'','2017-08-26 14:05:17','2017-08-27 13:12:37'),
	(2,1,1,'测试','https://github.com/curder/cms/tree/master/database',1,'','2017-08-26 15:33:24','2017-08-26 15:45:18');

/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table links_votes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `links_votes`;

CREATE TABLE `links_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `link_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `links_votes` WRITE;
/*!40000 ALTER TABLE `links_votes` DISABLE KEYS */;

INSERT INTO `links_votes` (`id`, `user_id`, `link_id`, `created_at`, `updated_at`)
VALUES
	(2,1,1,'2017-08-26 15:23:29','2017-08-26 15:23:29');

/*!40000 ALTER TABLE `links_votes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`)
VALUES
	(1,1,'Dashboard','/admin','_self','voyager-boat',NULL,NULL,1,'2017-08-26 05:44:08','2017-08-26 05:44:08',NULL,NULL),
	(2,1,'Media','/admin/media','_self','voyager-images',NULL,NULL,5,'2017-08-26 05:44:08','2017-08-26 07:10:13',NULL,NULL),
	(3,1,'Posts','/admin/posts','_self','voyager-news',NULL,NULL,6,'2017-08-26 05:44:08','2017-08-26 07:10:13',NULL,NULL),
	(4,1,'Users','/admin/users','_self','voyager-person',NULL,NULL,4,'2017-08-26 05:44:08','2017-08-26 07:10:13',NULL,NULL),
	(5,1,'Categories','/admin/categories','_self','voyager-categories',NULL,NULL,9,'2017-08-26 05:44:08','2017-08-26 13:53:00',NULL,NULL),
	(6,1,'Pages','/admin/pages','_self','voyager-file-text',NULL,NULL,8,'2017-08-26 05:44:08','2017-08-26 13:53:00',NULL,NULL),
	(7,1,'Roles','/admin/roles','_self','voyager-lock',NULL,NULL,2,'2017-08-26 05:44:08','2017-08-26 05:44:08',NULL,NULL),
	(8,1,'Tools','/admin/posts','_self','voyager-tools','#000000',NULL,10,'2017-08-26 05:44:08','2017-08-26 13:53:00',NULL,''),
	(9,1,'Menu Builder','/admin/menus','_self','voyager-list',NULL,8,1,'2017-08-26 05:44:08','2017-08-26 06:30:30',NULL,NULL),
	(10,1,'Database','/admin/database','_self','voyager-data',NULL,8,2,'2017-08-26 05:44:08','2017-08-26 06:30:32',NULL,NULL),
	(11,1,'Settings','/admin/settings','_self','voyager-settings',NULL,NULL,11,'2017-08-26 05:44:08','2017-08-26 13:53:00',NULL,NULL),
	(12,1,'Permissions','/admin/permissions','_self','voyager-key','#000000',NULL,3,'2017-08-26 07:10:07','2017-08-26 07:21:04',NULL,''),
	(13,1,'Translations','/admin/translations','_self','voyager-hammer','#000000',8,3,'2017-08-26 12:18:12','2017-08-26 12:18:52',NULL,''),
	(14,1,'Links','/admin/links','_self','voyager-wand','#000000',NULL,7,'2017-08-26 13:51:26','2017-08-26 13:53:00',NULL,'');

/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','2017-08-26 05:44:08','2017-08-26 05:44:08');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_01_000000_add_voyager_user_fields',1),
	(4,'2016_01_01_000000_create_data_types_table',1),
	(5,'2016_01_01_000000_create_pages_table',1),
	(6,'2016_01_01_000000_create_posts_table',1),
	(7,'2016_02_15_204651_create_categories_table',1),
	(8,'2016_05_19_173453_create_menu_table',1),
	(9,'2016_10_21_190000_create_roles_table',1),
	(10,'2016_10_21_190000_create_settings_table',1),
	(11,'2016_11_30_135954_create_permission_table',1),
	(12,'2016_11_30_141208_create_permission_role_table',1),
	(13,'2016_12_26_201236_data_types__add__server_side',1),
	(14,'2017_01_13_000000_add_route_to_menu_items_table',1),
	(15,'2017_01_14_005015_create_translations_table',1),
	(16,'2017_01_15_000000_add_permission_group_id_to_permissions_table',1),
	(17,'2017_01_15_000000_create_permission_groups_table',1),
	(18,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),
	(19,'2017_03_06_000000_add_controller_to_data_types_table',1),
	(20,'2017_04_21_000000_add_order_to_data_rows_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,'关于我',NULL,'',NULL,'about-me',NULL,NULL,'ACTIVE','2017-08-26 13:37:36','2017-08-26 13:37:36');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permission_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_groups`;

CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;

INSERT INTO `permission_role` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(1,2),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1);

/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`)
VALUES
	(1,'browse_admin',NULL,'2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(2,'browse_database',NULL,'2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(3,'browse_media',NULL,'2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(4,'browse_settings',NULL,'2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(5,'browse_menus','menus','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(6,'read_menus','menus','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(7,'edit_menus','menus','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(8,'add_menus','menus','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(9,'delete_menus','menus','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(10,'browse_pages','pages','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(11,'read_pages','pages','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(12,'edit_pages','pages','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(13,'add_pages','pages','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(14,'delete_pages','pages','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(15,'browse_roles','roles','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(16,'read_roles','roles','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(17,'edit_roles','roles','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(18,'add_roles','roles','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(19,'delete_roles','roles','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(20,'browse_users','users','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(21,'read_users','users','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(22,'edit_users','users','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(23,'add_users','users','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(24,'delete_users','users','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(25,'browse_posts','posts','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(26,'read_posts','posts','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(27,'edit_posts','posts','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(28,'add_posts','posts','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(29,'delete_posts','posts','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(30,'browse_categories','categories','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(31,'read_categories','categories','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(32,'edit_categories','categories','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(33,'add_categories','categories','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(34,'delete_categories','categories','2017-08-26 05:44:08','2017-08-26 05:44:08',NULL),
	(35,'browse_permissions','permissions','2017-08-26 07:09:05','2017-08-26 07:09:05',NULL),
	(36,'read_permissions','permissions','2017-08-26 07:09:05','2017-08-26 07:09:05',NULL),
	(37,'edit_permissions','permissions','2017-08-26 07:09:05','2017-08-26 07:09:05',NULL),
	(38,'add_permissions','permissions','2017-08-26 07:09:05','2017-08-26 07:09:05',NULL),
	(39,'delete_permissions','permissions','2017-08-26 07:09:05','2017-08-26 07:09:05',NULL),
	(40,'browse_translations','translations','2017-08-26 12:14:54','2017-08-26 12:14:54',NULL),
	(41,'read_translations','translations','2017-08-26 12:14:54','2017-08-26 12:14:54',NULL),
	(42,'edit_translations','translations','2017-08-26 12:14:54','2017-08-26 12:14:54',NULL),
	(43,'add_translations','translations','2017-08-26 12:14:54','2017-08-26 12:14:54',NULL),
	(44,'delete_translations','translations','2017-08-26 12:14:54','2017-08-26 12:14:54',NULL),
	(45,'browse_links','links','2017-08-26 13:46:51','2017-08-26 13:46:51',NULL),
	(46,'read_links','links','2017-08-26 13:46:51','2017-08-26 13:46:51',NULL),
	(47,'edit_links','links','2017-08-26 13:46:51','2017-08-26 13:46:51',NULL),
	(48,'add_links','links','2017-08-26 13:46:51','2017-08-26 13:46:51',NULL),
	(49,'delete_links','links','2017-08-26 13:46:51','2017-08-26 13:46:51',NULL),
	(50,'home.links.store','links','2017-08-27 12:36:14','2017-08-27 12:36:14',NULL);

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`, `featured`)
VALUES
	(1,1,1,'对文章的标题、内容和当前文章的SEO等基本信息进行增删改查操作。','对文章的标题、内容和当前文章的SEO等基本信息进行增删改查操作。','对文章的标题、内容和当前文章的SEO等基本信息进行增删改查操作。','# Avatrade后台管理简述\r\n\r\n文章链接自动生成使用了有道云的翻译，api申请地址：\r\n\r\nhttp://fanyi.youdao.com/openapi?path=data-mode\r\n\r\n将申请到的appKey和appSecret写到.env文件中。\r\n\r\n</p> <p>YOUDAO_APP_KEY=app_key</p> <p>YOUDAO_APP_SECRET=app_secret</p> <p>\r\n\r\n## 图片分组管理\r\n\r\n管理PC和WAP的页面图片，图片尺寸已在相应的栏目中标出。目前暂定有如下图片列表数据：\r\n\r\n### PC\r\n\r\n首页大Banner滚动图，首页的产品交易图片和导航栏上国家列表数据。\r\n\r\n### WAP\r\n\r\n首页大Banner滚动图，导航栏上的列表和首页交易平台的列表数据。\r\n\r\n> 其中在修改和编辑图片时，名称 链接地址 和 图片必须 存在。其他信息可以后期上传或者不传。\r\n\r\n## 分类管理\r\n\r\n管理PC和移动端的导航结构和文章分类。\r\n\r\n在新增和编辑数据时，其中分类地址可填写具体的链接地址。目前有三种链接风格：/post/{slug}.html、/lists/{slug}.html和/pages/{slug}.html（其中slug为标识）\r\n\r\n/posts/{slug}.html\r\n\r\n可以在文章分类下上传一篇相关的文章，然后获取它的前台访问链接。填入：分类地址中。\r\n\r\n/lists/{slug}.html\r\n\r\n这种链接是填写了分类的分类别名生成的地址，其中{slug}为输入的分类别名。这常见于一些栏目列表，比如：技术面、基本面和行业动态。\r\n\r\n其中，该分类下的数据为在文章管理中上传的当前分类下的数据。如果是数据列表必须填写分类别名，以便数据的访问。否则可不填。\r\n\r\n* /pages/{slug}.html\r\n\r\n为单页面，常见于一些专题页面。其中页面所在静态文件的路径为：resources/views/home/pages/{slug}.blade.php。\r\n\r\n## 文章管理\r\n\r\n对文章的标题、内容和当前文章的SEO等基本信息进行增删改查操作。\r\n\r\n## 注册管理\r\n\r\n对前台所有的表单的注册数据进行查询操作。\r\n\r\n## SEO管理\r\n\r\n/posts/{slug}.html 可找到对应的文章进行TDK的更改。\r\n\r\n/lists/{slug}.html 可以找到对应的数据分类进行TDK的更改。\r\n\r\n/lists/{slug}.html 可找到对应的页面模版进行TDK的更改。\r\n\r\n首页找到对应的模版进行修改。\r\n\r\n## 其他管理\r\n\r\n### 管理员管理\r\n\r\n对管理员的增删改查\r\n\r\n对用户分组的增删改查\r\n\r\n对管理员的权限的增删改查','posts/August2017/8xb82SQ7ryLlvCJtFdBQ.jpg','regulation','对文章的标题、内容和当前文章的SEO等基本信息进行增删改查操作。','对文章的标题、内容和当前文章的SEO等基本信息进行增删改查操作。','PENDING','2017-08-26 09:25:43','2017-08-26 11:54:13',0),
	(2,1,1,'C语言中的关键字','SEO-Title','关键字，关键字的基本概念和控制流程关键字','# 关键字\r\n\r\n## 关键字的基本概念\r\n\r\n- 被C语言赋予了特殊含义的单词\r\n\r\n    + 关键字特征:全部都是小写\r\n    \r\n    + 关键字在开发工具中会显示特殊颜色\r\n    \r\n    > 编译器严格区分大小写\r\n    > 注意: 关键字不能用作变量名、函数名等\r\n\r\n- C语言中一共有32个关键字\r\n\r\n + auto double int struct break else long switch\r\n +  case enum register typedef char extern return\r\n + union const float short unsigned continue for\r\n + signed void default goto sizeof volatile do if while static\r\n\r\n> 这些不用专门去记住,用多了就会了。在编译器里都是有特殊颜色的。 我们用到时候会一个一个讲解这个些关键字怎么用,现在浏览下,有个印象就OK了。\r\n\r\n\r\n## 数据类型关键字\r\n\r\n- 基本数据类型(5个)\r\n\r\n    + void :声明函数无返回值或无参数,声明无类型指针,显式丢弃运算结果\r\n    + char :字符型类型数据,属于整型数据的一种\r\n    + int :整型数据,通常为编译器指定的机器字长\r\n    + float :单精度浮点型数据,属于浮点数据的一种\r\n    + double :双精度浮点型数据,属于浮点数据的一种\r\n\r\n- 类型修饰关键字(4个)\r\n    + short :修饰int,短整型数据,可省略被修饰的int。\r\n    + long :修饰int,长整形数据,可省略被修饰的int。\r\n    + signed :修饰整型数据,有符号数据类型\r\n    + unsigned :修饰整型数据,无符号数据类型\r\n\r\n- 复杂类型关键字(5个) struct :结构体声明分区\r\n    + struct :结构体声明\r\n    + union :共用体声明\r\n    + enum :枚举声明\r\n    + typedef :声明类型别名\r\n    + sizeof :得到特定类型或特定类型变量的大小\r\n\r\n- 存储级别关键字(6个)\r\n    + auto :指定为自动变量,由编译器自动分配及释放。通常在栈上分配\r\n    + static :指定为静态变量,分配在静态变量区,修饰函数时,指定函数作用域为文件内部\r\n    + register :指定为寄存器变量,建议编译器将变量存储到寄存器中使用,也可以修饰函数形参,建议编译器通过寄存器而不是堆栈传递参数\r\n    + extern :指定对应变量为外部变量,即标示变量或者函数的定义在别的文件中,?示编译器遇到此变量和函数时在其他模块中寻找其定义。\r\n    + const :与volatile合称“cv特性”,指定变量不可被当前线程/进程改变(但有可能被系统或其他线程/进程改变)\r\n    + volatile :与const合称“cv特性”,指定变量的值有可能会被系统或其他进程/线程改变, 强制编译器每次从内存中取得该变量的值\r\n\r\n\r\n## 流程控制关键字\r\n\r\n- 跳转结构(4个)\r\n    + return :用在函数体中,返回特定值(或者是void值,即不返回值)\r\n    + continue :结束当前循环,开始下一轮循环\r\n    + break :跳出当前循环或switch结构\r\n    + goto :无条件跳转语句\r\n\r\n- 分支结构(5个)\r\n    + if :条件语句,后面不需要放分号\r\n    + else :条件语句否定分支(与if连用)\r\n    + switch :开关语句(多重分支语句)\r\n    + case :开关语句中的分支标记\r\n    + default :开关语句中的“其他”分支,可选。\r\n\r\n- 循环结构(3个)\r\n    + for:for循环结构,for(1;2;3)4;的执行顺序为1->2->4->3->2...循环,其中2为循环条件。在整个for循环过程中,表达式1只计算一次,表达式2和表达式3则可能计算多次,也可能一次也 不计算。循环体可能多次执行,也可能一次都不执行。\r\n    + do :do循环结构,do 1 while(2); 的执行顺序是1->2->1...循环,2为循环条件\r\n    + while :while循环结构,while(1) 2; 的执行顺序是1->2->1...循环,1为循环条件 以上循环语句,当循环条件表达式为真则继续循环,为假则跳出循环。',NULL,'key-words-in-c-language','关键字，关键字的基本概念和控制流程关键字','关键字，关键字的基本概念和控制流程关键字','PUBLISHED','2017-08-26 12:09:14','2017-08-26 12:09:14',0);

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Administrator','2017-08-26 05:44:08','2017-08-26 05:44:08'),
	(2,'user','Normal User','2017-08-26 05:44:08','2017-08-26 05:44:08');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`)
VALUES
	(1,'admin_title','网站标题','孤独的坚持者',NULL,'text',0),
	(2,'admin_description','网站描述','Web Dev Blog',NULL,'text',1);

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(10,'menu_items','title',14,'en','','2017-08-26 13:51:26','2017-08-26 13:51:26'),
	(11,'data_types','display_name_singular',7,'en','Permission','2017-08-26 14:17:03','2017-08-26 14:17:03'),
	(12,'data_types','display_name_plural',7,'en','Permissions','2017-08-26 14:17:03','2017-08-26 14:17:03'),
	(13,'data_types','display_name_singular',3,'en','User','2017-08-26 14:38:12','2017-08-26 14:38:12'),
	(14,'data_types','display_name_plural',3,'en','Users','2017-08-26 14:38:12','2017-08-26 14:38:12'),
	(15,'categories','name',1,'en','PHP','2017-08-26 15:06:02','2017-08-26 15:06:02'),
	(16,'data_types','display_name_singular',4,'en','Category','2017-08-26 15:07:23','2017-08-26 15:07:23'),
	(17,'data_types','display_name_plural',4,'en','Categories','2017-08-26 15:07:23','2017-08-26 15:07:23'),
	(18,'links','category_id',2,'en','1','2017-08-26 15:44:43','2017-08-26 15:44:43'),
	(19,'links','description',2,'en','','2017-08-26 15:44:43','2017-08-26 15:44:43'),
	(20,'links','name',2,'en','test','2017-08-26 15:44:43','2017-08-26 15:45:25'),
	(21,'links','category_id',1,'en','1','2017-08-27 13:12:30','2017-08-27 13:12:30'),
	(22,'links','description',1,'en','','2017-08-27 13:12:30','2017-08-27 13:12:30'),
	(23,'links','name',1,'en','asd','2017-08-27 13:12:30','2017-08-27 13:12:30');

/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trusted` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`, `trusted`)
VALUES
	(1,1,'Admin','admin@admin.com','users/default.png','$2y$10$SHq7YlKQxrgPyou6OWcqSeIAlI0URz/clmSvXsDLCUGk2yri8Zt9y','VgTKSyJx8OanSqJxVvhcwENKhJHu47Sf37E1Nz0fI6TYW8N3rGY4VUIwT1qF','2017-08-26 05:51:20','2017-08-26 05:51:20',0),
	(2,2,'curder','curder@foxmail.com','users/August2017/dqqK1ZQopkVDZWaknU3C.jpg','$2y$10$8V5YEqG1clo6p6WeAdTuj..9k4T.FVbMpdzjXEozhF7xZ19/StMta','Xfm8cqaIMrJEkBttgkx9lIZr58ZhzatBze4hfbi3PDj3mACcAyC4KQ3GBOhI','2017-08-26 06:30:58','2017-08-26 06:30:58',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
