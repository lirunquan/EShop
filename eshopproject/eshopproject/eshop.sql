-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add clerk',7,'add_clerk'),(26,'Can change clerk',7,'change_clerk'),(27,'Can delete clerk',7,'delete_clerk'),(28,'Can view clerk',7,'view_clerk'),(29,'Can add customer',8,'add_customer'),(30,'Can change customer',8,'change_customer'),(31,'Can delete customer',8,'delete_customer'),(32,'Can view customer',8,'view_customer'),(33,'Can add recieve info',9,'add_recieveinfo'),(34,'Can change recieve info',9,'change_recieveinfo'),(35,'Can delete recieve info',9,'delete_recieveinfo'),(36,'Can view recieve info',9,'view_recieveinfo'),(37,'Can add goods',10,'add_goods'),(38,'Can change goods',10,'change_goods'),(39,'Can delete goods',10,'delete_goods'),(40,'Can view goods',10,'view_goods'),(41,'Can add purchase',11,'add_purchase'),(42,'Can change purchase',11,'change_purchase'),(43,'Can delete purchase',11,'delete_purchase'),(44,'Can view purchase',11,'view_purchase'),(45,'Can add deliver',12,'add_deliver'),(46,'Can change deliver',12,'change_deliver'),(47,'Can delete deliver',12,'delete_deliver'),(48,'Can view deliver',12,'view_deliver'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add cart',14,'add_cart'),(54,'Can change cart',14,'change_cart'),(55,'Can delete cart',14,'delete_cart'),(56,'Can view cart',14,'view_cart'),(57,'Can add ali pay order',15,'add_alipayorder'),(58,'Can change ali pay order',15,'change_alipayorder'),(59,'Can delete ali pay order',15,'delete_alipayorder'),(60,'Can view ali pay order',15,'view_alipayorder');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$JrBi1DQyUAU6$xFvco/uEBo9916mf+2+9KLQhXkK8O3CXnYxrskqccyg=','2019-07-05 13:59:18.288038',1,'root','','','1617277400@qq.com',1,1,'2019-06-28 16:18:13.135694');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsList` json NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_cart_customer_id_bbe4c408_uniq` (`customer_id`),
  CONSTRAINT `cart_cart_customer_id_bbe4c408_fk_user_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `user_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (4,'{\"list\": []}',2),(5,'{\"list\": []}',1),(6,'{\"list\": []}',27),(7,'{\"list\": []}',28),(8,'{\"list\": []}',33);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-06-28 16:19:25.043818','1','liweiyuan 15917616127 1079397813@qq.com',1,'[{\"added\": {}}]',8,1),(2,'2019-06-28 16:20:01.349266','1','laizhuowei 20162501040',1,'[{\"added\": {}}]',7,1),(3,'2019-06-28 16:37:51.625164','1','美的EM7KCGW3-NR[874319]',1,'[{\"added\": {}}]',10,1),(4,'2019-06-28 17:05:10.250786','2','AppleiPhone XR[100001860781]',1,'[{\"added\": {}}]',10,1),(5,'2019-06-28 18:10:32.864121','2','admin 15917616128 1079397812@qq.com',1,'[{\"added\": {}}]',8,1),(6,'2019-06-28 18:55:20.371503','2','AppleiPhone XR[100001860781]',2,'[{\"changed\": {\"fields\": [\"params\"]}}]',10,1),(7,'2019-06-28 18:56:46.239624','1','美的EM7KCGW3-NR[874319]',2,'[{\"changed\": {\"fields\": [\"params\"]}}]',10,1),(8,'2019-06-28 18:58:21.016532','2','AppleiPhone XR[100001860781]',2,'[{\"changed\": {\"fields\": [\"params\"]}}]',10,1),(9,'2019-06-28 19:04:35.873096','3','AppleiPad[100000305435]',1,'[{\"added\": {}}]',10,1),(10,'2019-06-28 19:07:52.744366','4','AppleMacBook Pro[100003520925]',1,'[{\"added\": {}}]',10,1),(11,'2019-06-29 00:18:49.177675','1','Cart object (1)',1,'[{\"added\": {}}]',14,1),(12,'2019-06-29 00:18:56.882315','2','Cart object (2)',1,'[{\"added\": {}}]',14,1),(13,'2019-06-29 01:02:09.501122','2','admin',2,'[{\"changed\": {\"fields\": [\"goodsList\"]}}]',14,1),(14,'2019-06-29 01:02:35.470316','2','admin',2,'[{\"changed\": {\"fields\": [\"goodsList\"]}}]',14,1),(15,'2019-06-29 01:03:50.837618','2','admin',2,'[{\"changed\": {\"fields\": [\"goodsList\"]}}]',14,1),(16,'2019-06-29 01:10:57.949759','5','小米 Redmi K20Pro[100003582699]',1,'[{\"added\": {}}]',10,1),(17,'2019-06-29 01:14:13.680248','6','一加 OnePlus 7 Pro[100003344497]',1,'[{\"added\": {}}]',10,1),(18,'2019-06-29 01:18:57.900131','7','华为 HUAWEI P30 Pro[100004404944]',1,'[{\"added\": {}}]',10,1),(19,'2019-06-29 01:23:51.966974','8','华为(HUAWEI)MateBook 13[100002368328]',1,'[{\"added\": {}}]',10,1),(20,'2019-06-29 01:27:41.768453','9','vivo iQOO 8GB+128GB[100003785533]',1,'[{\"added\": {}}]',10,1),(21,'2019-06-29 01:34:05.082504','10','佳能（Canon）EOS 80D 单反套机（EF-S 18-200mm f/3.5-5.6 IS）[2554856]',1,'[{\"added\": {}}]',10,1),(22,'2019-06-29 05:15:44.900126','4','AppleMacBook Pro[100003520925]',3,'',10,1),(23,'2019-06-29 05:15:44.903137','3','AppleiPad[100000305435]',3,'',10,1),(24,'2019-06-29 05:15:44.905793','2','AppleiPhone XR[100001860781]',3,'',10,1),(25,'2019-06-29 05:15:44.908289','1','美的EM7KCGW3-NR[874319]',3,'',10,1),(26,'2019-06-29 05:47:20.108966','11','苹果 iPhone XR 手机[31545088844]',1,'[{\"added\": {}}]',10,1),(27,'2019-06-29 05:50:10.119164','12','苹果 iPhone X[11794447957]',1,'[{\"added\": {}}]',10,1),(28,'2019-06-29 05:54:16.772786','13','联想(Lenovo)拯救者Y7000P 2019[100003324439]',1,'[{\"added\": {}}]',10,1),(29,'2019-06-29 05:56:55.299403','14','联想(Lenovo)小新14英寸[100003385931]',1,'[{\"added\": {}}]',10,1),(30,'2019-06-29 05:58:57.059051','15','Apple AirPods[100004325476]',1,'[{\"added\": {}}]',10,1),(31,'2019-06-29 06:01:50.452107','16','小米（MI）小米AI音箱[5239477]',1,'[{\"added\": {}}]',10,1),(32,'2019-06-29 06:06:23.346547','17','耐克 NIKE AIR MAX 270 女子运动鞋[40911763933]',1,'[{\"added\": {}}]',10,1),(33,'2019-06-29 06:10:42.851135','1','liweiyuan',2,'[{\"changed\": {\"fields\": [\"goodsList\"]}}]',14,1),(34,'2019-06-29 06:24:31.404435','3','hpsssss',1,'[{\"added\": {}}]',14,1),(35,'2019-06-29 07:10:01.996291','1','Deliver object (1)',1,'[{\"added\": {}}]',12,1),(36,'2019-06-29 07:10:42.992266','1','hpsssss[4068213795]',2,'[{\"changed\": {\"fields\": [\"isDelivered\", \"remarks\"]}}]',13,1),(37,'2019-07-03 15:50:26.732877','8','华为(HUAWEI)MateBook 13[100002368328]',2,'[{\"changed\": {\"fields\": [\"isSelling\"]}}]',10,1),(38,'2019-07-03 15:51:47.399683','7','华为 HUAWEI P30 Pro[100004404944]',2,'[{\"changed\": {\"fields\": [\"isSelling\"]}}]',10,1),(39,'2019-07-04 16:07:45.171739','1','Purchase object (1)',3,'',11,1),(40,'2019-07-04 16:45:37.809325','1','Deliver object (1)',3,'',12,1),(41,'2019-07-04 16:45:49.339119','1','hpsssss[4068213795]',2,'[{\"changed\": {\"fields\": [\"isDelivered\"]}}]',13,1),(42,'2019-07-04 17:12:06.131723','2','Purchase object (2)',3,'',11,1),(43,'2019-07-05 13:17:59.704632','20','lwy4 129384 lakskjd',3,'',8,1),(44,'2019-07-05 13:17:59.707359','19','lwy3 128939874 qwiodmkals',3,'',8,1),(45,'2019-07-05 13:17:59.709408','18','lwy2 1092380 qowieoijaksd',3,'',8,1),(46,'2019-07-05 13:17:59.717729','17','lwy 12345 qwesasczxc',3,'',8,1),(47,'2019-07-05 13:17:59.720152','16','hpsssss 15802224 qwo222',3,'',8,1),(48,'2019-07-05 13:17:59.721378','15','admin88 1203018931 qwieioo',3,'',8,1),(49,'2019-07-05 13:17:59.724031','14','zxcvqwd 123511424 qwqtqw',3,'',8,1),(50,'2019-07-05 13:17:59.725233','13','qwert 1231234 qwedasd',3,'',8,1),(51,'2019-07-05 13:17:59.727476','12','admin11 564664 qwpoe',3,'',8,1),(52,'2019-07-05 13:17:59.728691','11','admin6 22222222222 22222qwe',3,'',8,1),(53,'2019-07-05 13:17:59.730498','7','laizhuowei  ',3,'',8,1),(54,'2019-07-05 13:17:59.732542','6','qwer 12345752 5551s115@qq.com',3,'',8,1),(55,'2019-07-05 13:17:59.733719','3','admin3 12345667 5551115@qq.com',3,'',8,1),(56,'2019-07-05 13:18:37.431002','1','阿萨大	亲卫队请问的 ',3,'',9,1),(58,'2019-07-05 13:18:55.364961','4','laizhuowei	SCAU 15002908482',3,'',9,1),(59,'2019-07-05 13:19:31.602759','2','Deliver object (2)',3,'',12,1),(60,'2019-07-05 13:19:54.031152','4','hpsssss[2391678504]',3,'',13,1),(61,'2019-07-05 13:19:54.033897','3','hpsssss[9258163407]',3,'',13,1),(62,'2019-07-05 13:19:54.035957','2','hpsssss[0149628753]',3,'',13,1),(63,'2019-07-05 13:19:54.036977','1','hpsssss[4068213795]',3,'',13,1),(64,'2019-07-05 13:20:09.060960','3','hpsssss',3,'',14,1),(65,'2019-07-05 13:20:09.063720','2','admin',3,'',14,1),(66,'2019-07-05 13:20:09.064870','1','liweiyuan',3,'',14,1),(67,'2019-07-05 13:20:32.276877','20','lwy4 129384 lakskjd',3,'',8,1),(68,'2019-07-05 13:20:32.279744','19','lwy3 128939874 qwiodmkals',3,'',8,1),(69,'2019-07-05 13:20:32.290335','18','lwy2 1092380 qowieoijaksd',3,'',8,1),(70,'2019-07-05 13:20:32.292829','17','lwy 12345 qwesasczxc',3,'',8,1),(71,'2019-07-05 13:20:32.294031','16','hpsssss 15802224 qwo222',3,'',8,1),(72,'2019-07-05 13:20:32.296110','15','admin88 1203018931 qwieioo',3,'',8,1),(73,'2019-07-05 13:20:32.300254','14','zxcvqwd 123511424 qwqtqw',3,'',8,1),(74,'2019-07-05 13:20:32.301409','13','qwert 1231234 qwedasd',3,'',8,1),(75,'2019-07-05 13:20:32.305041','12','admin11 564664 qwpoe',3,'',8,1),(76,'2019-07-05 13:20:32.307998','11','admin6 22222222222 22222qwe',3,'',8,1),(77,'2019-07-05 13:20:32.309231','7','laizhuowei  ',3,'',8,1),(78,'2019-07-05 13:20:32.312026','6','qwer 12345752 5551s115@qq.com',3,'',8,1),(79,'2019-07-05 13:20:32.313260','3','admin3 12345667 5551115@qq.com',3,'',8,1),(80,'2019-07-05 13:20:43.276871','4','admin',1,'[{\"added\": {}}]',14,1),(81,'2019-07-05 13:20:51.006488','5','liweiyuan',1,'[{\"added\": {}}]',14,1),(82,'2019-07-05 13:21:29.555024','2','admin 15917616128 1079397812@qq.com',2,'[{\"changed\": {\"fields\": [\"isOnline\"]}}]',8,1),(83,'2019-07-05 13:21:36.614763','1','liweiyuan 15917616127 1079397813@qq.com',2,'[{\"changed\": {\"fields\": [\"isOnline\"]}}]',8,1),(84,'2019-07-05 13:38:43.155064','22','asdfg 987654321 asdasd@qq.com',3,'',8,1),(85,'2019-07-05 13:38:43.157917','21','account 12345678 lwy@qq.com',3,'',8,1),(86,'2019-07-05 13:59:42.602817','27','account 15917616129 15917616127@qq.com',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',8,1),(87,'2019-07-05 16:18:40.697425','1','laizhuowei 20162501040',2,'[]',7,1),(88,'2019-07-05 16:18:54.609965','2','liweiyuan 112',2,'[]',7,1),(89,'2019-07-05 20:30:56.083129','11','account[7523160984]',3,'',13,1),(90,'2019-07-05 20:30:56.086426','10','account[0257396148]',3,'',13,1),(91,'2019-07-05 20:30:56.088599','9','account[1490583267]',3,'',13,1),(92,'2019-07-05 20:30:56.089813','8','account[2056871493]',3,'',13,1),(93,'2019-07-05 20:30:56.092176','7','account[4081593672]',3,'',13,1),(94,'2019-07-05 20:30:56.096464','6','account[6079521483]',3,'',13,1),(95,'2019-07-05 20:30:56.097681','5','account[3428760195]',3,'',13,1),(96,'2019-07-06 13:55:33.649970','20','苹果 iPhone Xx[40911763934]',2,'[{\"changed\": {\"fields\": [\"picture\"]}}]',10,1),(97,'2019-07-06 13:59:35.681570','12','苹果 iPhone X[11794447957]',2,'[{\"changed\": {\"fields\": [\"producer\", \"picture\"]}}]',10,1),(98,'2019-07-06 14:00:25.803816','12','苹果 iPhone X[11794447957]',2,'[{\"changed\": {\"fields\": [\"picture\"]}}]',10,1),(99,'2019-07-06 14:01:33.985685','12','苹果 iPhone X[11794447957]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(100,'2019-07-06 14:03:34.880897','6','一加 OnePlus 7 Pro[100003344497]',2,'[{\"changed\": {\"fields\": [\"picture\"]}}]',10,1),(101,'2019-07-06 14:05:44.080958','19','MI）小米AI音箱[5239479]',2,'[{\"changed\": {\"fields\": [\"picture\", \"gType\"]}}]',10,1),(102,'2019-07-06 14:11:06.612590','20','苹果 iPhone Xx[40911763934]',2,'[{\"changed\": {\"fields\": [\"params\", \"gType\"]}}]',10,1),(103,'2019-07-06 14:15:57.852546','19','MI）小米AI音箱[5239479]',2,'[{\"changed\": {\"fields\": [\"producer\", \"params\"]}}]',10,1),(104,'2019-07-06 14:16:21.284644','16','小米（MI）小米AI音箱[5239477]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(105,'2019-07-06 14:17:20.892452','9','vivo iQOO 8GB+128GB[100003785533]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(106,'2019-07-06 14:17:29.204735','15','Apple AirPods[100004325476]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(107,'2019-07-06 14:20:14.641149','7','华为 HUAWEI P30 Pro[100004404944]',2,'[{\"changed\": {\"fields\": [\"cost\", \"price\", \"producer\", \"params\"]}}]',10,1),(108,'2019-07-06 14:21:35.483278','10','佳能（Canon）EOS 80D 单反套机（EF-S 18-200mm f/3.5-5.6 IS）[2554856]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(109,'2019-07-06 14:21:54.688187','12','苹果 iPhone X[11794447957]',2,'[{\"changed\": {\"fields\": [\"producer\", \"params\"]}}]',10,1),(110,'2019-07-06 14:22:05.665905','8','华为(HUAWEI)MateBook 13[100002368328]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(111,'2019-07-06 14:22:13.718945','5','小米 Redmi K20Pro[100003582699]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(112,'2019-07-06 14:22:32.461458','6','一加 OnePlus 7 Pro[100003344497]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(113,'2019-07-06 14:26:42.826840','11','苹果 iPhone XR 手机[31545088844]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(114,'2019-07-06 14:26:56.320828','13','联想(Lenovo)拯救者Y7000P 2019[100003324439]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1),(115,'2019-07-06 14:27:08.751524','14','联想(Lenovo)小新14英寸[100003385931]',2,'[{\"changed\": {\"fields\": [\"producer\"]}}]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(14,'cart','cart'),(5,'contenttypes','contenttype'),(10,'goods','goods'),(15,'order','alipayorder'),(13,'order','order'),(12,'record','deliver'),(11,'record','purchase'),(6,'sessions','session'),(7,'user','clerk'),(8,'user','customer'),(9,'user','recieveinfo');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-06-28 16:13:58.883188'),(2,'auth','0001_initial','2019-06-28 16:13:59.032491'),(3,'admin','0001_initial','2019-06-28 16:13:59.438312'),(4,'admin','0002_logentry_remove_auto_add','2019-06-28 16:13:59.547972'),(5,'admin','0003_logentry_add_action_flag_choices','2019-06-28 16:13:59.560820'),(6,'contenttypes','0002_remove_content_type_name','2019-06-28 16:13:59.651099'),(7,'auth','0002_alter_permission_name_max_length','2019-06-28 16:13:59.702835'),(8,'auth','0003_alter_user_email_max_length','2019-06-28 16:13:59.747935'),(9,'auth','0004_alter_user_username_opts','2019-06-28 16:13:59.761218'),(10,'auth','0005_alter_user_last_login_null','2019-06-28 16:13:59.810381'),(11,'auth','0006_require_contenttypes_0002','2019-06-28 16:13:59.814101'),(12,'auth','0007_alter_validators_add_error_messages','2019-06-28 16:13:59.826667'),(13,'auth','0008_alter_user_username_max_length','2019-06-28 16:13:59.871048'),(14,'auth','0009_alter_user_last_name_max_length','2019-06-28 16:13:59.914071'),(15,'auth','0010_alter_group_name_max_length','2019-06-28 16:13:59.955419'),(16,'auth','0011_update_proxy_permissions','2019-06-28 16:13:59.968603'),(17,'user','0001_initial','2019-06-28 16:14:00.055261'),(18,'cart','0001_initial','2019-06-28 16:14:00.120554'),(19,'goods','0001_initial','2019-06-28 16:14:00.192262'),(20,'order','0001_initial','2019-06-28 16:14:00.230127'),(21,'record','0001_initial','2019-06-28 16:14:00.366125'),(22,'sessions','0001_initial','2019-06-28 16:14:00.553656'),(23,'cart','0002_auto_20190629_0431','2019-06-28 21:31:47.090044'),(24,'goods','0002_auto_20190629_0417','2019-06-28 21:31:47.218915'),(25,'goods','0003_auto_20190629_0431','2019-06-28 21:31:47.227336'),(26,'order','0002_auto_20190629_0417','2019-06-28 21:31:47.254427'),(27,'order','0003_auto_20190629_0437','2019-06-28 21:31:47.277115'),(28,'user','0002_auto_20190629_0417','2019-06-28 21:31:47.294280'),(29,'record','0002_auto_20190629_0633','2019-06-28 22:33:27.579179'),(30,'record','0002_auto_20190629_0616','2019-06-28 23:39:46.916258'),(31,'record','0003_merge_20190629_0739','2019-06-28 23:39:46.920844'),(32,'cart','0003_auto_20190629_0815','2019-06-29 00:15:22.771806'),(33,'order','0004_auto_20190629_0815','2019-06-29 00:15:22.783124'),(34,'goods','0004_auto_20190629_2133','2019-06-29 13:33:49.242315'),(35,'order','0005_alipayorder','2019-07-03 14:47:42.784573'),(36,'record','0004_auto_20190703_2306','2019-07-03 15:06:44.852910'),(37,'goods','0005_auto_20190704_0106','2019-07-03 17:06:48.858387'),(38,'record','0005_auto_20190705_0123','2019-07-04 17:23:43.351158'),(39,'user','0003_auto_20190705_2103','2019-07-05 13:04:03.010253'),(40,'goods','0006_goods_producer','2019-07-05 15:03:00.288983'),(41,'order','0006_auto_20190705_2302','2019-07-05 15:03:00.394767'),(42,'record','0006_auto_20190705_2302','2019-07-05 15:03:00.629614'),(43,'goods','0007_auto_20190706_2140','2019-07-06 13:40:39.942467'),(44,'goods','0008_auto_20190706_2147','2019-07-06 13:48:01.499501'),(45,'goods','0009_auto_20190706_2152','2019-07-06 13:52:27.878591'),(46,'goods','0010_remove_goods_tags','2019-07-06 13:55:11.896399'),(47,'goods','0011_auto_20190706_2201','2019-07-06 14:01:26.526229');
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
INSERT INTO `django_session` VALUES ('3chpzz9k9rrlc7lfztrcrrmkq9qrspon','ZmJjOGFhNTk4ZWQ0NmM4ZGE3ZDNkMjEyNTAwYjI1ZDg4NTRiMzhiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmU3ZjMyZDQ4ZmVmZWZlYTQzZTEzNGNlYmE1YWIyMDQ4NWRiNjFkIn0=','2019-07-12 16:18:44.275881'),('bzwg6atjzuyjj1x6i4lsft14u0f5reld','ZmJjOGFhNTk4ZWQ0NmM4ZGE3ZDNkMjEyNTAwYjI1ZDg4NTRiMzhiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmU3ZjMyZDQ4ZmVmZWZlYTQzZTEzNGNlYmE1YWIyMDQ4NWRiNjFkIn0=','2019-07-13 07:40:33.399934'),('papzlb4wjhovdjwbxwe8h7pezh56zpyl','ZDg1NTBmNmI0ZjUzYTJkZGRiMzFiMjY3M2ZlNDAwN2UxNTllZWEyYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZmU3ZjMyZDQ4ZmVmZWZlYTQzZTEzNGNlYmE1YWIyMDQ4NWRiNjFkIiwidXNlcl9pZCI6ImxhaXpodW93ZWkyIiwidXNlcl9ncm91cCI6IjAifQ==','2019-07-20 08:53:02.464711'),('pny9gdlluh4mflqvyrzpzkq6fl82ul43','MWJhOWQwZWM4YmZiMWE4NTM5YWI3OTM2MTU4YzFjM2I0YjE1OTk5ZDp7InVzZXJfaWQiOiJsYWl6aHVvd2VpMiIsInVzZXJfZ3JvdXAiOiIwIn0=','2019-07-21 14:20:46.946348');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goods`
--

DROP TABLE IF EXISTS `goods_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbnCode` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `params` json DEFAULT NULL,
  `detail` longtext,
  `repertory` int(10) unsigned NOT NULL,
  `gType` varchar(20) DEFAULT NULL,
  `isSelling` tinyint(1) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `cost` double NOT NULL,
  `producer` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbnCode` (`isbnCode`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goods`
--

LOCK TABLES `goods_goods` WRITE;
/*!40000 ALTER TABLE `goods_goods` DISABLE KEYS */;
INSERT INTO `goods_goods` VALUES (5,'100003582699','小米 Redmi K20Pro',2499,'{\"CPU\": \"Snapdrgon855\", \"Brand\": \"Xiaomi\", \"Weight\": \"191g\", \"Market Date\": \"2019.5\"}','<p>&lt;p&gt;火焰红&lt;/p&gt;</p>',115,'手机数码',1,'goods/pic/100003582699/pic.jpg',0,'Xiaomi'),(6,'100003344497','一加 OnePlus 7 Pro',4499,'{\"CPU\": \"Snapdrgon855\", \"Brand\": \"One Plus\", \"Weight\": \"206g\", \"Market Date\": \"2019.5\"}','<p>&lt;p&gt;黑色&lt;/p&gt;</p>',198,'手机数码',1,'goods/pic/100003344497/pic_i4o6zMy.jpg',0,'OnePlus'),(7,'100004404944','华为 HUAWEI P30 Pro',5489,'{\"OS\": \"EMUI 9.1.0\", \"CPU\": \"Krin980\", \"RAM\": \"8GB\", \"ROM\": \"128GB\", \"Brand\": \"HUAWEI\", \"Weight\": \"192g\", \"Market Date\": \"2019.4\"}','<p>&lt;p&gt;黑色&lt;/p&gt;</p>',1523,'手机数码',1,'goods/pic/100004404944/pic.jpg',5000,'Huawei'),(8,'100002368328','华为(HUAWEI)MateBook 13',500,'{\"CPU\": \"Intel i5-8265U\", \"Brand\": \"HUAWEI\", \"Market Date\": \"2019\", \"Operate System\": \"Windows 10\"}','<p>&lt;p&gt;银色&lt;/p&gt;</p>',1000,'手机数码',0,'goods/pic/100002368328/pic.jpg',0,'HuaWei'),(9,'100003785533','vivo iQOO 8GB+128GB',500,'{\"CPU\": \"Snapdrgon855\", \"Brand\": \"VIVO\", \"Weight\": \"196g\", \"Market Date\": \"2019.3\", \"Operate System\": \"Android9\"}','<p>&lt;p&gt;羽光白&lt;/p&gt;</p>',500,'手机数码',0,'goods/pic/100003785533/pic.jpg',0,'Vivo'),(10,'2554856','佳能（Canon）EOS 80D 单反套机（EF-S 18-200mm f/3.5-5.6 IS）',500,'{\"Brand\": \"Canon\", \"Pixel\": \"24.5 million\", \"Weight\": \"650g\", \"Camera lens\": \"EF-s 18-200mm f/3.5-5.6 IS\", \"Market Date\": \"2016.4\"}','<p>&lt;p&gt;传感器类型 CMOS&lt;/p&gt;</p>',99,'手机数码',0,'goods/pic/2554856/pic.jpg',0,'Canon'),(11,'31545088844','苹果 iPhone XR 手机',5299,'{\"CPU\": \"A12X\", \"Brand\": \"Apple\", \"Weight\": \"198g\", \"Market Date\": \"2018.4\", \"Operate System \": \"IOS\"}','<p><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">&nbsp;</span></span></span></span></p>',328,'手机数码',0,'goods/pic/31545088844/pic.jpg',5299,'Apple'),(12,'11794447957','苹果 iPhone X',5958,'{\"CPU\": \"A11\", \"OS \": \"IOS\", \"Brand\": \"Apple\", \"Weight\": \"174g\", \"Market Date\": \"2017.9\"}','<p><span style=\"vertical-align: inherit;\"><span style=\"vertical-align: inherit;\">&lt;P&gt;黑色&lt;/ P&gt;</span></span></p>',1000,'手机数码',0,'goods/pic/11794447957/pic_JrQDo6D.jpeg',5958,'Apple'),(13,'100003324439','联想(Lenovo)拯救者Y7000P 2019',8099,'{\"CPU\": \"Intel i7-9750H\", \"Brand\": \"Lenovo\", \"Market Date\": \"2019\", \"Graphics Card\": \"NVIDIA GeForce GTX 1650\"}','<p>&lt;p&gt;黑色&lt;/p&gt;</p>',100,'手机数码',0,'goods/pic/100003324439/pic.jpg',0,'Lenovo'),(14,'100003385931','联想(Lenovo)小新14英寸',4599,'{\"CPU\": \"Ryzen 5 3500U\", \"Brand\": \"Lenovo\", \"Market Date\": \"2019\", \"Graphics Card\": \"NVIDIA GeForce GTX 940\"}','<p>&lt;p&gt;银色&lt;/P&gt;</p>',1100,'手机数码',0,'goods/pic/100003385931/pic.jpg',4599,'Lenovo'),(15,'100004325476','Apple AirPods',1299,'{\"Brand\": \"Apple\", \"Model\": \"MV7N2CH/A\"}','<p>&lt;p&gt;白色&lt;/p&gt;</p>',5000,'手机数码',0,'goods/default.png',0,'Apple'),(16,'5239477','小米（MI）小米AI音箱',299,'{\"Brand\": \"XIAOMI\", \"Weight\": \"1130g\", \"Market Date\": \"2019.5\"}','<p>&lt;p&gt;白色&lt;/p&gt;</p>',200,'手机数码',0,'goods/pic/5239477/pic.jpg',0,'小米通讯技术有限公司'),(17,'40911763933','耐克 NIKE AIR MAX 270 女子运动鞋',850,'{\"Brand\": \"NIKE\", \"Weight\": \"1000g\", \"Market Date\": \"2019.6\"}','<p>&lt;p&gt;白色&lt;/p&gt;</p>',503,'鞋子',1,'goods/pic/40911763933/pic.png',800,''),(19,'5239479','MI）小米AI音箱',0,'{\"OS\": \"Linux\", \"Brand\": \"Xiaomi\", \"Color\": \"White\", \"Language\": \"Simplified Chinese\", \"Connection\": [\"Wifi\", \"BlueTooth\"], \"SoundChannel\": \"Mono Audio\"}','',300,'音箱',0,'goods/pic/5239479/pic.jpg',399,'小米通讯技术有限公司'),(20,'40911763934','苹果 iPhone Xx',6000,'{\"CPU\": \"AppleA12\", \"ROM\": \"128GB\", \"Brand\": \"Apple\", \"Color\": \"Black\", \"System\": \"iOS\", \"Weight\": \"300g\", \"Market Date\": \"2018.10\"}','',200,'Apple',1,'goods/pic/40911763934/pic_Wk3c6XH.jpg',5000,'apple');
/*!40000 ALTER TABLE `goods_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_alipayorder`
--

DROP TABLE IF EXISTS `order_alipayorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_alipayorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(10) NOT NULL,
  `alipay_out_trade_no` varchar(64) NOT NULL,
  `alipay_trade_no` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_code` (`order_code`),
  UNIQUE KEY `alipay_out_trade_no` (`alipay_out_trade_no`),
  UNIQUE KEY `alipay_trade_no` (`alipay_trade_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_alipayorder`
--

LOCK TABLES `order_alipayorder` WRITE;
/*!40000 ALTER TABLE `order_alipayorder` DISABLE KEYS */;
INSERT INTO `order_alipayorder` VALUES (1,'7243608195','7243608195','2019070622001481841000081640'),(2,'2536840197','2536840197','2019070622001481841000083032');
/*!40000 ALTER TABLE `order_alipayorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `createAt` datetime(6) NOT NULL,
  `updateAt` datetime(6) NOT NULL,
  `goodsList` json NOT NULL,
  `totalPrice` decimal(15,2) NOT NULL,
  `isPaid` tinyint(1) NOT NULL,
  `payment_method` int(10) unsigned NOT NULL,
  `isDelivered` tinyint(1) NOT NULL,
  `remarks` longtext NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rcvInfo_id` int(11) NOT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `isRecieved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_order_code_30c16a65_uniq` (`code`),
  KEY `order_order_customer_id_5bbbd957_fk_user_customer_id` (`customer_id`),
  KEY `order_order_rcvInfo_id_055943a8_fk_user_recieveinfo_id` (`rcvInfo_id`),
  CONSTRAINT `order_order_customer_id_5bbbd957_fk_user_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `user_customer` (`id`),
  CONSTRAINT `order_order_rcvInfo_id_055943a8_fk_user_recieveinfo_id` FOREIGN KEY (`rcvInfo_id`) REFERENCES `user_recieveinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (12,'7243608195','2019-07-05 20:25:46.745344','2019-07-05 20:43:34.627179','[{\"name\": \"小米 Redmi K20Pro\", \"price\": 2499, \"number\": 1, \"isbncode\": \"100003582699\"}, {\"name\": \"小米 Redmi K20Pro\", \"price\": 2499, \"number\": 1, \"isbncode\": \"100003582699\"}]',4998.00,1,1,1,'{}',27,6,0,1),(13,'2536840197','2019-07-05 20:31:30.170983','2019-07-05 20:34:27.642027','[{\"name\": \"小米 Redmi K20Pro\", \"price\": 2499, \"number\": 1, \"isbncode\": \"100003582699\"}, {\"name\": \"小米 Redmi K20Pro\", \"price\": 2499, \"number\": 1, \"isbncode\": \"100003582699\"}, {\"name\": \"小米 Redmi K20Pro\", \"price\": 2499, \"number\": 1, \"isbncode\": \"100003582699\"}]',7497.00,1,1,1,'{}',27,6,0,1);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_deliver`
--

DROP TABLE IF EXISTS `record_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_deliver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createAt` datetime(6) NOT NULL,
  `operation` varchar(8) NOT NULL,
  `remarks` longtext NOT NULL,
  `recieveInfo_id` int(11) NOT NULL,
  `logistics` varchar(40) NOT NULL,
  `clerk_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `expressnumber` varchar(15) NOT NULL,
  `code` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expressnumber` (`expressnumber`),
  UNIQUE KEY `code` (`code`),
  KEY `record_deliver_clerk_id_3309fd3b_fk_user_clerk_id` (`clerk_id`),
  KEY `record_deliver_order_id_03f3851c_fk_order_order_id` (`order_id`),
  KEY `record_deliver_recieveInfo_id_084dc555` (`recieveInfo_id`),
  CONSTRAINT `record_deliver_clerk_id_3309fd3b_fk_user_clerk_id` FOREIGN KEY (`clerk_id`) REFERENCES `user_clerk` (`id`),
  CONSTRAINT `record_deliver_order_id_03f3851c_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `record_deliver_recieveInfo_id_084dc555_fk_user_recieveinfo_id` FOREIGN KEY (`recieveInfo_id`) REFERENCES `user_recieveinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_deliver`
--

LOCK TABLES `record_deliver` WRITE;
/*!40000 ALTER TABLE `record_deliver` DISABLE KEYS */;
INSERT INTO `record_deliver` VALUES (4,'2019-07-05 20:33:08.979033','Deliver','None',6,'顺丰',3,13,'615105',''),(7,'2019-07-05 20:42:46.981440','Deliver','None',6,'顺丰',3,12,'805140','6764eb5a09ed68c8abaee13327140be3');
/*!40000 ALTER TABLE `record_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_purchase`
--

DROP TABLE IF EXISTS `record_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createAt` datetime(6) NOT NULL,
  `operation` varchar(8) NOT NULL,
  `remarks` longtext NOT NULL,
  `goodsList` json NOT NULL,
  `clerk_id` int(11) NOT NULL,
  `code` varchar(36) NOT NULL,
  `totalCost` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `record_purchase_clerk_id_3beea693_fk_user_clerk_id` (`clerk_id`),
  CONSTRAINT `record_purchase_clerk_id_3beea693_fk_user_clerk_id` FOREIGN KEY (`clerk_id`) REFERENCES `user_clerk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_purchase`
--

LOCK TABLES `record_purchase` WRITE;
/*!40000 ALTER TABLE `record_purchase` DISABLE KEYS */;
INSERT INTO `record_purchase` VALUES (3,'2019-07-04 17:25:24.536405','Purchase','test api','[{\"cost\": 800, \"name\": \"耐克 NIKE AIR MAX 270 女子运动鞋\", \"number\": 1, \"isbncode\": \"40911763933\"}]',1,'74a2ae255b9ab067286a5f2e15dfbc75',0.00),(4,'2019-07-04 17:25:48.562692','Purchase','test api','[{\"cost\": 800, \"name\": \"耐克 NIKE AIR MAX 270 女子运动鞋\", \"number\": 1, \"isbncode\": \"40911763933\"}]',1,'6e190ffda7f169f8288244eba4316ab0',0.00),(5,'2019-07-05 15:53:38.132107','Purchase','None','[{\"cost\": 0, \"name\": \"\", \"number\": 0, \"isbncode\": \"\", \"producer\": \"\"}]',1,'2e8c12c895b22fe8935f97b145c65939',0.00),(6,'2019-07-05 15:53:42.819447','Purchase','None','[{\"cost\": 0, \"name\": \"\", \"number\": 0, \"isbncode\": \"\", \"producer\": \"\"}]',1,'9ccd546b0803802fb08f1990509b0712',0.00),(7,'2019-07-05 15:55:53.710050','Purchase','None','[{\"cost\": 0, \"name\": \"\", \"number\": 0, \"isbncode\": \"\", \"producer\": \"\"}]',1,'81431baa6fff38dfd23df2dd949bd69d',0.00),(8,'2019-07-05 15:56:45.215461','Purchase','None','[{\"cost\": 0, \"name\": \"\", \"number\": 0, \"isbncode\": \"\", \"producer\": \"\"}]',1,'efeee6548ee2cf04843afb28a5286dd3',0.00),(9,'2019-07-05 15:57:41.511171','Purchase','None','[{\"cost\": 0, \"name\": \"\", \"number\": 0, \"isbncode\": \"\", \"producer\": \"\"}]',1,'064387a01e70d622ff24e1a055bd973f',0.00),(10,'2019-07-05 16:00:07.786805','Purchase','None','[{\"cost\": 0, \"name\": \"\", \"number\": 0, \"isbncode\": \"\", \"producer\": \"\"}]',1,'671997ee0294d1204a188f8def24eac6',0.00),(11,'2019-07-05 16:00:54.476349','Purchase','None','[{\"cost\": 0, \"name\": \"\", \"number\": 0, \"isbncode\": \"\", \"producer\": \"\"}]',1,'bf893f331528b81f45c556c61ecd9020',0.00),(12,'2019-07-05 16:05:21.172867','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 123, \"isbncode\": \"100004404944\", \"producer\": \"\"}]',1,'100e7ca4b44b163ce884e8c7192d1800',61500.00),(13,'2019-07-05 19:49:41.639004','Purchase','None','[{\"cost\": 5299, \"name\": \"苹果 iPhone XR 手机\", \"number\": 50, \"isbncode\": \"31545088844\", \"producer\": \"\"}]',3,'da8caf77b463b03d1b73cb70630773e8',264950.00),(14,'2019-07-05 19:50:00.314421','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 500, \"isbncode\": \"100004404944\", \"producer\": \"\"}]',3,'02a4c6fc0cd64795ea023ab35511f173',250000.00),(15,'2019-07-05 19:50:18.938022','Purchase','None','[{\"cost\": 5958, \"name\": \"苹果 iPhone X\", \"number\": 0, \"isbncode\": \"11794447957\", \"producer\": \"\"}]',3,'6da1eb3e7570a4aa20e0fe36b828235d',0.00),(16,'2019-07-05 19:50:28.042376','Purchase','None','[{\"cost\": 5958, \"name\": \"苹果 iPhone X\", \"number\": 500, \"isbncode\": \"11794447957\", \"producer\": \"\"}]',3,'3f247e383b8bf958ccb71d90abdcf777',2979000.00),(17,'2019-07-06 06:53:47.084505','Purchase','None','[{\"cost\": 123123, \"name\": \"sda\", \"number\": 0, \"isbncode\": 123123, \"producer\": \"nike\"}]',3,'99e42fd93ee9c2155545333f49fe3aef',0.00),(18,'2019-07-06 06:53:54.539698','Purchase','None','[{\"cost\": 123123, \"name\": \"sda\", \"number\": 100, \"isbncode\": 123123, \"producer\": \"nike\"}]',3,'cf3a89f1734406ad1b8eb408ff961583',12312300.00),(19,'2019-07-06 06:55:09.004070','Purchase','None','[{\"cost\": 399, \"name\": \"小米（MI）小米AI音箱2\", \"number\": 300, \"isbncode\": 5239478, \"producer\": \"小米\"}]',3,'d1b0c782677be698ca8816bbafd6cdce',119700.00),(20,'2019-07-06 06:57:36.468332','Purchase','None','[{\"cost\": 399, \"name\": \"MI）小米AI音箱\", \"number\": 300, \"isbncode\": 5239479, \"producer\": \"\"}]',3,'49d066036145d236567c72e38ca2c80b',119700.00),(21,'2019-07-06 06:57:51.614444','Purchase','None','[{\"cost\": 4599, \"name\": \"联想(Lenovo)小新14英寸\", \"number\": 300, \"isbncode\": 100003385931, \"producer\": \"\"}]',3,'06c32c3f35d5dd1e733f9e35a16d32a6',1379700.00),(22,'2019-07-06 07:04:04.179553','Purchase','None','[{\"cost\": 399, \"name\": \"MI）小米AI音箱\", \"number\": 300, \"isbncode\": 5239479, \"producer\": \"\"}]',3,'c6d7f3f33c0ad3ff5ed11bb6ad26a3be',119700.00),(23,'2019-07-06 07:15:10.024076','Purchase','None','[{\"cost\": 5000, \"name\": \"苹果 iPhone Xx\", \"number\": 0, \"isbncode\": 40911763934, \"producer\": \"apple\"}]',3,'95b6a222eded4bf1f5a0bbfd934ff291',0.00),(24,'2019-07-06 07:17:24.438416','Purchase','None','[{\"cost\": 5000, \"name\": \"苹果 iPhone Xx\", \"number\": 200, \"isbncode\": 40911763934, \"producer\": \"apple\"}]',3,'235cb3503c4ccd3185c360f5cf882c2d',1000000.00),(25,'2019-07-06 07:49:38.156702','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'4d2c3d51ff3e8df7f30045006d6d41a6',0.00),(26,'2019-07-06 07:49:48.071262','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'3e7d77d2b3ed782a2d6d401f56547611',0.00),(27,'2019-07-06 07:49:50.019841','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'2e37482cdd8b94212fc814bee308ac65',0.00),(28,'2019-07-06 07:49:50.904353','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'91992d701338c7205b2a30cfc7d25788',0.00),(29,'2019-07-06 07:49:51.510526','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'c4c02c9140b4991df6edb15cff80ff21',0.00),(30,'2019-07-06 07:49:52.024984','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'59ed91da2c8534747ff18951a5607fa9',0.00),(31,'2019-07-06 07:49:52.432965','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'546a58a32ea3511f2e66a17b7a4093b6',0.00),(32,'2019-07-06 07:49:52.784963','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'cc98950533d63aed345f29b676c2532c',0.00),(33,'2019-07-06 07:50:11.397887','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'8b6c1f9d6b986e30f2371cf9dfdf4ea4',0.00),(34,'2019-07-06 07:50:27.519842','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'47677343245e9a520f14569da76aeb63',0.00),(35,'2019-07-06 07:50:31.513983','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'ff728f6409e2a8d284feb157586fcbc8',0.00),(36,'2019-07-06 07:50:33.015655','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'a64bd2ec08cb3ec52d4c112dded2525f',0.00),(37,'2019-07-06 07:51:34.441724','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'08705181e191fff95ecd11d3b215ebea',0.00),(38,'2019-07-06 07:51:51.160456','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'0acb8b0d962376c20fe280f01da3408d',0.00),(39,'2019-07-06 07:52:16.588519','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 300, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'403eb655f8170c70ceca974a057a7962',150000.00),(40,'2019-07-06 07:52:22.883422','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 300, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'f230dbc1e28a4931befc7cf0f3457393',150000.00),(41,'2019-07-06 07:55:07.039029','Purchase','None','[{\"cost\": 5299, \"name\": \"苹果 iPhone XR 手机\", \"number\": 0, \"isbncode\": 31545088844, \"producer\": \"\"}]',3,'a37f8ce35ed537f04a3cb6fcc5145882',0.00),(42,'2019-07-06 07:55:16.538252','Purchase','None','[{\"cost\": 5299, \"name\": \"苹果 iPhone XR 手机\", \"number\": 0, \"isbncode\": 31545088844, \"producer\": \"\"}]',3,'15f0d08694c6fa5dc483497e2534df36',0.00),(43,'2019-07-06 07:56:03.536405','Purchase','None','[{\"cost\": 0, \"name\": \"一加 OnePlus 7 Pro\", \"number\": 0, \"isbncode\": 100003344497, \"producer\": \"\"}]',3,'e5b8dbddbf959f664d66924563169f79',0.00),(44,'2019-07-06 07:56:25.403353','Purchase','None','[{\"cost\": 0, \"name\": \"华为(HUAWEI)MateBook 13\", \"number\": 0, \"isbncode\": 100002368328, \"producer\": \"\"}]',3,'c654329b3e580f92eab9f9f7cba80db5',0.00),(45,'2019-07-06 07:56:27.799027','Purchase','None','[{\"cost\": 500, \"name\": \"华为 HUAWEI P30 Pro\", \"number\": 0, \"isbncode\": 100004404944, \"producer\": \"\"}]',3,'ac87a922efafe85f4f067c47907fdac9',0.00),(46,'2019-07-06 07:56:30.036691','Purchase','None','[{\"cost\": 0, \"name\": \"一加 OnePlus 7 Pro\", \"number\": 0, \"isbncode\": 100003344497, \"producer\": \"\"}]',3,'0f4df9adb783187357a50355fd881fc1',0.00),(47,'2019-07-06 07:56:31.383153','Purchase','None','[{\"cost\": 0, \"name\": \"小米 Redmi K20Pro\", \"number\": 0, \"isbncode\": 100003582699, \"producer\": \"\"}]',3,'4c20e95b2783dc0a0acc7442eb3984b6',0.00),(48,'2019-07-06 07:56:33.198379','Purchase','None','[{\"cost\": 0, \"name\": \"华为(HUAWEI)MateBook 13\", \"number\": 0, \"isbncode\": 100002368328, \"producer\": \"\"}]',3,'8583f93fb8a24f70ed8c628194d1670c',0.00),(49,'2019-07-06 07:56:33.737702','Purchase','None','[{\"cost\": 0, \"name\": \"vivo iQOO 8GB+128GB\", \"number\": 0, \"isbncode\": 100003785533, \"producer\": \"\"}]',3,'b2fe7e212ccb258d196c2b1b398649cc',0.00),(50,'2019-07-06 07:56:34.242358','Purchase','None','[{\"cost\": 0, \"name\": \"佳能（Canon）EOS 80D 单反套机（EF-S 18-200mm f/3.5-5.6 IS）\", \"number\": 0, \"isbncode\": 2554856, \"producer\": \"\"}]',3,'b91c4390d5f6b0101c53af1c09cf4041',0.00),(51,'2019-07-06 07:56:35.041852','Purchase','None','[{\"cost\": 5299, \"name\": \"苹果 iPhone XR 手机\", \"number\": 0, \"isbncode\": 31545088844, \"producer\": \"\"}]',3,'3df825ec01992202bff9469cc1a88b25',0.00),(52,'2019-07-06 07:56:35.915953','Purchase','None','[{\"cost\": 5958, \"name\": \"苹果 iPhone X\", \"number\": 0, \"isbncode\": 11794447957, \"producer\": \"\"}]',3,'621a130b86c26dd567f740ebc1b87ee5',0.00);
/*!40000 ALTER TABLE `record_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_clerk`
--

DROP TABLE IF EXISTS `user_clerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_clerk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `realName` varchar(50) NOT NULL,
  `group` varchar(10) NOT NULL,
  `lastLogin` datetime(6) NOT NULL,
  `createAt` datetime(6) NOT NULL,
  `updateAt` datetime(6) NOT NULL,
  `isOnline` tinyint(1) NOT NULL,
  `jobnumber` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_clerk`
--

LOCK TABLES `user_clerk` WRITE;
/*!40000 ALTER TABLE `user_clerk` DISABLE KEYS */;
INSERT INTO `user_clerk` VALUES (1,'laizhuowei','201625010409','赖卓伟','0','2019-07-05 15:21:00.000000','2019-06-28 16:20:01.348612','2019-07-05 16:41:58.693678',0,'20162501040'),(2,'liweiyuan','alskdjfhg','赖卓伟','0','2019-07-05 14:16:00.000000','2019-07-05 14:16:15.434475','2019-07-05 16:18:54.608713',0,'112'),(3,'laizhuowei2','123456','赖卓伟','0','2019-07-07 14:20:46.942181','2019-07-05 16:42:43.563414','2019-07-07 14:20:46.942354',1,'112');
/*!40000 ALTER TABLE `user_clerk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customer`
--

DROP TABLE IF EXISTS `user_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `realName` varchar(50) NOT NULL,
  `group` varchar(10) NOT NULL,
  `lastLogin` datetime(6) NOT NULL,
  `createAt` datetime(6) NOT NULL,
  `updateAt` datetime(6) NOT NULL,
  `isOnline` tinyint(1) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `account` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customer`
--

LOCK TABLES `user_customer` WRITE;
/*!40000 ALTER TABLE `user_customer` DISABLE KEYS */;
INSERT INTO `user_customer` VALUES (1,'liweiyuan','201625010411','李伟源','1','2019-06-28 18:03:00.000000','2019-06-28 16:19:25.043084','2019-07-05 13:21:36.613395',0,'15917616127','1079397813@qq.com',1000),(2,'admin','0000','李伟源','1','2019-07-05 14:19:18.528635','2019-06-28 18:10:32.861270','2019-07-05 14:19:21.940323',0,'15917616128','1079397812@qq.com',1000),(27,'account','123456','赖卓伟','1','2019-07-05 20:43:30.665396','2019-07-05 13:41:11.004890','2019-07-07 14:20:36.019391',0,'15917616129','15917616127@qq.com',1000),(28,'asdfg','asdfg','赖卓伟','1','1970-01-01 00:00:00.000000','2019-07-06 07:31:46.464329','2019-07-06 07:31:46.464350',0,'11222112211','qweqwe@qq.com',1000),(33,'asd2','asdfge','赖卓伟','1','2019-07-06 07:34:37.814131','2019-07-06 07:34:28.333411','2019-07-06 07:34:40.761398',0,'11222112','qwwe@qq.com',1000);
/*!40000 ALTER TABLE `user_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_recieveinfo`
--

DROP TABLE IF EXISTS `user_recieveinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_recieveinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reciever` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `phone` varchar(11) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_recieveinfo_owner_id_5e5490b5_fk_user_customer_id` (`owner_id`),
  CONSTRAINT `user_recieveinfo_owner_id_5e5490b5_fk_user_customer_id` FOREIGN KEY (`owner_id`) REFERENCES `user_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_recieveinfo`
--

LOCK TABLES `user_recieveinfo` WRITE;
/*!40000 ALTER TABLE `user_recieveinfo` DISABLE KEYS */;
INSERT INTO `user_recieveinfo` VALUES (5,'李伟源','华山区17栋','1234567','511500',2),(6,'asdasd','asdasd','adadad','asdad',27),(7,'asdasdss','asdasdss','adad','asda',27),(8,'asdasd33','asdasd22','adawsadaasd','asww',27);
/*!40000 ALTER TABLE `user_recieveinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-07 22:51:03
