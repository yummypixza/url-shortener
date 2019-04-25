-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.1.51    Database: short_link_generator
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `AccessLog`
--

DROP TABLE IF EXISTS `AccessLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessLog` (
  `access_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` int(10) unsigned DEFAULT NULL,
  `source_ip` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`access_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessLog`
--

LOCK TABLES `AccessLog` WRITE;
/*!40000 ALTER TABLE `AccessLog` DISABLE KEYS */;
INSERT INTO `AccessLog` VALUES (1,1,'::ffff:172.22.0.1',NULL,NULL),(2,3,'::ffff:172.22.0.1',NULL,NULL),(3,3,'::ffff:172.22.0.1',NULL,NULL),(4,3,'::ffff:172.22.0.1',NULL,NULL),(5,4,'::ffff:172.22.0.1',NULL,NULL),(6,3,'::ffff:172.22.0.1',NULL,NULL),(7,14,'::ffff:172.22.0.1',NULL,NULL),(8,24,'::ffff:172.22.0.1',NULL,NULL),(9,26,'::ffff:172.22.0.1',NULL,NULL),(10,28,'::ffff:172.22.0.1',NULL,NULL),(11,31,'::ffff:172.22.0.1',NULL,NULL),(12,3,'::ffff:172.22.0.1',NULL,NULL),(13,3,'::ffff:172.22.0.1',NULL,NULL);
/*!40000 ALTER TABLE `AccessLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
INSERT INTO `File` VALUES (1,'/public/MvoPjV.jpg',24905,1526110592),(2,'/public/7N22PE.jpg',32982,1526219285),(3,'/public/vRDBnz.jpg',214711,1526219382),(4,'/public/T9DT48.jpg',115385,1526220193),(5,'/public/jcyN28.jpg',115287,1526220821),(6,'/public/uvE9qL.jpg',114919,1526221481),(7,'/public/iTRaSf.jpg',116253,1526221518),(8,'/public/bVWAF4.jpg',116728,1526221606),(9,'/public/f146K4.jpg',114724,1526221896),(10,'/public/jXiV5F.jpg',115563,1526222041),(11,'/public/qCxNx7.jpg',116853,1526222072),(12,'/public/BstPgG.jpg',115287,1526222092),(13,'/public/dMYVnz.jpg',116176,1526222152),(14,'/public/Var1ph.jpg',118326,1526222205),(15,'/public/uzGDWA.jpg',143266,1526222235),(16,'/public/xJVp39.jpg',141008,1526222363),(17,'/public/oqaDqg.jpg',115854,1526222430),(18,'/public/4AZv4L.jpg',115854,1526222440),(19,'/public/GqRz32.jpg',115298,1526222513),(20,'/public/xpLNcn.jpg',115298,1526222787),(21,'/public/eEQ15G.jpg',115544,1526222963),(22,'/public/Nms4fz.jpg',117720,1526222990),(23,'/public/kbDetw.jpg',117184,1526223045),(24,'/public/U3jsxW.jpg',115844,1526223059),(25,'/public/viWCsP.jpg',73584,1526223371),(26,'/public/gBjxdJ.jpg',73584,1526223380),(27,'/public/Ux3YVK.jpg',12996,1526228755),(28,'/public/tMmRsM.jpg',24905,1526231288),(29,'/public/rAbvEv.jpg',202875,1526231567),(30,'/public/PfH5Po.jpg',199993,1526231775),(31,'/public/YaB4q1.jpg',12523,1526232765),(32,'/public/GiWJDq.jpg',115890,1526232951),(33,'/public/Z5BKm9.jpg',17633,1526233136),(34,'/public/Rsm2PG.jpg',73584,1526233237),(35,'/public/SfcNgi.jpg',105851,1526263301);
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `URL`
--

DROP TABLE IF EXISTS `URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `URL` (
  `url_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `original_url` text,
  `shortened_url` text,
  `screenshot` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`url_id`),
  KEY `url_creator_id_foreign` (`creator_id`),
  CONSTRAINT `url_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `URL`
--

LOCK TABLES `URL` WRITE;
/*!40000 ALTER TABLE `URL` DISABLE KEYS */;
INSERT INTO `URL` VALUES (1,1,'https://www.google.com','MvoPjV','/public/MvoPjV.jpg',1526110591,1526110591),(2,NULL,'https://www.google.com','7N22PE','/public/7N22PE.jpg',1526219283,1526219283),(3,NULL,'https://tw.yahoo.com','vRDBnz','/public/vRDBnz.jpg',1526219372,1526219372),(4,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','T9DT48','/public/T9DT48.jpg',1526220189,1526220189),(5,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','jcyN28','/public/jcyN28.jpg',1526220818,1526220818),(6,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','uvE9qL','/public/uvE9qL.jpg',1526221478,1526221478),(7,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','iTRaSf','/public/iTRaSf.jpg',1526221516,1526221516),(8,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','bVWAF4','/public/bVWAF4.jpg',1526221605,1526221605),(9,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','f146K4','/public/f146K4.jpg',1526221895,1526221895),(10,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','jXiV5F','/public/jXiV5F.jpg',1526222039,1526222039),(11,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','qCxNx7','/public/qCxNx7.jpg',1526222070,1526222070),(12,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','BstPgG','/public/BstPgG.jpg',1526222090,1526222090),(13,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','dMYVnz','/public/dMYVnz.jpg',1526222150,1526222150),(14,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','Var1ph','/public/Var1ph.jpg',1526222204,1526222204),(15,NULL,'https://ithelp.ithome.com.tw/articles/10195344','uzGDWA','/public/uzGDWA.jpg',1526222231,1526222231),(16,NULL,'https://ithelp.ithome.com.tw/articles/10195344','xJVp39','/public/xJVp39.jpg',1526222360,1526222360),(17,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','oqaDqg','/public/oqaDqg.jpg',1526222428,1526222428),(18,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','4AZv4L','/public/4AZv4L.jpg',1526222438,1526222438),(19,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','GqRz32','/public/GqRz32.jpg',1526222511,1526222511),(20,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','xpLNcn','/public/xpLNcn.jpg',1526222785,1526222785),(21,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','eEQ15G','/public/eEQ15G.jpg',1526222962,1526222962),(22,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','Nms4fz','/public/Nms4fz.jpg',1526222988,1526222988),(23,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','kbDetw','/public/kbDetw.jpg',1526223043,1526223043),(24,NULL,'https://getbootstrap.com/docs/4.0/components/buttons/','U3jsxW','/public/U3jsxW.jpg',1526223058,1526223058),(25,NULL,'https://www.facebook.com/','viWCsP','/public/viWCsP.jpg',1526223370,1526223370),(26,NULL,'https://www.facebook.com/','gBjxdJ','/public/gBjxdJ.jpg',1526223378,1526223378),(27,NULL,'https://www.myproguide.com/','Ux3YVK','/public/Ux3YVK.jpg',1526228745,1526228745),(28,NULL,'http://www.google.com','tMmRsM','/public/tMmRsM.jpg',1526231286,1526231286),(29,NULL,'https://tw.yahoo.com','rAbvEv','/public/rAbvEv.jpg',1526231559,1526231559),(30,NULL,'https://tw.yahoo.com','PfH5Po','/public/PfH5Po.jpg',1526231769,1526231769),(31,NULL,'https://item.taobao.com/item.htm?spm=a312a.7700824.w4002-17795851866.34.4d3de312KcxErO&id=546772513522','YaB4q1','/public/YaB4q1.jpg',1526232755,1526232755),(32,NULL,'https://developer.android.com/topic/arc/emulator','GiWJDq','/public/GiWJDq.jpg',1526232946,1526232946),(33,NULL,'https://forum.gamer.com.tw/C.php?bsn=201&snA=16933&tnum=4','Z5BKm9','/public/Z5BKm9.jpg',1526233136,1526233136),(34,NULL,'https://www.facebook.com/','Rsm2PG','/public/Rsm2PG.jpg',1526233235,1526233235),(35,NULL,'http://knexjs.org/#Raw-Queries','SfcNgi','/public/SfcNgi.jpg',1526263297,1526263297);
/*!40000 ALTER TABLE `URL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'test@test.com','$2a$12$Z.Z1UAOGGyrqhmfNychVdugjiRkHaKqLMTkT/0RgqzlmeVJcMDr0C','Test User',1526110333,1526110333);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations`
--

DROP TABLE IF EXISTS `knex_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knex_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations`
--

LOCK TABLES `knex_migrations` WRITE;
/*!40000 ALTER TABLE `knex_migrations` DISABLE KEYS */;
INSERT INTO `knex_migrations` VALUES (1,'20180510181224_initial.js',1,'2018-05-12 07:31:18');
/*!40000 ALTER TABLE `knex_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations_lock`
--

DROP TABLE IF EXISTS `knex_migrations_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knex_migrations_lock` (
  `is_locked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations_lock`
--

LOCK TABLES `knex_migrations_lock` WRITE;
/*!40000 ALTER TABLE `knex_migrations_lock` DISABLE KEYS */;
INSERT INTO `knex_migrations_lock` VALUES (0);
/*!40000 ALTER TABLE `knex_migrations_lock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-20 21:45:06
