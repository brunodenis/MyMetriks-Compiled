CREATE DATABASE  IF NOT EXISTS `repository` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `repository`;



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



-- Table structure for table `portal_application_auth`
DROP TABLE IF EXISTS `portal_application_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_application_auth` (
  `USER_GROUP_ID` int(11) NOT NULL,
  `APPLICATION_ID` int(11) NOT NULL,
  `APPLICATION_AUTH` smallint(6) NOT NULL,
  PRIMARY KEY (`USER_GROUP_ID`,`APPLICATION_ID`),
  KEY `APPLICATION` (`APPLICATION_ID`),
  KEY `USER_GROUP` (`USER_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_application_auth` WRITE;
/*!40000 ALTER TABLE `portal_application_auth` DISABLE KEYS */;
INSERT INTO `portal_application_auth` VALUES (1,76,2),(1,78,2),(1,79,2),(1,80,2),(1,81,2),(1,84,2),(1,104,2),(1,105,2),(1,106,2),(1,108,2),(1,112,2),(1,121,2),(1,133,1),(1,130,2),(2,121,2),(2,50,2),(2,30,2),(2,112,2),(2,108,2),(2,106,2),(2,104,2),(2,60,2),(2,81,2),(2,80,2),(2,79,2),(2,73,2),(2,10,2),(1,73,2),(2,20,2);
/*!40000 ALTER TABLE `portal_application_auth` ENABLE KEYS */;
UNLOCK TABLES;



-- Table structure for table `portal_applications`
DROP TABLE IF EXISTS `portal_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_applications` (
  `APPLICATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLICATION_NAME` varchar(64) DEFAULT NULL,
  `APPLICATION_SORT` smallint(6) DEFAULT NULL,
  `APPLICATION_PARENT_ID` int(11) DEFAULT NULL,
  `APPLICATION_FUNCTION` varchar(64) DEFAULT NULL,
  `CORE_APPLICATION` int(11) DEFAULT '0',
  `APPLICATION_TABLE` varchar(64) DEFAULT NULL,
  `APPLICATION_ICON` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`APPLICATION_ID`),
  KEY `PARENT_ID` (`APPLICATION_PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='CORE_TABLE';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_applications` WRITE;
/*!40000 ALTER TABLE `portal_applications` DISABLE KEYS */;
INSERT INTO `portal_applications` VALUES (20,'Données',2,0,NULL,0,NULL,'css/interface_imgs/groupings.png'),(10,'Tableaux de Bord',1,0,NULL,0,NULL,'css/interface_imgs/dashboards2.png'),(73,'Fichiers Sources (Batch)',2,60,'MMK_SOURCE_FILES',0,NULL,'css/interface_imgs/import.png'),(130,'Clients',1,50,'MMK_CUSTOMERS',1,NULL,'css/interface_imgs/settings.png'),(133,'Server Logs',4,50,'MMK_SRV_LOGS',1,NULL,'css/interface_imgs/notes.png'),(78,'Applications',2,50,'MMK_APPLICATIONS',1,NULL,'css/interface_imgs/application.png'),(79,'Utilisateurs',1,30,'MMK_USERS',0,NULL,'css/interface_imgs/users.png'),(80,'Groupes Utilisateurs',2,30,'MMK_USER_GROUPS',0,NULL,'css/interface_imgs/usergroups.png'),(81,'Connexions',1,20,'MMK_CONNECTIONS',0,NULL,'css/interface_imgs/connexion.png'),(60,'Alimentation',6,0,NULL,0,NULL,'css/interface_imgs/import.png'),(104,'Extractions',1,60,'MMK_EXTRACTS',0,NULL,'css/interface_imgs/export.png'),(105,'Gestion des paramètres',3,50,'MMK_PARAMS',1,'portal_params','css/interface_imgs/settings.png'),(106,'Tableaux de Bord',1,10,'dashInterfaceMngt',0,NULL,'css/interface_imgs/dashboards3.png'),(108,'Sources de Données',2,20,'MMK_QUERIES_DEFINITION',0,'portal_queries_definition','css/interface_imgs/sql_icon.png'),(112,'Affichage Conditionnel',2,10,'MMK_DISP_RULES_DEFINITION',0,'portal_disp_rules_definition','css/interface_imgs/darts.png'),(30,'Habilitations',3,0,NULL,0,NULL,'css/interface_imgs/credentials.png'),(50,'Administration',5,0,NULL,0,NULL,'css/interface_imgs/settings.png'),(121,'Fichiers à la demande',3,20,'MMK_USER_FILES',0,'portal_user_files','css/interface_imgs/import.png');
/*!40000 ALTER TABLE `portal_applications` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_applications_ADEL` AFTER DELETE ON `portal_applications` FOR EACH ROW
BEGIN
    DELETE FROM `portal_application_auth` WHERE APPLICATION_ID = old.APPLICATION_ID;    -- Delete applications auth
    DELETE FROM `portal_help_applications` WHERE ID = old.APPLICATION_ID;               -- Delete help 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_connections`
DROP TABLE IF EXISTS `portal_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_connections` (
  `CONNECTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) NOT NULL,
  `CONNECTION_DB` varchar(32) DEFAULT NULL,
  `CONNECTION_NAME` varchar(256) DEFAULT NULL,
  `CONNECTION_USER` varchar(64) DEFAULT NULL,
  `CONNECTION_PASSWORD` varchar(256) DEFAULT NULL,
  `CONNECTION_PROTOCOL` char(3) DEFAULT NULL,
  `CONNECTION_HOST` varchar(256) DEFAULT NULL,
  `CONNECTION_PORT` varchar(4) DEFAULT NULL,
  `CONNECTION_SID` varchar(256) DEFAULT NULL,
  `CONNECTION_SCHEMA` varchar(12) DEFAULT NULL,
  `CONNECTION_HINT` varchar(256) DEFAULT NULL,
  `CONNECTION_STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`CONNECTION_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='CORE_TABLE';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_connections_ADEL` AFTER DELETE ON `portal_connections` FOR EACH ROW
BEGIN
    -- Remise à null de la relation query/connection
    UPDATE `portal_queries_definition` SET QUERY_CONNECTION_ID = null, CONNECTION_STATUS = 0 WHERE QUERY_CONNECTION_ID = old.CONNECTION_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_credentials`
DROP TABLE IF EXISTS `portal_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_credentials` (
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `USER_GROUP_ID` int(11) DEFAULT NULL,
  `CONN_ID` int(11) DEFAULT NULL,
  `CREDENTIAL_TABLE` VARCHAR(64) NULL DEFAULT NULL,
  `CREDENTIAL_COLUMN` varchar(64) DEFAULT NULL,
  `CREDENTIAL_VALUE` varchar(256) DEFAULT NULL,
  `CREDENTIAL_VALID` TINYINT(1) NULL DEFAULT 1,
  UNIQUE KEY `USER` (`CUSTOMER_ID`,`USER_ID`,`CONN_ID`,`CREDENTIAL_COLUMN`,`CREDENTIAL_VALUE`),
  UNIQUE KEY `USER_GROUP` (`CUSTOMER_ID`,`USER_GROUP_ID`,`CONN_ID`,`CREDENTIAL_COLUMN`,`CREDENTIAL_VALUE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_customers`
DROP TABLE IF EXISTS `portal_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_customers` (
  `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_NAME` varchar(256) DEFAULT NULL,
  `CUSTOMER_USERS` int(11) DEFAULT NULL,
  `CUSTOMER_GROUPS` int(11) DEFAULT NULL,
  `CUSTOMER_CONNS` int(11) DEFAULT NULL,
  `CUSTOMER_LANG` varchar(5) DEFAULT '',
  `CUSTOMER_LOGO` varchar(256) DEFAULT NULL,
  `CUSTOMER_DNS` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_customers` WRITE;
/*!40000 ALTER TABLE `portal_customers` DISABLE KEYS */;
INSERT INTO `portal_customers` VALUES (1,'MyMetriks',0,0,0,'fr-FR','css/interface_imgs/mymetriks.png',''),(2,'Mon Client',5,5,5,'fr-FR','css/interface_imgs/blank.gif',NULL);
/*!40000 ALTER TABLE `portal_customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_customers_ADEL` AFTER DELETE ON `portal_customers` FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
	-- Delete les utilisateurs saisis pour le customer_id en question
	DELETE FROM `portal_users` WHERE `portal_users`.CUSTOMER_ID = old.CUSTOMER_ID;
	-- Delete les groupes utilisateurs saisis pour le customer_id en question
	DELETE FROM `portal_user_groups` WHERE `portal_user_groups`.CUSTOMER_ID = old.CUSTOMER_ID;
	-- Les triggers users et user_groups s'occupent de supprimer les credentials
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_dashboard_auth`
DROP TABLE IF EXISTS `portal_dashboard_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_dashboard_auth` (
  `USER_GROUP_ID` int(11) NOT NULL,
  `DASHBOARD_ID` bigint(20) NOT NULL,
  `DASHBOARD_AUTH` smallint(6) NOT NULL,
  PRIMARY KEY (`USER_GROUP_ID`,`DASHBOARD_ID`),
  KEY `DASHBOARD` (`DASHBOARD_ID`),
  KEY `USER_GROUP` (`USER_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_dashboard_definition`
DROP TABLE IF EXISTS `portal_dashboard_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_dashboard_definition` (
  `OBJ_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJ_PARENT_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `OBJ_NAME` varchar(64) DEFAULT NULL,
  `OBJ_DESCRIPTION` varchar(256) DEFAULT NULL,
  `OBJ_ICON` varchar(128) DEFAULT 'css/interface_imgs/blank.gif',
  `OBJ_SORT` smallint(6) DEFAULT NULL,
  `OBJ_DETAIL` int(1) DEFAULT NULL,
  PRIMARY KEY (`OBJ_ID`),
  KEY `PARENT` (`OBJ_PARENT_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='CORE_TABLE';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_dashboard_def_ADEL` AFTER DELETE ON `portal_dashboard_definition` FOR EACH ROW
BEGIN
    DELETE FROM `portal_dashboard_detail` WHERE OBJ_PARENT_ID = old.OBJ_ID;     -- Suppression des enfants de la table enfants
    DELETE FROM `portal_dashboard_auth` WHERE DASHBOARD_ID = old.OBJ_ID;        -- Suppression des autorisations
    DELETE FROM `portal_help_dashboards` WHERE ID = old.OBJ_ID;                 -- Suppression des autorisations
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_dashboard_detail`
DROP TABLE IF EXISTS `portal_dashboard_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_dashboard_detail` (
  `OBJ_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJ_PARENT_ID` bigint(20) DEFAULT NULL,
  `OBJ_TYPE` varchar(32) DEFAULT NULL,
  `OBJ_QUERY` int(11) DEFAULT NULL,
  `OBJ_TITLE` varchar(256) DEFAULT NULL,
  `OBJ_INDEX` int(11) DEFAULT NULL,
  `OBJ_DISPLAY` varchar(32) DEFAULT NULL,
  `OBJ_DIM_LOCATION` char(1) DEFAULT NULL,
  `OBJ_INIT` varchar(32) DEFAULT NULL,
  `OBJ_LEFT_POS` float DEFAULT NULL,
  `OBJ_TOP_POS` float DEFAULT NULL,
  `OBJ_WIDTH` float DEFAULT NULL,
  `OBJ_HEIGHT` float DEFAULT NULL,
  `OBJ_DIM_NBROWS` int(11) DEFAULT NULL,
  `OBJ_CSS` varchar(256) DEFAULT NULL,
  `OBJ_CSS_TITLE` varchar(256) DEFAULT NULL,
  `OBJ_MAP` varchar(32) DEFAULT NULL,
  `OBJ_TEXT` longtext,
  PRIMARY KEY (`OBJ_ID`),
  KEY `PARENT_ID` (`OBJ_PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='CORE_TABLE';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_dashboard_detail_ADEL` AFTER DELETE ON `portal_dashboard_detail` FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
DELETE FROM `portal_dashboard_query_details`
    WHERE `portal_dashboard_query_details`.FIELD_PARENT_ID = old.OBJ_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_dashboard_query_details`
DROP TABLE IF EXISTS `portal_dashboard_query_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_dashboard_query_details` (
  `FIELD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FIELD_PARENT_ID` bigint(20) DEFAULT NULL,
  `FIELD_TECHNICAL_NAME` varchar(128) DEFAULT NULL,
  `FIELD_FUNCTIONAL_NAME` longtext,
  `FIELD_TYPE` char(3) DEFAULT NULL,
  `FIELD_AGGREGATE` char(3) DEFAULT NULL,
  `FIELD_UPLEVEL` varchar(128) DEFAULT NULL,
  `FIELD_DOWNLEVEL` varchar(128) DEFAULT NULL,
  `FIELD_FORMAT` varchar(24) DEFAULT NULL,
  `FIELD_SELECTED` int(1) DEFAULT '0',
  `FIELD_SORT` char(4) DEFAULT NULL,
  `FIELD_SORT_LEVEL` char(1) DEFAULT NULL,
  `FIELD_FORMULA` longtext,
  `FIELD_MASK` varchar(32) DEFAULT NULL,
  `FIELD_ACTION` bigint(20) DEFAULT NULL,
  `FIELD_COND_RULE` int(11) DEFAULT NULL,
  `FIELD_COND_RULE_APPLY` varchar(128) DEFAULT NULL,
  `FIELD_COLOR` varchar(7) DEFAULT NULL,
  `FIELD_AXIS` smallint(6) DEFAULT '0',
  `FIELD_FID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `PARENT_ID` (`FIELD_PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_disp_rules_definition`
DROP TABLE IF EXISTS `portal_disp_rules_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_disp_rules_definition` (
  `RULE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_NAME` varchar(64) DEFAULT NULL,
  `RULE_TYPE` int(1) DEFAULT '0',
  `RULE_DESCRIPTION` longtext,
  `RULE_PARENT_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  PRIMARY KEY (`RULE_ID`),
  KEY `PARENT` (`RULE_PARENT_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_disp_rules_definition_ADEL` AFTER DELETE ON portal_disp_rules_definition FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
DELETE FROM portal_disp_rules_detail
    WHERE portal_disp_rules_detail.RULE_RULE_ID = old.RULE_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_disp_rules_detail`
DROP TABLE IF EXISTS `portal_disp_rules_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_disp_rules_detail` (
  `RULE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_RULE_ID` int(11) DEFAULT NULL,
  `RULE_NAME` varchar(64) DEFAULT NULL,
  `RULE_OPERATOR` varchar(2) DEFAULT NULL,
  `RULE_VALUE` int(11) DEFAULT NULL,
  `RULE_FORMAT` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`RULE_ID`),
  KEY `PARENT_ID` (`RULE_RULE_ID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_extract_details`
DROP TABLE IF EXISTS `portal_extract_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_extract_details` (
  `EXTRACT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXTRACT_PARENT_ID` int(11) DEFAULT NULL,
  `EXTRACT_NAME` varchar(64) DEFAULT NULL,
  `EXTRACT_SQL` longtext,
  `EXTRACT_FILENAME` varchar(64) DEFAULT NULL,
  `EXTRACT_COL_DELIM` char(1) DEFAULT NULL,
  `EXTRACT_ROW_DELIM` char(1) DEFAULT NULL,
  PRIMARY KEY (`EXTRACT_ID`),
  KEY `PARENT_ID` (`EXTRACT_PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;




-- Table structure for table `portal_extracts`
DROP TABLE IF EXISTS `portal_extracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_extracts` (
  `EXTRACT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) NOT NULL,
  `EXTRACT_NAME` varchar(64) DEFAULT NULL,
  `EXTRACT_PATH` varchar(256) DEFAULT NULL,
  `EXTRACT_DBTYPE` varchar(6) DEFAULT NULL,
  `EXTRACT_USER` varchar(64) DEFAULT NULL,
  `EXTRACT_PASSWORD` varchar(64) DEFAULT NULL,
  `EXTRACT_HOST` varchar(64) DEFAULT NULL,
  `EXTRACT_PORT` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`EXTRACT_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_extract_ADEL` AFTER DELETE ON `portal_extracts` FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
DELETE FROM portal_extract_details
    WHERE portal_extract_details.EXTRACT_PARENT_ID = old.EXTRACT_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_help_applications`
DROP TABLE IF EXISTS `portal_help_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_help_applications` (
  `ID` varchar(64) NOT NULL DEFAULT '',
  `LANG_CODE` varchar(5) NOT NULL DEFAULT '',
  `HELP_BODY` text,
  PRIMARY KEY (`ID`,`LANG_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_help_applications` WRITE;
/*!40000 ALTER TABLE `portal_help_applications` DISABLE KEYS */;
INSERT INTO `portal_help_applications` VALUES ('MMK_DISP_RULES_DEFINITION','fr-FR','<table bgcolor=\"#E6E6E6\" border=\"0\" width=\"100%\">\n  <tbody><tr>\n    <td colspan=\"3\" style=\"text-align: center; font-size: 18px;\"><strong>Affichage conditionnel</strong></td>\n  </tr>\n  <tr>\n    <td width=\"2%\"> </td>\n    <td width=\"30%\"><strong>Objectif</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p><br>\n      L\'application <strong>« Affichage conditionnel »</strong> permet de définir des règles (alertes) appliquées sur l’objet <strong>« Liste avancée »</strong> comme le cas des valeurs positives et négatives.<br>\n    </p></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Fonctionnement</strong></td>\n    <td bgcolor=\"#FFFFFF\"><br>\n      L\'interface de l\'application affiche la liste des dossiers et leurs règles définies.<br>\n      <br></td>\n  </tr>\n  <tr style=\"text-align: left\">\n    <td colspan=\"3\" bgcolor=\"#FFFFFF\"> <img src=\"css/help_imgs/MMK_DISP_RULES_DEFINITION/clip_image001.png\" width=\"100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Propriétés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Règle</strong> : nom de dossier/règle,</li>\n      <li><strong>Description</strong> : description de dossier/règle,</li>\n    </ul></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Gestion des tranches associées</strong></td>\n    <td bgcolor=\"#FFFFFF\"><br>\n      En cliquant sur une des règles définies, vous accédez aux tranches des valeurs  associées.\n      <span style=\"text-align: left\"><br>\n      </span></td>\n  </tr>\n  <tr>\n    <td colspan=\"3\" style=\"text-align: left\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_DISP_RULES_DEFINITION/clip_image004.png\" width=\"100%\"> </td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Attributs Associés</strong></td>\n    <td bgcolor=\"#FFFFFF\">\n      <ul>\n        <li> <strong>Libellé</strong> : l’intitulé à donner à la tranche</li>\n        <li> <strong>Opérateur</strong> : l’utilisateur définit ici l\'opérateur à appliquer</li>\n        <li> <strong>valeur</strong> : valeur liée à l’opérateur</li>\n        <li> <strong>Format</strong> : Style du texte (Format, couleurs et image)</li>\n      </ul>      </td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"></td>\n    <td style=\"text-align: left\"><strong>Autre Fonctionnalité</strong></td>\n    <td bgcolor=\"#FFFFFF\"><br>\n      En cliquant sur le champ « Format », vous accédez à la fenêtre de définition de format.<br>\n      <br>\n      <span style=\"text-align: left\"><img src=\"/css/help_imgs/MMK_DISP_RULES_DEFINITION/clip_image005.png\"></span></td>\n  </tr>\n  <tr>\n    <td colspan=\"3\" style=\"text-align: left\" bgcolor=\"#FFFFFF\"> </td>\n  </tr>\n  \n  \n  </tbody>\n</table>'),('MMK_APPLICATIONS','fr-FR','<table bgcolor=\"#E6E6E6\" border=\"0\" width=\"100%\">\n  <tbody><tr>\n    <td colspan=\"3\" style=\"text-align: center; font-size: 18px;\"> <strong>Applications</strong></td>\n  </tr>\n  <tr>\n    <td width=\"2%\"> </td>\n    <td width=\"15%\"><strong>Objectif</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L\'application <strong>« <span style=\"text-align: center\">Gestion des Applications</span> »</strong> permet gérer les applications de la solution. Ainsi de définir leurs accès  par les profils utilisateurs.</p></td>\n  </tr>\n <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Fonctionnement</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L’interface de l\'application affiche le paramétrage des accès aux applications selon les profils utilisateurs.</p>\n      <p>La disposition reprend le principe du menu utilisateur. Elle détaille les différents applications par thème, l’icône associée, l’ordre d’affichage du menu ainsi que les droits associés aux profils utilisateurs.</p>\n      <p>Si d’autres profils utilisateur sont créés (voir l\'application \"Groupes Utilisateurs\"), ils s’afficheront à la suite de ceux déjà existants et pourront être gérés de la même manière.</p>\n      <p>L’ordre du menu utilisateur peut également être modifié, en modifiant le champ « ORDRE ». Ainsi, une application peut être changé de thème en glissant/déplaçant .</p>\n      <p>Le nom des applications ainsi que celui du thème peut être modifié.<br>\n        <br>\n      </p></td>\n  </tr>\n  <tr style=\"text-align: left\">\n    <td colspan=\"3\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_APPLICATIONS/clip_image002.png\" width=\"100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Propriétés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Nom	Fonction: </strong>nom fonctionnel de l\'application,</li>\n      <li><strong>Javascript:</strong> fonction javascript associé,</li>\n      <li><strong> Ordre:</strong> ordre de l\'application,</li>\n      <li><strong> Table:</strong> table associé à l\'application,</li>\n      <li><strong> Core:</strong> case à coché (coché: visible dans l\'interface d’accueil de la solution),</li>\n      <li><strong> Icone:</strong> icône de l’application,</li>\n      <li><strong> Administrateurs	...	Accès externe:</strong> profils d\'utilisateurs. </li>\n    </ul>      </td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Autre Fonctionnalité</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>En cliquant sur le champ d’un profil, associé à une application, vous obtenez une liste déroulante pour définir les droits de cet utilisateur (Pas d’accès, Lecture seule, Lecture/écriture).</p>\n      <p><img src=\"/css/help_imgs/MMK_APPLICATIONS/clip_image003.png\" style=\"height:136px; width:112px\"></p>\n      <p>En cliquant sur le champ « Icone », vous accédez à la fenêtre de choix des icônes. Vous sélectionnez une icône puis vous cliquer sur le bouton <img src=\"/css/help_imgs/MMK_APPLICATIONS/clip_image005.png\" style=\"height:15px; width:21px\"></p>\n      <p><img src=\"/css/help_imgs/MMK_APPLICATIONS/clip_image007.png\" style=\"height:180px; width:218px\"></p></td>\n  </tr>\n  </tbody>\n</table>'),('MMK_CONNECTIONS','fr-FR','<table bgcolor=\"#E6E6E6\" border=\"0\" width=\"100%\">\n  <tbody><tr>\n    <td colspan=\"3\" style=\"text-align: center; font-size: 18px;\"><strong>Gestion des connexions</strong></td>\n  </tr>\n  <tr>\n    <td width=\"2%\"> </td>\n    <td width=\"30%\"><strong>Objectif</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L\'application <strong>« Gestion des connexions »</strong> permet de définir les connexions à la base de données.</p></td>\n  </tr>\n <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Fonctionnement</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L\'interface de l\'application affiche la liste des connexions définies.</p></td>\n  </tr>\n  <tr style=\"text-align: left\">\n    <td colspan=\"3\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_CONNECTIONS/clip_image002.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Propriétés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li> <strong>Type</strong> : type de la base de données,</li>\n      <li> <strong>Connexion</strong> : nom de la connexion,</li>\n      <li> <strong>Utilisateur</strong> : nom d’utilisateur,</li>\n      <li> <strong>Protocol</strong> : protocole de la connexion (facultatif),</li>\n      <li> <strong>Host</strong> : adresse IP de la base de données,</li>\n      <li> <strong>Port</strong> : port de la base de données,</li>\n      <li> <strong>Schéma</strong> : Schéma sélectionné.</li>\n      <li> <strong>Hint</strong> : facultatif,</li>\n      <li> <strong>Schéma Solution</strong> : type d’utilisation du schéma,</li>\n      <li> <strong>Statut</strong> : statut de la connexion (<img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image006.png\" style=\"height:18px; width:21px\">: valide, <img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image007.png\" style=\"height:17px; width:18px\">: non valide).</li>\n    </ul></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Autre Fonctionnalité</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>E cliquant sur le bouton<img src=\"/css/help_imgs/MMK_CONNECTIONS/clip_image004.png\" style=\"height:21px; width:55px\">, vous testez la validité de la connexion sélectionnée.</p>\n      <p>Vous obtenez les messages :<br>\n        <img src=\"/css/help_imgs/MMK_CONNECTIONS/clip_image005.png\" style=\"height:31px; width:134px\">, si la connexion est valide.<br>\n      <img src=\"/css/help_imgs/MMK_CONNECTIONS/clip_image006.png\" style=\"height:25px; width:337px\">,      si la connexion non valide, un message explique l’erreur trouvée.</p></td>\n  </tr>\n  </tbody>\n</table>'),('MMK_DASHBOARD_DEFINITION','fr-FR','En cours de développement'),('MMK_EXTRACTS','fr-FR','En cours de développement'),('MMK_SOURCE_FILES','fr-FR','<p>En cours de développement</p>\n'),('MMK_PARAMS','fr-FR','<table bgcolor=\"#E6E6E6\" border=\"0\" width=\"100%\">\n  <tbody><tr>\n    <td colspan=\"3\" style=\"text-align: center; font-size: 18px;\"><strong>Gestion des paramètres</strong></td>\n  </tr>\n  <tr>\n    <td width=\"2%\"> </td>\n    <td width=\"30%\"><strong>Objectif</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L’application <strong>« Gestion des paramètres »</strong> permet de gérer des paramètres de session et de liste.</p></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Fonctionnement</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L’interface de l’application affiche les paramètres de <strong>session</strong> et de <strong>liste</strong>.</p></td>\n  </tr>\n  <tr style=\"text-align: left\">\n    <td colspan=\"3\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_PARAMS/clip_image002.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Propriétés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Paramètre</strong> : nom du paramètre,</li>\n      <li><strong>Description</strong> : description du  paramètre,</li>\n      <li><strong>Valeur</strong> : Valeur du  paramètre (si le paramètre est défini en session),</li>\n      <li><strong>Liste</strong> : définition le paramètre en liste,</li>\n      <li><strong>Session</strong> : définition le paramètre en session.</li>\n    </ul>      </td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"></td>\n    <td style=\"text-align: left\"><strong>Gestion des paramètres de liste</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>En sélectionnant un paramètre de liste, vous accédez à la liste  associéé.</p></td>\n  </tr>\n  \n  <tr>\n    <td colspan=\"3\" style=\"text-align: left\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_PARAMS/clip_image003.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Attributs Associés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Code</strong> : code du paramètre,</li>\n      <li><strong>Libellé</strong> : libellé du paramètre,</li>\n      <li><strong>Index</strong> : Index du paramètre.</li>\n    </ul>      </td>\n  </tr>\n  \n  </tbody>\n</table>'),('MMK_USER_GROUPS','fr-FR','<table bgcolor=\"#E6E6E6\" border=\"0\" width=\"100%\">\n  <tbody><tr>\n    <td colspan=\"3\" style=\"text-align: center; font-size: 18px;\"><strong>Groupes Utilisateurs</strong></td>\n  </tr>\n  <tr>\n    <td width=\"2%\"> </td>\n    <td width=\"30%\"><strong>Objectif</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L’application <strong>« Groupes Utilisateurs »</strong> permet de gérer les groupes utilisateurs (maximum 9 groupes). Ainsi que d’appliquer la restriction de données sur les groupes définis.</p></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Fonctionnement</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L’interface de l’application affiche la liste des groupes définis.<br>\n      <br>\n      En cliquant sur un des <strong>« groupes utilisateurs »</strong> définies, vous activez le bouton<img src=\"/css/help_imgs/MMK_USER_GROUPS/clip_image002.png\" style=\"height:23px; width:136px\"> </p></td>\n  </tr>\n  <tr style=\"text-align: left\">\n    <td colspan=\"3\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_USER_GROUPS/clip_image001.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Propriétés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Groupe utilisateur</strong> : nom du groupe d’utilisateurs,</li>\n      <li><strong>Description</strong> : description du groupe,</li>\n      <li><strong>Colonne</strong> : champs technique associé au groupe (généré automatique).</li>\n    </ul>      </td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"></td>\n    <td style=\"text-align: left\"><strong>Autre Fonctionnalité</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>Pour un groupe d’utilisateur sélectionné :<br>\n      En cliquant sur le bouton<img src=\"/css/help_imgs/MMK_USER_GROUPS/clip_image002.png\" style=\"height:23px; width:136px\">, vous accédez à la liste des tables définies dans l’application<strong> « restriction de données »</strong>.</p></td>\n  </tr>\n  \n  <tr>\n    <td colspan=\"3\" style=\"text-align: left\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_USER_GROUPS/clip_image004.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Attributs Associés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Nom</strong> : nom de la restriction,</li>\n      <li><strong>Description</strong> : description de la restriction,</li>\n      <li><strong>Table</strong> : nom de la table concernée par la restriction.</li>\n    </ul></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"></td>\n    <td style=\"text-align: left\"><strong>Autre Fonctionnalité</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>Pour une table sélectionnée :<br>\n      En cliquant sur le bouton<img src=\"/css/help_imgs/MMK_USER_GROUPS/clip_image005.png\" style=\"height:21px; width:73px\">, vous accédez aux valeurs des champs définis dans l’application<strong> « restriction de données »</strong>.<br>\n      <br>\n      En cochant des valeurs, vous donnez le droit de visualisation pour le groupe d’utilisateurs sélectionné.    </p></td>\n  </tr>\n  \n  <tr>\n    <td colspan=\"3\" style=\"text-align: left\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_USER_GROUPS/clip_image007.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  \n  </tbody>\n</table>'),('MMK_QUERIES_DEFINITION','fr-FR','<table bgcolor=\"#E6E6E6\" border=\"0\" width=\"100%\">\n  <tbody><tr>\n    <td colspan=\"3\" style=\"text-align: center; font-size: 18px;\"><strong>Requêtes prédéfinis</strong></td>\n  </tr>\n  <tr>\n    <td width=\"2%\"> </td>\n    <td width=\"30%\"><strong>Objectif</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L’application <strong>« requêtes prédéfinis »</strong>, permet de créer et gérer des requêtes prédéfinis.</p></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Fonctionnement</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>L’interface de cette application affiche la liste des répertoires et leurs requêtes.<br>\n    </p></td>\n  </tr>\n  <tr style=\"text-align: left\">\n    <td colspan=\"3\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image002.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><strong>Propriétés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Nom</strong> : nom de repértoire/requête,</li>\n      <li>        <strong>Description</strong> : description de repértoire/requête,</li>\n      <li>        <strong>Dépendante de l\'utilisateur</strong> : case à cocher (coché : requête dépendante du nom d\'authentification de l\'utilisateur),</li>\n      <li><strong>Statut</strong> : Statut de la requête après un teste (signe <img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image006.png\" style=\"height:18px; width:21px\">: valide, signe<img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image007.png\" style=\"height:17px; width:18px\">: non valide)</li>\n      <li><strong>Requête SQL</strong> : code SQL de la requête (Champ visible dans la création ou la modification)</li>\n    </ul></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><p><strong>Création</strong></p>\n      <strong>Modification</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>Lors de la <strong>création</strong> ou de la <strong>modification</strong>, un formulaire s’affiche :</p>\n      <img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image012.png\"></td>\n  </tr>\n  \n  \n  <tr>\n    <td style=\"text-align: left\"> </td>\n    <td style=\"text-align: left\"><p><strong>Gestion des Attributs</strong></p></td>\n    <td bgcolor=\"#FFFFFF\"><p>En cliquant sur une des requêtes, vous accédez à listes des champs associées.</p></td>\n  </tr>\n  \n  <tr>\n    <td colspan=\"3\" style=\"text-align: left\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image014.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  <tr>\n    <td style=\"text-align: left\"></td>\n    <td style=\"text-align: left\"><strong>Attributs Associés</strong></td>\n    <td bgcolor=\"#FFFFFF\"><ul>\n      <li><strong>Nom Technique</strong> : nom technique du champ défini dans le code SQL,</li>\n      <li><strong>Nom Fonctionnel</strong> : nom fonctionnel du champ (sera utiliser dans les objets de TDB),</li>\n      <li><strong>Type</strong> : type du champ (Indicateur ou dimension),</li>\n      <li><strong>Aggrégat</strong> : agrégat à appliquer sur l’attribut (maximum, somme...),</li>\n      <li><strong>Parent</strong> : définition du champ parent,</li>\n      <li><strong>Enfant</strong> : définition du champ enfant,</li>\n      <li><strong>Format</strong> : format à appliquer sur le champ.</li>\n    </ul>        </td>\n  </tr>\n  \n  \n  \n  <tr>\n    <td style=\"text-align: left\"></td>\n    <td style=\"text-align: left\"><strong>Autre Fonctionnalité</strong></td>\n    <td bgcolor=\"#FFFFFF\"><p>En cliquant sur le bouton<img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image003.png\" style=\"height:19px; width:102px\">, vous accédez aux connexions existantes, puis vous choisissez une associée aux requêtes prêtes à tester et exécuter.</p>\n      <p><img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image004.png\" style=\"height:190px; width:135px\"><br>\n        <br>\n        Après votre choix de connexion :</p>\n      <p>En cliquant sur le bouton<img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image005.png\" style=\"height:20px; width:58px\">, vous tester la validation de la requête sélectionnéé, par l\'actualisation de son statut.<br>\n        <br>\n        En cliquant sur le bouton<img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image008.png\" style=\"height:20px; width:70px\">, vous obtenez le résultat de la requête sélectionnée dans la fenêtre en bas.</p></td>\n  </tr>\n  \n  <tr>\n    <td colspan=\"3\" style=\"text-align: left\" bgcolor=\"#FFFFFF\"><img src=\"/css/help_imgs/MMK_QUERIES_DEFINITION/clip_image009.png\" style=\"height:100%; width:100%\"></td>\n  </tr>\n  \n  </tbody>\n</table>'),('dashInterfaceMngt','fr-FR','<p>Construction en cours</p>\n'),('dashInterfaceMngt','en-US','<p>Construction pending..</p>\n');
/*!40000 ALTER TABLE `portal_help_applications` ENABLE KEYS */;
UNLOCK TABLES;



-- Table structure for table `portal_help_dashboards`
DROP TABLE IF EXISTS `portal_help_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_help_dashboards` (
  `ID` varchar(64) NOT NULL DEFAULT '',
  `LANG_CODE` varchar(5) NOT NULL DEFAULT '',
  `HELP_BODY` text,
  PRIMARY KEY (`ID`,`LANG_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_help_dashboards` WRITE;
/*!40000 ALTER TABLE `portal_help_dashboards` DISABLE KEYS */;
INSERT INTO `portal_help_dashboards` VALUES ('1422291940045','fr-FR','<p>En cours...</p>\n'),('1422291940045','en-US','<p>Pending...</p>\n');
/*!40000 ALTER TABLE `portal_help_dashboards` ENABLE KEYS */;
UNLOCK TABLES;



-- Table structure for table `portal_meta_data`
DROP TABLE IF EXISTS `portal_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_meta_data` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `FIELD_CONN` int(11) NOT NULL,
  `FIELD_TABLE` varchar(64) NOT NULL,
  `FIELD_NAME` varchar(64) NOT NULL,
  `FIELD_TYPE` int(11) DEFAULT NULL,
  `FIELD_DESCRIPTION` longtext,
  `FIELD_MASK` varchar(32) DEFAULT NULL,
  `FIELD_AGGREGATE` char(3) DEFAULT NULL,
  `FIELD_CREDENTIAL` int(1) DEFAULT NULL,
  `FIELD_PARENT` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`,`FIELD_CONN`,`FIELD_TABLE`,`FIELD_NAME`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `CONNEXION` (`FIELD_CONN`),
  KEY `TABLE` (`FIELD_TABLE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_param_details`
DROP TABLE IF EXISTS `portal_param_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_param_details` (
  `PARAM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAM_PARENT_ID` varchar(64) DEFAULT NULL,
  `PARAM_CODE` varchar(32) DEFAULT NULL,
  `PARAM_LIBELLE` varchar(64) DEFAULT NULL,
  `PARAM_INDEX` int(11) DEFAULT NULL,
  `PARAM_EXTRA1` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`PARAM_ID`),
  KEY `PARENT_ID` (`PARAM_PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_param_details` WRITE;
/*!40000 ALTER TABLE `portal_param_details` DISABLE KEYS */;
INSERT INTO `portal_param_details` VALUES (1,'DATA_TYPES','a','Alphanumérique',1,NULL),(2,'DATA_TYPES','i','Entier',2,NULL),(3,'DATA_TYPES','n','Numérique',3,NULL),(4,'DATA_TYPES','d','Date',4,NULL),(5,'DATA_TYPES','f','Flag',5,NULL),(6,'SCHEMAS_SOLUTION','SAS','Sas d\'entrée',1,NULL),(7,'SCHEMAS_SOLUTION','STG','Staging',2,NULL),(8,'SCHEMAS_SOLUTION','DMT','Datamart',3,NULL),(9,'SCHEMAS_SOLUTION','REP','Repository Portail',4,NULL),(10,'SCHEMAS_SOLUTION','MTA','Master Data',5,NULL),(12,'DELIMITERS','0','|',1,NULL),(13,'DELIMITERS','1',';',2,NULL),(14,'DELIMITERS','2','\\n',3,NULL),(15,'DELIMITERS','3','\\t',4,NULL),(19,'DBD_DIM_POS','L','Gauche',1,NULL),(20,'DBD_DIM_POS','R','Droite',2,NULL),(21,'DBD_DIM_POS','T','Haut',3,NULL),(22,'DBD_DIM_POS','B','Bas',4,NULL),(23,'DBD_AGGREGATORS','sum','Somme',1,NULL),(24,'DBD_AGGREGATORS','count','Nombre',2,NULL),(25,'DBD_AGGREGATORS','min','Minimum',3,NULL),(26,'DBD_AGGREGATORS','max','Maximum',4,NULL),(27,'LANG','fr-FR','Français',3,NULL),(28,'LANG','en-US','English (US)',1,NULL),(29,'SMTP','HOST','smtp.1and1.com',1,NULL),(30,'SMTP','PORT','465',2,NULL),(31,'SMTP','USER','bdenis@bndc.fr',3,NULL),(32,'SMTP','PWD','bndc78100',4,NULL),(33,'SMTP','FROM','MyMetriks<password@mymetriks.com>',5,NULL),(34,'SMTP','URL','192.168.0.30',6,NULL);
/*!40000 ALTER TABLE `portal_param_details` ENABLE KEYS */;
UNLOCK TABLES;



-- Table structure for table `portal_param_lang`
DROP TABLE IF EXISTS `portal_param_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_param_lang` (
  `ID` varchar(64) NOT NULL DEFAULT '',
  `LANG_CODE` varchar(5) NOT NULL DEFAULT '',
  `LABEL` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`,`LANG_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_param_lang` WRITE;
/*!40000 ALTER TABLE `portal_param_lang` DISABLE KEYS */;
INSERT INTO `portal_param_lang` VALUES ('fr-FR.js','fr-FR','Français'),('fr-FR.js','en-US','French'),('en-US.js','fr-FR','Anglais (Américain)'),('en-US.js','en-US','English(American)');
/*!40000 ALTER TABLE `portal_param_lang` ENABLE KEYS */;
UNLOCK TABLES;



-- Table structure for table `portal_param_maps`
DROP TABLE IF EXISTS `portal_param_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_param_maps` (
  `ID` varchar(64) NOT NULL DEFAULT '',
  `LANG_CODE` varchar(5) NOT NULL DEFAULT '',
  `LABEL` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`,`LANG_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_param_maps` WRITE;
/*!40000 ALTER TABLE `portal_param_maps` DISABLE KEYS */;
INSERT INTO `portal_param_maps` VALUES ('ca-CA.json','en-US','Canada'),('ca-CA.json','fr-FR','Canada'),('dz-DZ.json','en-US','Algeria'),('dz-DZ.json','fr-FR','Algérie'),('fr-FR.24.json','en-US','France Centre Region plus departments'),('fr-FR.24.json','fr-FR','France Région centre plus départements'),('fr-FR.78-AD.json','en-US','France Yvelines Adult patients (customer specifiq)'),('fr-FR.78-AD.json','fr-FR','France Yvelines patients adultes (spécifique client)'),('fr-FR.78-EN.json','en-US','France Yvelines Children patients (customer specifiq)'),('fr-FR.78-EN.json','fr-FR','France Yvelines patients aduenfantsltes (spécifique client)'),('fr-FR.78.json','en-US','France Yvelines'),('fr-FR.78.json','fr-FR','France Yvelines'),('fr-FR.CLF.json','en-US','France (customer specifiq)'),('fr-FR.CLF.json','fr-FR','France (spécifique client)'),('fr-FR.DEPT.json','en-US','France Departments'),('fr-FR.DEPT.json','fr-FR','France Départements'),('fr-FR.REG.json','en-US','France Regions  plus departments'),('fr-FR.REG.json','fr-FR','France Régions plus départements'),('jm-JM.json','en-US','Jamaïca'),('jm-JM.json','fr-FR','Jamaïque'),('us-CA.json','en-US','North America'),('us-CA.json','fr-FR','Amérique du Nord'),('us-US.json','en-US','USA'),('us-US.json','fr-FR','Etats-Unis');
/*!40000 ALTER TABLE `portal_param_maps` ENABLE KEYS */;
UNLOCK TABLES;



-- Table structure for table `portal_params`
DROP TABLE IF EXISTS `portal_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_params` (
  `PARAM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(64) DEFAULT NULL,
  `PARAM_DESCRIPTION` varchar(256) DEFAULT NULL,
  `PARAM_VALUE` varchar(256) DEFAULT NULL,
  `PARAM_LIST` int(1) DEFAULT NULL,
  `PARAM_GLOBAL` int(1) DEFAULT NULL,
  PRIMARY KEY (`PARAM_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='TABLE DES PARAMETRES';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_params` WRITE;
/*!40000 ALTER TABLE `portal_params` DISABLE KEYS */;
INSERT INTO `portal_params` VALUES (8,1,'SCHEMAS_SOLUTION','Liste des Schémas de la solution',NULL,1,1),(9,1,'DELIMITERS','Délimiteurs extractions',NULL,1,1),(13,1,'DBD_INIT_DATE','Date de dernier chargement Datamart.','2014-04-25',0,0),(2,1,'NODE_UPLOAD_SCHEMA','Schéma de stockage des tables correspondantes aux fichiers téléchargés','mmk_files',0,1),(1,1,'NODE_UPLOAD_DIR','Répertoire de stockage des fichiers téléchargés','upload',0,1),(0,1,'LANG','Langues',NULL,1,0),(16,1,'SMTP','Paramètres SMTP pour envoi d\'e-mails',NULL,1,1),(17,1,'MAPS','Gestion spécifique des cartes',NULL,1,1),(18,1,'VERSION','Application version',1.503,NULL,1);
/*!40000 ALTER TABLE `portal_params` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_params_ADEL` AFTER DELETE ON `portal_params` FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
DELETE FROM portal_param_details
    WHERE portal_param_details.PARAM_PARENT_ID = old.PARAM_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_queries_definition`
DROP TABLE IF EXISTS `portal_queries_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_queries_definition` (
  `QUERY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUERY_PARENT_ID` int(11) DEFAULT 0,
  `CUSTOMER_ID` int(11) NOT NULL,
  `QUERY_NAME` varchar(64) DEFAULT NULL,
  `QUERY_TYPE` int(1) DEFAULT '0',
  `QUERY_CONNECTION_ID` int(11) DEFAULT '0',
  `QUERY_DESCRIPTION` longtext,
  `QUERY` longtext,
  `QUERY_SPEC` int(1) DEFAULT '0',
  `QUERY_STATUS` int(1) DEFAULT '0',
  `QUERY_USER_ID` int(11) DEFAULT NULL,
  `QUERY_FILE_ID` bigint(20) DEFAULT NULL,
  `QUERY_LOG` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`QUERY_ID`),
  KEY `USER_ID` (`QUERY_USER_ID`,`QUERY_PARENT_ID`) USING BTREE,
  KEY `FILE_ID` (`QUERY_FILE_ID`) USING BTREE,
  KEY `PARENT` (`QUERY_PARENT_ID`) USING BTREE,
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='Table des Requêtes prédéfinies';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_query_definition_ADEL` AFTER DELETE ON `portal_queries_definition` FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
	DELETE FROM portal_query_details WHERE FIELD_PARENT_ID = old.QUERY_ID;
	DELETE FROM portal_query_auth WHERE QUERY_ID = old.QUERY_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_query_auth`
DROP TABLE IF EXISTS `portal_query_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_query_auth` (
  `USER_GROUP_ID` int(11) NOT NULL,
  `QUERY_ID` int(11) NOT NULL,
  `QUERY_AUTH` smallint(6) NOT NULL,
  PRIMARY KEY (`USER_GROUP_ID`,`QUERY_ID`),
  KEY `QUERY` (`QUERY_ID`),
  KEY `USER_GROUP` (`USER_GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_query_details`
DROP TABLE IF EXISTS `portal_query_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_query_details` (
  `FIELD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIELD_PARENT_ID` int(11) DEFAULT NULL,
  `FIELD_TECHNICAL_NAME` varchar(128) DEFAULT NULL,
  `FIELD_FUNCTIONAL_NAME` varchar(128) DEFAULT NULL,
  `FIELD_TYPE` char(3) DEFAULT NULL,
  `FIELD_AGGREGATE` char(3) DEFAULT NULL,
  `FIELD_UPLEVEL` varchar(128) DEFAULT NULL,
  `FIELD_DOWNLEVEL` varchar(128) DEFAULT NULL,
  `FIELD_FORMAT` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_source_file_fields`
DROP TABLE IF EXISTS `portal_source_file_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_source_file_fields` (
  `FIELD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIELD_FILE_ID` int(11) DEFAULT NULL,
  `FIELD_NAME` varchar(64) DEFAULT NULL,
  `FIELD_FUNCTIONAL_NAME` longtext,
  `FIELD_TYPE` char(1) DEFAULT NULL,
  `FIELD_INDEX` int(11) DEFAULT NULL,
  `FIELD_LENGTH` float DEFAULT NULL,
  `FIELD_INDX` int(11) DEFAULT NULL,
  `FIELD_PRIMARY` int(11) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `PARENT_ID` (`FIELD_FILE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_source_files`
DROP TABLE IF EXISTS `portal_source_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_source_files` (
  `FILE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_PARENT_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `FILE_GROUP` smallint(6) DEFAULT NULL,
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_DESCRIPTION` varchar(256) DEFAULT NULL,
  `FILE_PATH` varchar(256) DEFAULT NULL,
  `FILE_CONN` int(11) DEFAULT NULL,
  `FILE_TABLE` varchar(64) DEFAULT NULL,
  `FILE_FLG_OPTIONAL` char(1) DEFAULT NULL,
  `FILE_FLG_HEADER` char(1) DEFAULT NULL,
  `FILE_COL_DELIM` char(1) DEFAULT NULL,
  `FILE_ROW_DELIM` char(1) DEFAULT NULL,
  `FILE_EXCLUDE` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_source_files_ADEL` AFTER DELETE ON portal_source_files FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
	DELETE FROM portal_source_file_fields WHERE portal_source_file_fields.FIELD_FILE_ID = old.FILE_ID;	-- Delete File details
	DELETE FROM sas_log_process WHERE sas_log_process.FILE_ID = old.FILE_ID;							-- Delete logs
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_user_dashboard_definition`
DROP TABLE IF EXISTS `portal_user_dashboard_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_user_dashboard_definition` (
  `OBJ_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJ_PARENT_ID` bigint(20) DEFAULT NULL,
  `OBJ_NAME` varchar(64) DEFAULT NULL,
  `OBJ_DESCRIPTION` varchar(256) DEFAULT NULL,
  `OBJ_CONNECTION` int(11) DEFAULT '0',
  `OBJ_ICON` varchar(128) DEFAULT 'css/interface_imgs/blank.gif',
  `OBJ_SORT` smallint(6) DEFAULT NULL,
  `OBJ_DETAIL` int(1) DEFAULT NULL,
  `OBJ_USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJ_ID`),
  KEY `USER PARENT` (`OBJ_USER_ID`,`OBJ_PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='CORE_TABLE';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_user_dashboard_definition` WRITE;
/*!40000 ALTER TABLE `portal_user_dashboard_definition` DISABLE KEYS */;
INSERT INTO `portal_user_dashboard_definition` VALUES (1,0,'My Dashboard',NULL,0,'css/interface_imgs/blank.gif',1,0,1),(2,0,'My Dashboard','',0,'css/interface_imgs/dashboard_settings.png',1,0,2);
/*!40000 ALTER TABLE `portal_user_dashboard_definition` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_user_dashboard_def_ADEL` AFTER DELETE ON `portal_user_dashboard_definition` FOR EACH ROW
BEGIN
  DELETE FROM `portal_dashboard_detail` WHERE OBJ_PARENT_ID = old.OBJ_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_user_file_details`
DROP TABLE IF EXISTS `portal_user_file_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_user_file_details` (
  `FILE_ID` bigint(20) NOT NULL,
  `FIELD_ID` char(3) NOT NULL,
  `FIELD_TECHNICAL_NAME` varchar(512) DEFAULT NULL,
  `FIELD_FUNCTIONAL_NAME` varchar(512) DEFAULT NULL,
  `FIELD_TYPE` char(3) DEFAULT NULL,
  `FIELD_PARENT_ID` char(3) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`,`FIELD_ID`),
  KEY `FILE_ID` (`FILE_ID`),
  KEY `PARENT` (`FIELD_PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `portal_user_files`
DROP TABLE IF EXISTS `portal_user_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_user_files` (
  `FILE_ID` bigint(20) NOT NULL,
  `FILE_USER_ID` int(11) NOT NULL,
  `FILE_NAME` varchar(256) DEFAULT NULL,
  `FILE_TYPE` varchar(12) DEFAULT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `FILE_NB_ROWS` int(11) DEFAULT NULL,
  `FILE_UPLOAD_DATE` datetime DEFAULT NULL,
  `FILE_STATUS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `USER_ID` (`FILE_USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_user_files_ADEL` AFTER DELETE ON `portal_user_files` FOR EACH ROW
BEGIN
	declare fullTable varchar(256);
    DELETE FROM portal_user_file_details WHERE FILE_ID = old.FILE_ID;
    DELETE FROM portal_queries_definition WHERE QUERY_FILE_ID = old.FILE_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_user_groups`
DROP TABLE IF EXISTS `portal_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_user_groups` (
  `USER_GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) NOT NULL,
  `USER_GROUP_NAME` varchar(64) DEFAULT NULL,
  `USER_GROUP_DESCRIPTION` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`USER_GROUP_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_user_groups` WRITE;
/*!40000 ALTER TABLE `portal_user_groups` DISABLE KEYS */;
INSERT INTO `portal_user_groups` VALUES (1,1,'Administrateurs MyMetriks','Administrateurs MyMetriks'),(2,2,'Administrateurs Client',NULL);
/*!40000 ALTER TABLE `portal_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_user_groups_ADEL` AFTER DELETE ON `portal_user_groups` FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
	-- Delete les credentials data saisies pour le groupe utilisateur en question
  DELETE FROM `portal_credentials` WHERE `portal_credentials`.USER_GROUP_ID = old.USER_GROUP_ID;
  -- Delete les credentials application saisies pour le groupe utilisateur en question
  DELETE FROM `portal_application_auth` WHERE `portal_application_auth`.USER_GROUP_ID = old.USER_GROUP_ID;
  -- Delete les credentials dashboard saisies pour le groupe utilisateur en question
  DELETE FROM `portal_dashboard_auth` WHERE `portal_dashboard_auth`.USER_GROUP_ID = old.USER_GROUP_ID;
  -- Delete les credentials query saisies pour le groupe utilisateur en question
  DELETE FROM `portal_query_auth` WHERE `portal_query_auth`.USER_GROUP_ID = old.USER_GROUP_ID;
  -- Remise à null du champ user_group de la table users
  UPDATE `portal_users` SET user_group = null WHERE user_group = old.USER_GROUP_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `portal_users`
DROP TABLE IF EXISTS `portal_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int(11) NOT NULL,
  `USER_USERNAME` varchar(64) DEFAULT NULL,
  `USER_FULLNAME` varchar(64) DEFAULT NULL,
  `USER_PASSWORD` varchar(128) DEFAULT NULL,
  `USER_MAIL` varchar(256) DEFAULT NULL,
  `USER_GROUP` int(11) DEFAULT NULL,
  `USER_LANG` varchar(5) DEFAULT '',
  `USER_COLORS` varchar(200) DEFAULT NULL,
  `USER_DASHBOARDS` int(1) DEFAULT '1',
  `USER_ADMIN` INT(1) NULL DEFAULT 0,
  PRIMARY KEY (`USER_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED COMMENT='CORE_TABLE';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `portal_users` WRITE;
/*!40000 ALTER TABLE `portal_users` DISABLE KEYS */;
INSERT INTO `portal_users` VALUES (1,1,'administrator','Administrator MyMetriks','43ADD0ECCA6016AA4A103EE3DE3234C0B4BFF9E8A8C9DCD3F345F37B6E88AA33A0677F823686190CE6FA101E897CCB2346902B9555CC9FA939169BF5F2663526','admin@mymetriks.com',1,'fr-FR','#058DC7,#64E572,#ED561B,#DDDF00,#24CBE5,#50B432,#FF9655,#FFF263,#6AF9C4',1,1),(2,2,'Administrator','Administrator Client','F3877D681EF1EE7318D351B5C34BE3D7514F8320C5DF9D4EDD89EE63969A5A35075199DFD30BC6E26CBD168E4A01380CDE6ADC7E6E88EFC841F3284710342239',NULL,2,'fr-FR',NULL,1,1);
/*!40000 ALTER TABLE `portal_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_users_AINS` AFTER INSERT ON `portal_users` FOR EACH ROW
BEGIN
	-- Create User Dashboard Root
	INSERT INTO `portal_user_dashboard_definition` (`OBJ_PARENT_ID`,`OBJ_NAME`,`OBJ_DESCRIPTION`,`OBJ_CONNECTION`,`OBJ_ICON`,`OBJ_SORT`,`OBJ_DETAIL`,`OBJ_USER_ID`)
	VALUES (0,"My Dashboard","",0,'css/interface_imgs/dashboard_settings.png',1,0,new.USER_ID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `portal_users_ADEL` AFTER DELETE ON `portal_users` FOR EACH ROW
BEGIN
	-- Delete all user dashboards => par extension => supprime également toutes les entrées dans toutes les tables dashboards_details et dashboard_query_detail
	DELETE FROM `portal_user_dashboard_definition` WHERE `portal_user_dashboard_definition`.OBJ_USER_ID = old.USER_ID;
	-- Delete les credentials saisies pour l'utilisateur en question
	DELETE FROM `portal_credentials` WHERE `portal_credentials`.USER_ID = old.USER_ID;
	-- Delete les fichiers utilisateur pour l'utilisateur en question
	DELETE FROM `portal_user_files` WHERE `portal_user_files`.FILE_USER_ID = old.USER_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



-- Table structure for table `sas_log_process`
DROP TABLE IF EXISTS `sas_log_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sas_log_process` (
  `FILE_ID` int(11) NOT NULL,
  `FILE_NAME` varchar(45) DEFAULT NULL,
  `PROCESS_NAME` varchar(50) DEFAULT NULL,
  `STORED_PROCEDURE_NAME` varchar(45) DEFAULT NULL,
  `ACTION` varchar(200) DEFAULT NULL,
  `ACTION_DATE` varchar(50) DEFAULT NULL,
  `FILE_STATUT` int(11) DEFAULT NULL,
  `GLOBAL_STATUT` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Temporary table structure for view `view_queries_definition`
DROP TABLE IF EXISTS `view_queries_definition`;
/*!50001 DROP VIEW IF EXISTS `view_queries_definition`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_queries_definition` (
  `QUERY_ID` tinyint NOT NULL,
  `QUERY_PARENT_ID` tinyint NOT NULL,
  `CUSTOMER_ID` tinyint NOT NULL,
  `QUERY_NAME` tinyint NOT NULL,
  `QUERY_TYPE` tinyint NOT NULL,
  `QUERY_CONNECTION_ID` tinyint NOT NULL,
  `QUERY_DESCRIPTION` tinyint NOT NULL,
  `QUERY` tinyint NOT NULL,
  `QUERY_SPEC` tinyint NOT NULL,
  `QUERY_STATUS` tinyint NOT NULL,
  `QUERY_USER_ID` tinyint NOT NULL,
  `QUERY_FILE_ID` tinyint NOT NULL,
  `QUERY_LOG` tinyint NOT NULL,
  `USER_GROUP_ID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;



-- Temporary table structure for view `view_source_files`

DROP TABLE IF EXISTS `view_source_files`;
/*!50001 DROP VIEW IF EXISTS `view_source_files`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_source_files` (
  `FILE_ID` tinyint NOT NULL,
  `FILE_GROUP` tinyint NOT NULL,
  `FILE_NAME` tinyint NOT NULL,
  `FILE_DESCRIPTION` tinyint NOT NULL,
  `FILE_PATH` tinyint NOT NULL,
  `FILE_CONN` tinyint NOT NULL,
  `FILE_TABLE` tinyint NOT NULL,
  `FILE_FLG_OPTIONAL` tinyint NOT NULL,
  `FILE_FLG_HEADER` tinyint NOT NULL,
  `FILE_COL_DELIM` tinyint NOT NULL,
  `FILE_ROW_DELIM` tinyint NOT NULL,
  `FILE_EXCLUDE` tinyint NOT NULL,
  `FILE_PARENT_ID` tinyint NOT NULL,
  `CUSTOMER_ID` tinyint NOT NULL,
  `GLOBAL_STATUT` tinyint NOT NULL,
  `ACTION` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'repository'
--
/*!50003 DROP FUNCTION IF EXISTS `etlLoadFile_messages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `etlLoadFile_messages`(code_err int) RETURNS varchar(200) CHARSET utf8
BEGIN -- personnaliation des messages d'erreurs -> valeur de la colonne ACTION de sas_log_process 
	case code_err
		when 1  then return 'Initializing load process';
		when 2  then return 'Load process failure';
		when 3  then return 'Load process success';
		when 4  then return 'File loaded successfully';
		when 5  then return 'Unable to load file';
		when 6  then return 'Table creation failure';
		when 7  then return 'Table created successfully';
		when 8  then return 'Index or primary key creation failure';
		when 9  then return 'Index or primary key creation success';
		when 10 then return 'Load Data Infile failure';
		when 11 then return	'Load Data Infile success';
		when 12 then return 'File loaded successfully, check logs for warnings';
		when 13 then return	'File loaded in table succesfuly';
		when 14 then return 'Index suppression failure';
		when 15 then return	'Index deleted successfully';
		when 16 then return 'Table deletion failure';
		when 17 then return	'Table deleted successfully';
		when 18 then return	'Deleting all tables in schema';
        when 19 then return 'Date conversion failure';
        when 20 then return 'Date conversion succesfull';
        when 21 then return 'File not existing';
	end case;
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetFamilyTree_file_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `GetFamilyTree_file_details`(GivenID char(3), id_file bigint(20)) RETURNS varchar(1024) CHARSET utf8
BEGIN
    -- --------------------------------------------------------------------------------
    -- Création des Hiérarchies de chaque Dimension
    -- Import Fichiers Excel
    -- Appel exclusif depuis PORTAL_QUERY_MAKER
    -- --------------------------------------------------------------------------------
    DECLARE rv_functional, rv,q,queue,queue_children,front_id VARCHAR(1024);
    DECLARE queue_length,pos INT;
    
    SET rv_functional = '';
    SET rv = '';
    SET queue = GivenID;
    SET queue_length = 1;

    WHILE queue_length > 0 DO
        IF queue_length = 1 THEN
        SET front_id = queue;
            SET queue = '';
        ELSE
        SET front_id = SUBSTR(queue,1,LOCATE(',',queue)-1);
            SET pos = LOCATE(',',queue) + 1;
            SET q = SUBSTR(queue,pos);
            SET queue = q;
        END IF;
        SET queue_length = queue_length - 1;

        SELECT IFNULL(qc,'') INTO queue_children
        FROM (SELECT GROUP_CONCAT(field_id) qc
        FROM portal_user_file_details WHERE field_parent_id = front_id and file_id = id_file) A;

        IF LENGTH(queue_children) = 0 THEN
            IF LENGTH(queue) = 0 THEN
                SET queue_length = 0;
            END IF;
        ELSE
            IF LENGTH(rv) = 0 THEN
                SET rv = queue_children;
                SET rv_functional = (select FIELD_FUNCTIONAL_NAME from portal_user_file_details where field_id = queue_children and file_id = id_file);
            ELSE
                SET rv = CONCAT(rv,',',queue_children);
                SET rv_functional = concat(rv_functional, '/', (select FIELD_FUNCTIONAL_NAME from portal_user_file_details where field_id = queue_children and file_id = id_file));
            END IF;
            IF LENGTH(queue) = 0 THEN
                SET queue = queue_children;
            ELSE
                SET queue = CONCAT(queue,',',queue_children);
            END IF;
            SET queue_length = LENGTH(queue) - LENGTH(REPLACE(queue,',','')) + 1;
        END IF;
    END WHILE;
    
    RETURN concat(rv, ';', rv_functional);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `QUERIES_GetAncestry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `QUERIES_GetAncestry`(GivenID INT) RETURNS varchar(1024) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE rv VARCHAR(1024);
    DECLARE cm CHAR(1);
    DECLARE ch INT;

    SET rv = '';
    SET cm = '';
    SET ch = GivenID;
	if(GivenID is null or GivenID = '') then return("No Id specified"); END IF;

    WHILE ch > 0 DO
        SELECT IFNULL(QUERY_PARENT_ID,-1) INTO ch FROM
        (SELECT QUERY_PARENT_ID FROM portal_queries_definition WHERE QUERY_ID = ch) A;
        IF ch > 0 THEN
            SET rv = CONCAT(rv,cm,ch);
            SET cm = ',';
        END IF;
    END WHILE;
    RETURN rv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DUPLICATE_DASHBOARD_DEFINITION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `DUPLICATE_DASHBOARD_DEFINITION`(
	IN ID int
)
`DUPLICATE_DASHBOARD_DEFINITION`:BEGIN 
	declare cur_field_id 	int;
	declare newID   		int;
	declare dash_id   		int;
	declare exit_loop 		boolean;
	declare loop_cursor cursor for select OBJ_ID from portal_dashboard_detail where OBJ_PARENT_ID = ID;
	declare continue handler for not found
	set exit_loop := TRUE;
	
	set newID=(SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'portaldb' AND TABLE_NAME = 'portal_dashboard_definition');

	insert into portal_dashboard_definition
	select
		newID,																					/* NEXT SEQUENCE FOR ID */
		OBJ_PARENT_ID,
		OBJ_NAME,
		OBJ_DESCRIPTION,
		OBJ_CONNECTION,
		OBJ_ICON,
		OBJ_SORT,
		OBJ_DETAIL,
		USER_GROUP_01,
		USER_GROUP_02,
		USER_GROUP_03,
		USER_GROUP_04,
		USER_GROUP_05,
		USER_GROUP_06,
		USER_GROUP_07,
		USER_GROUP_08,
		USER_GROUP_09
		from portal_dashboard_definition
	where OBJ_ID=ID;

	open loop_cursor;
	LOOP1: loop
		fetch loop_cursor
		into  cur_field_id;
		if exit_loop then
			close loop_cursor;
			leave LOOP1;
		end if;

		set dash_id=(SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'portaldb' AND TABLE_NAME = 'portal_dashboard_detail');/* NEXT SEQUENCE FOR ID */

		insert into portal_dashboard_detail
		select
			dash_id,
			newID,
			OBJ_TYPE,
			OBJ_QUERY,
			OBJ_TITLE,
			OBJ_INDEX,
			OBJ_DISPLAY,
			OBJ_DIM_LOCATION,
			OBJ_INIT,
			OBJ_LEFT_POS,
			OBJ_TOP_POS,
			OBJ_WIDTH,
			OBJ_HEIGHT,
			OBJ_DIM_NBROWS,
            OBJ_CSS,
            OBJ_CSS_TITLE,
            OBJ_MAP,
			OBJ_TEXT
		from portal_dashboard_detail
		where OBJ_PARENT_ID = ID
		and OBJ_ID=cur_field_id;

		call DUPLICATE_DASHBOARD_DETAILS(dash_id);
		
	end loop LOOP1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DUPLICATE_DASHBOARD_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `DUPLICATE_DASHBOARD_DETAILS`(
    IN ID int
)
DUPLICATE_DASHBOARD_DETAILS:begin
	declare cur_field_id int;
	declare exit_loop boolean;
	declare dash_det_que cursor for
		select field_id from portal_dashboard_query_details where field_parent_id = ID;
	declare continue handler for not found
		set exit_loop := TRUE;
	open dash_det_que;
	LOOP1: loop
		fetch dash_det_que into cur_field_id;
		if exit_loop then
		close dash_det_que;
			leave LOOP1;
		end if;

			insert into portal_dashboard_query_details
			select
			(SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'portaldb' AND TABLE_NAME = 'portal_dashboard_query_details'), /* NEXT SEQUENCE FOR ID */
			ID,
			FIELD_TECHNICAL_NAME,
			FIELD_FUNCTIONAL_NAME,
			FIELD_TYPE,
			FIELD_AGGREGATE,
			FIELD_UPLEVEL,
			FIELD_DOWNLEVEL,
			FIELD_FORMAT,
			FIELD_SELECTED,
			FIELD_SORT,
			FIELD_SORT_LEVEL,
			FIELD_FORMULA,
			FIELD_MASK,
			FIELD_ACTION,
			FIELD_COND_RULE,
			FIELD_COND_RULE_APPLY
			from portal_dashboard_query_details
			where field_parent_id = ID
			and field_id = cur_field_id;
		
	end loop LOOP1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DUPLICATE_EXTRACTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `DUPLICATE_EXTRACTS`(
	IN ID int
)
`DUPLICATE_EXTRACTS`:BEGIN 
	declare cur_field_id 	int;
	declare newID   		int;
	declare exit_loop 		boolean;
	declare loop_cursor cursor for select extract_id from portal_extract_details where extract_parent_id = ID;
	declare continue handler for not found
	set exit_loop := TRUE;
	
	set newID=(SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'portaldb' AND TABLE_NAME = 'portal_extracts');

	insert into portal_extracts
	select
		newID,																					/* NEXT SEQUENCE FOR ID */
		EXTRACT_NAME,
		EXTRACT_PATH,
		EXTRACT_DBTYPE,
		EXTRACT_USER,
		EXTRACT_PASSWORD,
		EXTRACT_HOST,
		EXTRACT_PORT
	from portal_extracts
	where extract_id=ID;

	open loop_cursor;
	LOOP1: loop
		fetch loop_cursor
		into  cur_field_id;
		if exit_loop then
			close loop_cursor;
			leave LOOP1;
		end if;

		insert into portal_extract_details
		select
			(SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'portaldb' AND TABLE_NAME = 'portal_extract_details'),/* NEXT SEQUENCE FOR ID */
			newID,
			EXTRACT_NAME,
			EXTRACT_SQL,
			EXTRACT_FILENAME,
			EXTRACT_COL_DELIM,
			EXTRACT_ROW_DELIM
		from portal_extract_details
		where extract_parent_id = ID
		and extract_id=cur_field_id;
		
	end loop LOOP1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DUPLICATE_QUERIES_DEFINITION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `DUPLICATE_QUERIES_DEFINITION`(
	IN ID int
)
`DUPLICATE_QUERIES_DEFINITION`:BEGIN 
	declare cur_field_id 	int;
	declare newID   		int;
	declare foldertest   	varchar(32);
	declare exit_loop 		boolean;
	declare loop_cursor cursor for select field_id from portal_query_details where field_parent_id = ID;
	declare continue handler for not found
	set exit_loop := TRUE;
	set foldertest = (select query_type from portal_queries_definition where query_id=ID);
	IF foldertest = 1 then LEAVE DUPLICATE_QUERIES_DEFINITION;
	END IF;
	
	set newID=(SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'portaldb' AND TABLE_NAME = 'portal_queries_definition');

	insert into portal_queries_definition
	select
		newID,																					/* NEXT SEQUENCE FOR ID */
		QUERY_NAME,
		QUERY_TYPE,
		QUERY_DESCRIPTION,
		QUERY,
		QUERY_SPEC,
		QUERY_PARENT_ID
	from portal_queries_definition
	where query_id=ID;

	open loop_cursor;
	LOOP1: loop
		fetch loop_cursor
		into  cur_field_id;
		if exit_loop then
			close loop_cursor;
			leave LOOP1;
		end if;

		insert into portal_query_details
		select
			(SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'portaldb' AND TABLE_NAME = 'portal_query_details'),/* NEXT SEQUENCE FOR ID */
			newID,
			FIELD_TECHNICAL_NAME,
			FIELD_FUNCTIONAL_NAME,
			FIELD_TYPE,
			FIELD_AGGREGATE,
			FIELD_UPLEVEL,
			FIELD_DOWNLEVEL,
			FIELD_FORMAT
		from portal_query_details
		where field_parent_id = ID
		and field_id=cur_field_id;
		
	end loop LOOP1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DUPLICATE_SOURCE_FILES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `DUPLICATE_SOURCE_FILES`(
	IN ID int
)
`DUPLICATE_SOURCE_FILES`:BEGIN 
	declare newID   		int;
	START TRANSACTION; 
		insert into portal_source_files (CUSTOMER_ID,FILE_NAME,FILE_DESCRIPTION,FILE_PATH,FILE_CONN,FILE_TABLE,FILE_FLG_OPTIONAL,FILE_FLG_HEADER,FILE_COL_DELIM,FILE_ROW_DELIM,FILE_EXCLUDE,FILE_PARENT_ID)
		select CUSTOMER_ID,FILE_NAME,FILE_DESCRIPTION,FILE_PATH,FILE_CONN,FILE_TABLE,FILE_FLG_OPTIONAL,FILE_FLG_HEADER,FILE_COL_DELIM,FILE_ROW_DELIM,FILE_EXCLUDE,FILE_PARENT_ID
		from portal_source_files
		where FILE_ID=ID;
	
		SET newID = LAST_INSERT_ID();

		insert into `portal_source_file_fields`
		select null,newID,FIELD_NAME,FIELD_FUNCTIONAL_NAME,FIELD_TYPE,FIELD_INDEX,FIELD_LENGTH,FIELD_INDX,FIELD_PRIMARY
		from `portal_source_file_fields`
		where FIELD_FILE_ID = ID;
		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_CreateAllSas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_CreateAllSas`(IN REP_ID int(11), OUT Erreur int(1))
BEGIN
/* 
	REP_ID -> identifiant du répértoire qui contient les fichiers à charger.
	Erreur -> dans le cas d'une erreur durant cette procédure, le code de l'erreur est renvoyé.
			  Exception: Erreur = 0 i.e. qu'il y a pas d'erreur!
			  Le texte correspondant au code d'erreur est celui présent dans la fonction etlLoadFile_messages(). 
	header -> boolean, présence d'entête dans le fichier source ou pas.
	col_delim -> délimiteur de colonnes dans le fichier source.
	row_delim -> délimiteur de lignes dans le fichier source.
	path -> le chemin d'accé au fichier source sur le serveur.
	tb -> le nom de la table de destination.
	optional -> le fichier est optionnel ?
	occ -> nombre de niveau dans la hérarchie du répertoire contenent les fichiers sources. 
*/
	declare fin tinyint default 0;
	declare id, header, occ, optional int(11);
	declare name, tb, conn_user, col_delim, row_delim varchar(64);
	declare path, conn_sid, conn_password, conn_host varchar(256);
	declare cur cursor for select src_files.file_id, src_files.file_name, src_files.file_path, src_files.file_table, src_files.file_flg_header, src_files.FILE_FLG_OPTIONAL,
						   param1.param_libelle, param2.param_libelle,
						   connexion.connection_user, connexion.connection_password, connexion.connection_host, connexion.connection_sid
						   from portal_source_files src_files
						   join portal_param_details param1 on (src_files.file_col_delim = param1.param_code and param1.param_parent_id = 'DELIMITERS')
						   join portal_param_details param2 on (src_files.file_row_delim = param2.param_code and param2.param_parent_id = 'DELIMITERS')
						   join portal_connections connexion on (src_files.file_conn = connexion.connection_id)
						   where src_files.FILE_EXCLUDE = 0 and src_files.FILE_PARENT_ID = REP_id;
	declare continue handler for not found set fin = 1;	
open cur;
loop_cur: loop
	fetch cur into id, name, path, tb, header, optional, col_delim, row_delim, conn_user, conn_password, conn_host, conn_sid;
	if fin = 1 then leave loop_cur; end if;

	set occ = (SELECT FLOOR(( LENGTH(concat(path, name)) - LENGTH(REPLACE(concat(path, name), '\\', '')) ) / (LENGTH('\\'))));
	-- test de l'éxistance du fichier dans le dossier 
	do sys_exec(concat('if not exist ', concat(path, name), ' echo not existing > ', replace(SUBSTRING_INDEX(concat(path, name), '\\', occ), '\\', '/'), '/file.log'));
	set @l = bit_length(load_file(concat(replace(SUBSTRING_INDEX(concat(path, name), '\\', occ), '\\', '/'), '/file.log')));
	if @l = 0 or @l is null then 
		-- création de la table dans le sas 
		call etlLoadFile_CreateTableSas (id, concat(path, name), tb, conn_sid, Erreur);
		if (Erreur = 0) then
			-- Alimentation de la table 
			call etlLoadFile_loadTableSas (header, concat(path, name), tb, conn_sid, conn_user, conn_host, conn_password, col_delim, row_delim, id, Erreur);
			if (Erreur = 0) then
				-- création d'index 
				call etlLoadFile_CreateIndexSas (id, conn_sid, tb, Erreur);
				if (Erreur = 0) then
				-- converstion des colonnes Date de varchar à Date.
					call etlLoadFile_VarcharToDate (id, conn_sid, tb, Erreur);
					if(Erreur = 0) then 
						insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
						values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(4), current_timestamp()+0.06, 0, 0);
						set Erreur = 0;
					else
						insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
						values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
						set Erreur = 1;
						if optional = 0 then leave loop_cur; end if; 
					end if;
				else
					insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
					values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
					set Erreur = 1;
					if optional = 0 then leave loop_cur; end if;
				end if;
			else -- else il y a des warnings dans l'alimentation de la table, ce n'est pas bloquant
				if (Erreur = 12) then  
					-- création d'index 
					call etlLoadFile_CreateIndexSas (id, conn_sid, tb, Erreur);
					if (Erreur = 0) then
					-- converstion des colonnes Date de varchar à Date
						call etlLoadFile_VarcharToDate (id, conn_sid, tb, Erreur);
						if(Erreur = 0) then 
							insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
							values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(4), current_timestamp()+0.06, 0, 2);
							set Erreur = 2;
						else 
							insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
							values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
							set Erreur = 1;
							if optional = 0 then leave loop_cur; end if;
						end if;
					else
						insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
						values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
						set Erreur = 1;
						if optional = 0 then leave loop_cur; end if;
					end if;
				else
					insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
					values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
					set Erreur = 1;
					if optional = 0 then leave loop_cur; end if;
				end if;
			end if;
		else
			insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
			values(id, name, 'Load File', 'etlLoadFile_CreateAllSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
			set Erreur = 1;
			if optional = 0 then leave loop_cur; end if;
		end if;
	else -- le fichier n'est pas présent dans le répertoire déclarer
			insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
			values(id, tb, 'Load File Into Table', 'etlLoadFile_loadTableSas', etlLoadFile_messages(21), current_timestamp()+0.035, 1, 1);
			set Erreur = 1;
			if optional = 0 then leave loop_cur; end if;
	end if; 
	do sys_exec (concat('del ', replace(SUBSTRING_INDEX(concat(path, name), '\\', occ), '\\\\', '\\'), '\\file.log')); 
end loop;
close cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_CreateIndexSas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_CreateIndexSas`(id int(11), conn_name varchar(256), tb varchar(64), OUT Erreur int(1))
BEGIN
/*
	id -> identifiant du fichier source présent dans la table portal_source_file_field.
	conn_name -> le nom du schema de la base de données.
	tb -> le nom de la table physique de déstination. 
	Erreur -> dans le cas d'une erreur durant cette procédure, le code de l'erreur est renvoyé.
			  Exception: Erreur = 0 i.e. qu'il y a pas d'erreur!
			  Le texte correspondant au code d'erreur est celui présent dans la fonction etlLoadFile_messages(). 
*/
	declare k, fin tinyint default 0;
	declare f_name varchar(64);
	declare f_primary int(11);
	declare cur cursor for 
		select field_name, field_primary
		from portal_source_file_fields
		where field_file_id = id and (field_indx = 1 or field_primary = 1);
	declare continue handler for not found set fin = 1;
	declare exit handler for sqlexception, sqlwarning
	BEGIN
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(id, tb, 'Create Index', 'etlLoadFile_CreateIndexSas', etlLoadFile_messages(8), current_timestamp()+0.04, 1, 0);
		select 8 into Erreur;
		ROLLBACK;
	END;
	
	set @str_key = '';
	set @str_id = concat('ALTER TABLE ', conn_name, '.', tb);
	set @str_id_len = char_length(@str_id);
	open cur;
		loop_cur: loop
			fetch cur into f_name, f_primary;
			if fin = 1 then leave loop_cur; end if;
			if(f_primary = 1) then set @str_key = concat(@str_key, replace(f_name, ' ', '_'), ', '); set k = 1; end if;
			set @str_id = concat(@str_id, ' ADD INDEX ', replace(f_name, ' ', '_'), '_id (', replace(f_name, ' ', '_'), '), ');
		end loop;
	close cur;
	-- executé la requête de création des indexs.
	if (char_length(@str_id)>@str_id_len) then
		set @str_id = concat(substring(@str_id, 1, char_length(@str_id)-2) , ';');
		start transaction;
			prepare stmt from @str_id;
			execute stmt;
		commit;
	end if;
	if (k = 1) then 
		-- executé la requête de création de la clé primaire.
		set @str_key = concat('ALTER TABLE ', conn_name, '.', tb, ' ADD PRIMARY KEY (', substring(@str_key, 1, char_length(@str_key)-2) , ');');
		start transaction;
			prepare stmt from @str_key;
			execute stmt;
		commit;
	end if;
	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(id, tb, 'Create Index', 'etlLoadFile_CreateIndexSas', etlLoadFile_messages(9), current_timestamp()+0.04, 0, 0);
	select 0 into Erreur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_CreateTableSas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_CreateTableSas`(IN id int(1), path varchar(256), tb varchar(64), conn_name varchar(256), OUT Erreur int(1))
BEGIN
/*
	id -> identifiant du fichier source présent dans la table portal_source_file_field.
	path -> le chemin d'accé au fichier source présent sur le serveur.
	tb -> le nom de la table physique de déstination.
	conn_name -> le nom du schema de la base de données.
	Erreur -> dans le cas d'une erreur durant cette procédure, le code de l'erreur est renvoyé.
			  Exception: Erreur = 0 i.e. qu'il y a pas d'erreur!
			  Le texte correspondant au code d'erreur est celui présent dans la fonction etlLoadFile_messages().
*/
	declare fin tinyint default 0;
	declare name_field, libelle varchar(64);
    declare func_name longtext;
	declare len, field_len float;
	declare cur cursor for 
		select src_file_fields.field_name, param.param_libelle, src_file_fields.field_length, src_file_fields.field_functional_name 
		from portal_source_file_fields src_file_fields
		join portal_param_details param on( src_file_fields.field_type = param.param_code and param_parent_id = 'DATA_TYPES')
		where src_file_fields.field_file_id = id order by src_file_fields.field_index;	
	declare continue handler for not found set fin = 1;
	declare exit handler for sqlexception
	BEGIN
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(id, tb, 'Create Table', 'etlLoadFile_CreateTableSas', etlLoadFile_messages(6), current_timestamp()+0.02, 1, 0);
		select 6 into Erreur;
		ROLLBACK;
	END;
	-- supprimer la table si elle existe déja dans le sas.
    start transaction;
		set @str = concat('DROP TABLE IF EXISTS ', conn_name, '.', tb, ';');
		prepare stmt from @str;
		execute stmt;
    commit;
    -- requête de creation de la table dans la BD sas
	set @s1 = concat('CREATE TABLE ', conn_name, '.', tb, '(');
	open cur;
	loop_cur: loop
		fetch cur into name_field, libelle, len, func_name;
		if fin = 1 then leave loop_cur; end if;
        if func_name is null then set func_name = 'non défini'; end if;
        if len is null then set field_len = 128; else set field_len = len; end if;
		case -- formuler les différents types offert pour l'utilisateur par des libelle mysql 
			when libelle = 'Alphanumérique' then set @s1 = concat(@s1, upper(replace(name_field, ' ', '_')), ' ', 'VARCHAR', '(', field_len, ') DEFAULT NULL COMMENT \'',func_name ,'\', ');
			when libelle = 'Entier' then set @s1 = concat(@s1, upper(replace(name_field, ' ', '_')), ' ', 'INT', '(', field_len, ') DEFAULT NULL COMMENT \'',func_name ,'\', ');
			when libelle = 'Numérique' then set @s1 = concat(@s1, upper(replace(name_field, ' ', '_')), ' ', 'FLOAT', '(', field_len, ') DEFAULT NULL COMMENT \'',func_name ,'\', ');
			when libelle = 'Date' then set @s1 = concat(@s1, upper(replace(name_field, ' ', '_')), ' ', 'VARCHAR', '(', field_len, ') DEFAULT NULL COMMENT \'DATE ',func_name ,'\', ');
			when libelle = 'Flag' then set @s1 = concat(@s1, upper(replace(name_field, ' ', '_')), ' ', 'CHAR', '(', field_len, ') DEFAULT NULL COMMENT \'',func_name ,'\', ');
		end case;
	end loop;
	close cur;
	-- finalisé la requête de construction de la table physique 
	set @s1 := concat(SUBSTRING(@s1, 1, char_length(@s1)-2), ') ENGINE=MyISAM DEFAULT CHARSET=UTF8;');
	start transaction;
		prepare stmt1 from @s1;
		execute stmt1;
	commit;

	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(id, tb, 'Create Table', 'etlLoadFile_CreateTableSas', etlLoadFile_messages(7), current_timestamp()+0.02, 0, 0);
	select 0 into Erreur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_DropIndex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_DropIndex`(name_index varchar(70), name_table varchar(64), db_schema varchar(50), OUT Erreur int)
BEGIN
/*
	name_index -> le nom de l'index (nom de la colonne + _id).
	name_table -> le nom de la table de données.
	db_schema -> le nom du schema de la base de données. 
	Erreur -> dans le cas d'une erreur durant cette procédure, le code de l'erreur est renvoyé.
			  Exception: Erreur = 0 i.e. qu'il y a pas d'erreur!
			  Le texte correspondant au code d'erreur est celui présent dans la fonction etlLoadFile_messages().
*/
	declare exit handler for sqlexception, sqlwarning
	BEGIN
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(0, name_table, 'Drop Index', 'etlLoadFile_DropIndex', etlLoadFile_messages(14), current_timestamp()+0.011, 1, 1);
		select 14 into Erreur;
		ROLLBACK;
	END;

	set @str = concat('DROP INDEX ', name_index, ' ON ', db_schema, '.', name_table);
	start transaction;
		prepare stmt from @str;
		execute stmt;
	commit;
	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(0, name_table, 'Drop Index', 'etlLoadFile_DropIndex', etlLoadFile_messages(15), current_timestamp()+0.011, 0, 0);
	select 0 into Erreur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_DropTableSas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_DropTableSas`(db_schema varchar(50), name_table varchar(64), OUT Erreur int)
BEGIN
/*
	db_schema -> le nom du schema de la base de données.
	nome_table -> le nom de la table de données.
	Erreur -> dans le cas d'une erreur durant cette procédure, le code de l'erreur est renvoyé.
		      Exception: Erreur = 0 i.e. qu'il y a pas d'erreur!
		      Le texte correspondant au code d'erreur est celui présent dans la fonction etlLoadFile_messages().
*/
	declare exit handler for sqlexception, sqlwarning
	BEGIN
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(0, name_table, 'Drop Table', 'etlLoadFile_DropTableSas', etlLoadFile_messages(16), current_timestamp()+0.011, 1, 1);
		select 16 into Erreur;
		ROLLBACK;
	END;

	set @str = concat('DROP TABLE IF EXISTS ', db_schema, '.', name_table);
	start transaction;
		prepare stmt from @str;
		execute stmt;
	commit;
	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(0, name_table, 'Drop Table', 'etlLoadFile_DropTableSas', etlLoadFile_messages(17), current_timestamp()+0.011, 0, 0);
	select 0 into Erreur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_Global` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_Global`(IN REP_id int(11))
BEGIN
declare Erreur int(11) default 0;
-- REP_id -> identifiant du répertoire contenent l'ensemble l'ensemble des fichiers sources.
	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(REP_id, '-', 'Global', 'etlLoadFile_Global', etlLoadFile_messages(1), current_timestamp()+0.01, 0, 0);
	-- appel à la procédure d'alimentation du SAS 
	call etlLoadFile_CreateAllSas (REP_id, Erreur); 
	if(Erreur = 1) then  -- Erreur != 0 i.e. y avait pas d'erreur dans l'alimentation du sas 
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(REP_id, '-', 'Global', 'etlLoadFile_Global', etlLoadFile_messages(2), current_timestamp()+0.07, 0, 1);
	else 
		if (Erreur = 2) then -- le process c'est terminé par des warnings. 
			insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
			values(REP_id, '-', 'Global', 'etlLoadFile_Global', etlLoadFile_messages(3), current_timestamp()+0.07, 0, 2);
		else -- le process c'est terminé par des erreurs.
			insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
			values(REP_id, '-', 'Global', 'etlLoadFile_Global', etlLoadFile_messages(3), current_timestamp()+0.07, 0, 0);
			
			-- appel à la procédure d'alimentation du staging area 

			-- appel à la procédure d'alimentation du datamart 

		end if;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_loadTableSas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_loadTableSas`(IN header int(11), path varchar(256), tb varchar(64), conn_name varchar(256), conn_user varchar(64), conn_host varchar(256), conn_password varchar(256), col_delim varchar(64), row_delim varchar(64), id int, OUT Erreur int)
BEGIN
/*
	header -> égale à 1 si la ligne une du fichier source représente les entêtes des colonnes, sinon 0.
	path -> le chemin d'accé au fichier source sur le serveur.
	tb -> le nom de la table de déstination du fichier source. 
	conn_name -> le nom du schema de la base de donnée.
	conn_user, conn_host, conn_password -> les paramêtres de connection au serveur mysql.
	col_delim -> délimiteur de colonnes.
	row_delim -> délimiteur de lignes. 
	Erreur -> dans le cas d'une erreur pendant l'execution, le code d'erreur est renvoyé.
			  Erreur = 0 i.e. qu'il y a pas d'erreur!
*/
	declare occ int(11);
	declare exit handler for sqlexception, sqlwarning
	BEGIN
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(id, tb, 'Load Data Infile', 'etlLoadFile_loadTableSas', etlLoadFile_messages(10), current_timestamp()+0.03, 1, 0);
		select 10 into Erreur;
		ROLLBACK;
	END;
	-- occ -> nombre de niveau dans la hérarchie du répertoire contenent les fichiers sources. 
	set occ = (SELECT FLOOR(( LENGTH(path) - LENGTH(REPLACE(path, '\\', '')) ) / (LENGTH('\\'))));
	do sys_exec (concat('del ',replace(SUBSTRING_INDEX(path, '\\', occ), '\\\\', '\\'), '\\LOG_', tb,'.log'));

	/* construction de la requête d'alimentation de la table sas.
	   export de la requête d'alimentation dans un fichier sql sur le serveur.
	*/
	set @s1 = concat('select "', 'LOAD DATA INFILE \'', replace(path, '\\', '/'), '\' INTO TABLE ', conn_name, '.', tb, ' CHARACTER SET LATIN1 FIELDS TERMINATED BY \'', col_delim, '\' LINES TERMINATED BY \'', row_delim, '\' ignore ', header,' lines','" into outfile "', replace(SUBSTRING_INDEX(path, '\\', occ), '\\', '/'),'/LOAD_', tb,'.sql"');
	start transaction;
		prepare stmt1 from @s1;
		execute stmt1;
	commit;

	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(id, tb, 'Load Data Infile', 'etlLoadFile_loadTableSas', etlLoadFile_messages(11), current_timestamp()+0.03, 0, 0);

	-- execution de la requête d'alimentation du sas à partir du fichier sql. un fichier warning est générer afin de vérifier le bon déroulement du chargement
	do sys_exec(concat('mysql --host=',conn_host,' --user=',conn_user,' --password=',conn_password,' --show-warnings < ', SUBSTRING_INDEX(path, '\\', occ), '/LOAD_', tb,'.sql > ', replace(SUBSTRING_INDEX(path, '\\', occ), '\\', '/'), '/LOG_', tb,'.log'));
	
	-- les warnings généré par la commande LOAD FILE sont stocké dans un fichier LOG et dans le même répértoire que celui du fichier source 
	set @l = bit_length(load_file(concat(replace(SUBSTRING_INDEX(path, '\\', occ), '\\', '/'), '/LOG_', tb,'.log')));
	if @l = 0 or @l is null then
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(id, tb, 'Load File Into Table', 'etlLoadFile_loadTableSas', etlLoadFile_messages(13), current_timestamp()+0.035, 0, 0);
		select 0 into Erreur;
	else
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(id, tb, 'Load File Into Table', 'etlLoadFile_loadTableSas', etlLoadFile_messages(12), current_timestamp()+0.035, 2, 0);
		select 12 into Erreur;
	end if;
    do sys_exec (concat('del ',replace(SUBSTRING_INDEX(path, '\\', occ), '\\\\', '\\'), '\\LOAD_', tb,'.sql'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_SingleSas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_SingleSas`(IN id int(11))
BEGIN
/* id -> identifiant du fichier à charger.
	Erreur -> dans le cas d'une erreur durant cette procédure, le code de l'erreur est renvoyé.
			  Exception: Erreur = 0 i.e. qu'il y a pas d'erreur!
			  Le texte correspondant au code d'erreur est celui présent dans la fonction etlLoadFile_messages(). 
	header -> boolean, présence d'entête dans le fichier source ou pas.
	col_delim -> délimiteur de colonnes dans le fichier source.
	row_delim -> délimiteur de lignes dans le fichier source.
	path -> le chemin d'accé au fichier source sur le serveur.
	tb -> le nom de la table de destination.
	optional -> le fichier est optionnel ?
	occ -> nombre de niveau dans la hérarchie du répertoire contenent les fichiers sources. 
*/
	declare header, Erreur, occ int(11);
	declare name, tb, conn_user, col_delim, row_delim varchar(64);
	declare path, conn_sid, conn_password, conn_host varchar(256);
	select src_files.file_id, src_files.file_name, src_files.file_path, src_files.file_table, src_files.file_flg_header,
	   param1.param_libelle, param2.param_libelle,
	   connexion.connection_user, connexion.connection_password, connexion.connection_host, connexion.connection_sid
	   from portal_source_files src_files
	   join portal_param_details param1 on (src_files.file_col_delim = param1.param_code and param1.param_parent_id = 'DELIMITERS')
	   join portal_param_details param2 on (src_files.file_row_delim = param2.param_code and param2.param_parent_id = 'DELIMITERS')
	   join portal_connections connexion on (src_files.file_conn = connexion.connection_id)
	   where src_files.FILE_EXCLUDE = 0 and src_files.file_id = id
	INTO
    id, name, path, tb, header, col_delim, row_delim, conn_user, conn_password, conn_host, conn_sid;

insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
values(id, name, 'Initializing', 'etlLoadFile_SingleSas', etlLoadFile_messages(1), current_timestamp()+0.06, 0, 0);

set occ = (SELECT FLOOR(( LENGTH(concat(path, name)) - LENGTH(REPLACE(concat(path, name), '\\', '')) ) / (LENGTH('\\'))));
do sys_exec(concat('if not exist ', concat(path, name), ' echo not existing > ', replace(SUBSTRING_INDEX(concat(path, name), '\\', occ), '\\', '/'), '/file.log'));

set @l = bit_length(load_file(concat(replace(SUBSTRING_INDEX(concat(path, name), '\\', occ), '\\', '/'), '/file.log')));
if @l = 0 or @l is null then
	-- création de la table dans le sas
	call etlLoadFile_CreateTableSas (id, concat(path, name), tb, conn_sid, Erreur);
	if (Erreur = 0) then
		-- Alimentation de la table
		call etlLoadFile_loadTableSas (header, concat(path, name), tb, conn_sid, conn_user, conn_host, conn_password, col_delim, row_delim, id, Erreur);
		if (Erreur = 0) then
			-- création d'index 
			call etlLoadFile_CreateIndexSas (id, conn_sid, tb, Erreur);
			if (Erreur = 0) then
			-- converstion des colonnes Date de varchar à Date
				call etlLoadFile_VarcharToDate (id, conn_sid, tb, Erreur);
				if(Erreur = 0) then
					insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
					values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(4), current_timestamp()+0.06, 0, 0);
				else
					insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
					values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
				end if;
			else
				insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
				values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
			end if;
		else 
			if (Erreur = 12) then
				-- création d'index 
				call etlLoadFile_CreateIndexSas (id, conn_sid, tb, Erreur);
				if (Erreur = 0) then
				-- converstion des colonnes Date de varchar à Date
					call etlLoadFile_VarcharToDate (id, conn_sid, tb, Erreur);
					if(Erreur = 0) then 
						insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
						values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(4), current_timestamp()+0.06, 0, 2);
					else 
						insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
						values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
					end if;
				else
					insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
					values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
				end if;
			else
				insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
				values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
			end if;
		end if;
	else
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(5), current_timestamp()+0.06, 1, 1);
	end if;
else
	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(id, name, 'Load File', 'etlLoadFile_SingleSas', etlLoadFile_messages(21), current_timestamp()+0.06, 1, 1);
end if; 
do sys_exec (concat('del ', replace(SUBSTRING_INDEX(concat(path, name), '\\', occ), '\\\\', '\\'), '\\file.log')); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_TruncateSchemaSas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_TruncateSchemaSas`(db_schema varchar(50))
BEGIN
-- db_schema -> Le nom du schema de la base de données.
	declare fin tinyint default 0;
	declare a varchar(50);
	declare cur cursor for SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = db_schema;
	declare continue handler for not found set fin = 1;
	open cur;
	loop_cur: loop
		fetch cur into a;
		if fin = 1 then leave loop_cur; end if;
		set @str_sql:= concat('DROP TABLE ', db_schema,'.', a);
		prepare stmt from @str_sql;
		execute stmt;
		drop prepare stmt;
	end loop;
	close cur;
	insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(0, db_schema, 'Truncate Schema SAS', 'etlLoadFile_TruncateSchemaSas', etlLoadFile_messages(18), current_timestamp()+0.011, 0, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etlLoadFile_VarcharToDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `etlLoadFile_VarcharToDate`(IN id int, dbschema varchar(10), tb_name varchar(64), OUT Erreur int)
BEGIN
	declare col_name varchar(128);
    declare fin tinyint default 0;
	declare cur cursor for
		SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = dbschema and TABLE_NAME=tb_name and COLUMN_COMMENT like '%DATE%';
	declare continue handler for not found set fin = 1;
    declare exit handler for sqlexception
	BEGIN
		insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
		values(id, tb_name, 'Varchar to date', 'etlLoadFile_VarcharToDate', etlLoadFile_messages(19), current_timestamp()+0.05, 1, 0);
		select 19 into Erreur;
		set @str_query = CONCAT('ALTER TABLE ', dbschema, '.', tb_name, ' DROP COLUMN_TEMP;');
		prepare stmt from @str_query;
		execute stmt;
		ROLLBACK;
	END;
	set @str_query = CONCAT('ALTER TABLE ', dbschema, '.', tb_name, ' ADD COLUMN_TEMP VARCHAR(10);');
	prepare stmt from @str_query;
	execute stmt;
	open cur;
	loop_cur: loop
		fetch cur into col_name;
		if fin = 1 then leave loop_cur; end if;
		set @str_query := CONCAT('UPDATE ', dbschema, '.', tb_name, ' SET COLUMN_TEMP=', col_name, ';');
		prepare stmt from @str_query;
		execute stmt;
		set @str_query := CONCAT('ALTER TABLE ', dbschema, '.', tb_name, ' CHANGE ', col_name, ' ', col_name, ' DATE;');
		prepare stmt from @str_query;
		execute stmt;
		set @str_query = CONCAT('UPDATE ', dbschema, '.', tb_name, ' SET ', col_name, '= STR_TO_DATE(COLUMN_TEMP, \'%d/%m/%Y\');'); 
		prepare stmt from @str_query;
		execute stmt;
	end loop;
	close cur;
	set @str_query = CONCAT('ALTER TABLE ', dbschema, '.', tb_name, ' DROP COLUMN_TEMP;');
	prepare stmt from @str_query;
	execute stmt;
    insert into sas_log_process(FILE_ID, FILE_NAME, PROCESS_NAME, STORED_PROCEDURE_NAME, ACTION, ACTION_DATE, FILE_STATUT, GLOBAL_STATUT)
	values(id, tb_name, 'Varchar to date', 'etlLoadFile_VarcharToDate', etlLoadFile_messages(20), current_timestamp()+0.05, 0, 0);
	select 0 into Erreur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PORTAL_QUERY_MAKER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `PORTAL_QUERY_MAKER`(in id bigint(20), parentId int, user_id int, bd_schema varchar(1024), OUT retour INT)
BEGIN
/*  Procédure de création des requetes dimension et cube pour import fichiers Excel
    Variables d'entrée: parsée par retour NODEJS
        id          => id fichier importé,
        parentId    => id niveau racine du conteneur requetes
        user_id     => id user => NODEJS session,
        bd_schema   => Schéma d'alimentation pour les fichiers externes (paramètre NODE_UPLOAD_SCHEMA dans portal_params) 
*/
    declare str_split varchar(1024);
    declare query_technical_name_cur varchar(512);
    declare field_type_cur, field_aggregate_cur char(3);
    declare query_parent_id_cur, query_user_id_cur int(11);
    declare field_technical_name_cur, field_functional_name_cur, field_uplevel_cur, field_downlevel_cur, field_format_cur varchar(128);
    declare query_name_cur varchar(64);
    declare query_description_cur, query_cur longtext;
    declare query_type_cur, query_spec_cur, query_status_cur int(1);
    declare fin tinyint default 0; declare flag tinyint;
    declare cur1 cursor for  -- sélection de toute les dimensions (type = DIM) et indicateurs (type = DBD) présent dans la table portal_user_file_details
        select
        q.field_technical_name as field_technical_name,                             
        q.field_functional_name as field_functional_name,
        q.field_type as field_type,
        if(q.field_type = 'DBD', 'sum', null) as field_aggregate,
        null as field_uplevel,
        null as field_downlevel, 
        null as field_format
        from(
            select field_technical_name, field_functional_name, field_type, field_parent_id 
            from portal_user_file_details where file_id = id and field_type is not null
        ) q;
    declare cur2 cursor for  -- construction des lignes complète des dimensions simples et avec hiérarchie à inséré dans portal_queries_definition et dans portal_query_details
        select -- selectionné les dimensions simples. 
            q.field_functional_name as query_name,
            1 as query_type, -- 1 pour type Dimension 
            q.field_functional_name as query_description,
            concat('SELECT DISTINCT ', q.field_technical_name, ' FROM ', bd_schema, '._', cast(id as char(20))) as query,
            0 as query_spec,
            1 as query_status,  -- 1 pour status valide
            parentId as query_parent_id,
            user_id as query_user_id,
            q.field_technical_name as field_technical_name,
            0 as flag  --  flag = 0 pour les dimensions simple i.e. représente un seul attribut 
            from(
                select field_technical_name, field_functional_name, field_parent_id 
                from portal_user_file_details where file_id = id and field_type = 'DIM'
            ) q
        union  
        select -- selectionné les dimensions avec héararchie. 
            q.query_description,
            1 as query_type, -- 1 pour type Dimension
            q.query_description,
            concat('SELECT DISTINCT ',q.query_name, ' FROM ', bd_schema, '._', cast(id as char(20))) as query,
            0 as query_spec, 
            1 as query_statuts, -- 1 pour status valide
            parentId as query_parent_id,
            user_id as query_user_id,
            replace(q.query_name, ',', '/') as field_technical_name,
            1 as flag  -- flag = 1 pour les dimensions avec hiérarchie
            from(
                select
                a.field_id,
                concat(a.field_id, ',', substring_index(a.GetFamilyTree, ';', 1)) as query_name,
                concat(a.field_functional_name, '/', substring_index(a.GetFamilyTree, ';', -1)) as query_description
                from (
                    select
                    field_id,
                    field_functional_name,
                    GetFamilyTree_file_details (field_id, id) as GetFamilyTree
                    from portal_user_file_details
                    where file_id = id and FIELD_PARENT_ID is null
                    having GetFamilyTree != ';'
                ) a
            ) as q;
    declare cur3 cursor for select split_str from temp;
    declare continue handler for not found set fin = 1;

-- hiérarchisation des dimensions 

    open cur2;
    loop_cur2: loop
        fetch cur2 into query_name_cur, query_type_cur, query_description_cur, query_cur, query_spec_cur, query_status_cur, query_parent_id_cur, query_user_id_cur, query_technical_name_cur, flag;
        if fin = 1 then leave loop_cur2; end if;
        -- insertion des dimensions dans la table portal_queries_definition
        -- Attention: on n'insère pas les dimensions dont le champ portal_user_file_details.field_type = null
        insert into portal_queries_definition (query_name, query_type, query_description, query, query_spec, query_status, query_parent_id, query_user_id,query_file_id)
        value (
            query_name_cur,
            query_type_cur,                                                     
            query_description_cur,
            query_cur,
            query_spec_cur,
            query_status_cur,
            query_parent_id_cur,
            query_user_id_cur,
            id
        );
        select last_insert_id() into @last_insert_id;
        if (flag = 0 ) then    -- insertion des dimensions dans la table portal_query_details 
                                --  Attention: on n'insère pas les dimensions dont le champ portal_user_file_details.field_type = null
            insert into portal_query_details (field_parent_id, field_technical_name, field_functional_name, field_type, field_aggregate, field_uplevel, field_downlevel, field_format)
            values (
                @last_insert_id,
                query_technical_name_cur,
                query_name_cur,
                'DIM',
                null,
                null,
                null,
                null
            );
        else
            -- inserer dans la table portal_query_détails tous les attributs qui compose la dimension avec héararchie.
            call toArray(query_technical_name_cur, '/');
            open cur3;
            loop_cur3: loop
                fetch cur3 into str_split;
                if fin = 1 then leave loop_cur3; end if;
                insert into portal_query_details (field_parent_id, field_technical_name, field_functional_name, field_type, field_aggregate, field_uplevel, field_downlevel, field_format)
                values (
                    @last_insert_id,
                    str_split,
                    (select field_functional_name from portal_user_file_details where field_technical_name = str_split and file_id = id),
                    'DIM',
                    null,
                    null,
                    null,
                    null
                );
            end loop;
            close cur3;
            set fin = 0;
            -- dans les deux update qui suivent, on hiérarchise les dimensions en se basant sur la colonne field_parent_id de la table portal_user_file_details
            -- mettre à jour la table portal_query_details, on renseignant field_downlevel
            update portal_query_details q1, portal_user_file_details q2
            set q1.field_downlevel = q2.field_id
            where q1.field_parent_id = @last_insert_id and q1.field_technical_name = q2.field_parent_id and q2.file_id = id;

            -- mettre à jour la table portal_query_details, on renseignant field_uplevel
            update portal_query_details q1, portal_user_file_details q2
            set q1.field_uplevel = q2.field_parent_id
            where q1.field_parent_id = @last_insert_id and q2.field_parent_id is not null  and q1.field_technical_name = q2.field_technical_name and q2.file_id = id;
        end if;
    end loop;
    close cur2;
    
-- hiérarchisation des indicateurs

    set @str_query_dbd := 'SELECT ';  -- la variable qui va servir à construire les requêtes de présentation (DBD)
    set fin = 0;
    open cur1;
    loop_cur1: loop
        fetch cur1 into field_technical_name_cur, field_functional_name_cur, field_type_cur, field_aggregate_cur, field_uplevel_cur, field_downlevel_cur, field_format_cur;
        if fin = 1 then leave loop_cur1; end if;
        insert into portal_query_details (field_parent_id, field_technical_name, field_functional_name, field_type, field_aggregate, field_uplevel, field_downlevel, field_format) 
        values (
            @last_insert_id+1,
            field_technical_name_cur,
            field_functional_name_cur,
            field_type_cur,
            field_aggregate_cur,
            field_uplevel_cur,
            field_downlevel_cur,
            field_format_cur
        );
        set @str_query_dbd := concat(@str_query_dbd, field_technical_name_cur, ', ');
    end loop;
    close cur1;
    -- finaliser la création de la requête de présentation
    set @str_query_dbd := concat(SUBSTRING(@str_query_dbd, 1, length(@str_query_dbd)-2), ' FROM ', bd_schema, '._', cast(id as char(20)));
    -- insertion de l'indicateurs (DBD) dans portal_queries_definition
    -- le nom fonctionnel du fichier servira de nom pour les indicateurs
    set @var1 = replace((select file_name from portal_user_files where file_id = id), concat('.', (select file_type from portal_user_files where file_id = id)), '');
    insert into portal_queries_definition (query_name, query_type, query_description, query, query_spec, query_status, query_parent_id, query_user_id,query_file_id)
    values (
        @var1,
        2, -- 2 pour type Indicateur
        @var1,
        @str_query_dbd,
        0,
        1,  -- 1 pour status valide
        parentId,
        user_id,
        id
    );
    -- récupérer le query_id de la requête de présentation, qui vient d'être inséré dans la table portal_queries_definition
    select last_insert_id() into @query_id_rep;
    -- dans les deux update qui suivent, on hiérarchise les dimensions en se basant sur la colonne field_parent_id de la table portal_user_file_details
    -- mettre à jour la table portal_query_details, on renseignant field_downlevel
    update portal_query_details q1, portal_user_file_details q2
    set q1.field_downlevel = q2.field_id
    where q1.field_parent_id = @query_id_rep and q1.field_technical_name = q2.field_parent_id and q2.file_id = id;

    -- mettre à jour la table portal_query_details, on renseignant field_uplevel
    update portal_query_details q1, portal_user_file_details q2
    set q1.field_uplevel = q2.field_parent_id
    where q1.field_parent_id = @query_id_rep and q2.field_parent_id is not null  and q1.field_technical_name = q2.field_technical_name and q2.file_id = id;

    SET retour = @query_id_rep;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `toArray` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `toArray`(str varchar(1024), delim char)
BEGIN
    -- --------------------------------------------------------------------------------
    -- Conversion chaine de caractères en tableaux de données
    -- Note: split par paramètre delim
    -- --------------------------------------------------------------------------------
    declare occurance, i int;
    drop table if exists temp;
    create temporary table temp(
        str varchar(1024),
        split_str varchar(1024)
    ) engine = MyISAM;
    
    set occurance = (SELECT LENGTH(str) - LENGTH(REPLACE(str, delim, ''))+1);
    set i = 1;
    while i <= occurance do
         insert into temp
         select 
         str,
         (SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, i), LENGTH(SUBSTRING_INDEX(str, delim, i - 1)) + 1), delim, ''));
         set i = i + 1;
    end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_queries_definition`
--

/*!50001 DROP TABLE IF EXISTS `view_queries_definition`*/;
/*!50001 DROP VIEW IF EXISTS `view_queries_definition`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `view_queries_definition` AS select `a`.`QUERY_ID` AS `QUERY_ID`,`a`.`QUERY_PARENT_ID` AS `QUERY_PARENT_ID`,`a`.`CUSTOMER_ID` AS `CUSTOMER_ID`,`a`.`QUERY_NAME` AS `QUERY_NAME`,`a`.`QUERY_TYPE` AS `QUERY_TYPE`,`a`.`QUERY_CONNECTION_ID` AS `QUERY_CONNECTION_ID`,`a`.`QUERY_DESCRIPTION` AS `QUERY_DESCRIPTION`,`a`.`QUERY` AS `QUERY`,`a`.`QUERY_SPEC` AS `QUERY_SPEC`,`a`.`QUERY_STATUS` AS `QUERY_STATUS`,`a`.`QUERY_USER_ID` AS `QUERY_USER_ID`,`a`.`QUERY_FILE_ID` AS `QUERY_FILE_ID`,`a`.`QUERY_LOG` AS `QUERY_LOG`,`b`.`USER_GROUP_ID` AS `USER_GROUP_ID` from (`portal_queries_definition` `a` left join `portal_query_auth` `b` on((`a`.`QUERY_ID` = `b`.`QUERY_ID`))) order by `a`.`QUERY_TYPE`,`a`.`QUERY_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_source_files`
--

/*!50001 DROP TABLE IF EXISTS `view_source_files`*/;
/*!50001 DROP VIEW IF EXISTS `view_source_files`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `view_source_files` AS select `a`.`FILE_ID` AS `FILE_ID`,`a`.`FILE_GROUP` AS `FILE_GROUP`,`a`.`FILE_NAME` AS `FILE_NAME`,`a`.`FILE_DESCRIPTION` AS `FILE_DESCRIPTION`,`a`.`FILE_PATH` AS `FILE_PATH`,`a`.`FILE_CONN` AS `FILE_CONN`,`a`.`FILE_TABLE` AS `FILE_TABLE`,`a`.`FILE_FLG_OPTIONAL` AS `FILE_FLG_OPTIONAL`,`a`.`FILE_FLG_HEADER` AS `FILE_FLG_HEADER`,`a`.`FILE_COL_DELIM` AS `FILE_COL_DELIM`,`a`.`FILE_ROW_DELIM` AS `FILE_ROW_DELIM`,`a`.`FILE_EXCLUDE` AS `FILE_EXCLUDE`,`a`.`FILE_PARENT_ID` AS `FILE_PARENT_ID`,`a`.`CUSTOMER_ID` AS `CUSTOMER_ID`,`b`.`GLOBAL_STATUT` AS `GLOBAL_STATUT`,`b`.`ACTION` AS `ACTION` from (`portal_source_files` `a` left join `sas_log_process` `b` on(((`a`.`FILE_ID` = `b`.`FILE_ID`) and (`b`.`ACTION_DATE` = (select max(`sas_log_process`.`ACTION_DATE`) from `sas_log_process` where (`sas_log_process`.`FILE_ID` = `b`.`FILE_ID`) order by microsecond(`sas_log_process`.`ACTION_DATE`) desc))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-22 20:45:21
