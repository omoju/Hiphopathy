-- MySQL dump 10.13  Distrib 5.5.28, for osx10.6 (i386)
--
-- Host: localhost    Database: hiphopathy
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `albumid` int(11) NOT NULL AUTO_INCREMENT,
  `album` varchar(255) NOT NULL,
  `artistid` int(11) NOT NULL,
  PRIMARY KEY (`albumid`)
) ENGINE=MyISAM AUTO_INCREMENT=61181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (61179,'American Gangster',34697),(61180,'The Best of Both Worlds',34697);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `artistid` int(11) NOT NULL AUTO_INCREMENT,
  `artist` varchar(255) NOT NULL,
  `alias` text NOT NULL,
  PRIMARY KEY (`artistid`)
) ENGINE=MyISAM AUTO_INCREMENT=34700 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (34697,'Jay-Z ','Hova / Hovi / Shawn Carter');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_a7792de1` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add poll',8,'add_poll'),(23,'Can change poll',8,'change_poll'),(24,'Can delete poll',8,'delete_poll'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice'),(34,'Can add artist',12,'add_artist'),(35,'Can change artist',12,'change_artist'),(36,'Can delete artist',12,'delete_artist'),(37,'Can add album',13,'add_album'),(38,'Can change album',13,'change_album'),(39,'Can delete album',13,'delete_album'),(40,'Can add song',14,'add_song'),(41,'Can change song',14,'change_song'),(42,'Can delete song',14,'delete_song'),(43,'Can add snippet',15,'add_snippet'),(44,'Can change snippet',15,'change_snippet'),(45,'Can delete snippet',15,'delete_snippet');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'hiphopathy_user','','','hiphopathy@gmail.com','pbkdf2_sha256$10000$9wnjGY9vGHgo$PTlNkYQmUHSyeC0L7Krdz2UJhsx1iNz9szwEur51WiU=',1,1,1,'2013-02-19 20:51:23','2012-11-28 18:32:17');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f0ee9890` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base64_data`
--

DROP TABLE IF EXISTS `base64_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base64_data` (
  `c` char(1) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `val` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base64_data`
--

