-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: psysdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add customer',1,'add_customer'),(2,'Can change customer',1,'change_customer'),(3,'Can delete customer',1,'delete_customer'),(4,'Can view customer',1,'view_customer'),(5,'Can add customer numbering',2,'add_customernumbering'),(6,'Can change customer numbering',2,'change_customernumbering'),(7,'Can delete customer numbering',2,'delete_customernumbering'),(8,'Can view customer numbering',2,'view_customernumbering'),(9,'Can add employee',3,'add_employee'),(10,'Can change employee',3,'change_employee'),(11,'Can delete employee',3,'delete_employee'),(12,'Can view employee',3,'view_employee'),(13,'Can add item',4,'add_item'),(14,'Can change item',4,'change_item'),(15,'Can delete item',4,'delete_item'),(16,'Can view item',4,'view_item'),(17,'Can add orders',5,'add_orders'),(18,'Can change orders',5,'change_orders'),(19,'Can delete orders',5,'delete_orders'),(20,'Can view orders',5,'view_orders'),(21,'Can add order details',6,'add_orderdetails'),(22,'Can change order details',6,'change_orderdetails'),(23,'Can delete order details',6,'delete_orderdetails'),(24,'Can view order details',6,'view_orderdetails'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add content type',11,'add_contenttype'),(42,'Can change content type',11,'change_contenttype'),(43,'Can delete content type',11,'delete_contenttype'),(44,'Can view content type',11,'view_contenttype'),(45,'Can add session',12,'add_session'),(46,'Can change session',12,'change_session'),(47,'Can delete session',12,'delete_session'),(48,'Can view session',12,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_code` varchar(6) NOT NULL,
  `customer_name` varchar(32) DEFAULT NULL,
  `customer_telno` varchar(13) DEFAULT NULL,
  `customer_postalcode` varchar(8) DEFAULT NULL,
  `customer_address` varchar(40) DEFAULT NULL,
  `discount_rate` int(2) DEFAULT NULL,
  `delete_flag` int(1) NOT NULL,
  PRIMARY KEY (`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('RA0001','A店社','06-128-3581','530-0001','大阪市北区梅田２－１',0,0),('RA0002','B店社','06-128-3582','530-0002','大阪市北区中之島２－２',0,0),('RA0003','C店社','06-128-3583','530-0003','大阪市北区弁天２－１',0,0),('RA0004','D店社','06-128-3584','530-0004','大阪市北区南幸１－４',0,0),('RA0005','E店社','06-128-3585','530-0005','大阪市北区梅田２－５',0,0),('RA0006','F店社','06-128-3586','530-0006','大阪市北区梅田２－６',0,0),('RA0007','G店社','06-128-3587','530-0007','大阪市北区堂島１－１',0,0),('RA0008','H店社','06-128-3588','530-0008','大阪市北区堂島１－２',0,0),('RA0009','I店社','06-128-3589','530-0009','大阪市北区堂島２－３',0,0),('RA0010','J店社','06-150-3590','530-0010','大阪市北区堂島２－４',0,0),('RA0011','K店社','06-150-3591','530-0011','大阪市北区弁天２－１',0,0),('RA0012','L店社','06-150-3592','530-0012','大阪市北区弁天２－２',0,0),('RA0013','M店社','06-150-3593','530-0013','大阪市北区弁天２－３',0,0),('RA0014','N店社','06-150-3594','530-0014','大阪市北区弁天２－４',0,0),('RA0015','O店社','06-150-3595','530-0015','大阪市北区弁天２－５',0,0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_numbering`
--

DROP TABLE IF EXISTS `customer_numbering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_numbering` (
  `customer_code` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_numbering`
--

LOCK TABLES `customer_numbering` WRITE;
/*!40000 ALTER TABLE `customer_numbering` DISABLE KEYS */;
INSERT INTO `customer_numbering` VALUES (15);
/*!40000 ALTER TABLE `customer_numbering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(1,'psys','customer'),(2,'psys','customernumbering'),(3,'psys','employee'),(4,'psys','item'),(6,'psys','orderdetails'),(5,'psys','orders'),(12,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-01-05 14:25:26.648671'),(2,'auth','0001_initial','2026-01-05 14:25:26.921300'),(3,'admin','0001_initial','2026-01-05 14:25:27.013652'),(4,'admin','0002_logentry_remove_auto_add','2026-01-05 14:25:27.032173'),(5,'admin','0003_logentry_add_action_flag_choices','2026-01-05 14:25:27.063433'),(6,'contenttypes','0002_remove_content_type_name','2026-01-05 14:25:27.118870'),(7,'auth','0002_alter_permission_name_max_length','2026-01-05 14:25:27.149977'),(8,'auth','0003_alter_user_email_max_length','2026-01-05 14:25:27.162405'),(9,'auth','0004_alter_user_username_opts','2026-01-05 14:25:27.168419'),(10,'auth','0005_alter_user_last_login_null','2026-01-05 14:25:27.199677'),(11,'auth','0006_require_contenttypes_0002','2026-01-05 14:25:27.202422'),(12,'auth','0007_alter_validators_add_error_messages','2026-01-05 14:25:27.208664'),(13,'auth','0008_alter_user_username_max_length','2026-01-05 14:25:27.216656'),(14,'auth','0009_alter_user_last_name_max_length','2026-01-05 14:25:27.226560'),(15,'auth','0010_alter_group_name_max_length','2026-01-05 14:25:27.236177'),(16,'auth','0011_update_proxy_permissions','2026-01-05 14:25:27.242208'),(17,'auth','0012_alter_user_first_name_max_length','2026-01-05 14:25:27.251568'),(18,'psys','0001_initial','2026-01-05 14:25:27.258102'),(19,'sessions','0001_initial','2026-01-05 14:25:27.277427');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('95uxp8a56jh37jagfpynisy7j3e0qrb8','.eJyrVsrJT8_Miy8tTi2Kz0xRslIKMjIwMDBU0kGWyEvMTQVKxZRaGhmbxJSamRtZxJSapBoYAEUMklOVagFJaBaf:1vclWj:8SiSYlb6exHPA48qOwigfxvsDAjDUFFQGL52MrC0zbs','2026-01-19 14:25:45.006375');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_no` varchar(6) NOT NULL,
  `employee_name` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('R20001','鈴木一郎','ry000001'),('R20002','山田太郎','rx000002'),('R20003','坂本竜馬','rw000003'),('R20004','田中花','rv000004');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_code` varchar(6) NOT NULL,
  `item_name` varchar(32) DEFAULT NULL,
  `price` int(6) DEFAULT NULL,
  `stock` int(8) DEFAULT NULL,
  PRIMARY KEY (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('AR0001','ミネラルウォーター（500ml）',80,99975),('AR0002','ミネラルウォーター（2ｌ）',100,100000),('AR0003','ミネラルウォーター（業務用）',1000,100000),('AR0004','ミネラルウォーター(500ml)x12本',500,100000),('AR0005','ミネラルウォーター(2ｌ)x12本',1200,100000),('AR0006','海洋深層水（500ml）',80,100000),('AR0007','海洋深層水（2ｌ）',100,100000),('AR0008','海洋深層水（業務用）',1000,100000),('AR0009','海洋深層水(500ml)x12本',500,100000),('AR0010','海洋深層水(2ｌ)x12本',1200,100000),('BR0001','黄金にんにく・10日分',1200,99970),('BR0002','黄金にんにく・30日分',3000,99990),('BR0003','黄金にんに・ 90日分',8000,100000),('BR0004','無臭にんにく・10日分',1000,100000),('BR0005','無臭にんにく・30日分',2800,99990),('BR0006','無臭にんにく・90日分',7400,100000),('BR0007','健康黒ゴマ・10日分',500,100000),('BR0008','健康黒ゴマ・30日分',1300,99990),('BR0009','健康黒ゴマ・90日分',3500,100000),('BR0010','黒ゴマセサミン・10日分',600,100000),('BR0011','黒ゴマセサミン・30日分',1500,99990),('BR0012','黒ゴマセサミン・90日分',4000,100000),('CR0001','食べる納豆キナーゼ・10日分',600,99980),('CR0002','食べる納豆キナーゼ・30日分',1600,100000),('CR0003','食べる納豆キナーゼ・90日分',4500,100000),('DR0001','雑穀プラス・10食分',500,100000),('DR0002','雑穀プラス・30食分',1300,100000),('DR0003','雑穀プラス・90食分',3500,100000),('DR0004','五穀米・10食分',1000,100000),('DR0005','五穀米・30食分',2800,100000),('DR0006','五穀米・90食分',8500,100000),('DR0007','十穀米・10食分',1200,100000),('DR0008','十穀米・30食分',3400,100000),('DR0009','十穀米・90食分',9500,100000),('DR0010','健康発芽玄米・10食分',1000,100000),('DR0011','健康発芽玄米・30食分',2800,100000),('DR0012','健康発芽玄米・90食分',8500,100000),('DR0013','健康黒酢（200ml）',350,100000),('DR0014','健康黒酢（1ｌ）',900,100000),('DR0015','健康黒酢（200ml）x12本',3500,100000),('DR0016','健康黒酢（1ｌ）x12本',9000,100000),('ER0001','乳酸菌飲料ジョイ・6本パック',280,100000),('ER0002','乳酸菌飲料ジョイ・12本パック',500,100000),('ER0003','乳酸菌プラス・24袋パック',2200,100000),('ER0004','乳酸菌プラス・36袋パック',3000,100000),('ER0005','乳酸菌プラス・36袋パック',5000,100000),('ER0006','健康青汁・24袋パック',2200,100000),('ER0007','健康青汁・36袋パック',3000,100000),('ER0008','健康青汁・60袋パック',5000,100000),('FR0001','マルチビタミン&ミネラル・10日分',1200,99990),('FR0002','マルチビタミン&ミネラル・30日分',3500,100000),('FR0003','マルチビタミン&ミネラル・120日分',12000,100000),('FR0004','マルチビタミンforMen・10日分',1200,100000),('FR0005','マルチビタミンforMen・30日分',3500,100000),('FR0006','マルチビタミンforMen・120日分',12000,100000),('FR0007','マルチビタミンforWomen・10日分',1200,100000),('FR0008','マルチビタミンforWomen・30日分',3500,100000),('FR0009','マルチビタミンforWomen・120日分',12000,100000),('FR0010','ビタミン13・10日分',1000,100000),('FR0011','ビタミン13・30日分',3500,100000),('FR0012','ビタミン13・120日分',10000,100000),('FR0013','ビタミンBB・10日分',900,100000),('FR0014','ビタミンBB・30日分',2500,100000),('FR0015','ビタミンBB・120日分',9000,100000),('FR0016','ビタミンC・10日分',800,100000),('FR0017','ビタミンC・30日分',2200,100000),('FR0018','ビタミンC・120日分',8000,100000),('FR0019','天然ビタミンＥ・10日分',900,100000),('FR0020','天然ビタミンＥ・30日分',2500,100000),('FR0021','天然ビタミンＥ・120日分',9000,100000),('FR0022','紫蘇・10日分',300,100000),('FR0023','紫蘇・30日分',800,100000),('FR0024','紫蘇・120日分',3000,100000),('FR0025','天然アミノ・10日分',350,100000),('FR0026','天然アミノ・30日分',1200,100000),('FR0027','天然アミノ・120日分',4000,100000),('FR0028','甜茶･10日分',300,100000),('FR0029','甜茶･30日分',800,100000),('FR0030','甜茶･120日分',3000,100000),('FR0031','天然田七人参・10日分',300,100000),('FR0032','天然田七人参・30日分',800,100000),('FR0033','天然田七人参・30日分',3000,100000),('GR0001','健康十穀の粥・1食',120,99990),('GR0002','健康十穀の粥・10食パック',1000,100000),('GR0003','健康十穀の粥・30食パック',2800,100000),('GR0004','健康十穀の粥・90食パック',8000,99990),('GR0005','健康十穀の粥(カレー)・1食',120,99990),('GR0006','健康十穀の粥(カレー）・10食パック',1000,100000),('GR0007','健康十穀の粥(カレー)・30食パック',2800,100000),('GR0008','健康十穀の粥(カレー)・90食パック',8000,99990),('HR0001','健康低反発まくらS',12000,100000),('HR0002','健康低反発まくらM',12500,100000),('HR0003','健康低反発まくらL',13000,100000),('IR0001','健康オーダーまくらS',17000,100000),('IR0002','健康オーダーまくらM',17500,100000),('IR0003','健康オーダーまくらL',18000,100000),('JR0001','男性用育毛トニック',6500,99990),('JR0002','女性用育毛トニック',6500,99990),('JR0003','育毛シャンプー',2000,99990),('JR0004','育毛コンディショナー',2200,99990),('JR0005','高級メロン',5000,10);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_no` varchar(6) NOT NULL,
  `item_code` varchar(6) NOT NULL,
  `order_num` int(4) DEFAULT NULL,
  `order_price` int(10) DEFAULT NULL,
  PRIMARY KEY (`order_no`,`item_code`),
  KEY `item_code` (`item_code`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_no`) REFERENCES `orders` (`order_no`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_code`) REFERENCES `item` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES ('000001','AR0001',10,800),('000002','BR0001',10,12000),('000003','CR0001',10,6000),('000004','AR0001',15,1200),('000004','BR0001',10,12000),('000005','JR0001',10,65000),('000005','JR0002',10,65000),('000005','JR0003',10,20000),('000005','JR0004',10,22000),('000006','BR0002',10,30000),('000006','BR0005',10,28000),('000006','BR0008',10,13000),('000006','BR0011',10,15000),('000007','BR0001',10,12000),('000007','CR0001',10,6000),('000008','FR0001',10,12000),('000008','GR0001',10,1200),('000008','GR0004',10,80000),('000008','GR0005',10,1200),('000008','GR0008',10,80000);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_no` varchar(6) NOT NULL,
  `customer_code` varchar(6) DEFAULT NULL,
  `employee_no` varchar(6) DEFAULT NULL,
  `total_price` int(12) DEFAULT NULL,
  `detail_num` int(2) DEFAULT NULL,
  `deliver_date` date DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  KEY `customer_code` (`customer_code`),
  KEY `employee_no` (`employee_no`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_code`) REFERENCES `customer` (`customer_code`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('000001','RA0001','R20001',800,1,'2016-11-10','2016-11-09'),('000002','RA0015','R20002',12000,1,'2016-12-08','2016-12-07'),('000003','RA0015','R20001',6000,1,'2016-12-01','2016-12-01'),('000004','RA0001','R20003',13200,2,'2016-12-10','2016-12-09'),('000005','RA0014','R20001',172000,4,'2017-01-05','2017-01-05'),('000006','RA0003','R20003',86000,4,'2017-02-10','2017-02-10'),('000007','RA0001','R20001',18000,2,'2017-02-15','2017-02-15'),('000008','RA0003','R20002',174400,5,'2017-03-20','2017-03-20'),('000009','RA0001','R20001',80,1,'2026-01-06','2026-01-05'),('000010','RA0001','R20001',10000,2,'2026-01-06','2026-01-06');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-08 14:53:49
