-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 192.168.3.19    Database: deploy
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 员工表',6,'add_userinfo'),(22,'Can change 员工表',6,'change_userinfo'),(23,'Can delete 员工表',6,'delete_userinfo'),(24,'Can view 员工表',6,'view_userinfo'),(25,'Can add department',7,'add_department'),(26,'Can change department',7,'change_department'),(27,'Can delete department',7,'delete_department'),(28,'Can view department',7,'view_department'),(29,'Can add deploy',8,'add_deploy'),(30,'Can change deploy',8,'change_deploy'),(31,'Can delete deploy',8,'delete_deploy'),(32,'Can view deploy',8,'view_deploy'),(33,'Can add host',9,'add_host'),(34,'Can change host',9,'change_host'),(35,'Can delete host',9,'delete_host'),(36,'Can view host',9,'view_host'),(37,'Can add onlinelist',10,'add_onlinelist'),(38,'Can change onlinelist',10,'change_onlinelist'),(39,'Can delete onlinelist',10,'delete_onlinelist'),(40,'Can view onlinelist',10,'view_onlinelist'),(41,'Can add script',11,'add_script'),(42,'Can change script',11,'change_script'),(43,'Can delete script',11,'delete_script'),(44,'Can view script',11,'view_script'),(45,'Can add sqlcredential',12,'add_sqlcredential'),(46,'Can change sqlcredential',12,'change_sqlcredential'),(47,'Can delete sqlcredential',12,'delete_sqlcredential'),(48,'Can view sqlcredential',12,'view_sqlcredential'),(49,'Can add rollback record',13,'add_rollbackrecord'),(50,'Can change rollback record',13,'change_rollbackrecord'),(51,'Can delete rollback record',13,'delete_rollbackrecord'),(52,'Can view rollback record',13,'view_rollbackrecord'),(53,'Can add project',14,'add_project'),(54,'Can change project',14,'change_project'),(55,'Can delete project',14,'delete_project'),(56,'Can view project',14,'view_project'),(57,'Can add 上线单详情表',15,'add_onlinedetails'),(58,'Can change 上线单详情表',15,'change_onlinedetails'),(59,'Can delete 上线单详情表',15,'delete_onlinedetails'),(60,'Can view 上线单详情表',15,'view_onlinedetails'),(61,'Can add deploy record',16,'add_deployrecord'),(62,'Can change deploy record',16,'change_deployrecord'),(63,'Can delete deploy record',16,'delete_deployrecord'),(64,'Can view deploy record',16,'view_deployrecord'),(65,'Can add menu',17,'add_menu'),(66,'Can change menu',17,'change_menu'),(67,'Can delete menu',17,'delete_menu'),(68,'Can view menu',17,'view_menu'),(69,'Can add permission',18,'add_permission'),(70,'Can change permission',18,'change_permission'),(71,'Can delete permission',18,'delete_permission'),(72,'Can view permission',18,'view_permission'),(73,'Can add role',19,'add_role'),(74,'Can change role',19,'change_role'),(75,'Can delete role',19,'delete_role'),(76,'Can view role',19,'view_role'),(77,'Can add user info',20,'add_userinfo'),(78,'Can change user info',20,'change_userinfo'),(79,'Can delete user info',20,'delete_userinfo'),(80,'Can view user info',20,'view_userinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_web_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_web_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-06-27 15:32:59.484053','1','上线申请单管理',1,'[{\"added\": {}}]',17,1),(2,'2019-06-27 15:33:14.669922','2','用户管理',1,'[{\"added\": {}}]',17,1),(3,'2019-06-27 15:33:26.311588','3','主机管理',1,'[{\"added\": {}}]',17,1),(4,'2019-06-27 15:33:38.844305','4','脚本管理',1,'[{\"added\": {}}]',17,1),(5,'2019-06-27 15:33:45.804703','5','项目管理',1,'[{\"added\": {}}]',17,1),(6,'2019-06-27 15:33:56.200297','6','数据库申请单管理',1,'[{\"added\": {}}]',17,1),(7,'2019-06-27 15:36:47.536097','1','上线单列表',1,'[{\"added\": {}}]',18,1),(8,'2019-06-27 15:37:14.945665','2','添加上线单',1,'[{\"added\": {}}]',18,1),(9,'2019-06-27 15:37:47.153507','3','编辑上线单',1,'[{\"added\": {}}]',18,1),(10,'2019-06-27 15:38:21.300460','4','删除上线单',1,'[{\"added\": {}}]',18,1),(11,'2019-06-27 15:38:58.296576','5','项目列表',1,'[{\"added\": {}}]',18,1),(12,'2019-06-27 15:39:36.330752','6','添加项目',1,'[{\"added\": {}}]',18,1),(13,'2019-06-27 15:40:19.638229','7','编辑项目',1,'[{\"added\": {}}]',18,1),(14,'2019-06-27 15:40:51.046025','8','删除项目',1,'[{\"added\": {}}]',18,1),(15,'2019-06-27 15:42:36.239042','9','主机列表',1,'[{\"added\": {}}]',18,1),(16,'2019-06-27 15:43:24.448799','10','任务列表',1,'[{\"added\": {}}]',18,1),(17,'2019-06-27 15:44:05.899170','11','脚本列表',1,'[{\"added\": {}}]',18,1),(18,'2019-06-27 15:45:01.639358','12','查看上线单',1,'[{\"added\": {}}]',18,1),(19,'2019-06-27 15:49:02.151115','13','添加主机',1,'[{\"added\": {}}]',18,1),(20,'2019-06-27 15:49:32.618857','14','host_edit',1,'[{\"added\": {}}]',18,1),(21,'2019-06-27 15:50:38.320615','15','删除主机',1,'[{\"added\": {}}]',18,1),(22,'2019-06-27 15:51:27.672438','14','编辑主机',2,'[{\"changed\": {\"fields\": [\"title\", \"name\", \"menu\", \"parent\"]}}]',18,1),(23,'2019-06-27 15:52:00.826334','16','添加发布任务',1,'[{\"added\": {}}]',18,1),(24,'2019-06-27 15:52:34.902283','17','编辑发布任务',1,'[{\"added\": {}}]',18,1),(25,'2019-06-27 15:52:55.547464','18','删除任务列表',1,'[{\"added\": {}}]',18,1),(26,'2019-06-27 15:53:35.724762','19','添加脚本',1,'[{\"added\": {}}]',18,1),(27,'2019-06-27 15:54:02.788310','20','编辑脚本',1,'[{\"added\": {}}]',18,1),(28,'2019-06-27 15:54:50.204022','21','删除脚本',1,'[{\"added\": {}}]',18,1),(29,'2019-06-27 15:55:20.379748','22','数据库申请单列表',1,'[{\"added\": {}}]',18,1),(30,'2019-06-27 15:55:42.969040','23','添加数据库申请单',1,'[{\"added\": {}}]',18,1),(31,'2019-06-27 15:56:49.122824','24','查看数据库申请详情',1,'[{\"added\": {}}]',18,1),(32,'2019-06-27 15:57:21.703688','25','删除数据库申请单',1,'[{\"added\": {}}]',18,1),(33,'2019-06-27 15:57:44.370984','26','编辑数据库申请单',1,'[{\"added\": {}}]',18,1),(34,'2019-06-27 15:58:38.388074','27','项目负责人审核',1,'[{\"added\": {}}]',18,1),(35,'2019-06-27 15:59:20.331473','28','测试审核',1,'[{\"added\": {}}]',18,1),(36,'2019-06-27 15:59:55.911508','29','运维审核',1,'[{\"added\": {}}]',18,1),(37,'2019-06-27 16:00:32.241586','30','产品审核',1,'[{\"added\": {}}]',18,1),(38,'2019-06-27 16:05:17.231886','31','任务回滚',1,'[{\"added\": {}}]',18,1),(39,'2019-06-27 16:05:41.458272','32','发布代码',1,'[{\"added\": {}}]',18,1),(40,'2019-06-27 16:08:25.886677','33','用户列表',1,'[{\"added\": {}}]',18,1),(41,'2019-06-27 16:09:26.915167','34','添加用户',1,'[{\"added\": {}}]',18,1),(42,'2019-06-27 16:09:53.699699','35','编辑用户',1,'[{\"added\": {}}]',18,1),(43,'2019-06-27 16:10:26.640583','36','删除用户',1,'[{\"added\": {}}]',18,1),(44,'2019-06-27 16:11:38.571698','37','项目负责人审核数据库',1,'[{\"added\": {}}]',18,1),(45,'2019-06-27 16:13:00.142363','38','运维审核数据库申请单',1,'[{\"added\": {}}]',18,1),(46,'2019-06-27 16:14:35.354809','39','拉取代码',1,'[{\"added\": {}}]',18,1),(47,'2019-06-27 16:15:26.186716','40','搜索',1,'[{\"added\": {}}]',18,1),(48,'2019-06-27 16:18:10.369107','1','运维',1,'[{\"added\": {}}]',19,1),(49,'2019-06-27 16:19:16.431886','2','开发',1,'[{\"added\": {}}]',19,1),(50,'2019-06-27 16:21:17.464808','3','测试',1,'[{\"added\": {}}]',19,1),(51,'2019-06-27 16:22:35.044246','4','产品',1,'[{\"added\": {}}]',19,1),(52,'2019-06-27 16:24:10.575710','5','项目负责人',1,'[{\"added\": {}}]',19,1),(53,'2019-06-27 16:24:25.652572','6','管理员',1,'[{\"added\": {}}]',19,1),(54,'2019-06-27 16:25:37.834701','1','运维',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(55,'2019-06-27 16:28:03.540035','1','admin',1,'[{\"added\": {}}]',20,1),(56,'2019-06-27 16:28:59.117213','2','kf',1,'[{\"added\": {}}]',20,1),(57,'2019-06-27 16:29:27.861857','3','project',1,'[{\"added\": {}}]',20,1),(58,'2019-06-27 16:30:35.183708','4','hu',1,'[{\"added\": {}}]',20,1),(59,'2019-06-27 16:31:00.082132','5','cs',1,'[{\"added\": {}}]',20,1),(60,'2019-06-27 16:31:27.411695','6','pm',1,'[{\"added\": {}}]',20,1),(61,'2019-06-27 16:31:52.364123','1','admin',2,'[{\"changed\": {\"fields\": [\"server_name\", \"git_name\", \"git_pwd\"]}}]',20,1),(62,'2019-06-27 16:36:50.010147','7','部门列表',1,'[{\"added\": {}}]',17,1),(63,'2019-06-27 16:41:16.920413','41','部门列表',1,'[{\"added\": {}}]',18,1),(64,'2019-06-27 16:45:29.880882','42','添加部门',1,'[{\"added\": {}}]',18,1),(65,'2019-06-27 16:47:17.264024','43','depart_edit',1,'[{\"added\": {}}]',18,1),(66,'2019-06-27 16:47:49.212851','44','删除部门',1,'[{\"added\": {}}]',18,1),(67,'2019-06-27 16:48:29.924180','43','编辑部门',2,'[{\"changed\": {\"fields\": [\"title\", \"name\"]}}]',18,1),(68,'2019-06-27 16:48:42.627906','6','管理员',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(69,'2019-06-27 16:50:20.401499','7','部门管理',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',17,1),(70,'2019-06-27 16:51:16.623714','44','删除部门',2,'[{\"changed\": {\"fields\": [\"menu\", \"parent\"]}}]',18,1),(71,'2019-06-27 16:51:16.628715','43','编辑部门',2,'[{\"changed\": {\"fields\": [\"menu\", \"parent\"]}}]',18,1),(72,'2019-06-27 16:51:16.632715','42','添加部门',2,'[{\"changed\": {\"fields\": [\"menu\", \"parent\"]}}]',18,1),(73,'2019-06-27 19:47:37.706918','2','开发',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(74,'2019-06-27 19:49:09.928192','2','开发',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(75,'2019-07-03 14:16:38.912309','3','测试',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(76,'2019-07-03 14:19:51.676335','1','运维',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(77,'2019-07-03 15:18:21.725098','1','运维',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(78,'2019-07-03 15:19:55.774478','1','运维',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(79,'2019-07-03 15:21:26.663676','5','项目负责人',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(80,'2019-07-03 15:22:33.147479','5','项目负责人',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(81,'2019-07-03 15:40:22.639650','5','项目负责人',2,'[]',19,1),(82,'2019-07-03 15:40:41.748743','4','产品',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(83,'2019-07-03 15:40:53.829434','3','测试',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(84,'2019-07-03 15:41:08.243259','2','开发',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(85,'2019-07-03 15:41:49.224603','6','管理员',2,'[]',19,1),(86,'2019-07-03 15:45:10.467113','40','搜索',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',18,1),(87,'2019-07-03 15:47:31.165160','40','搜索',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',18,1),(88,'2019-07-03 15:50:30.302407','5','项目负责人',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(89,'2019-07-03 15:50:58.508020','4','产品',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(90,'2019-07-03 15:51:07.400528','3','测试',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(91,'2019-07-03 15:51:20.518279','2','开发',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(92,'2019-07-03 16:28:45.864705','4','产品',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(93,'2019-07-03 16:33:18.914323','4','产品',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(94,'2019-07-03 16:49:02.181275','2','kf',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',20,1),(95,'2019-07-03 18:01:23.185566','45','产品审核数据库申请单',1,'[{\"added\": {}}]',18,1),(96,'2019-07-03 18:01:49.560074','6','管理员',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1),(97,'2019-07-03 18:02:13.570448','4','产品',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',19,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(17,'rbac','menu'),(18,'rbac','permission'),(19,'rbac','role'),(20,'rbac','userinfo'),(5,'sessions','session'),(7,'web','department'),(8,'web','deploy'),(16,'web','deployrecord'),(9,'web','host'),(15,'web','onlinedetails'),(10,'web','onlinelist'),(14,'web','project'),(13,'web','rollbackrecord'),(11,'web','script'),(12,'web','sqlcredential'),(6,'web','userinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-06-27 14:37:54.614026'),(2,'contenttypes','0002_remove_content_type_name','2019-06-27 14:37:54.796036'),(3,'auth','0001_initial','2019-06-27 14:37:54.965046'),(4,'auth','0002_alter_permission_name_max_length','2019-06-27 14:37:55.356068'),(5,'auth','0003_alter_user_email_max_length','2019-06-27 14:37:55.369069'),(6,'auth','0004_alter_user_username_opts','2019-06-27 14:37:55.384070'),(7,'auth','0005_alter_user_last_login_null','2019-06-27 14:37:55.397070'),(8,'auth','0006_require_contenttypes_0002','2019-06-27 14:37:55.407071'),(9,'auth','0007_alter_validators_add_error_messages','2019-06-27 14:37:55.421072'),(10,'auth','0008_alter_user_username_max_length','2019-06-27 14:37:55.435073'),(11,'auth','0009_alter_user_last_name_max_length','2019-06-27 14:37:55.449073'),(12,'auth','0010_alter_group_name_max_length','2019-06-27 14:37:55.523078'),(13,'auth','0011_update_proxy_permissions','2019-06-27 14:37:55.549079'),(14,'web','0001_initial','2019-06-27 14:37:56.438130'),(15,'admin','0001_initial','2019-06-27 14:37:57.340182'),(16,'admin','0002_logentry_remove_auto_add','2019-06-27 14:37:57.519192'),(17,'admin','0003_logentry_add_action_flag_choices','2019-06-27 14:37:57.543193'),(18,'admin','0004_auto_20190627_1437','2019-06-27 14:37:57.666200'),(19,'rbac','0001_initial','2019-06-27 14:37:58.214231'),(20,'sessions','0001_initial','2019-06-27 14:37:58.630255'),(21,'web','0002_auto_20190627_1906','2019-06-27 19:06:35.604093'),(22,'web','0003_auto_20190628_1551','2019-06-28 15:51:54.650778'),(23,'web','0004_auto_20190628_1716','2019-06-28 17:16:21.052560'),(24,'web','0005_auto_20190628_1728','2019-06-28 17:28:22.488824');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('15udrfbucz3aw6j80k4t3om5wpurz1m9','MTk3NjFjMGZiZjQ4NDU4MzMwNjZjNTdmMTczOWFkMDU2NzIzMDMyZDp7ImNoZWNrX2NvZGUiOiJDQ1FUWCIsInVzZXJfaWQiOjQsImlqa3NkdWZ3ZXNkZnMiOnsib25saW5lX2xpc3QiOnsidXJsIjoiL29ubGluZS9saXN0LyIsIm1lbnVfaWQiOjEsInBhcmVudF9uYW1lIjpudWxsfSwib25saW5lX2VkaXQiOnsidXJsIjoiL29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInByb2plY3RfbGlzdCI6eyJ1cmwiOiIvcHJvamVjdC9saXN0LyIsIm1lbnVfaWQiOjUsInBhcmVudF9uYW1lIjpudWxsfSwicHJvamVjdF9hZGQiOnsidXJsIjoiL3Byb2plY3QvYWRkLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInByb2plY3RfZWRpdCI6eyJ1cmwiOiIvcHJvamVjdC9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJwcm9qZWN0X2RlbCI6eyJ1cmwiOiIvcHJvamVjdC9kZWwvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImhvc3RfbGlzdCI6eyJ1cmwiOiIvaG9zdC9saXN0LyIsIm1lbnVfaWQiOjMsInBhcmVudF9uYW1lIjpudWxsfSwiZGVwbG95X2xpc3QiOnsidXJsIjoiL2RlcGxveS9saXN0Lyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInNjcmlwdF9saXN0Ijp7InVybCI6Ii9zY3JpcHQvbGlzdC8iLCJtZW51X2lkIjo0LCJwYXJlbnRfbmFtZSI6bnVsbH0sImhvc3RfYWRkIjp7InVybCI6Ii9ob3N0L2FkZC8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Imhvc3RfbGlzdCJ9LCJob3N0X2VkaXQiOnsidXJsIjoiL2hvc3QvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJob3N0X2xpc3QifSwiaG9zdF9kZWwiOnsidXJsIjoiL2hvc3QvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Imhvc3RfbGlzdCJ9LCJkZXBsb3lfYWRkIjp7InVybCI6Ii9kZXBsb3kvYWRkLyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9lZGl0Ijp7InVybCI6Ii9kZXBsb3kvZWRpdC8oP1A8cHJvamVjdF9pZD5cXGQrKS8oP1A8bmlkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9kZWwiOnsidXJsIjoiL2RlcGxveS9kZWwvKD9QPHByb2plY3RfaWQ+XFxkKykvKD9QPG5pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJzY3JpcHRfYWRkIjp7InVybCI6Ii9zY3JpcHQvYWRkLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoic2NyaXB0X2xpc3QifSwic2NyaXB0X2VkaXQiOnsidXJsIjoiL3NjcmlwdC9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InNjcmlwdF9saXN0In0sInNjcmlwdF9kZWwiOnsidXJsIjoiL3NjcmlwdC9kZWwvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoic2NyaXB0X2xpc3QifSwib3Bfb25saW5lX2VkaXQiOnsidXJsIjoiL29wL29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sImRlcGxveV9yb2xsYmFjayI6eyJ1cmwiOiIvZGVwbG95L3JvbGxiYWNrLyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9wdXNoIjp7InVybCI6Ii9kZXBsb3kvcHVzaC8oP1A8cHJvamVjdF9pZD5cXGQrKS8oP1A8ZGVwbG95X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9mZXRjaCI6eyJ1cmwiOiIvZGVwbG95L2ZldGNoLyg/UDxwcm9qZWN0X2lkPlxcZCspLyg/UDxkZXBsb3lfaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwic2VhcmNoIjp7InVybCI6Ii9zZWFyY2gvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifX0sInJ0d3NkZmd3ZXJmZnNkIjp7IjEiOnsidGl0bGUiOiJcdTRlMGFcdTdlYmZcdTc1MzNcdThiZjdcdTUzNTVcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtbWFwLW8iLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTRlMGFcdTdlYmZcdTUzNTVcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvb25saW5lL2xpc3QvIiwibmFtZSI6Im9ubGluZV9saXN0In1dfSwiNSI6eyJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS1naXRsYWIiLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTk4NzlcdTc2ZWVcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvcHJvamVjdC9saXN0LyIsIm5hbWUiOiJwcm9qZWN0X2xpc3QifV19LCIzIjp7InRpdGxlIjoiXHU0ZTNiXHU2NzNhXHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWlveGhvc3QiLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTRlM2JcdTY3M2FcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvaG9zdC9saXN0LyIsIm5hbWUiOiJob3N0X2xpc3QifV19LCI0Ijp7InRpdGxlIjoiXHU4MTFhXHU2NzJjXHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWNhbGVuZGFyLW1pbnVzLW8iLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTgxMWFcdTY3MmNcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc2NyaXB0L2xpc3QvIiwibmFtZSI6InNjcmlwdF9saXN0In1dfX19','2019-07-11 19:20:19.643226'),('3bbeicsqs81gvlidr4v1iqfpk17q9auo','YTM5NTczYjM4MGYxMDBhYzllODhjNDE2NjcwMDlmMGZjMTNjMDcwMDp7ImNoZWNrX2NvZGUiOiJIVFdVVCIsInVzZXJfaWQiOjYsImlqa3NkdWZ3ZXNkZnMiOnsib25saW5lX2xpc3QiOnsidXJsIjoiL29ubGluZS9saXN0LyIsIm1lbnVfaWQiOjEsInBhcmVudF9uYW1lIjpudWxsfSwiZGF0YWJhc2VfbGlzdCI6eyJ1cmwiOiIvZGF0YWJhc2UvbGlzdC8iLCJtZW51X2lkIjo2LCJwYXJlbnRfbmFtZSI6bnVsbH0sImRhdGFiYXNlX2RldGFpbHMiOnsidXJsIjoiL2RhdGFiYXNlL2RldGFpbHMvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJwbV9vbmxpbmVfZWRpdCI6eyJ1cmwiOiIvcG0vb25saW5lL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoib25saW5lX2xpc3QifSwicG1fZGF0YWJhc2VfZWRpdCI6eyJ1cmwiOiIvcG1fZGF0YWJhc2UvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkYXRhYmFzZV9saXN0In19LCJydHdzZGZnd2VyZmZzZCI6eyIxIjp7InRpdGxlIjoiXHU0ZTBhXHU3ZWJmXHU3NTMzXHU4YmY3XHU1MzU1XHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLW1hcC1vIiwiY2xhc3MiOiJoaWRlIiwiY2hpbGRyZW4iOlt7InRpdGxlIjoiXHU0ZTBhXHU3ZWJmXHU1MzU1XHU1MjE3XHU4ODY4IiwidXJsIjoiL29ubGluZS9saXN0LyIsIm5hbWUiOiJvbmxpbmVfbGlzdCJ9XX0sIjYiOnsidGl0bGUiOiJcdTY1NzBcdTYzNmVcdTVlOTNcdTc1MzNcdThiZjdcdTUzNTVcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtZGF0YWJhc2UiLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTY1NzBcdTYzNmVcdTVlOTNcdTc1MzNcdThiZjdcdTUzNTVcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvZGF0YWJhc2UvbGlzdC8iLCJuYW1lIjoiZGF0YWJhc2VfbGlzdCJ9XX19fQ==','2019-07-17 19:22:15.954128'),('8v7um1lukbz08ow2ur6ovngek7r9ybo5','NWQ2MjViNjhlOWUyOTg4ZmMwNmNkZDI3ZWZhZjdmNmIzNGQ4NTA0ODp7ImNoZWNrX2NvZGUiOiJVWkRHUyIsInVzZXJfaWQiOjQsImlqa3NkdWZ3ZXNkZnMiOnsib25saW5lX2xpc3QiOnsidXJsIjoiL29ubGluZS9saXN0LyIsIm1lbnVfaWQiOjEsInBhcmVudF9uYW1lIjpudWxsfSwib25saW5lX2VkaXQiOnsidXJsIjoiL29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInByb2plY3RfbGlzdCI6eyJ1cmwiOiIvcHJvamVjdC9saXN0LyIsIm1lbnVfaWQiOjUsInBhcmVudF9uYW1lIjpudWxsfSwicHJvamVjdF9hZGQiOnsidXJsIjoiL3Byb2plY3QvYWRkLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInByb2plY3RfZWRpdCI6eyJ1cmwiOiIvcHJvamVjdC9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJwcm9qZWN0X2RlbCI6eyJ1cmwiOiIvcHJvamVjdC9kZWwvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImhvc3RfbGlzdCI6eyJ1cmwiOiIvaG9zdC9saXN0LyIsIm1lbnVfaWQiOjMsInBhcmVudF9uYW1lIjpudWxsfSwiZGVwbG95X2xpc3QiOnsidXJsIjoiL2RlcGxveS9saXN0Lyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInNjcmlwdF9saXN0Ijp7InVybCI6Ii9zY3JpcHQvbGlzdC8iLCJtZW51X2lkIjo0LCJwYXJlbnRfbmFtZSI6bnVsbH0sImhvc3RfYWRkIjp7InVybCI6Ii9ob3N0L2FkZC8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Imhvc3RfbGlzdCJ9LCJob3N0X2VkaXQiOnsidXJsIjoiL2hvc3QvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJob3N0X2xpc3QifSwiaG9zdF9kZWwiOnsidXJsIjoiL2hvc3QvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Imhvc3RfbGlzdCJ9LCJkZXBsb3lfYWRkIjp7InVybCI6Ii9kZXBsb3kvYWRkLyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9lZGl0Ijp7InVybCI6Ii9kZXBsb3kvZWRpdC8oP1A8cHJvamVjdF9pZD5cXGQrKS8oP1A8bmlkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9kZWwiOnsidXJsIjoiL2RlcGxveS9kZWwvKD9QPHByb2plY3RfaWQ+XFxkKykvKD9QPG5pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJzY3JpcHRfYWRkIjp7InVybCI6Ii9zY3JpcHQvYWRkLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoic2NyaXB0X2xpc3QifSwic2NyaXB0X2VkaXQiOnsidXJsIjoiL3NjcmlwdC9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InNjcmlwdF9saXN0In0sInNjcmlwdF9kZWwiOnsidXJsIjoiL3NjcmlwdC9kZWwvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoic2NyaXB0X2xpc3QifSwib3Bfb25saW5lX2VkaXQiOnsidXJsIjoiL29wL29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sImRlcGxveV9yb2xsYmFjayI6eyJ1cmwiOiIvZGVwbG95L3JvbGxiYWNrLyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9wdXNoIjp7InVybCI6Ii9kZXBsb3kvcHVzaC8oP1A8cHJvamVjdF9pZD5cXGQrKS8oP1A8ZGVwbG95X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9mZXRjaCI6eyJ1cmwiOiIvZGVwbG95L2ZldGNoLyg/UDxwcm9qZWN0X2lkPlxcZCspLyg/UDxkZXBsb3lfaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwic2VhcmNoIjp7InVybCI6Ii9zZWFyY2gvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifX0sInJ0d3NkZmd3ZXJmZnNkIjp7IjEiOnsidGl0bGUiOiJcdTRlMGFcdTdlYmZcdTc1MzNcdThiZjdcdTUzNTVcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtbWFwLW8iLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTRlMGFcdTdlYmZcdTUzNTVcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvb25saW5lL2xpc3QvIiwibmFtZSI6Im9ubGluZV9saXN0In1dfSwiNSI6eyJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS1naXRsYWIiLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTk4NzlcdTc2ZWVcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvcHJvamVjdC9saXN0LyIsIm5hbWUiOiJwcm9qZWN0X2xpc3QifV19LCIzIjp7InRpdGxlIjoiXHU0ZTNiXHU2NzNhXHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWlveGhvc3QiLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTRlM2JcdTY3M2FcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvaG9zdC9saXN0LyIsIm5hbWUiOiJob3N0X2xpc3QifV19LCI0Ijp7InRpdGxlIjoiXHU4MTFhXHU2NzJjXHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWNhbGVuZGFyLW1pbnVzLW8iLCJjbGFzcyI6ImhpZGUiLCJjaGlsZHJlbiI6W3sidGl0bGUiOiJcdTgxMWFcdTY3MmNcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc2NyaXB0L2xpc3QvIiwibmFtZSI6InNjcmlwdF9saXN0In1dfX19','2019-07-12 10:13:55.863898'),('e7eqohcmxcvoy5rnxealtaltqwm7hlty','ZmFkNmNkZTQ0MzgyY2E3Mzc5ODZkM2I1NzhiMGQyOTYzOWI0ZTBkOTp7ImNoZWNrX2NvZGUiOiJQSkRWTSIsInVzZXJfaWQiOjEsImlqa3NkdWZ3ZXNkZnMiOnsib25saW5lX2xpc3QiOnsidXJsIjoiL29ubGluZS9saXN0LyIsIm1lbnVfaWQiOjEsInBhcmVudF9uYW1lIjpudWxsfSwib25saW5lX2FkZCI6eyJ1cmwiOiIvb25saW5lL2FkZC8iLCJtZW51X2lkIjoxLCJwYXJlbnRfbmFtZSI6bnVsbH0sIm9ubGluZV9lZGl0Ijp7InVybCI6Ii9vbmxpbmUvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJvbmxpbmVfbGlzdCJ9LCJvbmxpbmVfZGVsIjp7InVybCI6Ii9vbmxpbmUvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInByb2plY3RfbGlzdCI6eyJ1cmwiOiIvcHJvamVjdC9saXN0LyIsIm1lbnVfaWQiOjUsInBhcmVudF9uYW1lIjpudWxsfSwicHJvamVjdF9hZGQiOnsidXJsIjoiL3Byb2plY3QvYWRkLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInByb2plY3RfZWRpdCI6eyJ1cmwiOiIvcHJvamVjdC9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJwcm9qZWN0X2RlbCI6eyJ1cmwiOiIvcHJvamVjdC9kZWwvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImhvc3RfbGlzdCI6eyJ1cmwiOiIvaG9zdC9saXN0LyIsIm1lbnVfaWQiOjMsInBhcmVudF9uYW1lIjpudWxsfSwiZGVwbG95X2xpc3QiOnsidXJsIjoiL2RlcGxveS9saXN0Lyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInNjcmlwdF9saXN0Ijp7InVybCI6Ii9zY3JpcHQvbGlzdC8iLCJtZW51X2lkIjo0LCJwYXJlbnRfbmFtZSI6bnVsbH0sIm9ubGluZV9kZXRhaWxzIjp7InVybCI6Ii9vbmxpbmUvZGV0YWlscy8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJvbmxpbmVfbGlzdCJ9LCJob3N0X2FkZCI6eyJ1cmwiOiIvaG9zdC9hZGQvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJob3N0X2xpc3QifSwiaG9zdF9lZGl0Ijp7InVybCI6Ii9ob3N0L2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiaG9zdF9saXN0In0sImhvc3RfZGVsIjp7InVybCI6Ii9ob3N0L2RlbC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJob3N0X2xpc3QifSwiZGVwbG95X2FkZCI6eyJ1cmwiOiIvZGVwbG95L2FkZC8oP1A8cHJvamVjdF9pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJkZXBsb3lfZWRpdCI6eyJ1cmwiOiIvZGVwbG95L2VkaXQvKD9QPHByb2plY3RfaWQ+XFxkKykvKD9QPG5pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJkZXBsb3lfZGVsIjp7InVybCI6Ii9kZXBsb3kvZGVsLyg/UDxwcm9qZWN0X2lkPlxcZCspLyg/UDxuaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwic2NyaXB0X2FkZCI6eyJ1cmwiOiIvc2NyaXB0L2FkZC8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InNjcmlwdF9saXN0In0sInNjcmlwdF9lZGl0Ijp7InVybCI6Ii9zY3JpcHQvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJzY3JpcHRfbGlzdCJ9LCJzY3JpcHRfZGVsIjp7InVybCI6Ii9zY3JpcHQvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InNjcmlwdF9saXN0In0sImRhdGFiYXNlX2xpc3QiOnsidXJsIjoiL2RhdGFiYXNlL2xpc3QvIiwibWVudV9pZCI6NiwicGFyZW50X25hbWUiOm51bGx9LCJkYXRhYmFzZV9hZGQiOnsidXJsIjoiL2RhdGFiYXNlL2FkZC8iLCJtZW51X2lkIjo2LCJwYXJlbnRfbmFtZSI6bnVsbH0sImRhdGFiYXNlX2RldGFpbHMiOnsidXJsIjoiL2RhdGFiYXNlL2RldGFpbHMvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJkYXRhYmFzZV9kZWwiOnsidXJsIjoiL2RhdGFiYXNlL2RlbC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkYXRhYmFzZV9saXN0In0sImRhdGFiYXNlX2VkaXQiOnsidXJsIjoiL2RhdGFiYXNlL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJwcm9qZWN0X29ubGluZV9lZGl0Ijp7InVybCI6Ii9wcm9qZWN0L29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInRlc3Rfb25saW5lX2VkaXQiOnsidXJsIjoiL3Rlc3Qvb25saW5lL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoib25saW5lX2xpc3QifSwib3Bfb25saW5lX2VkaXQiOnsidXJsIjoiL29wL29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInBtX29ubGluZV9lZGl0Ijp7InVybCI6Ii9wbS9vbmxpbmUvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJvbmxpbmVfbGlzdCJ9LCJkZXBsb3lfcm9sbGJhY2siOnsidXJsIjoiL2RlcGxveS9yb2xsYmFjay8oP1A8cHJvamVjdF9pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJkZXBsb3lfcHVzaCI6eyJ1cmwiOiIvZGVwbG95L3B1c2gvKD9QPHByb2plY3RfaWQ+XFxkKykvKD9QPGRlcGxveV9pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJ1c2VyX2xpc3QiOnsidXJsIjoiL3VzZXIvbGlzdC8iLCJtZW51X2lkIjoyLCJwYXJlbnRfbmFtZSI6bnVsbH0sInVzZXJfYWRkIjp7InVybCI6Ii91c2VyL2FkZC8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InVzZXJfbGlzdCJ9LCJ1c2VyX2VkaXQiOnsidXJsIjoiL3VzZXIvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJ1c2VyX2xpc3QifSwidXNlcl9kZWwiOnsidXJsIjoiL3VzZXIvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InVzZXJfbGlzdCJ9LCJwcm9qZWN0X2RhdGFiYXNlX2VkaXQiOnsidXJsIjoiL3Byb2plY3RfZGF0YWJhc2UvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkYXRhYmFzZV9saXN0In0sIm9wX2RhdGFiYXNlX2VkaXQiOnsidXJsIjoiL29wX2RhdGFiYXNlL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJkZXBsb3lfZmV0Y2giOnsidXJsIjoiL2RlcGxveS9mZXRjaC8oP1A8cHJvamVjdF9pZD5cXGQrKS8oP1A8ZGVwbG95X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInNlYXJjaCI6eyJ1cmwiOiIvc2VhcmNoLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGFydF9saXN0Ijp7InVybCI6Ii9kZXBhcnQvbGlzdC8iLCJtZW51X2lkIjo3LCJwYXJlbnRfbmFtZSI6bnVsbH0sImRlcGFydF9hZGQiOnsidXJsIjoiL2RlcGFydC9hZGQvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkZXBhcnRfbGlzdCJ9LCJkZXBhcnRfZWRpdCI6eyJ1cmwiOiIvZGVwYXJ0L2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGVwYXJ0X2xpc3QifSwiZGVwYXJ0X2RlbCI6eyJ1cmwiOiIvZGVwYXJ0L2RlbC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkZXBhcnRfbGlzdCJ9fSwicnR3c2RmZ3dlcmZmc2QiOnsiMSI6eyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NzUzM1x1OGJmN1x1NTM1NVx1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS1tYXAtbyIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NTM1NVx1NTIxN1x1ODg2OCIsInVybCI6Ii9vbmxpbmUvbGlzdC8iLCJuYW1lIjoib25saW5lX2xpc3QifSx7InRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU0ZTBhXHU3ZWJmXHU1MzU1IiwidXJsIjoiL29ubGluZS9hZGQvIiwibmFtZSI6Im9ubGluZV9hZGQifV19LCI1Ijp7InRpdGxlIjoiXHU5ODc5XHU3NmVlXHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWdpdGxhYiIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1NTIxN1x1ODg2OCIsInVybCI6Ii9wcm9qZWN0L2xpc3QvIiwibmFtZSI6InByb2plY3RfbGlzdCJ9XX0sIjMiOnsidGl0bGUiOiJcdTRlM2JcdTY3M2FcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtaW94aG9zdCIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NGUzYlx1NjczYVx1NTIxN1x1ODg2OCIsInVybCI6Ii9ob3N0L2xpc3QvIiwibmFtZSI6Imhvc3RfbGlzdCJ9XX0sIjQiOnsidGl0bGUiOiJcdTgxMWFcdTY3MmNcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtY2FsZW5kYXItbWludXMtbyIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1ODExYVx1NjcyY1x1NTIxN1x1ODg2OCIsInVybCI6Ii9zY3JpcHQvbGlzdC8iLCJuYW1lIjoic2NyaXB0X2xpc3QifV19LCI2Ijp7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWRhdGFiYXNlIiwiY2xhc3MiOiJoaWRlIiwiY2hpbGRyZW4iOlt7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU1MjE3XHU4ODY4IiwidXJsIjoiL2RhdGFiYXNlL2xpc3QvIiwibmFtZSI6ImRhdGFiYXNlX2xpc3QifSx7InRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1IiwidXJsIjoiL2RhdGFiYXNlL2FkZC8iLCJuYW1lIjoiZGF0YWJhc2VfYWRkIn1dfSwiMiI6eyJ0aXRsZSI6Ilx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS11c2VyLWNpcmNsZSIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NzUyOFx1NjIzN1x1NTIxN1x1ODg2OCIsInVybCI6Ii91c2VyL2xpc3QvIiwibmFtZSI6InVzZXJfbGlzdCJ9XX0sIjciOnsidGl0bGUiOiJcdTkwZThcdTk1ZThcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtaW94aG9zdCIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1OTBlOFx1OTVlOFx1NTIxN1x1ODg2OCIsInVybCI6Ii9kZXBhcnQvbGlzdC8iLCJuYW1lIjoiZGVwYXJ0X2xpc3QifV19fX0=','2019-07-16 13:48:35.922099'),('efjgar7fp4ga70l088i5b0ulpzbzpia2','YjM3ZGZmNmI5NzMzNmNiMTljZWYyNDBjN2RlMGZjOGM2YmEwYjI3MDp7ImNoZWNrX2NvZGUiOiJYVUtOQyIsInVzZXJfaWQiOjQsImlqa3NkdWZ3ZXNkZnMiOnsib25saW5lX2xpc3QiOnsidXJsIjoiL29ubGluZS9saXN0LyIsIm1lbnVfaWQiOjEsInBhcmVudF9uYW1lIjpudWxsfSwicHJvamVjdF9saXN0Ijp7InVybCI6Ii9wcm9qZWN0L2xpc3QvIiwibWVudV9pZCI6NSwicGFyZW50X25hbWUiOm51bGx9LCJwcm9qZWN0X2FkZCI6eyJ1cmwiOiIvcHJvamVjdC9hZGQvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwicHJvamVjdF9lZGl0Ijp7InVybCI6Ii9wcm9qZWN0L2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInByb2plY3RfZGVsIjp7InVybCI6Ii9wcm9qZWN0L2RlbC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwiaG9zdF9saXN0Ijp7InVybCI6Ii9ob3N0L2xpc3QvIiwibWVudV9pZCI6MywicGFyZW50X25hbWUiOm51bGx9LCJkZXBsb3lfbGlzdCI6eyJ1cmwiOiIvZGVwbG95L2xpc3QvKD9QPHByb2plY3RfaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwic2NyaXB0X2xpc3QiOnsidXJsIjoiL3NjcmlwdC9saXN0LyIsIm1lbnVfaWQiOjQsInBhcmVudF9uYW1lIjpudWxsfSwib25saW5lX2RldGFpbHMiOnsidXJsIjoiL29ubGluZS9kZXRhaWxzLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sImhvc3RfYWRkIjp7InVybCI6Ii9ob3N0L2FkZC8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Imhvc3RfbGlzdCJ9LCJob3N0X2VkaXQiOnsidXJsIjoiL2hvc3QvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJob3N0X2xpc3QifSwiaG9zdF9kZWwiOnsidXJsIjoiL2hvc3QvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Imhvc3RfbGlzdCJ9LCJkZXBsb3lfYWRkIjp7InVybCI6Ii9kZXBsb3kvYWRkLyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9lZGl0Ijp7InVybCI6Ii9kZXBsb3kvZWRpdC8oP1A8cHJvamVjdF9pZD5cXGQrKS8oP1A8bmlkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGxveV9kZWwiOnsidXJsIjoiL2RlcGxveS9kZWwvKD9QPHByb2plY3RfaWQ+XFxkKykvKD9QPG5pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJzY3JpcHRfYWRkIjp7InVybCI6Ii9zY3JpcHQvYWRkLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoic2NyaXB0X2xpc3QifSwic2NyaXB0X2VkaXQiOnsidXJsIjoiL3NjcmlwdC9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InNjcmlwdF9saXN0In0sInNjcmlwdF9kZWwiOnsidXJsIjoiL3NjcmlwdC9kZWwvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoic2NyaXB0X2xpc3QifSwiZGF0YWJhc2VfbGlzdCI6eyJ1cmwiOiIvZGF0YWJhc2UvbGlzdC8iLCJtZW51X2lkIjo2LCJwYXJlbnRfbmFtZSI6bnVsbH0sImRhdGFiYXNlX2RldGFpbHMiOnsidXJsIjoiL2RhdGFiYXNlL2RldGFpbHMvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJvcF9vbmxpbmVfZWRpdCI6eyJ1cmwiOiIvb3Avb25saW5lL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoib25saW5lX2xpc3QifSwiZGVwbG95X3JvbGxiYWNrIjp7InVybCI6Ii9kZXBsb3kvcm9sbGJhY2svKD9QPHByb2plY3RfaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwiZGVwbG95X3B1c2giOnsidXJsIjoiL2RlcGxveS9wdXNoLyg/UDxwcm9qZWN0X2lkPlxcZCspLyg/UDxkZXBsb3lfaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwib3BfZGF0YWJhc2VfZWRpdCI6eyJ1cmwiOiIvb3BfZGF0YWJhc2UvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkYXRhYmFzZV9saXN0In0sImRlcGxveV9mZXRjaCI6eyJ1cmwiOiIvZGVwbG95L2ZldGNoLyg/UDxwcm9qZWN0X2lkPlxcZCspLyg/UDxkZXBsb3lfaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwic2VhcmNoIjp7InVybCI6Ii9zZWFyY2giLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9fSwicnR3c2RmZ3dlcmZmc2QiOnsiMSI6eyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NzUzM1x1OGJmN1x1NTM1NVx1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS1tYXAtbyIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NTM1NVx1NTIxN1x1ODg2OCIsInVybCI6Ii9vbmxpbmUvbGlzdC8iLCJuYW1lIjoib25saW5lX2xpc3QifV19LCI1Ijp7InRpdGxlIjoiXHU5ODc5XHU3NmVlXHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWdpdGxhYiIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1NTIxN1x1ODg2OCIsInVybCI6Ii9wcm9qZWN0L2xpc3QvIiwibmFtZSI6InByb2plY3RfbGlzdCJ9XX0sIjMiOnsidGl0bGUiOiJcdTRlM2JcdTY3M2FcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtaW94aG9zdCIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NGUzYlx1NjczYVx1NTIxN1x1ODg2OCIsInVybCI6Ii9ob3N0L2xpc3QvIiwibmFtZSI6Imhvc3RfbGlzdCJ9XX0sIjQiOnsidGl0bGUiOiJcdTgxMWFcdTY3MmNcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtY2FsZW5kYXItbWludXMtbyIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1ODExYVx1NjcyY1x1NTIxN1x1ODg2OCIsInVybCI6Ii9zY3JpcHQvbGlzdC8iLCJuYW1lIjoic2NyaXB0X2xpc3QifV19LCI2Ijp7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWRhdGFiYXNlIiwiY2xhc3MiOiJoaWRlIiwiY2hpbGRyZW4iOlt7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU1MjE3XHU4ODY4IiwidXJsIjoiL2RhdGFiYXNlL2xpc3QvIiwibmFtZSI6ImRhdGFiYXNlX2xpc3QifV19fX0=','2019-07-17 18:16:20.079865'),('i8gz6fxgbp9z8td7jq1g9v8ftkr6qvo1','ODBiMGZlNjIxYWYzMTA0Nzk3YTRmZDUxMTQ5N2VmZmU2ZmM3ZjYzOTp7ImNoZWNrX2NvZGUiOiJZRkZHRSIsInVzZXJfaWQiOjEsImlqa3NkdWZ3ZXNkZnMiOnsib25saW5lX2xpc3QiOnsidXJsIjoiL29ubGluZS9saXN0LyIsIm1lbnVfaWQiOjEsInBhcmVudF9uYW1lIjpudWxsfSwib25saW5lX2FkZCI6eyJ1cmwiOiIvb25saW5lL2FkZC8iLCJtZW51X2lkIjoxLCJwYXJlbnRfbmFtZSI6bnVsbH0sIm9ubGluZV9lZGl0Ijp7InVybCI6Ii9vbmxpbmUvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJvbmxpbmVfbGlzdCJ9LCJvbmxpbmVfZGVsIjp7InVybCI6Ii9vbmxpbmUvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInByb2plY3RfbGlzdCI6eyJ1cmwiOiIvcHJvamVjdC9saXN0LyIsIm1lbnVfaWQiOjUsInBhcmVudF9uYW1lIjpudWxsfSwicHJvamVjdF9hZGQiOnsidXJsIjoiL3Byb2plY3QvYWRkLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInByb2plY3RfZWRpdCI6eyJ1cmwiOiIvcHJvamVjdC9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJwcm9qZWN0X2RlbCI6eyJ1cmwiOiIvcHJvamVjdC9kZWwvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImhvc3RfbGlzdCI6eyJ1cmwiOiIvaG9zdC9saXN0LyIsIm1lbnVfaWQiOjMsInBhcmVudF9uYW1lIjpudWxsfSwiZGVwbG95X2xpc3QiOnsidXJsIjoiL2RlcGxveS9saXN0Lyg/UDxwcm9qZWN0X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInNjcmlwdF9saXN0Ijp7InVybCI6Ii9zY3JpcHQvbGlzdC8iLCJtZW51X2lkIjo0LCJwYXJlbnRfbmFtZSI6bnVsbH0sIm9ubGluZV9kZXRhaWxzIjp7InVybCI6Ii9vbmxpbmUvZGV0YWlscy8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJvbmxpbmVfbGlzdCJ9LCJob3N0X2FkZCI6eyJ1cmwiOiIvaG9zdC9hZGQvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJob3N0X2xpc3QifSwiaG9zdF9lZGl0Ijp7InVybCI6Ii9ob3N0L2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiaG9zdF9saXN0In0sImhvc3RfZGVsIjp7InVybCI6Ii9ob3N0L2RlbC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJob3N0X2xpc3QifSwiZGVwbG95X2FkZCI6eyJ1cmwiOiIvZGVwbG95L2FkZC8oP1A8cHJvamVjdF9pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJkZXBsb3lfZWRpdCI6eyJ1cmwiOiIvZGVwbG95L2VkaXQvKD9QPHByb2plY3RfaWQ+XFxkKykvKD9QPG5pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJkZXBsb3lfZGVsIjp7InVybCI6Ii9kZXBsb3kvZGVsLyg/UDxwcm9qZWN0X2lkPlxcZCspLyg/UDxuaWQ+XFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJwcm9qZWN0X2xpc3QifSwic2NyaXB0X2FkZCI6eyJ1cmwiOiIvc2NyaXB0L2FkZC8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InNjcmlwdF9saXN0In0sInNjcmlwdF9lZGl0Ijp7InVybCI6Ii9zY3JpcHQvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJzY3JpcHRfbGlzdCJ9LCJzY3JpcHRfZGVsIjp7InVybCI6Ii9zY3JpcHQvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InNjcmlwdF9saXN0In0sImRhdGFiYXNlX2xpc3QiOnsidXJsIjoiL2RhdGFiYXNlL2xpc3QvIiwibWVudV9pZCI6NiwicGFyZW50X25hbWUiOm51bGx9LCJkYXRhYmFzZV9hZGQiOnsidXJsIjoiL2RhdGFiYXNlL2FkZC8iLCJtZW51X2lkIjo2LCJwYXJlbnRfbmFtZSI6bnVsbH0sImRhdGFiYXNlX2RldGFpbHMiOnsidXJsIjoiL2RhdGFiYXNlL2RldGFpbHMvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJkYXRhYmFzZV9kZWwiOnsidXJsIjoiL2RhdGFiYXNlL2RlbC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkYXRhYmFzZV9saXN0In0sImRhdGFiYXNlX2VkaXQiOnsidXJsIjoiL2RhdGFiYXNlL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJwcm9qZWN0X29ubGluZV9lZGl0Ijp7InVybCI6Ii9wcm9qZWN0L29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInRlc3Rfb25saW5lX2VkaXQiOnsidXJsIjoiL3Rlc3Qvb25saW5lL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoib25saW5lX2xpc3QifSwib3Bfb25saW5lX2VkaXQiOnsidXJsIjoiL29wL29ubGluZS9lZGl0LyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6Im9ubGluZV9saXN0In0sInBtX29ubGluZV9lZGl0Ijp7InVybCI6Ii9wbS9vbmxpbmUvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJvbmxpbmVfbGlzdCJ9LCJkZXBsb3lfcm9sbGJhY2siOnsidXJsIjoiL2RlcGxveS9yb2xsYmFjay8oP1A8cHJvamVjdF9pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJkZXBsb3lfcHVzaCI6eyJ1cmwiOiIvZGVwbG95L3B1c2gvKD9QPHByb2plY3RfaWQ+XFxkKykvKD9QPGRlcGxveV9pZD5cXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InByb2plY3RfbGlzdCJ9LCJ1c2VyX2xpc3QiOnsidXJsIjoiL3VzZXIvbGlzdC8iLCJtZW51X2lkIjoyLCJwYXJlbnRfbmFtZSI6bnVsbH0sInVzZXJfYWRkIjp7InVybCI6Ii91c2VyL2FkZC8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InVzZXJfbGlzdCJ9LCJ1c2VyX2VkaXQiOnsidXJsIjoiL3VzZXIvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJ1c2VyX2xpc3QifSwidXNlcl9kZWwiOnsidXJsIjoiL3VzZXIvZGVsLyhcXGQrKS8iLCJtZW51X2lkIjpudWxsLCJwYXJlbnRfbmFtZSI6InVzZXJfbGlzdCJ9LCJwcm9qZWN0X2RhdGFiYXNlX2VkaXQiOnsidXJsIjoiL3Byb2plY3RfZGF0YWJhc2UvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkYXRhYmFzZV9saXN0In0sIm9wX2RhdGFiYXNlX2VkaXQiOnsidXJsIjoiL29wX2RhdGFiYXNlL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9LCJkZXBsb3lfZmV0Y2giOnsidXJsIjoiL2RlcGxveS9mZXRjaC8oP1A8cHJvamVjdF9pZD5cXGQrKS8oP1A8ZGVwbG95X2lkPlxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sInNlYXJjaCI6eyJ1cmwiOiIvc2VhcmNoLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoicHJvamVjdF9saXN0In0sImRlcGFydF9saXN0Ijp7InVybCI6Ii9kZXBhcnQvbGlzdC8iLCJtZW51X2lkIjo3LCJwYXJlbnRfbmFtZSI6bnVsbH0sImRlcGFydF9hZGQiOnsidXJsIjoiL2RlcGFydC9hZGQvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkZXBhcnRfbGlzdCJ9LCJkZXBhcnRfZWRpdCI6eyJ1cmwiOiIvZGVwYXJ0L2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGVwYXJ0X2xpc3QifSwiZGVwYXJ0X2RlbCI6eyJ1cmwiOiIvZGVwYXJ0L2RlbC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkZXBhcnRfbGlzdCJ9fSwicnR3c2RmZ3dlcmZmc2QiOnsiMSI6eyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NzUzM1x1OGJmN1x1NTM1NVx1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS1tYXAtbyIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NTM1NVx1NTIxN1x1ODg2OCIsInVybCI6Ii9vbmxpbmUvbGlzdC8iLCJuYW1lIjoib25saW5lX2xpc3QifSx7InRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU0ZTBhXHU3ZWJmXHU1MzU1IiwidXJsIjoiL29ubGluZS9hZGQvIiwibmFtZSI6Im9ubGluZV9hZGQifV19LCI1Ijp7InRpdGxlIjoiXHU5ODc5XHU3NmVlXHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWdpdGxhYiIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1NTIxN1x1ODg2OCIsInVybCI6Ii9wcm9qZWN0L2xpc3QvIiwibmFtZSI6InByb2plY3RfbGlzdCJ9XX0sIjMiOnsidGl0bGUiOiJcdTRlM2JcdTY3M2FcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtaW94aG9zdCIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NGUzYlx1NjczYVx1NTIxN1x1ODg2OCIsInVybCI6Ii9ob3N0L2xpc3QvIiwibmFtZSI6Imhvc3RfbGlzdCJ9XX0sIjQiOnsidGl0bGUiOiJcdTgxMWFcdTY3MmNcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtY2FsZW5kYXItbWludXMtbyIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1ODExYVx1NjcyY1x1NTIxN1x1ODg2OCIsInVybCI6Ii9zY3JpcHQvbGlzdC8iLCJuYW1lIjoic2NyaXB0X2xpc3QifV19LCI2Ijp7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWRhdGFiYXNlIiwiY2xhc3MiOiJoaWRlIiwiY2hpbGRyZW4iOlt7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU1MjE3XHU4ODY4IiwidXJsIjoiL2RhdGFiYXNlL2xpc3QvIiwibmFtZSI6ImRhdGFiYXNlX2xpc3QifSx7InRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1IiwidXJsIjoiL2RhdGFiYXNlL2FkZC8iLCJuYW1lIjoiZGF0YWJhc2VfYWRkIn1dfSwiMiI6eyJ0aXRsZSI6Ilx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS11c2VyLWNpcmNsZSIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NzUyOFx1NjIzN1x1NTIxN1x1ODg2OCIsInVybCI6Ii91c2VyL2xpc3QvIiwibmFtZSI6InVzZXJfbGlzdCJ9XX0sIjciOnsidGl0bGUiOiJcdTkwZThcdTk1ZThcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEgZmEtaW94aG9zdCIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1OTBlOFx1OTVlOFx1NTIxN1x1ODg2OCIsInVybCI6Ii9kZXBhcnQvbGlzdC8iLCJuYW1lIjoiZGVwYXJ0X2xpc3QifV19fX0=','2019-07-11 19:21:34.234492'),('jheap4z36qpxctk3j155egxno8eid77y','MzUyODNmZGQ2ZDRlZmQ2ZDhmNzI4NDlkNjNlOGE4MzI1ZTFkNmYxNDp7ImNoZWNrX2NvZGUiOiJFWERPRCIsInVzZXJfaWQiOjIsImlqa3NkdWZ3ZXNkZnMiOnsib25saW5lX2xpc3QiOnsidXJsIjoiL29ubGluZS9saXN0LyIsIm1lbnVfaWQiOjEsInBhcmVudF9uYW1lIjpudWxsfSwib25saW5lX2FkZCI6eyJ1cmwiOiIvb25saW5lL2FkZC8iLCJtZW51X2lkIjoxLCJwYXJlbnRfbmFtZSI6bnVsbH0sIm9ubGluZV9lZGl0Ijp7InVybCI6Ii9vbmxpbmUvZWRpdC8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJvbmxpbmVfbGlzdCJ9LCJvbmxpbmVfZGV0YWlscyI6eyJ1cmwiOiIvb25saW5lL2RldGFpbHMvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoib25saW5lX2xpc3QifSwiZGF0YWJhc2VfbGlzdCI6eyJ1cmwiOiIvZGF0YWJhc2UvbGlzdC8iLCJtZW51X2lkIjo2LCJwYXJlbnRfbmFtZSI6bnVsbH0sImRhdGFiYXNlX2FkZCI6eyJ1cmwiOiIvZGF0YWJhc2UvYWRkLyIsIm1lbnVfaWQiOjYsInBhcmVudF9uYW1lIjpudWxsfSwiZGF0YWJhc2VfZGV0YWlscyI6eyJ1cmwiOiIvZGF0YWJhc2UvZGV0YWlscy8oXFxkKykvIiwibWVudV9pZCI6bnVsbCwicGFyZW50X25hbWUiOiJkYXRhYmFzZV9saXN0In0sImRhdGFiYXNlX2VkaXQiOnsidXJsIjoiL2RhdGFiYXNlL2VkaXQvKFxcZCspLyIsIm1lbnVfaWQiOm51bGwsInBhcmVudF9uYW1lIjoiZGF0YWJhc2VfbGlzdCJ9fSwicnR3c2RmZ3dlcmZmc2QiOnsiMSI6eyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NzUzM1x1OGJmN1x1NTM1NVx1N2JhMVx1NzQwNiIsImljb24iOiJmYSBmYS1tYXAtbyIsImNsYXNzIjoiaGlkZSIsImNoaWxkcmVuIjpbeyJ0aXRsZSI6Ilx1NGUwYVx1N2ViZlx1NTM1NVx1NTIxN1x1ODg2OCIsInVybCI6Ii9vbmxpbmUvbGlzdC8iLCJuYW1lIjoib25saW5lX2xpc3QifSx7InRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU0ZTBhXHU3ZWJmXHU1MzU1IiwidXJsIjoiL29ubGluZS9hZGQvIiwibmFtZSI6Im9ubGluZV9hZGQifV19LCI2Ijp7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU3YmExXHU3NDA2IiwiaWNvbiI6ImZhIGZhLWRhdGFiYXNlIiwiY2xhc3MiOiJoaWRlIiwiY2hpbGRyZW4iOlt7InRpdGxlIjoiXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1XHU1MjE3XHU4ODY4IiwidXJsIjoiL2RhdGFiYXNlL2xpc3QvIiwibmFtZSI6ImRhdGFiYXNlX2xpc3QifSx7InRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2NTcwXHU2MzZlXHU1ZTkzXHU3NTMzXHU4YmY3XHU1MzU1IiwidXJsIjoiL2RhdGFiYXNlL2FkZC8iLCJuYW1lIjoiZGF0YWJhc2VfYWRkIn1dfX19','2019-07-12 16:37:33.902455'),('jqryx3c7zs551gb8471g4yg7mitqrw0a','ZTEzMzg5NTM2YzhkNThkZWQwZmMzY2JhM2UyZmJhN2IxODI0YTYyMzp7ImNoZWNrX2NvZGUiOiJJTFdWSiJ9','2019-07-16 14:04:12.825687');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_menu`
--

DROP TABLE IF EXISTS `rbac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_menu`
--

LOCK TABLES `rbac_menu` WRITE;
/*!40000 ALTER TABLE `rbac_menu` DISABLE KEYS */;
INSERT INTO `rbac_menu` VALUES (1,'上线申请单管理','fa fa-map-o'),(2,'用户管理','fa fa-user-circle'),(3,'主机管理','fa fa-ioxhost'),(4,'脚本管理','fa fa-calendar-minus-o'),(5,'项目管理','fa fa-gitlab'),(6,'数据库申请单管理','fa fa-database'),(7,'部门管理','fa fa-ioxhost');
/*!40000 ALTER TABLE `rbac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permission`
--

DROP TABLE IF EXISTS `rbac_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(128) NOT NULL,
  `title` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `rbac_permission_menu_id_3dcc68be_fk_rbac_menu_id` (`menu_id`),
  KEY `rbac_permission_parent_id_bcb411ef_fk_rbac_permission_id` (`parent_id`),
  CONSTRAINT `rbac_permission_menu_id_3dcc68be_fk_rbac_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`id`),
  CONSTRAINT `rbac_permission_parent_id_bcb411ef_fk_rbac_permission_id` FOREIGN KEY (`parent_id`) REFERENCES `rbac_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permission`
--

LOCK TABLES `rbac_permission` WRITE;
/*!40000 ALTER TABLE `rbac_permission` DISABLE KEYS */;
INSERT INTO `rbac_permission` VALUES (1,'/online/list/','上线单列表','online_list',1,NULL),(2,'/online/add/','添加上线单','online_add',1,NULL),(3,'/online/edit/(\\d+)/','编辑上线单','online_edit',NULL,1),(4,'/online/del/(\\d+)/','删除上线单','online_del',NULL,1),(5,'/project/list/','项目列表','project_list',5,NULL),(6,'/project/add/','添加项目','project_add',NULL,5),(7,'/project/edit/(\\d+)/','编辑项目','project_edit',NULL,5),(8,'/project/del/(\\d+)/','删除项目','project_del',NULL,5),(9,'/host/list/','主机列表','host_list',3,NULL),(10,'/deploy/list/(?P<project_id>\\d+)/','任务列表','deploy_list',NULL,5),(11,'/script/list/','脚本列表','script_list',4,NULL),(12,'/online/details/(\\d+)/','查看上线单','online_details',NULL,1),(13,'/host/add/','添加主机','host_add',NULL,9),(14,'/host/edit/(\\d+)/','编辑主机','host_edit',NULL,9),(15,'/host/del/(\\d+)/','删除主机','host_del',NULL,9),(16,'/deploy/add/(?P<project_id>\\d+)/','添加发布任务','deploy_add',NULL,5),(17,'/deploy/edit/(?P<project_id>\\d+)/(?P<nid>\\d+)/','编辑发布任务','deploy_edit',NULL,5),(18,'/deploy/del/(?P<project_id>\\d+)/(?P<nid>\\d+)/','删除任务列表','deploy_del',NULL,5),(19,'/script/add/','添加脚本','script_add',NULL,11),(20,'/script/edit/(\\d+)/','编辑脚本','script_edit',NULL,11),(21,'/script/del/(\\d+)/','删除脚本','script_del',NULL,11),(22,'/database/list/','数据库申请单列表','database_list',6,NULL),(23,'/database/add/','添加数据库申请单','database_add',6,NULL),(24,'/database/details/(\\d+)/','查看数据库申请详情','database_details',NULL,22),(25,'/database/del/(\\d+)/','删除数据库申请单','database_del',NULL,22),(26,'/database/edit/(\\d+)/','编辑数据库申请单','database_edit',NULL,22),(27,'/project/online/edit/(\\d+)/','项目负责人审核','project_online_edit',NULL,1),(28,'/test/online/edit/(\\d+)/','测试审核','test_online_edit',NULL,1),(29,'/op/online/edit/(\\d+)/','运维审核','op_online_edit',NULL,1),(30,'/pm/online/edit/(\\d+)/','产品审核','pm_online_edit',NULL,1),(31,'/deploy/rollback/(?P<project_id>\\d+)/','任务回滚','deploy_rollback',NULL,5),(32,'/deploy/push/(?P<project_id>\\d+)/(?P<deploy_id>\\d+)/','发布代码','deploy_push',NULL,5),(33,'/user/list/','用户列表','user_list',2,NULL),(34,'/user/add/','添加用户','user_add',NULL,33),(35,'/user/edit/(\\d+)/','编辑用户','user_edit',NULL,33),(36,'/user/del/(\\d+)/','删除用户','user_del',NULL,33),(37,'/project_database/edit/(\\d+)/','项目负责人审核数据库','project_database_edit',NULL,22),(38,'/op_database/edit/(\\d+)/','运维审核数据库申请单','op_database_edit',NULL,22),(39,'/deploy/fetch/(?P<project_id>\\d+)/(?P<deploy_id>\\d+)/','拉取代码','deploy_fetch',NULL,5),(40,'/search','搜索','search',NULL,5),(41,'/depart/list/','部门列表','depart_list',7,NULL),(42,'/depart/add/','添加部门','depart_add',NULL,41),(43,'/depart/edit/(\\d+)/','编辑部门','depart_edit',NULL,41),(44,'/depart/del/(\\d+)/','删除部门','depart_del',NULL,41),(45,'/pm_database/edit/(\\d+)/','产品审核数据库申请单','pm_database_edit',NULL,22);
/*!40000 ALTER TABLE `rbac_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (1,'运维'),(2,'开发'),(3,'测试'),(4,'产品'),(5,'项目负责人'),(6,'管理员');
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_permissions`
--

DROP TABLE IF EXISTS `rbac_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_permissions_role_id_permission_id_d01303da_uniq` (`role_id`,`permission_id`),
  KEY `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` (`permission_id`),
  CONSTRAINT `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_permissions`
--

LOCK TABLES `rbac_role_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_role_permissions` DISABLE KEYS */;
INSERT INTO `rbac_role_permissions` VALUES (2,1,1),(4,1,5),(84,1,6),(85,1,7),(83,1,8),(7,1,9),(8,1,10),(9,1,11),(96,1,12),(10,1,13),(11,1,14),(12,1,15),(13,1,16),(14,1,17),(15,1,18),(16,1,19),(17,1,20),(18,1,21),(97,1,22),(95,1,24),(19,1,29),(20,1,31),(1,1,32),(99,1,38),(5,1,39),(6,1,40),(90,2,1),(21,2,2),(22,2,3),(91,2,12),(92,2,22),(23,2,23),(24,2,24),(25,2,26),(26,3,1),(94,3,12),(28,3,22),(93,3,24),(30,3,28),(31,4,1),(32,4,22),(107,4,24),(108,4,30),(110,4,45),(34,5,1),(35,5,2),(36,5,3),(101,5,12),(38,5,22),(39,5,23),(40,5,24),(42,5,27),(37,5,37),(43,6,1),(44,6,2),(45,6,3),(46,6,4),(47,6,5),(48,6,6),(49,6,7),(50,6,8),(51,6,9),(52,6,10),(53,6,11),(54,6,12),(55,6,13),(56,6,14),(57,6,15),(58,6,16),(59,6,17),(60,6,18),(61,6,19),(62,6,20),(63,6,21),(64,6,22),(65,6,23),(66,6,24),(67,6,25),(68,6,26),(69,6,27),(70,6,28),(71,6,29),(72,6,30),(73,6,31),(74,6,32),(75,6,33),(76,6,34),(77,6,35),(78,6,36),(79,6,37),(80,6,38),(81,6,39),(82,6,40),(86,6,41),(87,6,42),(88,6,43),(89,6,44),(109,6,45);
/*!40000 ALTER TABLE `rbac_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_userinfo`
--

DROP TABLE IF EXISTS `rbac_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `server_name` varchar(32) NOT NULL,
  `server_private_key` longtext NOT NULL,
  `git_name` varchar(32) DEFAULT NULL,
  `git_pwd` varchar(32) DEFAULT NULL,
  `wechat_user` varchar(64) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `jobs` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_userinfo`
--

LOCK TABLES `rbac_userinfo` WRITE;
/*!40000 ALTER TABLE `rbac_userinfo` DISABLE KEYS */;
INSERT INTO `rbac_userinfo` VALUES (1,'admin','123','yx','-----BEGIN RSA PRIVATE KEY-----\r\nMIIEowIBAAKCAQEAw7OSe41ZAuqn2NcBV+I4OC4svDmqZO1tG6wamHCG7LM1BQte\r\nJOPsM290QK/zb2x/rGr2+yY44ADQ4wgqVAYyATg5lAfh3n9Ef17i/I45PAzjUa1c\r\nNSxUGjX61yUKp1ezCT7apxe97AsbHmk5Wp/mK8c1bF8issp6Vk1ZS0CfRK/kcwla\r\nt/7d9e7Mnm2F4kVO84+3CjZirMoT/xizZoYEbu/ING2+V+Ud43WrtAslQAgTqyd8\r\nvWDOkfjLEC63WWQAe9w9WC0CQLsvu1q3j0+rkyhAsnXwuRKFYdJP3yQPXjqRvexY\r\nsBQOw94B1+IsUF/bcoUVKTiF/E3kakJeD5W+pQIDAQABAoIBAApcoa7lBwd+gTCc\r\nAbgzhCKFX1z/+KOrZpGGhUn4+0vhGTeRKITvhHwctJ0QM+V8ay4n47fciDpkEKtU\r\nrVkRkug5n+LUoAL13hyYW5Bfv2wMiqSydyVhmXphzUxC69N8c0BUEaOzQB0VYXQ0\r\nwhKoULmUrKF2UBIDYoLbSZUQcN5kEeYkeR7MgifvPpbqsLexSbX3Dd8AUM5cj831\r\nMHsrZGWK489jUT+u6HOKBvmGA3ZRNneFaSgjLmFWj14Z8UzmxOG4Nqe/WE8xrCKe\r\nesV5Fz0/eboDt9nqy6KQmb/6IK+kmOEOoeT0jOPo81M6VjHo+drRkvpOwNpPwDAA\r\n3swNgukCgYEA/J6J8Kbn5hlYgG4d0fN2LRosVX7my+xUXGK/Km2FBqP1zG0p0SxN\r\nqhSZ6qvX3bvlNXZvwfw9ujdd0aiFEIMOLmnjZRhaU/7knkzFih6r2ZFlQ+Vsupm8\r\nebqDl1jjavZTxo6MQM3UbaTDSNO1k9H2RW4dFv91yH+0SS5q8JiONGMCgYEAxlIJ\r\nIh2orXasigAdkAzC7fdum2E+yEdeGM7i30Ng7mDwvE+qkxc31GurUc/pIuY1GzzX\r\njOZLeFrUww69nXqzh/a98cdGNV+lCmbdX+fe733yR3/CsTTUrUS593xgK0iseQZk\r\ncxmx2EV6r9rikWSm+/1dreeHyC3pPy4wV2lum1cCgYEA97FvaSIOMURazZqq7Ig+\r\nMF0AaVgDbqGr2eYMsMov6+HqCWZj4TACeqi2fi2+fDBWvsQBMoBj+el9uSv2RMlr\r\np0C18RMexksf2MNH0XTfZXW1iAw1PwWskuK5UjWazu72F7L/fC8VgehSfl7vJCBz\r\ny4H7TehvkYb9u9+ihYPfsycCgYBFN/jMGYH4GUWbXPL0hh+7IvNN9CEPkik7i2oP\r\n9tpsGRWtBDlK4X2w/GttQJ3kemjqus+Y9AA/X6SG+CwiPONQf0RIkP7mPh3Chaia\r\ngrmC6XiYj/UKGKBqYWRvBtAiC1l3XE3PBpbWH1n06vbNPE40AXii6/6uVaflT1+8\r\nAqaCPQKBgBM7vFU/oQt9MfFWAhMl66LI/CK4n7+lGeqcZVwjxFTuMvTlcEnJiZge\r\n2zjzJBwXcKkpoA6QnQEEpwnC9umkeH/9J5mEbNeY5vAlx06I+t/06A/bOmmq/atx\r\nh52Txo+ajD1S5CgtufUpgPHFLx0b4FPTcpVly9yXo180jc9KKEYH\r\n-----END RSA PRIVATE KEY-----','root','12345678','xxx','huningfei@126.com','管理员'),(2,'kf','123','','',NULL,NULL,'ddd','825536458@qq.com','开发'),(3,'project','123','','',NULL,NULL,'ddd','huningfei@126.com','项目负责人'),(4,'hu','123','yx','-----BEGIN RSA PRIVATE KEY-----\r\nMIIEowIBAAKCAQEAw7OSe41ZAuqn2NcBV+I4OC4svDmqZO1tG6wamHCG7LM1BQte\r\nJOPsM290QK/zb2x/rGr2+yY44ADQ4wgqVAYyATg5lAfh3n9Ef17i/I45PAzjUa1c\r\nNSxUGjX61yUKp1ezCT7apxe97AsbHmk5Wp/mK8c1bF8issp6Vk1ZS0CfRK/kcwla\r\nt/7d9e7Mnm2F4kVO84+3CjZirMoT/xizZoYEbu/ING2+V+Ud43WrtAslQAgTqyd8\r\nvWDOkfjLEC63WWQAe9w9WC0CQLsvu1q3j0+rkyhAsnXwuRKFYdJP3yQPXjqRvexY\r\nsBQOw94B1+IsUF/bcoUVKTiF/E3kakJeD5W+pQIDAQABAoIBAApcoa7lBwd+gTCc\r\nAbgzhCKFX1z/+KOrZpGGhUn4+0vhGTeRKITvhHwctJ0QM+V8ay4n47fciDpkEKtU\r\nrVkRkug5n+LUoAL13hyYW5Bfv2wMiqSydyVhmXphzUxC69N8c0BUEaOzQB0VYXQ0\r\nwhKoULmUrKF2UBIDYoLbSZUQcN5kEeYkeR7MgifvPpbqsLexSbX3Dd8AUM5cj831\r\nMHsrZGWK489jUT+u6HOKBvmGA3ZRNneFaSgjLmFWj14Z8UzmxOG4Nqe/WE8xrCKe\r\nesV5Fz0/eboDt9nqy6KQmb/6IK+kmOEOoeT0jOPo81M6VjHo+drRkvpOwNpPwDAA\r\n3swNgukCgYEA/J6J8Kbn5hlYgG4d0fN2LRosVX7my+xUXGK/Km2FBqP1zG0p0SxN\r\nqhSZ6qvX3bvlNXZvwfw9ujdd0aiFEIMOLmnjZRhaU/7knkzFih6r2ZFlQ+Vsupm8\r\nebqDl1jjavZTxo6MQM3UbaTDSNO1k9H2RW4dFv91yH+0SS5q8JiONGMCgYEAxlIJ\r\nIh2orXasigAdkAzC7fdum2E+yEdeGM7i30Ng7mDwvE+qkxc31GurUc/pIuY1GzzX\r\njOZLeFrUww69nXqzh/a98cdGNV+lCmbdX+fe733yR3/CsTTUrUS593xgK0iseQZk\r\ncxmx2EV6r9rikWSm+/1dreeHyC3pPy4wV2lum1cCgYEA97FvaSIOMURazZqq7Ig+\r\nMF0AaVgDbqGr2eYMsMov6+HqCWZj4TACeqi2fi2+fDBWvsQBMoBj+el9uSv2RMlr\r\np0C18RMexksf2MNH0XTfZXW1iAw1PwWskuK5UjWazu72F7L/fC8VgehSfl7vJCBz\r\ny4H7TehvkYb9u9+ihYPfsycCgYBFN/jMGYH4GUWbXPL0hh+7IvNN9CEPkik7i2oP\r\n9tpsGRWtBDlK4X2w/GttQJ3kemjqus+Y9AA/X6SG+CwiPONQf0RIkP7mPh3Chaia\r\ngrmC6XiYj/UKGKBqYWRvBtAiC1l3XE3PBpbWH1n06vbNPE40AXii6/6uVaflT1+8\r\nAqaCPQKBgBM7vFU/oQt9MfFWAhMl66LI/CK4n7+lGeqcZVwjxFTuMvTlcEnJiZge\r\n2zjzJBwXcKkpoA6QnQEEpwnC9umkeH/9J5mEbNeY5vAlx06I+t/06A/bOmmq/atx\r\nh52Txo+ajD1S5CgtufUpgPHFLx0b4FPTcpVly9yXo180jc9KKEYH\r\n-----END RSA PRIVATE KEY-----','root','12345678','15101181093','huningfei@126.com','运维'),(5,'cs','123','','',NULL,NULL,'ddd','huningfei@126.com','测试'),(6,'pm','123','','',NULL,NULL,'xxx','huningfei@126.com','产品');
/*!40000 ALTER TABLE `rbac_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_userinfo_roles`
--

DROP TABLE IF EXISTS `rbac_userinfo_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_userinfo_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_userinfo_roles_userinfo_id_role_id_aeda2126_uniq` (`userinfo_id`,`role_id`),
  KEY `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`),
  CONSTRAINT `rbac_userinfo_roles_userinfo_id_2da02bea_fk_rbac_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_userinfo_roles`
--

LOCK TABLES `rbac_userinfo_roles` WRITE;
/*!40000 ALTER TABLE `rbac_userinfo_roles` DISABLE KEYS */;
INSERT INTO `rbac_userinfo_roles` VALUES (1,1,6),(2,2,2),(3,3,5),(4,4,1),(5,5,3),(6,6,4);
/*!40000 ALTER TABLE `rbac_userinfo_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_department`
--

DROP TABLE IF EXISTS `web_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_department`
--

LOCK TABLES `web_department` WRITE;
/*!40000 ALTER TABLE `web_department` DISABLE KEYS */;
INSERT INTO `web_department` VALUES (1,'运维'),(2,'开发');
/*!40000 ALTER TABLE `web_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_deploy`
--

DROP TABLE IF EXISTS `web_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_deploy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch` varchar(32) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `script_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_deploy_project_id_6f02b7ab_fk_web_project_id` (`project_id`),
  KEY `web_deploy_script_id_d70b590c_fk_web_script_id` (`script_id`),
  CONSTRAINT `web_deploy_project_id_6f02b7ab_fk_web_project_id` FOREIGN KEY (`project_id`) REFERENCES `web_project` (`id`),
  CONSTRAINT `web_deploy_script_id_d70b590c_fk_web_script_id` FOREIGN KEY (`script_id`) REFERENCES `web_script` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_deploy`
--

LOCK TABLES `web_deploy` WRITE;
/*!40000 ALTER TABLE `web_deploy` DISABLE KEYS */;
INSERT INTO `web_deploy` VALUES (1,'master','php20190627165226','2019-06-27 16:52:26.319701',3,1,1),(2,'master','PHP20190627174027','2019-06-27 17:40:27.390489',3,1,1),(3,'master','PHP20190627194337','2019-06-27 19:43:37.553182',3,1,1),(4,'master','PHP20190628144414','2019-06-28 14:44:14.439548',3,1,1),(5,'master','PHP20190628144750','2019-06-28 14:47:50.757920',3,1,1),(6,'master','PHP20190628144917','2019-06-28 14:49:17.162862',3,1,1),(7,'master','PHP20190703144145','2019-07-03 14:41:45.878503',3,1,1);
/*!40000 ALTER TABLE `web_deploy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_deployrecord`
--

DROP TABLE IF EXISTS `web_deployrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_deployrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_version` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `deploy_time` datetime(6) DEFAULT NULL,
  `log` longtext NOT NULL,
  `deploy_id` int(11) DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_deployrecord_deploy_id_ccf1fcfd_fk_web_deploy_id` (`deploy_id`),
  KEY `web_deployrecord_host_id_428695fa_fk_web_host_id` (`host_id`),
  CONSTRAINT `web_deployrecord_deploy_id_ccf1fcfd_fk_web_deploy_id` FOREIGN KEY (`deploy_id`) REFERENCES `web_deploy` (`id`),
  CONSTRAINT `web_deployrecord_host_id_428695fa_fk_web_host_id` FOREIGN KEY (`host_id`) REFERENCES `web_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_deployrecord`
--

LOCK TABLES `web_deployrecord` WRITE;
/*!40000 ALTER TABLE `web_deployrecord` DISABLE KEYS */;
INSERT INTO `web_deployrecord` VALUES (1,'master',2,'2019-06-27 17:01:06.500453','发布成功',1,1),(2,'master',2,'2019-06-27 17:40:37.040040','发布成功',2,1),(3,'master',2,'2019-06-27 17:40:37.041041','发布成功',2,2),(4,'master',2,'2019-06-27 19:43:47.404745','发布成功',3,1),(5,'master',2,'2019-06-28 14:44:25.173162','发布成功',4,1),(6,'master',2,'2019-06-28 14:44:25.176162','发布成功',4,2),(7,'master',2,'2019-06-28 14:47:57.651315','发布成功',5,1),(8,'master',2,'2019-06-28 14:47:57.652315','发布成功',5,2),(9,'master',2,'2019-06-28 14:49:24.783298','发布成功',6,1),(10,'master',2,'2019-06-28 14:49:24.785298','发布成功',6,2),(11,'master',2,'2019-07-03 14:43:49.079550','发布成功',7,1),(12,'master',2,'2019-07-03 14:43:49.080550','发布成功',7,2);
/*!40000 ALTER TABLE `web_deployrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_host`
--

DROP TABLE IF EXISTS `web_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(32) NOT NULL,
  `ssh_port` int(11) NOT NULL,
  `other` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_host`
--

LOCK TABLES `web_host` WRITE;
/*!40000 ALTER TABLE `web_host` DISABLE KEYS */;
INSERT INTO `web_host` VALUES (1,'192.168.10.227',22,'web'),(2,'192.168.6.220',22,'web1');
/*!40000 ALTER TABLE `web_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_onlinedetails`
--

DROP TABLE IF EXISTS `web_onlinedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_onlinedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Online_project` varchar(128) DEFAULT NULL,
  `Online_time` datetime(6) DEFAULT NULL,
  `Rollback_name` varchar(128) DEFAULT NULL,
  `Online_step` varchar(128) DEFAULT NULL,
  `Branch_status` varchar(128) DEFAULT NULL,
  `Influence` varchar(128) DEFAULT NULL,
  `select_project` varchar(128) DEFAULT NULL,
  `select_test` varchar(128) DEFAULT NULL,
  `select_op` varchar(128) DEFAULT NULL,
  `Op_qz` varchar(128) DEFAULT NULL,
  `Rd_qz` varchar(128) DEFAULT NULL,
  `Test_qz` varchar(128) DEFAULT NULL,
  `Ui_qz` varchar(128) DEFAULT NULL,
  `Pm_qz` varchar(128) DEFAULT NULL,
  `Zj_qz` varchar(128) DEFAULT NULL,
  `Rallback_result` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_onlinedetails`
--

LOCK TABLES `web_onlinedetails` WRITE;
/*!40000 ALTER TABLE `web_onlinedetails` DISABLE KEYS */;
INSERT INTO `web_onlinedetails` VALUES (1,'xb','2019-06-03 00:00:00.000000','回滚到最新备份','DDDDDDDDDDDDDDDDD\n','已经合并','修改首页','project','cs','hu','运维预上线完成','kf','测试确认签字',NULL,'产品确认','负责人确认签字',NULL,9,3),(2,'p2peye','2019-06-05 00:00:00.000000','回滚到最新备份','分支：  feature/lhw_redmine_17508\r\n/source/include/post/post_editpost.php\n','已经合并','修改首页','project','cs','hu','运维上线完成','kf','测试确认签字',NULL,'产品确认','负责人确认签字',NULL,9,3),(3,'library','2019-06-03 00:00:00.000000','回滚到最新备份','eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\n','已经合并','修改首页','project','cs','hu',NULL,'kf',NULL,NULL,NULL,'None',NULL,2,3),(4,'test','2019-07-01 00:00:00.000000','回滚到最新备份','ddddddddddddddddddddddddd\n','已经合并','修改首页','project','cs','hu',NULL,'kf',NULL,NULL,NULL,'',NULL,8,3),(5,'HU','2019-06-03 00:00:00.000000','回滚到最新备份','DDDDDDDDDDDDDDD\n','已经合并','修改首页','project','cs','hu','','kf','','','','','',1,3);
/*!40000 ALTER TABLE `web_onlinedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_project`
--

DROP TABLE IF EXISTS `web_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `git` varchar(128) NOT NULL,
  `private` tinyint(1) NOT NULL,
  `online_path` varchar(128) NOT NULL,
  `depart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_project_depart_id_fba2085e_fk_web_department_id` (`depart_id`),
  CONSTRAINT `web_project_depart_id_fba2085e_fk_web_department_id` FOREIGN KEY (`depart_id`) REFERENCES `web_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_project`
--

LOCK TABLES `web_project` WRITE;
/*!40000 ALTER TABLE `web_project` DISABLE KEYS */;
INSERT INTO `web_project` VALUES (1,'PHP','http://192.168.7.18/root/php.git',1,'/home/yx/server/nginx/html/',2),(2,'xb','http://192.168.7.18/root/php.git',1,'/home/yx/server/nginx/html/',1);
/*!40000 ALTER TABLE `web_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_project_hosts`
--

DROP TABLE IF EXISTS `web_project_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_project_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_project_hosts_project_id_host_id_16f92d78_uniq` (`project_id`,`host_id`),
  KEY `web_project_hosts_host_id_446ae507_fk_web_host_id` (`host_id`),
  CONSTRAINT `web_project_hosts_host_id_446ae507_fk_web_host_id` FOREIGN KEY (`host_id`) REFERENCES `web_host` (`id`),
  CONSTRAINT `web_project_hosts_project_id_8467c117_fk_web_project_id` FOREIGN KEY (`project_id`) REFERENCES `web_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_project_hosts`
--

LOCK TABLES `web_project_hosts` WRITE;
/*!40000 ALTER TABLE `web_project_hosts` DISABLE KEYS */;
INSERT INTO `web_project_hosts` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2);
/*!40000 ALTER TABLE `web_project_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_rollbackrecord`
--

DROP TABLE IF EXISTS `web_rollbackrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_rollbackrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_version` varchar(32) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `deploy_time` datetime(6) NOT NULL,
  `rollback_log` longtext NOT NULL,
  `deploy_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_rollbackrecord_deploy_id_d241019b_fk_web_deploy_id` (`deploy_id`),
  KEY `web_rollbackrecord_host_id_9f30e866_fk_web_host_id` (`host_id`),
  CONSTRAINT `web_rollbackrecord_deploy_id_d241019b_fk_web_deploy_id` FOREIGN KEY (`deploy_id`) REFERENCES `web_deploy` (`id`),
  CONSTRAINT `web_rollbackrecord_host_id_9f30e866_fk_web_host_id` FOREIGN KEY (`host_id`) REFERENCES `web_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_rollbackrecord`
--

LOCK TABLES `web_rollbackrecord` WRITE;
/*!40000 ALTER TABLE `web_rollbackrecord` DISABLE KEYS */;
INSERT INTO `web_rollbackrecord` VALUES (1,'master',2,'2019-07-03 15:05:01.000000','回滚成功',1,1),(2,'master',2,'2019-07-03 15:05:00.000000','回滚成功',1,2);
/*!40000 ALTER TABLE `web_rollbackrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_script`
--

DROP TABLE IF EXISTS `web_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `interpreter` varchar(16) NOT NULL,
  `code` longtext NOT NULL,
  `rollback_code` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_script`
--

LOCK TABLES `web_script` WRITE;
/*!40000 ALTER TABLE `web_script` DISABLE KEYS */;
INSERT INTO `web_script` VALUES (1,'test_shell','sh','#!/bin/bash\r\nproject_name=$1\r\ndir_time=$2\r\nfile_name=$3\r\n# 所有代码存放目录\r\nCODE_BASE_PATH=\"/home/yx/codes\"\r\n# 某个项目代码存放目录\r\nPROJECT_PATH=\"$CODE_BASE_PATH/$project_name/$dir_time/\"\r\necho \"$PROJECT_PATH\"\r\n\r\n# 项目所在目录\r\nWEB_BASE_PATH=\"/home/yx/server/nginx/vhost/\"\r\n\r\nunzip -d $PROJECT_PATH  $CODE_BASE_PATH/$project_name/$dir_time/${file_name}  # 解压代码       \r\nrsync -av $PROJECT_PATH --exclude-from \"/home/yx/exclude.list\"  $WEB_BASE_PATH   # 拷贝文件到项目所在目录，但是要排除所有的配置文件','#!/bin/bash\r\nproject_name=$1\r\ndir_time=$2\r\nfile_name=$3\r\n# 所有代码存放目录\r\nCODE_BASE_PATH=\"/home/yx/codes\"\r\n# 某个项目存放目录\r\nPROJECT_PATH=\"$CODE_BASE_PATH/$project_name/$dir_time/\"\r\necho \"$PROJECT_PATH\"\r\n# 项目所在目录\r\nWEB_BASE_PATH=\"/home/yx/server/nginx/vhost/\"\r\nrsync -av $PROJECT_PATH/ --exclude-from \"/home/yx/exclude.list\"  $WEB_BASE_PATH');
/*!40000 ALTER TABLE `web_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_sqlcredential`
--

DROP TABLE IF EXISTS `web_sqlcredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sqlcredential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `database_name` varchar(256) NOT NULL,
  `Apply_time` datetime(6) NOT NULL,
  `sql_yj` longtext NOT NULL,
  `select_project` varchar(128) NOT NULL,
  `select_test` varchar(128) NOT NULL,
  `select_op` varchar(128) NOT NULL,
  `Rollback_name` varchar(128) NOT NULL,
  `Development_qz` varchar(128) NOT NULL,
  `Project_qz` varchar(128) NOT NULL,
  `Technical_qz` varchar(128) NOT NULL,
  `op_qz` varchar(256) NOT NULL,
  `Project_confirm_qz` varchar(128) NOT NULL,
  `status` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_sqlcredential_staff_id_8f71beec_fk_web_userinfo_id` (`staff_id`),
  CONSTRAINT `web_sqlcredential_staff_id_8f71beec_fk_web_userinfo_id` FOREIGN KEY (`staff_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_sqlcredential`
--

LOCK TABLES `web_sqlcredential` WRITE;
/*!40000 ALTER TABLE `web_sqlcredential` DISABLE KEYS */;
INSERT INTO `web_sqlcredential` VALUES (8,'p2pyeye','2019-07-03 00:00:00.000000','eeeeeeeeeee','project','','hu','回滚到最新备份','kf','','','','',1,3),(9,'touyouquan','2019-07-02 00:00:00.000000','ddddddddddddddddd','project','','hu','回滚到最新备份','kf','','','','',4,3),(10,'stocks','2019-07-03 00:00:00.000000','dddddddddddddd','project','','hu','回滚到最新备份','kf','项目负责人确认签字','','运维确认dddd ','对方答复',6,3),(11,'111111','2019-07-03 00:00:00.000000','TTTTTTTTTTTTTT','project','','hu','回滚到最新备份','kf','','','','',1,3),(12,'deploy','2019-07-03 00:00:00.000000','ffffffffffff','project','','hu','回滚到最新备份','kf','技术总监确认','技术总监确认','运维已经备份',' 产品确认',6,3);
/*!40000 ALTER TABLE `web_sqlcredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userinfo`
--

DROP TABLE IF EXISTS `web_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `server_name` varchar(32) NOT NULL,
  `server_private_key` longtext NOT NULL,
  `git_name` varchar(32) DEFAULT NULL,
  `git_pwd` varchar(32) DEFAULT NULL,
  `wechat_user` varchar(64) DEFAULT NULL,
  `jobs` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userinfo`
--

LOCK TABLES `web_userinfo` WRITE;
/*!40000 ALTER TABLE `web_userinfo` DISABLE KEYS */;
INSERT INTO `web_userinfo` VALUES (1,'pbkdf2_sha256$150000$BCsEccw4y0V1$PVPP/Agvts8WZ/AiWCCFji1g3J4HCxXe932gQA8+dIQ=','2019-07-03 14:15:01.755752',1,'admin','','','',1,1,'2019-06-27 14:41:18.428683','','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `web_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userinfo_groups`
--

DROP TABLE IF EXISTS `web_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_userinfo_groups_userinfo_id_group_id_5337b99a_uniq` (`userinfo_id`,`group_id`),
  KEY `web_userinfo_groups_group_id_f0e66acc_fk_auth_group_id` (`group_id`),
  CONSTRAINT `web_userinfo_groups_group_id_f0e66acc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `web_userinfo_groups_userinfo_id_dfe01481_fk_web_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userinfo_groups`
--

LOCK TABLES `web_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `web_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `web_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_userinfo_user_permis_userinfo_id_permission_i_5fcd24d5_uniq` (`userinfo_id`,`permission_id`),
  KEY `web_userinfo_user_pe_permission_id_1a37ea1f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `web_userinfo_user_pe_permission_id_1a37ea1f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `web_userinfo_user_pe_userinfo_id_1565944c_fk_web_useri` FOREIGN KEY (`userinfo_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userinfo_user_permissions`
--

LOCK TABLES `web_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `web_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 11:22:11
