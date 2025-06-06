/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES
(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2025-06-03 09:38:17','2025-06-03 09:38:17','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.',0,'post-trashed','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'cron','a:11:{i:1748943497;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1748943498;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1748944040;a:3:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1748944041;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1748944100;a:1:{s:28:\"wp_update_comment_type_batch\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1748946126;a:1:{s:8:\"do_pings\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1748947097;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1748948897;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1748950697;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1749029897;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on'),
(2,'siteurl','http://cdomet-d.42.fr','on'),
(3,'home','http://cdomet-d.42.fr','on'),
(4,'blogname','cdomet-d&#039;s blog','on'),
(5,'blogdescription','','on'),
(6,'users_can_register','0','on'),
(7,'admin_email','cdomet-d@student.42lyon.fr','on'),
(8,'start_of_week','1','on'),
(9,'use_balanceTags','0','on'),
(10,'use_smilies','1','on'),
(11,'require_name_email','1','on'),
(12,'comments_notify','1','on'),
(13,'posts_per_rss','10','on'),
(14,'rss_use_excerpt','0','on'),
(15,'mailserver_url','mail.example.com','on'),
(16,'mailserver_login','login@example.com','on'),
(17,'mailserver_pass','','on'),
(18,'mailserver_port','110','on'),
(19,'default_category','1','on'),
(20,'default_comment_status','open','on'),
(21,'default_ping_status','open','on'),
(22,'default_pingback_flag','1','on'),
(23,'posts_per_page','10','on'),
(24,'date_format','F j, Y','on'),
(25,'time_format','g:i a','on'),
(26,'links_updated_date_format','F j, Y g:i a','on'),
(27,'comment_moderation','0','on'),
(28,'moderation_notify','1','on'),
(29,'permalink_structure','','on'),
(30,'rewrite_rules','','on'),
(31,'hack_file','0','on'),
(32,'blog_charset','UTF-8','on'),
(33,'moderation_keys','','off'),
(34,'active_plugins','a:1:{i:0;s:22:\"embed-github/index.php\";}','on'),
(35,'category_base','','on'),
(36,'ping_sites','http://rpc.pingomatic.com/','on'),
(37,'comment_max_links','2','on'),
(38,'gmt_offset','0','on'),
(39,'default_email_category','1','on'),
(40,'recently_edited','','off'),
(41,'template','bjork','on'),
(42,'stylesheet','bjork','on'),
(43,'comment_registration','0','on'),
(44,'html_type','text/html','on'),
(45,'use_trackback','0','on'),
(46,'default_role','subscriber','on'),
(47,'db_version','58975','on'),
(48,'uploads_use_yearmonth_folders','1','on'),
(49,'upload_path','','on'),
(50,'blog_public','1','on'),
(51,'default_link_category','2','on'),
(52,'show_on_front','posts','on'),
(53,'tag_base','','on'),
(54,'show_avatars','1','on'),
(55,'avatar_rating','G','on'),
(56,'upload_url_path','','on'),
(57,'thumbnail_size_w','150','on'),
(58,'thumbnail_size_h','150','on'),
(59,'thumbnail_crop','1','on'),
(60,'medium_size_w','300','on'),
(61,'medium_size_h','300','on'),
(62,'avatar_default','mystery','on'),
(63,'large_size_w','1024','on'),
(64,'large_size_h','1024','on'),
(65,'image_default_link_type','none','on'),
(66,'image_default_size','','on'),
(67,'image_default_align','','on'),
(68,'close_comments_for_old_posts','0','on'),
(69,'close_comments_days_old','14','on'),
(70,'thread_comments','1','on'),
(71,'thread_comments_depth','5','on'),
(72,'page_comments','0','on'),
(73,'comments_per_page','50','on'),
(74,'default_comments_page','newest','on'),
(75,'comment_order','asc','on'),
(76,'sticky_posts','a:0:{}','on'),
(77,'widget_categories','a:0:{}','on'),
(78,'widget_text','a:0:{}','on'),
(79,'widget_rss','a:0:{}','on'),
(80,'uninstall_plugins','a:0:{}','off'),
(81,'timezone_string','','on'),
(82,'page_for_posts','0','on'),
(83,'page_on_front','0','on'),
(84,'default_post_format','0','on'),
(85,'link_manager_enabled','0','on'),
(86,'finished_splitting_shared_terms','1','on'),
(87,'site_icon','0','on'),
(88,'medium_large_size_w','768','on'),
(89,'medium_large_size_h','0','on'),
(90,'wp_page_for_privacy_policy','3','on'),
(91,'show_comments_cookies_opt_in','1','on'),
(92,'admin_email_lifespan','1764495497','on'),
(93,'disallowed_keys','','off'),
(94,'comment_previously_approved','1','on'),
(95,'auto_plugin_theme_update_emails','a:0:{}','off'),
(96,'auto_update_core_dev','enabled','on'),
(97,'auto_update_core_minor','enabled','on'),
(98,'auto_update_core_major','enabled','on'),
(99,'wp_force_deactivated_plugins','a:0:{}','on'),
(100,'wp_attachment_pages_enabled','0','on'),
(101,'initial_db_version','58975','on'),
(102,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','on'),
(103,'fresh_site','0','off'),
(104,'user_count','2','off'),
(105,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto'),
(106,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','auto'),
(107,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(108,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(109,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(110,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(111,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(112,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(113,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(114,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(115,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(116,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(117,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(118,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(119,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(120,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(130,'theme_mods_twentytwentyfive','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1748943500;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','off'),
(131,'current_theme','Björk','auto'),
(132,'theme_mods_bjork','a:3:{s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}','on'),
(133,'theme_switched','','auto'),
(147,'can_compress_scripts','1','on'),
(159,'recently_activated','a:1:{s:22:\"embed-github/index.php\";i:1749128344;}','off'),
(172,'wp_calendar_block_has_published_posts','','auto'),
(232,'ghbpro-redirect','1','auto'),
(338,'_site_transient_timeout_wp_theme_files_patterns-6c5a5152bb57e3a9a4d0e6a0f08d0404','1749130342','off'),
(339,'_site_transient_wp_theme_files_patterns-6c5a5152bb57e3a9a4d0e6a0f08d0404','a:2:{s:7:\"version\";s:5:\"0.2.4\";s:8:\"patterns\";a:16:{s:16:\"blog-excerpt.php\";a:4:{s:5:\"title\";s:29:\"Blog posts shown as excerpts.\";s:4:\"slug\";s:18:\"bjork/blog-excerpt\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:10:\"bjork-blog\";}}s:20:\"blog-grid-cols-2.php\";a:4:{s:5:\"title\";s:68:\"Two column blog post grid with featured image, post date, and title.\";s:4:\"slug\";s:22:\"bjork/blog-grid-cols-2\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:10:\"bjork-blog\";}}s:20:\"blog-grid-cols-3.php\";a:4:{s:5:\"title\";s:70:\"Three column blog post grid with featured image, post date, and title.\";s:4:\"slug\";s:22:\"bjork/blog-grid-cols-3\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:10:\"bjork-blog\";}}s:13:\"blog-list.php\";a:4:{s:5:\"title\";s:57:\"Blog post list with featured image, post date, and title.\";s:4:\"slug\";s:15:\"bjork/blog-list\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:10:\"bjork-blog\";}}s:18:\"cta-horizontal.php\";a:4:{s:5:\"title\";s:26:\"Horizontal call to action.\";s:4:\"slug\";s:20:\"bjork/cta-horizontal\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:9:\"bjork-cta\";}}s:16:\"cta-vertical.php\";a:4:{s:5:\"title\";s:24:\"Vertical call to action.\";s:4:\"slug\";s:18:\"bjork/cta-vertical\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:9:\"bjork-cta\";}}s:35:\"general-columns-with-paragraphs.php\";a:4:{s:5:\"title\";s:32:\"Columns with paragraphs of text.\";s:4:\"slug\";s:37:\"bjork/general-columns-with-paragraphs\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:24:\"general-demo-content.php\";a:4:{s:5:\"title\";s:70:\"Demo content for the theme, and default content for the Home template.\";s:4:\"slug\";s:26:\"bjork/general-demo-content\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:26:\"general-featured-items.php\";a:4:{s:5:\"title\";s:59:\"Featured items with a image, heading, paragraph and button.\";s:4:\"slug\";s:28:\"bjork/general-featured-items\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:32:\"general-follow-us-horizontal.php\";a:4:{s:5:\"title\";s:43:\"Follow us section with a horizontal layout.\";s:4:\"slug\";s:34:\"bjork/general-follow-us-horizontal\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:30:\"general-follow-us-vertical.php\";a:4:{s:5:\"title\";s:41:\"Follow us section with a vertical layout.\";s:4:\"slug\";s:32:\"bjork/general-follow-us-vertical\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:33:\"general-hero-full-height-wide.php\";a:4:{s:5:\"title\";s:52:\"Wide and full height hero with headings and buttons.\";s:4:\"slug\";s:30:\"bjork/general-hero-full-height\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:28:\"general-hero-full-height.php\";a:4:{s:5:\"title\";s:43:\"Full height hero with headings and buttons.\";s:4:\"slug\";s:30:\"bjork/general-hero-full-height\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:21:\"general-hero-wide.php\";a:4:{s:5:\"title\";s:36:\"Wide hero with headings and buttons.\";s:4:\"slug\";s:23:\"bjork/general-hero-wide\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:24:\"general-recent-posts.php\";a:4:{s:5:\"title\";s:49:\"Section with recent posts displayed horizontally.\";s:4:\"slug\";s:26:\"bjork/general-recent-posts\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}s:24:\"general-testimonials.php\";a:4:{s:5:\"title\";s:21:\"Testimonials section.\";s:4:\"slug\";s:26:\"bjork/general-testimonials\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:13:\"bjork-general\";}}}}','off'),
(340,'_transient_doing_cron','1749128905.4083690643310546875000','on');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(2,3,'_wp_page_template','default'),
(8,8,'_wp_attached_file','2025/06/CODING.jpg'),
(9,8,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:427;s:4:\"file\";s:18:\"2025/06/CODING.jpg\";s:8:\"filesize\";i:29872;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"CODING-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11806;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"CODING-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5849;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(10,9,'_wp_attached_file','2025/06/mail.jpg'),
(11,9,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:427;s:4:\"file\";s:16:\"2025/06/mail.jpg\";s:8:\"filesize\";i:55852;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:16:\"mail-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11067;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:16:\"mail-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5989;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(23,66,'_wp_attached_file','2025/06/rsz_122_sandrine-min-1-edited.png'),
(24,66,'_wp_attachment_image_alt','profesionnal shot of cdomet-d'),
(25,66,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:1132;s:6:\"height\";i:849;s:4:\"file\";s:41:\"2025/06/rsz_122_sandrine-min-1-edited.png\";s:8:\"filesize\";i:964786;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:41:\"rsz_122_sandrine-min-1-edited-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:87448;}s:5:\"large\";a:5:{s:4:\"file\";s:42:\"rsz_122_sandrine-min-1-edited-1024x768.png\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:987599;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:41:\"rsz_122_sandrine-min-1-edited-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:35301;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:41:\"rsz_122_sandrine-min-1-edited-768x576.png\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:567076;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:12:\"parent_image\";a:2:{s:13:\"attachment_id\";s:1:\"7\";s:4:\"file\";s:34:\"2025/06/rsz_122_sandrine-min-1.png\";}}'),
(36,119,'_edit_lock','1749117865:1'),
(37,124,'origin','theme'),
(38,127,'origin','theme'),
(39,139,'_edit_lock','1749117766:1'),
(48,146,'origin','theme'),
(50,119,'_edit_last','1'),
(51,119,'footnotes','');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(3,1,'2025-06-03 09:38:17','2025-06-03 09:38:17','<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://cdomet-d.42.fr.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n','Privacy Policy','','draft','closed','open','','privacy-policy','','','2025-06-03 09:38:17','2025-06-03 09:38:17','',0,'http://cdomet-d.42.fr/?page_id=3',0,'page','',0),
(4,1,'2025-06-03 09:47:21','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2025-06-03 09:47:21','0000-00-00 00:00:00','',0,'https://cdomet-d.42.fr/?p=4',0,'post','',0),
(5,1,'2025-06-03 09:47:49','2025-06-03 09:47:49','{\"styles\":{\"elements\":{\"button\":{\"color\":{\"background\":\"var:preset|color|vivid-red\"}}}},\"settings\":{\"color\":{\"palette\":{\"theme\":[{\"slug\":\"foreground\",\"color\":\"#111111\",\"name\":\"Foreground\"},{\"slug\":\"background\",\"color\":\"#FFFFFF\",\"name\":\"Background\"},{\"slug\":\"primary\",\"color\":\"#cf2e2e\",\"name\":\"Primary\"},{\"slug\":\"secondary\",\"color\":\"#6B6A6A\",\"name\":\"Secondary\"},{\"slug\":\"tertiary\",\"color\":\"#E2E2E2\",\"name\":\"Tertiary\"},{\"slug\":\"quaternary\",\"color\":\"#F3F2F2\",\"name\":\"Quaternary\"}]}}},\"isGlobalStylesUserThemeJSON\":true,\"version\":3}','Custom Styles','','publish','closed','closed','','wp-global-styles-bjork','','','2025-06-05 08:12:09','2025-06-05 08:12:09','',0,'https://cdomet-d.42.fr/?p=5',0,'wp_global_styles','',0),
(8,1,'2025-06-03 10:05:09','2025-06-03 10:05:09','','CODING','','inherit','open','closed','','coding','','','2025-06-03 10:05:09','2025-06-03 10:05:09','',0,'http://cdomet-d.42.fr/wp-content/uploads/2025/06/CODING.jpg',0,'attachment','image/jpeg',0),
(9,1,'2025-06-03 10:08:34','2025-06-03 10:08:34','','mail','','inherit','open','closed','','mail','','','2025-06-03 10:08:34','2025-06-03 10:08:34','',0,'http://cdomet-d.42.fr/wp-content/uploads/2025/06/mail.jpg',0,'attachment','image/jpeg',0),
(10,1,'2025-06-03 10:20:38','2025-06-03 10:20:38','<!-- wp:navigation-link {\"label\":\"Home\",\"url\":\"#\",\"kind\":\"custom\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"About me\",\"url\":\"#\",\"kind\":\"custom\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:home-link /-->','Menu','','publish','closed','closed','','menu','','','2025-06-03 14:55:37','2025-06-03 14:55:37','',0,'https://cdomet-d.42.fr/?p=10',0,'wp_navigation','',0),
(66,1,'2025-06-03 14:18:33','2025-06-03 14:18:33','the most commercial picture of me known to man','rsz_122_sandrine-min','','inherit','open','closed','','rsz_122_sandrine-min','','','2025-06-03 14:18:33','2025-06-03 14:18:33','',0,'http://cdomet-d.42.fr/wp-content/uploads/2025/06/rsz_122_sandrine-min-1-edited.png',0,'attachment','image/png',0),
(119,1,'2025-06-03 15:58:50','2025-06-03 15:58:50','<!-- wp:paragraph -->\n<p>If one thing is true about me, it\'s that I love many, very different things. This led me to try a <em>lot</em> of things before finding the thing I really want to do everyday for the rest of my life</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>While that provides me with a lot of adaptability and a wide variety of professional experience, it isn\'t really pretty on a resume. The path I took may look winding and illogical, but there was an internal reasoning that I feel I never get a true chance of explaining. This <em>About Me</em> section is a way for me to do just that. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you\'d like the formal, polished version with dates and everything, please refer instead to my <a href=\"https://www.linkedin.com/in/coralie-domet-de-mont/\">LinkedIn profile</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">I used to be an artist, okay</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>I was <em>not </em>predisposed in the slightest to become a software engineer. After struggling with math and science for my entire education and dropping those subjects as soon as I legally could, I graduated high-school with a literary-focused diploma and promptly went to work in the movie industry as a make-up artist.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>However, that trade and I were not a really good fit. Though it definitely can be challenging and involves a lot of on the fly problem solving, it lacked something that I could not quite place at the time. I decided to enroll in college in 2017, preparing a social sciences degree geared towards cultural management with the vague idea of working in movie production. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>I hugely enjoyed my time in college - my degree was was strongly oriented towards social theory and research, culminating in the production of a short thesis on a subject of our choice; I chose to work on meme propagation and Internet culture, a fascinating subject that crosses over sociology, communication and linguistics.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It was also during this time that I was introduced to programming, specifically HTML, CSS and JavaScript in a website management class. I really enjoyed it, even completing my final internship deploying a <a href=\"https://nina-parisi.com/\">simple website</a> for a photographer.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">The shift</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>After graduating, I pursued a career in movie production for a year, briefly working as a production assistant for a YouTube channel, but COVID had made work opportunities scarce; by the end of 2021, out of necessity, I had to pivot to a completely different industry.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>I became an administrative manager for a service provider under the French government. My missions included tracking and billing thousands of service orders and preparing monthly reports for company\'s decision makers. Most of the monitoring was made by hand when I first started, and it wasn\'t long before I grew frustrated with the inefficiency of the process; I started automating most of my tasks, using simple Excel formulas who grew more and more complicated as I added features to my system. Soon, it spread throughout the team, and I started informally training new recruits on how to use and improve it.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>While my automation - stat generation, automated warnings and reminders - where nothing groundbreaking, I loved setting it up. Ironically, I had more fun streamlining Excel workflows than I ever did working in the movie industry; I grew to accept that.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>From there, the shift to computer science was easier than one might think. As I was relating my Excel adventures to my gathered friends one evening, a programmer among them suggested I try software development as a career. I outright rejected the idea - after all, I used to be an artist. I was not logical, not smart enough and most importantly, horrible at math. Surely, I wouldn\'t not be able to take up to programming, right ?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Wrong.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>I was able to take up programming, and it was the greatest thing to happen in my professional life. I love understanding how computers work and how we can make them do things. I love spending hours debugging something, because it\'s horrible but <em>it\'s so fun</em>. I love figuring out a solution in the shower, when I\'m not even thinking about work.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Since starting at 42 in November 2023, my passion for programming has only grown. I love diving deep into concepts and tackling complex problems. I retained my love of automation, and that motivates my interest in robotics; I enjoy the idea of working in industrial automation, to help people get relief from repetitive, bone-breaking tasks.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','About me','','publish','closed','closed','','about-me','','','2025-06-05 10:02:28','2025-06-05 10:02:28','',0,'https://cdomet-d.42.fr/?page_id=119',0,'page','',0),
(124,1,'2025-06-03 16:02:49','2025-06-03 16:02:49','<!-- wp:template-part {\"slug\":\"header\",\"theme\":\"bjork\",\"tagName\":\"header\",\"className\":\"site-header\"} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"margin\":{\"top\":\"0\",\"bottom\":\"0\"}}},\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"margin-top:0;margin-bottom:0\"><!-- wp:columns {\"align\":\"wide\",\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"0px\"}}}} -->\n<div class=\"wp-block-columns alignwide\" style=\"margin-bottom:0px\"><!-- wp:column {\"width\":\"23%\",\"className\":\"site-sidebar-col\"} -->\n<div class=\"wp-block-column site-sidebar-col\" style=\"flex-basis:23%\"><!-- wp:template-part {\"slug\":\"sidebar\",\"theme\":\"bjork\",\"tagName\":\"aside\",\"className\":\"site-sidebar\"} /--></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"77%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:77%\"><!-- wp:group {\"tagName\":\"main\",\"layout\":{\"inherit\":true,\"type\":\"constrained\"}} -->\n<main class=\"wp-block-group\"><!-- wp:cover {\"dimRatio\":0,\"overlayColor\":\"quaternary\",\"isUserOverlayColor\":true,\"minHeight\":90,\"minHeightUnit\":\"vh\",\"isDark\":false,\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"0vh\",\"right\":\"0vh\",\"bottom\":\"0vh\",\"left\":\"0vh\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-cover alignwide is-light\" style=\"padding-top:0vh;padding-right:0vh;padding-bottom:0vh;padding-left:0vh;min-height:90vh\"><span aria-hidden=\"true\" class=\"wp-block-cover__background has-quaternary-background-color has-background-dim-0 has-background-dim\"></span><div class=\"wp-block-cover__inner-container\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"bottom\":\"0vh\",\"top\":\"0vh\"},\"blockGap\":\"2rem\"}},\"textColor\":\"foreground\"} -->\n<div class=\"wp-block-group alignwide has-foreground-color has-text-color\" style=\"padding-top:0vh;padding-bottom:0vh\"><!-- wp:heading {\"level\":1,\"style\":{\"spacing\":{\"margin\":{\"top\":\"0px\"}}},\"textColor\":\"secondary\",\"fontSize\":\"extra-large\"} -->\n<h1 class=\"wp-block-heading has-secondary-color has-text-color has-extra-large-font-size\" style=\"margin-top:0px\">Hi there!\n							</h1>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1 class=\"wp-block-heading\">My name is Coralie and this is my website.</h1>\n<!-- /wp:heading -->\n\n<!-- wp:media-text {\"mediaId\":66,\"mediaType\":\"image\"} -->\n<div class=\"wp-block-media-text is-stacked-on-mobile\"><figure class=\"wp-block-media-text__media\"><img src=\"http://cdomet-d.42.fr/wp-content/uploads/2025/06/rsz_122_sandrine-min-1-edited-1024x768.png\" alt=\"profesionnal shot of cdomet-d\" class=\"wp-image-66 size-full\"/></figure><div class=\"wp-block-media-text__content\"><!-- wp:paragraph {\"placeholder\":\"Content…\"} -->\n<p>I used to be a makeup artist, but I\'ve decided I like computer science more. You can learn more about me below.</p>\n<!-- /wp:paragraph --></div></div>\n<!-- /wp:media-text -->\n\n<!-- wp:buttons {\"style\":{\"spacing\":{\"blockGap\":\"1em\"}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"center\"}} -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"textColor\":\"primary\",\"className\":\"is-style-outline\"} -->\n<div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link has-primary-color has-text-color wp-element-button\" href=\"https://cdomet-d.42.fr/?page_id=119\" rel=\"nofollow\">About\n										Me</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons --></div>\n<!-- /wp:group --></div></div>\n<!-- /wp:cover -->\n\n<!-- wp:separator {\"className\":\"is-style-bjork-angled-separator-wide\",\"backgroundColor\":\"tertiary\"} -->\n<hr class=\"wp-block-separator has-text-color has-tertiary-color has-alpha-channel-opacity has-tertiary-background-color has-background is-style-bjork-angled-separator-wide\"/>\n<!-- /wp:separator -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"backgroundColor\":\"quaternary\",\"textColor\":\"foreground\"} -->\n<div class=\"wp-block-column has-foreground-color has-quaternary-background-color has-text-color has-background\"><!-- wp:image {\"id\":9,\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"style\":{\"border\":{\"radius\":{\"topLeft\":\"0px\",\"topRight\":\"0px\",\"bottomLeft\":\"0px\",\"bottomRight\":\"0px\"}}}} -->\n<figure class=\"wp-block-image size-full has-custom-border\"><img src=\"http://cdomet-d.42.fr/wp-content/uploads/2025/06/mail.jpg\" alt=\"\" class=\"wp-image-9\" style=\"border-top-left-radius:0px;border-top-right-radius:0px;border-bottom-left-radius:0px;border-bottom-right-radius:0px\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"margin\":{\"top\":\"0px\",\"bottom\":\"0px\"},\"blockGap\":\"1.5rem\"}},\"backgroundColor\":\"quaternary\"} -->\n<div class=\"wp-block-group has-quaternary-background-color has-background\" style=\"margin-top:0px;margin-bottom:0px\"><!-- wp:heading {\"textAlign\":\"left\",\"level\":6,\"style\":{\"typography\":{\"lineHeight\":\"1\"}}} -->\n<h6 class=\"wp-block-heading has-text-align-left\" id=\"my-story\" style=\"line-height:1\">Reach out</h6>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"align\":\"left\",\"fontSize\":\"small\"} -->\n<p class=\"has-text-align-left has-small-font-size\">Curious about anything? Reach out !</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:buttons {\"layout\":{\"type\":\"flex\",\"justifyContent\":\"center\"}} -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"backgroundColor\":\"foreground\",\"fontSize\":\"tiny\"} -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link has-foreground-background-color has-background has-tiny-font-size has-custom-font-size wp-element-button\" href=\"http://mailto:cdomet-d@student.42lyon.fr\">s(hoot) me an email</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons --></div>\n<!-- /wp:group --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"backgroundColor\":\"quaternary\",\"textColor\":\"foreground\"} -->\n<div class=\"wp-block-column has-foreground-color has-quaternary-background-color has-text-color has-background\"><!-- wp:image {\"id\":8,\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"style\":{\"border\":{\"radius\":{\"topLeft\":\"0px\",\"topRight\":\"0px\",\"bottomLeft\":\"0px\",\"bottomRight\":\"0px\"}}}} -->\n<figure class=\"wp-block-image size-full has-custom-border\"><img src=\"http://cdomet-d.42.fr/wp-content/uploads/2025/06/CODING.jpg\" alt=\"\" class=\"wp-image-8\" style=\"border-top-left-radius:0px;border-top-right-radius:0px;border-bottom-left-radius:0px;border-bottom-right-radius:0px\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"1.5rem\",\"margin\":{\"top\":\"0px\",\"bottom\":\"0px\"}}},\"backgroundColor\":\"quaternary\"} -->\n<div class=\"wp-block-group has-quaternary-background-color has-background\" style=\"margin-top:0px;margin-bottom:0px\"><!-- wp:heading {\"textAlign\":\"left\",\"level\":6,\"style\":{\"typography\":{\"lineHeight\":\"1\"}}} -->\n<h6 class=\"wp-block-heading has-text-align-left\" id=\"my-story\" style=\"line-height:1\">Projects</h6>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"align\":\"left\",\"fontSize\":\"small\"} -->\n<p class=\"has-text-align-left has-small-font-size\">I have done some stuff, mostly school projects. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:buttons {\"layout\":{\"type\":\"flex\",\"justifyContent\":\"center\"}} -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"backgroundColor\":\"foreground\",\"fontSize\":\"tiny\"} -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link has-foreground-background-color has-background has-tiny-font-size has-custom-font-size wp-element-button\" href=\"https://github.com/cdomet-d\">look them up on github</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons --></div>\n<!-- /wp:group --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"bjork\",\"tagName\":\"footer\",\"className\":\"site-footer\"} /--></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:group -->','Front Page','Displays your site\'s homepage, whether it is set to display latest posts or a static page. The Front Page template takes precedence over all templates.','publish','closed','closed','','front-page','','','2025-06-05 08:11:15','2025-06-05 08:11:15','',0,'https://cdomet-d.42.fr/?p=124',0,'wp_template','',0),
(126,1,'2025-06-03 16:05:05','2025-06-03 16:05:05','<!-- wp:navigation-link {\"label\":\"About me\",\"type\":\"link\",\"url\":\"https://cdomet-d.42.fr/?page_id=119\",\"kind\":\"custom\",\"isTopLevelLink\":true} /-->\n\n<!-- wp:navigation-link {\"label\":\"Projects\",\"url\":\"https://cdomet-d.42.fr/?page_id=139\",\"kind\":\"custom\",\"isTopLevelLink\":true} /-->','Menu 2','','publish','closed','closed','','menu-2','','','2025-06-05 08:08:36','2025-06-05 08:08:36','',0,'https://cdomet-d.42.fr/?p=126',0,'wp_navigation','',0),
(127,1,'2025-06-03 16:05:05','2025-06-03 16:05:05','<!-- wp:group {\"style\":{\"spacing\":{\"margin\":{\"top\":\"0px\",\"bottom\":\"0px\"},\"blockGap\":\"2em\"}},\"layout\":{\"type\":\"flex\",\"orientation\":\"vertical\"}} -->\n<div class=\"wp-block-group\" style=\"margin-top:0px;margin-bottom:0px\"><!-- wp:site-title {\"style\":{\"typography\":{\"fontStyle\":\"normal\",\"fontWeight\":\"100\"}},\"fontSize\":\"heading-5\"} /-->\n\n<!-- wp:navigation {\"ref\":126,\"style\":{\"spacing\":{\"blockGap\":\"0.25em\"}},\"fontSize\":\"large\",\"layout\":{\"type\":\"flex\",\"orientation\":\"vertical\"}} /-->\n\n<!-- wp:social-links {\"iconColor\":\"foreground\",\"iconColorValue\":\"inherit\",\"className\":\"is-style-logos-only\",\"style\":{\"spacing\":{\"blockGap\":{\"top\":\"1em\",\"left\":\"1em\"},\"margin\":{\"bottom\":\"0px\",\"top\":\"0px\"}}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"left\"}} -->\n<ul class=\"wp-block-social-links has-icon-color is-style-logos-only\" style=\"margin-top:0px;margin-bottom:0px\"><!-- wp:social-link {\"url\":\"https://www.linkedin.com/in/coralie-domet-de-mont/\",\"service\":\"linkedin\"} /-->\n\n<!-- wp:social-link {\"url\":\"https://github.com/cdomet-d\",\"service\":\"github\"} /-->\n\n<!-- wp:social-link {\"url\":\"cdomet-d@student.42lyon.fr\",\"service\":\"mail\"} /--></ul>\n<!-- /wp:social-links --></div>\n<!-- /wp:group -->','Sidebar (Desktop)','','publish','closed','closed','','sidebar','','','2025-06-05 08:10:28','2025-06-05 08:10:28','',0,'https://cdomet-d.42.fr/?p=127',0,'wp_template_part','',0),
(139,1,'2025-06-03 16:22:51','2025-06-03 16:22:51','<!-- wp:ghb/github {\"cId\":\"a6f0e520-3\",\"userName\":\"cdomet-d\",\"elements\":{\"logo\":false,\"repoName\":true,\"desc\":true,\"download\":false,\"topic\":false,\"pagination\":false,\"masonry\":false},\"query\":{\"postsPerPage\":10},\"columns\":{\"desktop\":4,\"tablet\":2,\"mobile\":1},\"background\":{\"color\":\"#FFFFFF\",\"type\":\"solid\"},\"padding\":{\"top\":\"100px\",\"right\":\"100px\",\"bottom\":\"100px\",\"left\":\"100px\"},\"cardBG\":{\"color\":\"#FFFFFF\"},\"cardPadding\":{\"top\":\"25px\",\"right\":\"25px\",\"bottom\":\"25px\",\"left\":\"25px\"},\"nameColor\":\"rgba(178, 76, 134, 0.89)\",\"descColor\":\"#111111\",\"pageBtnColors\":{\"color\":\"#FFFFFF\",\"bg\":\"#000\"}} /-->\n\n<!-- wp:paragraph {\"style\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var:preset|color|foreground\"}}}},\"textColor\":\"foreground\",\"fontSize\":\"small\"} -->\n<p class=\"has-foreground-color has-text-color has-link-color has-small-font-size\"></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Projects','','publish','closed','closed','','projects','','','2025-06-05 10:02:51','2025-06-05 10:02:51','',0,'https://cdomet-d.42.fr/?page_id=139',0,'page','',0),
(146,1,'2025-06-05 08:08:09','2025-06-05 08:08:09','<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"1em\",\"padding\":{\"top\":\"var:preset|spacing|70\"}},\"margin\":{\"bottom\":\"0px\"}},\"fontSize\":\"small\",\"layout\":{\"type\":\"flex\",\"flexWrap\":\"wrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group has-small-font-size\" style=\"padding-top:var(--wp--preset--spacing--70)\"><!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"1.5em\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"wrap\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"0.5em\"},\"typography\":{\"fontWeight\":\"700\"}},\"layout\":{\"type\":\"flex\",\"justifyContent\":\"left\"}} -->\n<div class=\"wp-block-group\" style=\"font-weight:700\"><!-- wp:paragraph -->\n<p>© 2025</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:site-title {\"level\":0,\"style\":{\"typography\":{\"fontWeight\":\"700\",\"fontStyle\":\"normal\"}}} /--></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph {\"className\":\"theme-credit\",\"textColor\":\"secondary\"} -->\n<p class=\"theme-credit has-secondary-color has-text-color\">Theme by <a href=\"https://andersnoren.se\">Anders Norén</a></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->','Footer','','publish','closed','closed','','footer','','','2025-06-05 08:08:09','2025-06-05 08:08:09','',0,'https://cdomet-d.42.fr/?p=146',0,'wp_template_part','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(1,1,0),
(5,2,0),
(16,1,0),
(124,2,0),
(127,2,0),
(127,3,0),
(146,2,0),
(146,4,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,0),
(2,2,'wp_theme','',0,4),
(3,3,'wp_template_part_area','',0,1),
(4,4,'wp_template_part_area','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Uncategorized','uncategorized',0),
(2,'bjork','bjork',0),
(3,'uncategorized','uncategorized',0),
(4,'footer','footer',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(1,1,'nickname','wpsu'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'comment_shortcuts','false'),
(8,1,'admin_color','fresh'),
(9,1,'use_ssl','0'),
(10,1,'show_admin_bar_front','true'),
(11,1,'locale',''),
(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(13,1,'wp_user_level','10'),
(14,1,'dismissed_wp_pointers',''),
(15,1,'show_welcome_panel','1'),
(16,2,'nickname','serendipity'),
(17,2,'first_name',''),
(18,2,'last_name',''),
(19,2,'description',''),
(20,2,'rich_editing','true'),
(21,2,'syntax_highlighting','true'),
(22,2,'comment_shortcuts','false'),
(23,2,'admin_color','fresh'),
(24,2,'use_ssl','0'),
(25,2,'show_admin_bar_front','true'),
(26,2,'locale',''),
(27,2,'wp_capabilities','a:1:{s:6:\"author\";b:1;}'),
(28,2,'wp_user_level','2'),
(29,2,'dismissed_wp_pointers',''),
(30,1,'session_tokens','a:1:{s:64:\"a9a1bc36d25a0c79db7aeb89a430fd12854d09b95807916b6d9ca74dffd50982\";a:4:{s:10:\"expiration\";i:1749289648;s:2:\"ip\";s:10:\"172.18.0.1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0\";s:5:\"login\";i:1749116848;}}'),
(31,1,'wp_dashboard_quick_press_last_post_id','4'),
(32,1,'community-events-location','a:1:{s:2:\"ip\";s:10:\"172.18.0.0\";}'),
(33,1,'wp_user-settings','libraryContent=browse'),
(34,1,'wp_user-settings-time','1748944749'),
(35,1,'wp_persisted_preferences','a:6:{s:4:\"core\";a:1:{s:26:\"isComplementaryAreaVisible\";b:1;}s:14:\"core/edit-post\";a:1:{s:12:\"welcomeGuide\";b:0;}s:9:\"_modified\";s:24:\"2025-06-03T16:19:42.007Z\";s:14:\"core/edit-site\";a:2:{s:12:\"welcomeGuide\";b:0;s:18:\"welcomeGuideStyles\";b:0;}s:17:\"core/block-editor\";a:1:{s:25:\"linkControlSettingsDrawer\";b:1;}s:18:\"create-block-theme\";a:1:{s:11:\"reset-theme\";a:3:{s:11:\"resetStyles\";b:1;s:14:\"resetTemplates\";b:1;s:18:\"resetTemplateParts\";b:1;}}}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(1,'wpsu','$wp$2y$10$Xb1oq36Ax2R1cWC0NWz.BOujWQEdQ58s6kbKsLHTW6LNhEJUDbAVu','wpsu','cdomet-d@student.42lyon.fr','http://cdomet-d.42.fr','2025-06-03 09:38:17','',0,'wpsu'),
(2,'serendipity','$wp$2y$10$ZrYKb7Bk2UYrDM42/v3U2umeFyZVsX1TWun6sprRJ3LvRLLTTMIau','serendipity','serendipity@example.fr','','2025-06-03 09:38:17','',0,'Serendipity');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-05 13:09:07
