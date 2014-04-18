-- MySQL dump 10.13  Distrib 5.5.32, for Win32 (x86)
--
-- Host: localhost    Database: a5bgames
-- ------------------------------------------------------
-- Server version	5.5.32

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
-- Table structure for table `game_officials`
--

DROP TABLE IF EXISTS `game_officials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_officials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` int(11) NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `assignRole` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignState` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personNameFull` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gameId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_official_game_slot_index` (`gameId`,`slot`),
  KEY `IDX_B7810586EC55B7A4` (`gameId`),
  CONSTRAINT `FK_B7810586EC55B7A4` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_officials`
--

LOCK TABLES `game_officials` WRITE;
/*!40000 ALTER TABLE `game_officials` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_officials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_teams`
--

DROP TABLE IF EXISTS `game_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` int(11) NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `levelKey` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupKeySlot` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conduct` longtext COLLATE utf8_unicode_ci,
  `gameId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_team_game_slot_index` (`gameId`,`slot`),
  KEY `IDX_A4F15BD7EC55B7A4` (`gameId`),
  CONSTRAINT `FK_A4F15BD7EC55B7A4` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_teams`
--

LOCK TABLES `game_teams` WRITE;
/*!40000 ALTER TABLE `game_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectKey` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `venueName` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fieldName` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `levelKey` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupKey` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dtBeg` datetime NOT NULL,
  `dtEnd` datetime DEFAULT NULL,
  `link` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_project_num_index` (`projectKey`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `age` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` int(11) DEFAULT NULL,
  `sport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domainSub` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `level_sport_index` (`sport`),
  KEY `level_domain_index` (`domain`),
  KEY `level_domain_sub_index` (`domainSub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_fed_certs`
--

DROP TABLE IF EXISTS `person_fed_certs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_fed_certs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_fed_id` int(11) DEFAULT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_date` date DEFAULT NULL,
  `badge` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `badge_date` date DEFAULT NULL,
  `badge_verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `badge_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upgrading` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mem_year` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_fed_cert_role_index` (`person_fed_id`,`role`,`org_key`),
  KEY `IDX_6C3359C78F5CF919` (`person_fed_id`),
  CONSTRAINT `FK_6C3359C78F5CF919` FOREIGN KEY (`person_fed_id`) REFERENCES `person_feds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_fed_certs`
--

LOCK TABLES `person_fed_certs` WRITE;
/*!40000 ALTER TABLE `person_fed_certs` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_fed_certs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_feds`
--

DROP TABLE IF EXISTS `person_feds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_feds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `person_verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fed` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fed_role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fed_role_date` date DEFAULT NULL,
  `fed_key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fed_key_verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_key_verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mem_year` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_336E7406A73E848A` (`fed_key`),
  UNIQUE KEY `person_fed_role_index` (`fed_role`,`person_id`),
  KEY `IDX_336E7406217BBB47` (`person_id`),
  CONSTRAINT `FK_336E7406217BBB47` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_feds`
--

LOCK TABLES `person_feds` WRITE;
/*!40000 ALTER TABLE `person_feds` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_feds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_persons`
--

DROP TABLE IF EXISTS `person_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_80C2745A727ACA70` (`parent_id`),
  KEY `IDX_80C2745ADD62C21B` (`child_id`),
  CONSTRAINT `FK_80C2745ADD62C21B` FOREIGN KEY (`child_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `FK_80C2745A727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_persons`
--

LOCK TABLES `person_persons` WRITE;
/*!40000 ALTER TABLE `person_persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_plans`
--

DROP TABLE IF EXISTS `person_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `project_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `person_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `basic` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `level` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `avail` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `notes` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_plan_project_person_id_index` (`project_id`,`person_id`),
  KEY `IDX_99518715217BBB47` (`person_id`),
  KEY `person_plan_project_person_name_index` (`project_id`,`person_name`),
  CONSTRAINT `FK_99518715217BBB47` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_plans`
--

LOCK TABLES `person_plans` WRITE;
/*!40000 ALTER TABLE `person_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name_full` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_first` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_last` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_nick` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_middle` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address_city` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A25CC7D32B6FCFB2` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_teams`
--

DROP TABLE IF EXISTS `project_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectKey` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `levelKey` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `groupKey` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_team_game_slot_index` (`projectKey`,`levelKey`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_teams`
--

LOCK TABLES `project_teams` WRITE;
/*!40000 ALTER TABLE `project_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyx` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slugPrefix` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descx` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fed` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fedOrg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fedRole` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `season` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sport` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domainSub` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignor` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `dates` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `plan` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `search` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5C93B3A4235C9D64` (`keyx`),
  UNIQUE KEY `UNIQ_5C93B3A4989D9B62` (`slug`),
  KEY `projectSeasonIndex` (`season`),
  KEY `projectSportIndex` (`sport`),
  KEY `projectDomainIndex` (`domain`),
  KEY `projectDomainSubIndex` (`domainSub`),
  KEY `projectSlugPrefixStatusIndex` (`slugPrefix`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'AYSO_A5BGames_Spring2014','A5BGamesSpring2014','A5BGames','Tournament','Area 5B Games 2014','AYSO Area 5B Games 2014 - Knoxville, TN - April 25,26,27','AYSO','USSF_AL','AUSOV','Spring2014','Soccer','AYSO','A5BGames','Active','a:6:{s:4:\"name\";s:11:\"Art Hundiak\";s:5:\"email\";s:18:\"ahundiak@gmail.com\";s:5:\"phone\";s:12:\"256.457.5943\";s:6:\"submit\";s:52:\"Emails your application to Art Hundiak and yourself.\";s:6:\"prefix\";s:8:\"A5BGames\";s:3:\"bcc\";a:2:{s:4:\"name\";s:11:\"Art Hundiak\";s:5:\"email\";s:18:\"ahundiak@gmail.com\";}}','a:3:{i:0;a:5:{s:4:\"date\";s:10:\"2014-04-25\";s:5:\"label\";s:3:\"Fri\";s:7:\"lodging\";b:0;s:6:\"search\";b:1;s:5:\"avail\";s:11:\"5PM Kickoff\";}i:1;a:5:{s:4:\"date\";s:10:\"2014-04-26\";s:5:\"label\";s:3:\"Sat\";s:7:\"lodging\";b:0;s:6:\"search\";b:1;s:5:\"avail\";s:6:\"AllDay\";}i:2;a:5:{s:4:\"date\";s:10:\"2014-04-27\";s:5:\"label\";s:3:\"Sun\";s:7:\"lodging\";b:0;s:6:\"search\";b:1;s:5:\"avail\";s:6:\"AllDay\";}}','a:12:{s:12:\"refereeLevel\";N;s:18:\"comfortLevelCenter\";N;s:18:\"comfortLevelAssist\";N;s:17:\"requestAssessment\";N;s:7:\"lodging\";N;s:11:\"lodgingWith\";N;s:13:\"travelingWith\";N;s:13:\"travelingFrom\";N;s:18:\"teamClubAffilation\";N;s:12:\"teamClubName\";N;s:12:\"availability\";N;s:5:\"notes\";N;}','N;');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authens`
--

DROP TABLE IF EXISTS `user_authens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authens` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_3DE1ECD0A76ED395` (`user_id`),
  CONSTRAINT `FK_3DE1ECD0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authens`
--

LOCK TABLES `user_authens` WRITE;
/*!40000 ALTER TABLE `user_authens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_authens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_guid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_verified` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_confirmed` tinyint(1) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_confirmed` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hint` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `account_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_enabled` tinyint(1) NOT NULL,
  `account_locked` tinyint(1) NOT NULL,
  `account_expired` tinyint(1) NOT NULL,
  `account_expires_at` datetime DEFAULT NULL,
  `account_created_on` datetime DEFAULT NULL,
  `account_updated_on` datetime DEFAULT NULL,
  `account_last_login_on` datetime DEFAULT NULL,
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_requested_at` datetime DEFAULT NULL,
  `password_reset_expires_at` datetime DEFAULT NULL,
  `email_confirm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirm_requested_at` datetime DEFAULT NULL,
  `email_confirm_expires_at` datetime DEFAULT NULL,
  `person_confirm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_confirm_requested_at` datetime DEFAULT NULL,
  `person_confirm_expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-17 17:00:59