LOCK TABLES `base64_data` WRITE;
/*!40000 ALTER TABLE `base64_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `base64_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_type_id_refs_id_288599e6` (`content_type_id`),
  KEY `user_id_refs_id_c8665aa` (`user_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-11-28 18:33:37',1,12,'34686','Tone-Loc',3,''),(2,'2012-11-28 18:52:45',1,15,'1','This is the shit you dream about/with the homies steaming out',1,''),(3,'2012-11-28 18:55:03',1,12,'34687','Outlawz',3,''),(4,'2012-11-28 18:55:03',1,12,'34688','2Pac',3,''),(5,'2012-11-28 18:55:03',1,12,'34689','Murphy Lee f/ Zee',3,''),(6,'2012-11-28 18:55:03',1,12,'34690','Kanye West f/ Young Jeezy',3,''),(7,'2012-11-28 18:55:03',1,12,'34691','OutKast',3,''),(8,'2012-11-28 18:55:03',1,12,'34692','MC Solaar',3,''),(9,'2012-11-28 18:55:03',1,12,'34693','JT Money f/ Trick Daddy Dollaz',3,''),(10,'2012-11-28 18:55:03',1,12,'34694','Phat Kat',3,''),(11,'2012-11-28 18:55:03',1,12,'34695','The Luniz',3,''),(12,'2012-11-28 18:55:03',1,12,'34696','Pumpkinhead',3,''),(13,'2012-11-28 18:56:50',1,15,'2','Back, back, backing them Beemers out',1,''),(14,'2012-11-28 20:11:54',1,14,'179','Pray',2,'Changed title.'),(15,'2012-11-28 20:12:20',1,14,'191','Shake Ya Body',3,''),(16,'2012-11-28 20:12:20',1,14,'192','Somebody\'s Girl',3,''),(17,'2012-11-28 20:12:20',1,14,'193','Shorty',3,''),(18,'2012-11-28 20:12:20',1,14,'194','It Ain\'t Personal',3,''),(19,'2012-11-28 20:12:20',1,14,'195','The Streets',3,''),(20,'2012-11-28 20:12:20',1,14,'196','Pussy',3,''),(21,'2012-11-28 20:12:20',1,14,'197','The Best of Both Worlds',3,''),(22,'2012-11-28 20:12:20',1,14,'198','Take You Home With Me a.k.a. Body',3,''),(23,'2012-11-28 20:12:20',1,14,'199','Honey',3,''),(24,'2012-11-28 20:12:20',1,14,'200','Break Up to Make Up',3,''),(25,'2012-11-28 20:12:20',1,14,'201','Naked',3,''),(26,'2012-11-28 20:12:20',1,14,'202','Get This Money',3,''),(27,'2012-11-28 20:12:20',1,14,'203','Green Light',3,''),(28,'2012-11-28 20:12:44',1,12,'34698','Jay-Z',3,''),(29,'2012-11-28 20:12:55',1,12,'34697','Jay-Z ',2,'Changed artist.'),(30,'2012-11-28 23:16:50',1,15,'1','This is the shit you dream about/with the homies steaming out',2,'Changed decoded.'),(31,'2013-02-13 22:42:22',1,18,'1','This is the shit you dream about/with the homies steaming out',2,'No fields changed.');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'poll','polls','poll'),(9,'choice','polls','choice'),(12,'artist','polls','artist'),(13,'album','polls','album'),(14,'song','polls','song'),(15,'snippet','polls','snippet'),(16,'song','hiphopathy','song'),(17,'artist','hiphopathy','artist'),(18,'snippet','hiphopathy','snippet');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3243e042ab8cc2deeb57c6bc1cc92744','ZWQ0NmFlNzRiZTMzNTBlNmMyYTMxYzVjMzQyMWQ1M2M3ZDEwMzY1OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-12-12 23:15:54'),('522d66d9028819ad47ff6633c4a461de','ZjcyY2UxMjkzN2QxOGE1ZGM3NjgxMjAxZjFmYjhiNzQzMDE5YjljODqAAn1xAS4=\n','2013-03-05 20:51:27'),('56bd32a3c623932358e594ad0c60b9d9','ZWQ0NmFlNzRiZTMzNTBlNmMyYTMxYzVjMzQyMWQ1M2M3ZDEwMzY1OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-01-24 22:04:58');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_level`
--

DROP TABLE IF EXISTS `education_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_level` (
  `education_levelid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`education_levelid`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_level`
--

LOCK TABLES `education_level` WRITE;
/*!40000 ALTER TABLE `education_level` DISABLE KEYS */;
INSERT INTO `education_level` VALUES (1,'low-literate'),(2,'low-literate'),(3,'low-literate'),(4,'low-literate'),(5,'low-literate'),(6,'low-literate'),(7,'low-literate'),(8,'junior high school'),(9,'junior high school'),(10,'junior high school'),(11,'some high school'),(12,'some high school'),(13,'high school graduate'),(14,'some college'),(15,'some college'),(16,'some college'),(17,'university degree'),(18,'post-graduate studies'),(19,'post-graduate studies'),(20,'post-graduate degree');
/*!40000 ALTER TABLE `education_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hiphopathy_snippet`
--

DROP TABLE IF EXISTS `hiphopathy_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hiphopathy_snippet` (
  `snippetid` int(11) NOT NULL,
  `songid` int(11) NOT NULL,
  `chunk` longtext,
  `user_answer` varchar(765) DEFAULT NULL,
  `comments` longtext NOT NULL,
  `decoded` varchar(765) DEFAULT NULL,
  PRIMARY KEY (`snippetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hiphopathy_snippet`
--

LOCK TABLES `hiphopathy_snippet` WRITE;
/*!40000 ALTER TABLE `hiphopathy_snippet` DISABLE KEYS */;
INSERT INTO `hiphopathy_snippet` VALUES (1,185,'This is the shit you dream about/with the homies steaming out','dreams, goals, aspirations hope, fantasy, reality','This line has not being decoded by Jay','sdfas'),(2,185,'Back, back, backing them Beemers out','materialism, luxuries, dreams','beginnings, dreaming, dangerous, good/bad',NULL);
/*!40000 ALTER TABLE `hiphopathy_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `choice` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id_refs_id_a27693dd` (`poll_id`),
  CONSTRAINT `poll_id_refs_id_a27693dd` FOREIGN KEY (`poll_id`) REFERENCES `polls_poll` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_myartist`
--

DROP TABLE IF EXISTS `polls_myartist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_myartist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(200) NOT NULL,
  `alias` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_myartist`
--

LOCK TABLES `polls_myartist` WRITE;
/*!40000 ALTER TABLE `polls_myartist` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_myartist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_mysong`
--

DROP TABLE IF EXISTS `polls_mysong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_mysong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `singer_id` int(11) NOT NULL,
  `song` varchar(200) NOT NULL,
  `album` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `singer_id_refs_id_e5586857` (`singer_id`),
  CONSTRAINT `singer_id_refs_id_e5586857` FOREIGN KEY (`singer_id`) REFERENCES `polls_myartist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_mysong`
--

LOCK TABLES `polls_mysong` WRITE;
/*!40000 ALTER TABLE `polls_mysong` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_mysong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_poll`
--

DROP TABLE IF EXISTS `polls_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_poll`
--

LOCK TABLES `polls_poll` WRITE;
/*!40000 ALTER TABLE `polls_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `songid` int(11) NOT NULL AUTO_INCREMENT,
  `albumid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `lyrics` text NOT NULL,
  `artistid` int(11) NOT NULL,
  PRIMARY KEY (`songid`)
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (177,61179,'Ignorant Shit','[Intro: Jay-Z]\r\nYes sir~! Just the sound of his voice is a hit, heh heh\r\nY\'all niggaz got me really confused out there\r\nI make \"Big Pimpin\'\" or \"Give it to Me\" one of those\r\nY\'all hail me as the greatest writer of the 21st century\r\nI make some thought provokin shit y\'all question whether he fallin off\r\nI\'ma really confuse y\'all on this one... follow!\r\n\r\n[Verse One: Jay-Z]\r\nWhen them tops come down, chicks tops come down\r\nLike when them shots come out, make cops come around\r\nWhen them blocks come out I can wake up a small town\r\nFinish off the block then I make my mall rounds\r\nStares get exchanged then the fifth come out\r\nThe tough guy disappear, then the bitch come out\r\n\"That\'s him!\" I\'m usually what they whisper \'bout\r\nEither what chick he with, or his chip amount\r\nCause I been doin\' this since C*H*I*P*S was out\r\nWatchin Erik Estrada, baggin up at the Ramada\r\nTable full of powder, AC broke\r\n\'Bout to take another shower on my twenty-fifth hour\r\nSpike Lee\'s everywhere, game on the flight\r\nYou might see me anywhere, day in the life\r\nOnly thing changed the tail number on the flight\r\nI can touch down and take off the same night\r\n\r\n[Chorus: Jay-Z]\r\nI\'m so bossy, bitch get off me\r\nTrick get off me, you can\'t get shit off me\r\nI\'m so flossy, no 6\'s or Sprees\r\nLaid back, Maybachs, don\'t even talk to me\r\nThis is that ignorant shit you like\r\nNigga fuck shit ass bitch trick precise, c\'mon\r\nI got that ignorant shit you love\r\nNigga fuck shit maricón puta and drugs, c\'mon\r\nI got that ignorant shit you need\r\nNigga fuck shit ass bitch trick plus weed, c\'mon\r\nI\'m only tryin to give you what you want\r\nNigga fuck shit ass bitch you like it don\'t front!\r\n\r\n[Verse Two: Jay-Z]\r\nThey\'re all actors\r\nLookin at themselves in the mirror backwards\r\nCan\'t even face themselves, don\'t fear no rappers\r\nThey\'re all weirdos, DeNiros in practice\r\nSo don\'t believe everything your earlobe captures; it\'s mostly backwards\r\nUnless it happens to be as accurate as me\r\nAnd everything said in song you happen to see\r\nThen, actually, believe half of what you see\r\nNone of what you hear, even if it\'s spat by me\r\nAnd with that said, I will kill niggaz dead\r\nCut niggaz short, give you wheels for legs\r\nI\'m a K-I-double-L-E-R\r\nSee y\'all in Hell, shoot niggaz straight through the E.R.\r\nWhoa~! This ain\'t B.R., no\r\nThis S.C. CEO, the next Lyor, no\r\nThe next leader of the whole free world\r\nAnd the first thing I\'ma do is free Sigel, go\r\n\r\n[Verse Three: Beanie Sigel]\r\nTake off the cuffs, unlock the gate\r\nIt\'s that ignorant nigga that you love to hate\r\nThe oh-seven Ice Cube, B. Sig\' so rude\r\nTell a trick get these nuts, eat dick like food\r\nNow see if I care if this verse get aired\r\nEven if you mute it, the curse is there, yeah\r\nI\'m so rauncy, bitch get off me\r\nKeep my flea collar on, you lil\' ticks get off me\r\n\r\n[Verse Four: Jay-Z]\r\nI missed the part when it stopped bein \'bout Imus\r\nWhat do my lyrics got to do with this shit!\r\n\"Scarface\" the movie did more than Scarface the rapper to me\r\nSo that ain\'t to blame for all the shit that\'s happened to me\r\nAre you sayin what I\'m spittin\r\nIs worse than these celebrataunts showin they kittin, you kiddin!\r\nLet\'s stop the bullshittin\r\n\'Til we all without sin, let\'s quit the pulpittin\r\n\"Scarface\" the movie did more than Scarface the rapper to me\r\nSo that ain\'t to blame for all the shit that\'s happened to me\r\nNow stop the bullshittin\r\n\'Til we all without sin, let\'s quit the pulpittin\r\n\r\n[Chorus: Jay-Z]\r\nThis is that ignorant shit you like\r\nNigga fuck shit ass bitch trick precise, c\'mon\r\nI got that ignorant shit you love\r\nNigga fuck shit maricón puta and drugs, c\'mon\r\nI got that ignorant shit you need\r\nNigga fuck shit ass bitch trick plus weed, c\'mon\r\nI\'m only tryin to give you what you want\r\nNigga fuck shit ass bitch you like it don\'t front!\r\n\r\n[Jay-Z]\r\nIt\'s only entertainment! Hehehe\r\n',34697),(178,61179,'Success','[\"Dominic Cattano\" from American Gangster (film)]\r\n\"Your Success took a shot at you\r\nwhat are you going to do now?\r\nhow are you gonna kill it?\r\nyou\'re gonna become unsuccessful?\r\nFrank, you can be successful and have enemies uh?\r\nbe unsuccessful too, and even have friends\"\r\n\r\n[Jay-Z]\r\nI got these niggas breezy, don\'t worry about it\r\nLet that bitch breathe\r\n\r\nI use to give a fuck, now I give a fuck less\r\nWhat do I think of success?... it sucks\r\nto much stress I guess I blew up quick\r\n\'Cause friends I grew up with\r\nSee me as a Pre\'me but I\'m not and my nuts big\r\nI don\'t know what the fuss Is, my career is illustrious\r\nMy rep is impeccable; I\'m not to be fucked with\r\nwith, shit, let that bitch breathe\r\n\r\nI\'m way to important to be talking about extorting\r\nAsking me for a portion is like asking for a coffin\r\nBroad daylight I\'ll off your on switch\r\nYou\'re not to bright, goodnight long kiss\r\nbye bye my reply... BLAH, BLAH\r\nBlast burner then pass burner to Tye-Tye\r\nFinish my breakfast, why?\r\nI got an appetite for destruction and you\'re a small fry\r\nNow where was I?\r\nLet that bitch breathe\r\n\r\nI use to give a shit, now I don\'t give a shit more\r\nTruth be told I had more fun when I was piss poor\r\nI\'m pissed off, and is this what success is all about?\r\na bunch a niggas acting like bitches with big mouths\r\nAll this stress, all I got is this big house\r\nCouple of cars, I don\'t bring half of them shits out\r\nAll of this ace of spade I drank just to piss out\r\nI mean I like the taste coulda saved myself 6 hours\r\nHow many times can I go to Mr. Childs, taos mobu\r\nHold up, lemme move my bouwls\r\nI\'ll shit on y\'all niggas, OG tell these boys\r\n(Ya ain\'t about to shit on my nigga)\r\n\r\nI got watches I ain\'t seen in months\r\nApartment at the Trump; I only slept in once\r\nNiggas said Hova was ova, such dummies\r\nEven If I fell I\'ll land on a bunch of money\r\nYa ain\'t got nothing for me\r\n\"Nas; let that bitch breathe\"\r\n\r\n[Nas]\r\nSuccess, McLaren, women staring\r\nMy villain appearance sacred blood of a king\r\nand my vein ain\'t spilling\r\nGhetto Othello, Sugar Hill Romello\r\nCamaro driven, I climax from paper\r\nand ask why is life worth living?\r\nIs it to hunt for the shit that you want?\r\nTo recieve\'s great, but I lust giving\r\nThe best jewelers wanna make my things\r\nI make Jacob shit on Lorraine just to make me a chain\r\nNiggas mentioned on One Love\r\nCame home to the paper in hand\r\nAin\'t gotta brag about the FEDS young man\r\nOld cribs I sold, y\'all drive by like monuments\r\nGoogle Earth Nas; I got flats in other continents\r\nWorst enemies wanna be my best friends\r\nBest friends wanna be enemies like that\'s what\'s in\r\nBut I don\'t give a fuck walk inside the lions den\r\nTake everybody\'s chips, about to cash them in\r\nUp your catalog dawg, mine\'s worth to much\r\nLike Mike Jacks ATV pub, Mottola can\'t touch\r\nLet this bitch breathe\r\n\r\n[Jay-Z & Nas]\r\nLet this bitch breathe\r\n',34697),(179,61179,'Pray','[Intro: Beyoncé]\r\nDeliver me from my enemies, oh God\r\nDefend me from all that rise up against me\r\nDeliver me from the work of inequity\r\nAnd save me from the Bloody Mary\r\n\r\n[Jay-Z]\r\nLook.. mind state of a gangster from the 40\'s\r\nmeets the business mind of Motown\'s Berry Gordy\r\nTurned crack rock into a chain of 40/40\'s\r\nSorry my jewelry is so gaudy\r\nSlid into the party with my new pair of Mauri\'s\r\nAmerica, meet the gangster Shawn Corey\r\nHey young world, wanna hear a story?\r\nClose your eyes and you can pretend you\'re me\r\nI\'m cut from the cloth of the Kennedy\'s\r\nFrank Sinatra, havin dinner with the Genovese\r\nThis is the genesis of a nemesis\r\nMother America’s not witnessed since\r\nthe Harlem Renaissance birthed black businesses\r\nThis is the tale of lost innocence\r\nAs the incense burns and the turntables turn\r\nAnd that Al Green plays\r\nI see my mother\'s afro\r\nAs Mama taps her toes, as she rolls her J\'s\r\nAnd my papa just left the house\r\nin search of the killer of my Uncle Ray\r\nAnd she\'s trying to calm her nerves\r\nAs I observe this is just one day\r\nAnd what tomorrow has in store\r\nwe can never be sure so all we can do is... pray\r\n\r\n[Break: Beyoncé]\r\nBecause of your strength...\r\nWhile I walk the pond of Eden\r\nFor God is my deep fix (pray for me!)\r\n\r\n[Jay-Z]\r\nAs I head to my homeroom\r\nI observe the ruins\r\nDope needles on the ground\r\nI hear a car go, \"Vroom\"\r\nDrug dealer in the BM with the top down\r\nAs the girls start to giggle\r\nI ask, \"Why you laugh?\"\r\nThey say, \"You\'re too little\"\r\n\"One day you\'ll understand\r\nwhen you become a man\r\n\'bout things you have to get you\"\r\nFast forward, freeze frame on my pistol, fistful of dollars\r\nIgnorance is so blissful\r\nI ain\'t choose this life, this life chose me\r\nAround here it\'s the shit that you just do\r\nI just left school\r\nThe same BM is pulled over by the boys dressed blue\r\nThey had their guns drawn\r\nScreaming, \"Just move\"\r\n\"Or is there something else you suggest we can do?\"\r\nHe made his way to the trunk\r\nOpened it like, \"Huh?\"\r\nA treasure chest was removed\r\nCops said he\'ll be back next month\r\nWhat we called corrupt, he calls payin dues\r\nNow when the rules is blurred\r\nAs they is and were\r\nWhat am I to do.. but pray\r\nPray the Lord forgive me\r\nPray He guides me by for what I\'m \'bout to go through... pray\r\n\r\n[Break: Beyoncé]\r\nDeliver me in thy righteousness\r\nAnd cause me to escape\r\nAnd climb thine air internal\r\nSave me thine Lord (pray for me!)\r\n\r\n[Jay-Z]\r\nGeah.. anywhere there\'s oppression\r\nThe drug profession\r\nflourishes like beverages\r\nRefreshing, ahhh! Sweet taste of sin\r\nEverything I seen, made me everything I am\r\nBad drug dealer or victim, I beg\r\nWhat came first? \r\nMoving chickens or the egg?\r\nThis I why I be so fresh\r\nI\'m trying to beat life \'cause I can\'t cheat death\r\nTreat shame with shamelessness\r\nAnd stainless at anuses\r\nYou know the game this is?\r\nMove coke like Pepsi\r\nDon\'t matter what the brand name is\r\nI stand behind mine\r\nEverything I do, I\'m a man behind mine\r\nI\'m not an angel, I\'m sure\r\nBut every night before I lay\r\nI drop my knees to the floor and I pray\r\n\r\n[Outro: Beyoncé]\r\nThe name shall endure forever\r\nThe name shall be continued as long as the sun (pray for me!)\r\nMen shall be blessed in Him\r\nAll nations shall call Him blessed\r\n\r\nIn your name I pray... (pray for me!)\r\nLord bless us\r\n',34697),(180,61179,'Say Hello','[Jay-Z]\r\nUhh, uhh, uhh\r\nUhh...\r\nIt\'s that Roc-A-Fella music, soulful\r\n\r\n[Chorus: Jay-Z]\r\nSay hello, to the bad guy (hello) they say I\'m a bad guy\r\nI come from the bottom, but now I\'m mad fly (say hello)\r\nThey say I\'m a menace (hello) that\'s the picture they paint\r\nThey say a lot about me, let me tell you what I ain\'t (say hello)\r\nThey say I\'m a bad guy (hello) say hi to the bad guy\r\nI come from the bottom, but now I\'m mad fly (say hello)\r\nThey say I\'m a menace (hello) that\'s the picture they paint\r\nThey say a lot about me, let me tell you what I ain\'t (say hello)\r\nAy (say hello), ay, ay, ay\r\nThey say a lot about me, let me tell you what I ain\'t\r\n\r\n[Verse One: Jay-Z]\r\nI ain\'t playin, life\'s short so I aim\r\nI ain\'t waitin \'til lifers start betrayin \'em\r\nIt\'s twice as hard to get a job as payin \'em\r\nSo I ain\'t payin attention to what you\'re sayin\r\nRaindrops keep fallin on my brain\r\nCousin in the drop all flames\r\nI\'m so hot even if the weather change\r\nI don\'t have no top, I\'m insane\r\n\'Member dark-skinned Jermaine\r\nWho swayed in the rain, we sorta kinda the same\r\n\'Cept, I\'m no lame, and you gonna know my name\r\nBefore I go the world gon\' feel my pain\r\nThey sayin, I\'m a bad guy, why\'s that?\r\nCause when my back\'s against the wall, nigga I react\r\nSecretly though, I know you admire that\r\nYou wish you had the balls to fire back, brrrap\r\nSay hello, uhh uh, hello, uhh uh\r\nYou wish you had the balls to fire back, brrap!\r\n\r\n[Chorus]\r\n\r\n[Verse Two: Jay-Z]\r\nI ain\'t no ordinary nigga\r\nLook around, this ain\'t what ordinary gets ya (IT AIN\'T~!)\r\nExtraordinary figures (damn)\r\nI\'m an extraordinary nigga\r\nBefore my name became Jigga\r\nBefore I sang I had that thang on slippers\r\nCan\'t complain \'bout what they ain\'t gon\' give ya\r\nThat ain\'t gon\' get ya shit, might as well give up\r\nOr get up, get out and get somethin nigga\r\nGet a job my nigga, or get to dumpin\r\nOnly God can judge him, only he without sin\r\nTell me if my means, justified my ends\r\n\'Til then, I\'m just gon\' fly in the Benz\r\nWire my friends, through Western Union\r\nShhhhh, suprisin\r\nMy system knockin, here comes the bad guy again\r\nSay hello, uhh uh, hello, uhh uh\r\nHello, uhh here comes the bad guy again\r\n\r\n[Chorus] minus last line\r\n\r\n[Verse Three: Jay-Z]\r\n... let me tell you what I ain\'t\r\nWe ain\'t thugs for the sake of just bein thugs\r\nNobody do that where we grew at, nigga duh\r\nThe poverty line we not above\r\nSo I come to mask and gloves cause we ain\'t feelin the love\r\nWe ain\'t doin crime for the sake of doin crimes\r\nWe movin dimes cause we ain\'t doin fine\r\nOne out of three of us is locked up doin time\r\nYou know what this type of shit can do to a nigga moms\r\nMy mind on my money, money on my mind\r\nIf you owe me ten dollars you ain\'t givin me nine\r\nY\'all ain\'t give me 40 acres and a mule\r\nSo I got my glock 40 now I\'m cool\r\nAnd if Al Sharpton is speakin for me\r\nSomebody, give him the word and tell him I don\'t approve\r\nTell him I remove the curses\r\nIf you tell me our schools gon\' be perfect\r\nWhen Jena Six don\'t exist\r\nTell him that\'s when I\'ll stop sayin bitch, BEEEITCH~!\r\n\r\n[Chorus] minus last line\r\n',34697),(181,61179,'Blue Magic','Roc-a-fella records\r\nThe imperial Skateboard P\r\nGreat Hova\r\nY\'all already know what it is (Oh Shit!)\r\n\r\nC\'mon!\r\n[Verse 1]\r\nYeah\r\nSo what if you flip a couple words\r\nI could triple that in birds\r\nopen your mind you see the circus in the sky\r\nI\'m Ringling brothers Barnum and Bailey with the pies\r\nNo matter how you slice it I\'m your motherfucking guy\r\nJust like a B-Boy with 360 waves\r\nDo the same with the pot, still come back beige.\r\nWhether writers are par, whether powder the jar\r\nWhip it around, it still comes back hard.\r\nSo easily do I w-h-i-p\r\nMy repitition with wrists will bring you kilo biggers.\r\nI got kreole C.O. bitches for my niggas who slipped, became prisoners\r\nTrees taped to the visitors\r\nYou already know what the business is\r\nUnnecessary commissary, boy we live this shit\r\nNiggas wanna bring the 80s back\r\nIt\'s okay with me, that\'s where they made me at\r\nExcept I don\'t write on the wall\r\nI write my name in the history books, hustling in the hall (hustling in the hall)\r\nNah, I don\'t spin on my head\r\nI spin work in the pots so I can spend my bread\r\n\r\n[Chorus] (Pharrell)\r\nAnd I\'m getting it, I\'m getting it\r\nI aint talking about it, I\'m living it\r\nI\'m getting it, straight getting it\r\nGe-ge-ge-get get get it boy\r\n(Don\'t waste you time, fighting the life stay your course, and you\'ll understand)\r\nGet it boy\r\n\r\n[Verse]\r\nIt\'s \'87 state of mind that I\'m in (mind that I\'m in)\r\nIn my prime, so for that time, I\'m Rakim (I\'m Rakim)\r\nIf it wasn\'t for the crime that I was in\r\nBut I wouldn\'t be the guy whose rhymes it is that I\'m in (that I\'m in)\r\nNo pain, no profit, P I repeat if you show me where the pot is (pot is)\r\nCherry M3\'s with the top back (top back)\r\nRed and green G\'s all on my hat\r\nNorth beach leathers, matching Gucci sweater\r\nGucci sneaks on to keep my outfit together\r\nWhatever, hundred for the diamond chain\r\nCan\'t you tell that I came from the dope game\r\nBlame Reagan for making me into a monster\r\nBlame Oliver North and Iran-Contra\r\nI ran contraband that they sponsored\r\nBefore this rhyming stuff we was in concert\r\n\r\n[Chorus] (Pharrell)\r\nAnd I\'m getting it I\'m getting it\r\nI aint talking about it, I\'m living it\r\nI\'m getting it, straight getting it\r\nGe-ge-ge-get get get it boy\r\n(Don\'t waste you time, fighting the life, stay your course, and you\'ll understand)\r\nGet it boy\r\n\r\n[Verse 3]\r\nPush (push) money over broads, you got it, fuck Bush\r\nChef (chef), guess what I cooked\r\nBaked a lot of bread and kept it off the books\r\nRockstar, look, way before the bars my picture was getting took\r\nFeds, they like wack rappers, tried as they may, couldn\'t get me on the hook\r\nD.A. wanna indict me\r\nCause fish scales in my veins like a pisces\r\nThe pyrex pot, rolled up my sleeves\r\nTurn one into two like a Siamese\r\nTwin when it end, I\'m a stand as a man never dying or admiring these\r\nLast of a dying breed, so let the champagne pop\r\nI partied for a while now I\'m back to the block\r\n\r\n[Chorus] (Pharrell)\r\nAnd I\'m getting it I\'m getting it\r\nI aint talking about it, I\'m living it\r\nI\'m getting it, straight getting it\r\nGet get get get get get get it boy\r\n(Don\'t waste you time, fighting the life, stay your course, and you\'ll understand)\r\nGet it boy\r\n',34697),(182,61179,'No Hook','Most important thing in business is honesty, integrity, hard work, family...\r\nNever forgetting where we came from\r\n\r\nPoor me, dad was gone, finally got my dad back\r\nLiver bad, he wouldn\'t live long, they snatched my dad back\r\nGod as I never had that, streets was my second home\r\nWelcomed me with open arms provided a place to crash at\r\nA place to study math at, matter of fact, I learned it all\r\nBurned it all, this music is where I bury the ashes at\r\nFlash back, not having much, not having that\r\nHad to get some holla bread so you can holla back, and holla that\r\nMy Jewish lawyer too enjoyed the fruit of letting my cash stack\r\nAnd just in case a nigga gotta use his rat-tat-tat-tat\r\nOwn boss, own your, masters, slaves\r\nThe mentality I carry with me to this very day\r\nFuck rich, let\'s get wealthy, who else gon feed we?\r\nIf I need it, I\'ma get it however, God help me\r\n....And I don\'t need no hook for this shiiiit\r\nI\'m so fa sho, it\'s no facade\r\nStay outta trouble, momma said, as momma sighed\r\nHer fear her youngest son be a victim of homicide\r\nBut I gotta get you outta here momma, or I\'ma die\r\n...inside\r\nAnd either way, you lose me momma so let loose of me\r\nI got the rain our direction will soon change\r\nTo live and die in N-Y in the hustle game\r\nHustle caine, hustle clothes, I hustle music\r\nBut hustle hard in any hustle that you pick\r\nSkinny nigga, toothpick, but, but I do lift\r\nWeight like I\'m using, rhoids, Rolls, Royce keep my movements\r\nSmooth while manuevering, through all the maneur in\r\nThe sewer that I grew up in\r\nChoices, we make trying to escape\r\nAnd I don\'t need no hook for this shiiiit...\r\nThis is not for commercial usage\r\nPlease don\'t categorize this as music\r\nPlease don\'t compare me to other rappers\r\nCompare me to trappers, I\'m more Frank Lucas than Ludacris\r\nAnd Luda\'s my dude, I ain\'t trying to diss\r\nLike Frank Lucas is cool, but I ain\'t trying to snitch\r\nI\'ma follow the rules no matter how much time I\'ma get\r\nI\'ma live and die with the decisions that I\'ma pick\r\nSo fuck Dehaven for caving, that\'s why we don\'t speak\r\nMade men ain\'t supposed to make statements\r\nEnd of the story, I followed the code, cracked the safe\r\nOther niggas ain\'t in the game so they practice hate\r\nLeave that boy Hov alone, why don\'t cha?\r\nYou don\'t have to if you don\'t want to but don\'t say I didn\'t warn ya\r\nOh...\r\nAnd I don\'t need no hook for this shiiiit...\r\n',34697),(183,61179,'American Gangster','[Intro]\r\nAnd you say New York City\r\nUh-huh\r\nPut your hands together\r\nYoung! Uh-huh\r\nYeah\r\nUh-huh\r\nYes\r\n\r\nI\'m from the 80\'s,\r\nHome of the heroine,\r\nError of the hustlers, uh\r\nThe world is my custy\r\nNew Rich Porter\r\nThe way I flip quarters\r\nFront on all these other rap artists, but me\r\nMomma was a mink wearer, Papa ran numbers\r\nSo it\'s plain to see, where my whole plan come from\r\nAmerican dream, I\'m living the life still\r\nThe way I shine is like a zillion dollar light bill\r\nStill I\'m grinding, army jacket lining\r\n40 below timbs on, getting my M\'s on\r\nMy best friends gone, I seen bad days\r\nStill find songs that I hear him on\r\nGetting my Mary J. Blige +Reminisce+ on\r\nI hear his voice in my mind, like, nigga live on\r\nSo I get on that fly shit I been on\r\nSpin on corners in enzo with rims on\r\nBut for info, puffin\' on Endo-Nesia\r\nGive me amnesia\r\nI ease up, that right, I\'m high nigga\r\nI want the sky,\r\nThe world when I\'m done\r\nI\'m give it to my sons\r\nLet \'em live it up, split it up, switch it up, uh\r\nSixes kit it up, man I did it up, done\r\nThe rest of my belongings belong in the hall of fame, a list of hits next to all my names\r\nI came\r\n\r\n[Bridge]\r\nUh-huh\r\nI want the sky baby\r\nI want the sky baby\r\n\r\nIf the sky should fall\r\nAnd it all goes tomorrow, and they foreclose on the house and auction off all my cars\r\nDon\'t cry for me Argentina, I mobbed in the beamer\r\nTook trips abroad, got mobbed in Sardina\r\nIn Ibiza I had pizza in the club\r\nLadies know I\'m that guy, they wanna piece of my love\r\nNow they wanna ya boy like Mike in his prime\r\nBillie Jean, the goddamn boy ain\'t mine\r\nAnd the Roc break up had the people losing hope\r\nCan\'t lie, they had Muhammad Hovi on the ropes\r\nNow I\'m back in the go mode, back in the go-go\'s\r\nThrowing the diamond up, repping the logo\r\nRose gold rose flow, I\'m okay though\r\nWhat Don\'t kill me makes stronger than before so\r\nHere we go and I\'m not domino\r\nWhen it all falls down, I\'m like Kanye\'s jaw\r\nI might break but I don\'t fold, till I hold the sky in my hand\r\nYeah that\'s my goal\r\nAnd then I bid you Freddy Adu\r\nProdigal Child, y\'all not ready for the fu-ture\r\nThen I disappear in the Bermuda Triangle\r\nMy name will be viewed such\r\nHere\'s to the man that refused to give up\r\nI want the sky nigga, Chuuuuuuch\r\n',34697),(184,61179,'Roc Boys (And the Winner Is)...','And the winner is Hov... my man. SPEECH!\r\n\r\nFirst of all I wanna thank my connect\r\nThe most important person with all due respect\r\nThanks to duffle bag, the brown paper bag\r\nThe Nike shoe box for holding all this cash\r\nBoys in blue who put greed before the badge\r\nThe first pusher whoever made the stash\r\nThe Roc Boys in the building tonight (hey!)\r\nOh what a feeling I\'m feeling life (hey!)\r\nThanks to the lames, niggas with bad aim\r\nThanks to a little change I tore you out the game\r\nBullet wounds will stop your bafoonery\r\nThanks to the pastor rapping at your eulogy\r\nTo Lil Kim and them, you know the women friend\r\nWho, carry the work cross state for a gentlemen\r\nYeah, thanks to all the hustlers\r\nAnd most importantly you, the customer\r\n\r\nChorus: Jay-z [Kanye West]\r\nThe Roc Boys in the building tonight\r\nOh what a feeling, I\'m feeling life\r\nYou don\'t even gotta bring ya paper out\r\nWe the dope boys of the year, drinks is on the house\r\n[We in the house, hou-, hou-]\r\nThe Roc Boys in the building tonight\r\nLook at how I\'m chilling, I\'m killing this ice\r\nYou don\'t even gotta bring ya purses out\r\nWe the dope boys of the year, drinks is on the house\r\n[We in the house, hou-, hou-]\r\n[We in the house, hou-, hou-, HEY]\r\n\r\nLet ya hair down baby, I just hit a score\r\nPick any place on the planet, pick a shore\r\nTake what the Forbes figure, then figure more\r\nCause they forgot to account what I did with the raw\r\nPick a time, lets pick apart some stores\r\nPick a weekend for freaking for figure fours\r\nI figure frauds never hit a lick before\r\nSo they don\'t know the feeling when them things get across\r\nPut ya hand out the window, feel the force\r\nFeel the Porsche, hit the frost\r\nIce cold, jewels got no flaws\r\nDrop got no top, you on the top floor\r\nPink Rosay, think OJ\r\nI get away with murder when I sling yay\r\nHeroin got less steps than Britney\r\nThat means it ain\'t stepped on, dig me?\r\n\r\nChorus (with overlapping 3rd verse towards end)\r\n\r\nRed Porsches, rare portraits\r\nRed guns if you dare come near the fortress\r\nThis apple sauce is from the apple orchid\r\nThis kinda talk is only reserved for the bosses\r\nWhich means I get it from the ground\r\nWhich means you get it when I\'m around\r\nRich niggas, black bar mitzvahs\r\nMazel tov, it\'s a celebration bitches, L\'Chayim\r\nI wish for you a hundred years of success but it\'s my time\r\nCheers, toast to crime\r\nNumber one D-boy, shame he could rhyme\r\n\r\nchorus x 3\r\n\r\nSweet, let that ride out!\r\nBring the horns back in, yeah\r\nThis is black super hero music right here baby\r\nAmerican Gangsta\r\nTaking flight, coming to a town near you\r\nSoon as I touch down I just want ya\'ll to start playing the horns like...\r\nHovies home...Lukey baby\r\nHahahahaha...ow!\r\n',34697),(185,61179,'American Dreamin\'','[samples of \"Soon I\'ll Be Loving You Again\" by Marvin Gaye]\r\nDreamed of you this morning\r\nThen came the dawn, and\r\nI thought you were here with me\r\nIf youuuuu could only see\r\nHow much I love you\r\nThat\'s all, that\'s all baby\r\n\r\n[repeat 3X in background]\r\nOh no-oh, I never gave up no way\r\n\r\n[samples]\r\nI never, felt that before\r\nI never, felt that before\r\nI never, felt that before\r\nBut there\'s always; that\'s all, that\'s all baby\r\n\r\n[Jay-Z]\r\nThis is the shit you dream about with the homie steamin out\r\nBack-to-back, backin them Beemers out\r\nSeems as our, plans to get a grand\r\nThen go off to college, didn\'t pan or even out\r\nWe need it now, we need a town\r\nWe need a place to pitch, we need a mound\r\nFor now, I\'m just a lazy boy\r\nBig dreaming in my La-Z-Boy\r\nIn the clouds of smoke, been playin this Marvin\r\nMama forgive me, should be thinkin \'bout Harvard\r\nBut that\'s too far away, niggaz are starvin\r\nAin\'t nuttin wrong with my aim, just gotta change the target\r\nI got, dreams of baggin sni-dow, the size of pil-lows\r\nI see pies everytime my eyes cli-dose\r\nI see rides, sixes, I gotta get those\r\nLife\'s a bitch, I hope to not make her a widow\r\n\r\n[repeat 3X in background]\r\nOh no-oh, I never gave up no way\r\n\r\n[Chorus: samples] + (Jay-Z)\r\nI never, felt that before (American dreamin)\r\nI never, felt that before (Just American dreamin)\r\nI never, felt that before (American dreamin)\r\nBut there\'s always; that\'s all, that\'s all\r\n\r\n[Jay-Z]\r\nUh, uhhhh~!\r\nNow see the life\'s right there, and it seems right there\r\nIt\'s not quite near, and it\'s not like we\'re\r\nprofessionals, movin the decimals\r\nKnow where to cop? Nah! Got a connect? No\r\nWho in the F knows how to be successful\r\nNeed a \"Personal Jesus,\" I\'m in Depeche Mode\r\nThey say its celestial, its all in the stars\r\nLike Tony LaRussa on how you play your Cards\r\nCause y\'all ain\'t fuckin with me! The ironies are\r\nAt all costs bet on before he was boss\r\nNow let\'s start, on your mark\r\nGet set, let\'s go, get out the car\r\nGoin in circles it\'s a vicious cycle\r\nThis is a crash course, this ain\'t high school\r\nWake up Muttley, you\'re dreamin again\r\nYour own reality show, the season begins\r\n\r\n[repeat 3X in background]\r\nOh no-oh, I never gave up no way\r\n\r\n[Chorus]\r\n\r\n[Jay-Z]\r\nStep one in this process, scramble up in your projects\r\nAnd head to the heights where big coke is processed\r\nYou gotta convince \'em that you\'re not from the precinct\r\nPlease speak slow cause he no speaky no english\r\nIf he takes a likin after a couple of trips\r\nand your money is straight, he\'s gon\' give you consignment\r\nYou\'re now in a game where only time can tell\r\nSurvive the droughts, I wish you well - hold up\r\nSurvive the droughts? I wish you well?\r\nHow sick am I? I wish you health\r\nI wish you wheels, I wish you wealth\r\nI wish you insight so you could see for yourself\r\nYou could see the signs when the jackers is schemin\r\nAnd the cops is comin, you could read they mind\r\nYou could see from behind, you could redefine\r\nthe game as we know it, one dream at a time\r\nI\'m American dreamin\r\n\r\n[repeat 3X in background]\r\nOh no-oh, I never gave up no way\r\n\r\n[Chorus]\r\n\r\n[Jay-Z]\r\nAmerican dreamin\r\n\r\n{*instrumental continues for another 1:02*}\r\n',34697),(186,61179,'Hello Brooklyn 2.0','[Intro:]\r\nHelloooooooooooooo!!!!!!!! Brooklynnnnnnnnnnnnnnnnnn!!!!!!!!!!!!!!!!!!!\r\n\r\n[Chorus: Lil Wayne]\r\nHello Brooklyn, how you doin?\r\nWhere you goin? And can I come to?\r\nAnd If I can, I\'m a be your man\r\nYou could be my lady, and have my baby\r\nAnd drive my cars, and drive me crazy\r\nWherever you goin baby girl just take me\r\nCause I\'m so taken, if you taken\r\nI\'m just sayin baby I\'m just sayin\r\n\r\n[Verse 1: Jay-Z]\r\nLike a mama you birth me, Brooklyn you nursed me\r\nSchooled me with hard knocks, better than Berkeley\r\nThey said you murked me, by the time I was twenty one\r\nThat shit disturbed me, but you never hurt me\r\nHello Brooklyn, if we had a daughter\r\nGuess what I\'m a call her, Brooklyn Carter\r\nWhen I left you for Virginia, it didn\'t offend ya\r\nCause you know I only stepped out to get dinner\r\nAnd I\'m eatin, so much i bought extra\r\nSo much so the dinner now turnin to breakfast\r\nI only roll Lexus, to hug your road\r\nI love your corners, I\'m half your soul\r\n\r\n[Chorus: Lil Wayne]\r\nHello Brooklyn, how you doin?\r\nWhere you goin? And can I come to?\r\nAnd If I can, I\'m a be your man\r\nYou could be my lady, and have my baby\r\nAnd drive my cars, and drive me crazy\r\nWherever you goin baby girl just take me\r\nCause I\'m so taken, if you taken\r\nI\'m just sayin baby I\'m just sayin\r\n\r\n[Verse 2: Lil Wayne] (Jay-Z)\r\nHello Brooklyn, what\'s your story?\r\nShe said she eatin\' on the run but she ain\'t N.O.R.E.\r\nShe said she got a man but he ain\'t worried\r\nBut baby I\'m a have to +Rob+ him like +Horry+\r\nShe said she love B.I.G. and she like 2Pac\r\nAnd when I said Jay-Z she said it\'s The ROC\r\nAnd I\'m a leave it like this, like this like that\r\nWhere Brooklyn at? Where Brooklyn at?\r\nHave you seen her?\r\nAnd when she tell you somethin you better believe her\r\nShe told me she like my New Orleans demeanor\r\nAnd so I said goodbye Katrina, and hello Brooklyn\r\nBut baby you are, the sweetest sight eyes could see\r\nI said hello Brooklyn, but baby I hope you never say goodbye to me\r\nI said hello Brooklyn, but but baby you are so damn fine to me\r\nAnd I remember the time (Time) place (Place) and the weather\r\nOn the day you said hi to me and let\'s say hello Brooklyn\r\n\r\n[Verse 3: Jay-Z]\r\nBrooklyn we crazy, look how you made me\r\nRazor blades in my mouth walkin \'round behavin\r\nOr demented black hoodies and Timberlanded\r\nAlways schemin you see the green on that niggas pendant\r\nHello Brooklyn, you bad influence look what you had me doin\r\nBut I ain\'t mad at you, look at my attitude\r\nIt says my life too real, check out my ice grill\r\nBaby I\'m cold as ice, like I\'m from Brownsville\r\nBut my Bed\'s in the Stuy so while I Flatten your Bush\r\nTill we smoke a C.I. what up to the boy B.I.\r\nYou know I handle B.I. I dont half step on a Kane\r\nAsk the dreads \'bout I, how you gwaan so?\r\nShe like it hardcore, So I grind slow\r\nIller than Albee Square Mall back in the 9-0\r\nMy fine hoe we got some victims to catch\r\nSo in a couple years baby I\'m a bring you some Nets\r\n\r\n[Chorus: Lil Wayne]\r\nHello Brooklyn, how you doin?\r\nWhere you goin? And can I come to?\r\nAnd If I can, I\'m a be your man\r\nYou could be my lady, and have my baby\r\nAnd drive my cars, and drive me crazy\r\nWherever you goin baby girl just take me\r\nCause I\'m so taken, if you taken\r\nI\'m just sayin baby I\'m just sayin\r\n\r\n[Outro: Lil Wayne]\r\nAnd hello Brooklyn, but but baby you are, the sweetest thing eyes could see\r\nHello Brooklyn, baby I hope you never say goodbye to me\r\nI said hello Brooklyn, but baby you are, so damn fine to me\r\nBut I remember the time, place, and the weather on the day you said goodbye to me\r\n',34697),(187,61179,'I Know','[Chorus - Pharrell] (Jay-Z)\r\nAnd I Know And I Know\r\nAnd I Know And I Know\r\n(I know what you like)\r\nAnd I Know And I Know\r\nAnd I Know And I Know\r\n(I know what you love)\r\nEverything you like\r\nEverything you love\r\nEverything you like\r\nEverything you love\r\nAnd I Know And I Know\r\nAnd I Know And I Know\r\nAnd I Know And I Know\r\nAnd I Know And I Know\r\nI know what you like\r\nEverything you like\r\n(Baby you like ....HOV!)\r\nEverything you love\r\n(Baby you love ....HOV!)\r\nEverything you like\r\n(Baby you like ....HOV!)\r\nEverything you love\r\n(Baby you love ....HOV!)\r\n\r\n[Verse 1]\r\nUh\r\nShe wants that old thing back\r\nUh, uh, uh\r\nShe want those heroin tracks\r\nShe likes me\r\nShe fiends for me nightly\r\nShe leans for me\r\nMorning she rush for my touch\r\nThis is about lust\r\nCold sweats occur when I\'m not with her\r\nMy presence is a must, must-must\r\nBonita Applebum, I gotta put you on\r\nIf I didn\'t when we cuttin\', the feeling would be too strong\r\nIn any form, I\'m giving you sweet dreams\r\nThat Sugar Hill, she call me her sweet thing\r\nThat Black Rain that take away your pain\r\nJust for one night, baby, take me in vein\r\nNow that feelin\' got you trippin\'\r\nYou no wanna feel no different\r\nSaid lust has got you itchin\'\r\nAll wide open and its\' drippin\'(eh,eh,eh,eh)\r\nI know what you like, I am your prescription\r\nI\'m your physician, I\'m your addiction\r\n\r\n[Chorus]\r\n\r\n[Verse 2]\r\nI am so dope\r\nLike Louis Vuittons with the red bottoms\r\nYou gotta have \'em, you glad you got \'em\r\nLike every color, Giuseppe\'s your guilty pleasure is me\r\nIts so much fun, you shun therapy\r\nAlthough it never be, the feeling is fleeting\r\nShopping\'s like coppin\', you constantly need it\r\nI\'m never around, you constantly seeking\r\nYou\'ll never be down, I know where your peak is\r\n9 1/2 weeks is better than 12-steps\r\nI keep tryin\' to remind you to keep tellin\' yourself\r\nNow your conscience is interfering, like \"Better yourself!\"\r\nLike you better get help\r\nBut when that medicine\'s felt?\r\nWe\'re back together\r\nDon\'t ever leave me\r\nDon\'t ever let \'em tell you that you\'ll never need me\r\nMy China White, \'til we D.O.A.\r\nIts Montega forever, baby, lets get away....\r\n\r\n[Chorus]\r\n\r\n[Verse 3]\r\nHow could you leave me?\r\nI thought that you needed me\r\nWhen the world got too much and you pleaded with me\r\nWho helped you immediately?\r\nHow speedy of me\r\nHow could you deny me so vehemently?\r\nNow your body is shakin\' trying to free it of me\r\nAnd your soul is in control, trying to lead it from me\r\nAnd your heart no longer pledge allegiance to me\r\nDamn, I\'m missing the days when you needed the D\r\n\r\n[Chorus]\r\n',34697),(188,61179,'Sweet','[Verse 1]\r\nSweet - and still there\'s pain (pain) (pain)\r\nIf I would have grew up to be a doctor\r\nMy nephews would have grew up to do the same (same) (same)\r\nBut since I grew up through the game\r\nAnd my influence is the same\r\nAnd my therapy is music\r\nThey ask if you ashamed (ashamed) (ashamed)\r\nAnd though I wish I could separate the two things\r\nI cannot so my answer to you remains\r\nI can walk down the hall of mirrors in Versailles\r\nAnd be so satisfied when I look myself in the eyes\r\nNo shame, no sir\r\nJust big boats and tearin the coast up\r\nTight coups like I\'m wearin the roadster\r\nFor in the coup, bearhuggin the holster\r\n\r\n[Chorus]\r\nHov\' alright al-right\r\nAnd that may not be what you call perfect but\r\nBut it\'s my life (uh)\r\nThe life (uh-uh) the life (uh-uh) the life\r\nOnce again it\'s the life\r\n\r\n[Verse 2]\r\nSo I make no apologies, crooked policies\r\nSo a G a nigga gotta be\r\nWe playin for property no monopoly\r\nSo I\'ll pass go and let my nephew follow me\r\nThey say the child shall lead\r\nSo I take it far as I can and then we shall see\r\nShall we dance with the devil for a beat\r\nI pray to God I ain\'t got two left feet\r\nDo the hustle put keys in the street\r\nThen I\'m ballroom dancing\r\nKe-ke\'in in the suite\r\nSweet, BB\'s on the feet\r\nTV\'s in the seat, ene-mies on the creep\r\nIt\'s so corrupt\r\nSoak it up it\'s a lesson\r\nEvery fuck up\r\nOne day you\'re up\r\nNext day you\'re down\r\nLong as you stay the same it\'ll come back around\r\n\r\n[Chorus]\r\n\r\n[Verse 3]\r\nI\'m even better\r\nI\'m eatin better\r\nBest thing about it is\r\nMy niggas eatin together\r\nWith each endeavor,  we reachin levels\r\nNiggas ain\'t seen in like forever\r\nI\'m Hyman Roth I made all my partners rich\r\nI can\'t  vouch for you\r\nIf you ain\'t a part of this\r\nSo pardon me as I pave my wrist (uh)\r\nAs I parlay my chips\r\nHOV alright alright\r\nAmerican gangster gangster\r\nBusinesses  like I\'m white\r\nBut I\'m not, I\'m just bright\r\nSo fly with no fear of the flight\r\nSo if y\'all hear my plight\r\nAnd if you think you can make it this far without a fight\r\nCouple mistakes here and there\r\nNot always right, but I\'m always real\r\nThat\'s how I sleep at night\r\n\r\n[Chorus]\r\n\r\n[Jay-Z]\r\nSweet\r\n',34697),(189,61179,'Fallin\'','[Chorus - Bilal]\r\nI know I should\'ve did that\r\nI know it\'s gonna come right back\r\nI know it\'s gonna destroy everything I made\r\nIt\'s probably gonna get ya boy sent away\r\nBut this game I play ain\'t no way to fix it\r\nIt\'s inevitable that I\'m...\r\n\r\n[Verse 1 - Jay-Z]\r\nSaid where I would stop be-\r\nfore\' I even started\r\nWhen I get to one brick\r\nThen the game I would depart with\r\nGot to one brick then I looked to the sky like\r\nSorry God I lied\r\nBut give me one more try\r\nGot the two bricks\r\nNew cars new whips\r\nBut niggas never learn till they\r\nEnd up in the news clip\r\nThe irony of selling drugs\r\nIs sort of like you using it\r\nGuess it\'s two sides to what\r\nSubstance abuse is\r\nCan\'t stop won\'t stop\r\nAddicted to this new shit\r\nBrand new convertibles\r\nI\'m so roofless\r\nFront row fight night\r\nSee how big my tube is\r\nFuck HD nigga\r\nSee how clear my view is?\r\n(Bilal: Fallin\')... But there\'s a price for overdoing it\r\nDoin\' it this big will put you on the map\r\nStick-up kids is out to tax\r\nPlus the FBI boys with the cameras in the back\r\nDamn.......\r\n\r\n[Chorus - Bilal]\r\nI know I should\'ve did that\r\nI know it\'s gonna come right back\r\nI know it\'s gonna destroy everything I made\r\nIt\'s probably gonna get ya boy sent away\r\nBut this game I play ain\'t no way to fix it\r\nIt\'s inevitable (Jay-Z: Now ya) Fallin\'\r\n\r\n[Verse Two - Jay-Z]\r\nWhen you should\'ve fall back\r\nNow ya (Bilal: Fallin\')\r\nRight into they lap\r\nFallin\' and applauding\r\nAnd They screaming at the screen\r\nDamn you fucked up like your favorite movie scene\r\nGodfather Goodfellas Scarface Casino\r\nYou seen what that last run did to Denerio\r\nAnd he can\'t beat the odds\r\nCan\'t cheat the Gods\r\nCan\'t blow to hard\r\nLife\'s a deck of cards\r\nNow ya tumbling it\'s humbling\r\nYa fallin\' ya mumbling\r\nUnder ya breath like you knew this day was coming\r\n(Bilal: Fallin\').... Now let\'s pray that arm candy\r\nThat you left ya ex for stay down and come in handy\r\nCause come January it gets cold\r\nWhen the letters start to slow\r\nAnd ya commissary low\r\nAnd lawyers screams appeal\r\nOnly thinking about a bill\r\nAnd ya chances are nil\r\nDamn gravity\'s ill.....\r\n\r\n[Chorus - Bilal]\r\nI know I should\'ve did that\r\nI know it\'s gonna come right back\r\nI know it\'s gonna destroy everything I made\r\nIt\'s probably gonna get ya boy sent away\r\nBut this game I play ain\'t no way to fix it\r\nIt\'s inevitable (Jay-Z: But your) Fallin\'\r\n\r\n[Verse Three - Jay-Z]\r\nAnd ya can\'t get up\r\nAll you do is push-up\r\nPull-up sit-up\r\nLocked down the town now belongs to the squares\r\nWho said they won\'t make the same mistake that got you there\r\nAnd ya arm candy sweet on em\'and the women\r\nThat you left for this heffer got a college degree coming\r\nBad news keeps comin\'\r\nHard to keep something on ya stomach\r\nYour sick \'bout what ya life is becoming\r\n(Bilal: Fallin\')... But your use-to\'s has-beens\r\nRagging bad \'bout all the new dudes\r\nTalking tough on the Youtube\r\nBout what you use to do\r\nBut that\'s old school to the new crew\r\nThey doin\' numbers like Sudoku\r\nThere\'re the new you\r\nAnd it\'s damn near inevitable\r\nThey\'ll experience deja vu too\r\nFight and you\'ll never survive\r\nRun and you\'ll never escape\r\nSo just fall for Grace\r\nDamn...\r\n\r\n[Chorus - Bilal]\r\nI know I should\'ve did that\r\nI know it\'s gonna come right back\r\nI know it\'s gonna destroy everything I made\r\nIt\'s probably gonna get ya boy sent away\r\nBut this game I play ain\'t no way to fix it\r\nIt\'s inevitable that I\'m\r\n\r\n[Bilal]\r\nFallin\'\r\nSeems like I\'m fallin\'\r\n(repeated x7)\r\nfades............\r\n',34697),(190,61179,'Party Life','[samples of \"Does Your Mama Know\" by Rudy Love & The Love Family in background]\r\nOhhhhhhhhhhh.. I like the party life!\r\nThe city in bright lights\r\nLittle girls dressed in the skintight\r\n\r\n[Jay-Z over samples]\r\nBreak out the red lights, welcome to the party life\r\nWelcome to the 70\'s... sah-wweet~!\r\n\r\n[Jay-Z]\r\nOrdered some Patreezy, while talkin to this breezy\r\nBrushin off my three-piece, I make this look too easy\r\nSo tall and lanky; my suit, it should thank me\r\nI make it look, good to be this hood Meyer Lansky\r\nMixed with Lucky Lefty, gangster effortlessly\r\nPapa was a rolling stone it\'s in my an-ces-try\r\nI\'m in a whole \'nother league, niggaz never catch me\r\nAnd I sport fly shit, I should win the ESPY\r\n\r\n[samples]\r\nWhen you\'re blue, and got nothin to do\r\nWelcome to the party life\r\nIf you\'re feelin low, we got to see the glow\r\nHead into the party life\r\n\r\n[Jay-Z over samples]\r\nHehehehe... baby I said I-I sport, fly shit\r\nI should win the Espy\r\nI\'m really in another league, babe\r\nI got a slick mouth, you might wanna roll with me\r\n\r\n[Jay-Z]\r\nI\'m on the bra strap, she\'s on my dick\r\nAin\'t nothin\' wrong with that, that\'s my biiitch!\r\nI be the boss of that, I\'m on her shiiit\r\nSo all you niggaz fall back, I\'ll split ya wiiig\r\nShe\'s my little quarterback - ya dig?\r\nCause I\'m all that in the sack; yeah, ya dig?\r\nI spoiled her, foiled it if you fakin jax\r\nShe\'s used to million dollar vacations\r\nFuck y\'all gon\' do with that?\r\n\r\n[samples]\r\nWhen you\'re blue, and got nothin to do\r\nWelcome to the party life\r\nIf you\'re feelin low, we got to see the glow\r\nGet into the party life\r\n\r\n[Jay-Z over samples]\r\nAy baby, see\r\nWhen you\'re used to filet mignon\r\nIt\'s kinda hard to go back to Hamburger Helper\r\nIt\'s your choice though baby\r\nHead into the party life\r\n\r\n[Interlude]\r\n(Is you rollin, rollin, rollin)\r\nYeah, baby, is you rollin?\r\n{Head into the party life}\r\nYou can stall out or ball out\r\n(Is you rollin, rollin, rollin)\r\nMake a choice\r\n{Headin-headin to the party life}\r\nIt\'s so gangster, baby\r\n\r\n[Jay-Z]\r\nSippin on my vino got me cooler than Pacino\r\nand DeNiro put together my real life is like \"Casino\"\r\nThey should pay me for some B-roll\r\nTakin G-strokes through the ghee-to\r\nWhen rap-pap-pap-pid fire\'s just a neccesary evil\r\nHola Ho-vi-to, cooler than ze-ro\r\nBe-low, fresh one blade, no chemo\r\nArt with no easel, please it;s no equal\r\nYour boy\'s \"Off the Wall\" these other niggaz is Tito\r\n\r\n[samples]\r\nOhhhhhhhhhhh.. I like the party life!\r\nThe city in bright lights\r\nLittle girls dressed in the skintight\r\n\r\n[Jay-Z over samples]\r\nDAMN~! Ay baby I said I\'m\r\nI\'m \"Off the Wall\" I\'m like a young Michael Jackson\r\nThese other niggaz is Tito\r\nShout out to Randy, hehehehe\r\nReal talk!\r\n\r\n[samples]\r\nWhen you\'re blue, and got nothin to do\r\nWelcome to the party life\r\nIf you\'re feelin low, we got to see the glow\r\nHead into the party life\r\n\r\n[Jay-Z over samples]\r\nI\'ma just let this ride out\r\nI might let it ride out for like seven minutes\r\nYou can groove to it, whatever\r\nGet your two step - AOWWW!\r\nGuru, turn the lights down\r\nLet\'s keep it smooth\r\nThis that shit you roll up, like a lil\' tight J to\r\nSip your lil\' wine, whatever your vice is y\'know\r\nWhatever you like to do\r\nGet into your comfort zone baby, get into yo\' comfort zone\r\n\r\n[samples]\r\nWhen you\'re blue, and got nothin to do\r\nWelcome to the party life\r\nIf you\'re feelin low, we got to see the glow\r\nHead into the party life\r\n\r\n[Jay-Z over samples]\r\nHead into the party life\r\nI don\'t even want it to stop though, f\'real though\r\n\r\n[Jay-Z]\r\nStep into my bedroom, I, call it the red room\r\nCau-cause it gets hot hot hot hot...\r\nI trust you gon\' like it; see, why are we talkin all this fly shit?\r\nCau-cau-cau-cau-cau-cause I\'m the flyest\r\nHovito, baby, no equal, baby\r\nSold perico, beat the RICO, now I\'m leg-al ba-by\r\nHovito, baby, no equal, baby\r\nSold perico, beat the RICO, now can we go crazy\r\n\r\n[samples]\r\nWhen you\'re blue, and got nothin to do\r\nWelcome to the party life\r\nIf you\'re feelin low, we got to see the glow\r\nHead into the party life\r\n\r\n{*fade out last 0:12*}\r\n',34697);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-19 13:03:53
