-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: poo_proyecto1
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Asignatura',7,'add_asignatura'),(26,'Can change Asignatura',7,'change_asignatura'),(27,'Can delete Asignatura',7,'delete_asignatura'),(28,'Can view Asignatura',7,'view_asignatura'),(29,'Can add Carrera',8,'add_carrera'),(30,'Can change Carrera',8,'change_carrera'),(31,'Can delete Carrera',8,'delete_carrera'),(32,'Can view Carrera',8,'view_carrera'),(33,'Can add Facultad',9,'add_facultad'),(34,'Can change Facultad',9,'change_facultad'),(35,'Can delete Facultad',9,'delete_facultad'),(36,'Can view Facultad',9,'view_facultad'),(37,'Can add Profesor',10,'add_profesor'),(38,'Can change Profesor',10,'change_profesor'),(39,'Can delete Profesor',10,'delete_profesor'),(40,'Can view Profesor',10,'view_profesor'),(41,'Can add Semestre',11,'add_semestre'),(42,'Can change Semestre',11,'change_semestre'),(43,'Can delete Semestre',11,'delete_semestre'),(44,'Can view Semestre',11,'view_semestre'),(45,'Can add Estudiante',12,'add_student'),(46,'Can change Estudiante',12,'change_student'),(47,'Can delete Estudiante',12,'delete_student'),(48,'Can view Estudiante',12,'view_student'),(49,'Can add Nota',13,'add_nota'),(50,'Can change Nota',13,'change_nota'),(51,'Can delete Nota',13,'delete_nota'),(52,'Can view Nota',13,'view_nota');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$mFZxvWbzJMcBFOxv4Na91h$9Mcy8yRSqHEnp1WFW4HbXdwVn3hmVTmyZzYnm2lfioA=','2023-11-11 01:17:30.203522',1,'kadir','','','barquetbravokadir@gmail.com',1,1,'2023-11-11 01:07:38.446602');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-11-11 01:08:27.107988','1','Facultad de Ciencias e Ingeniería',1,'[{\"added\": {}}]',9,1),(2,'2023-11-11 01:08:32.510208','2','Facultad de Educación',1,'[{\"added\": {}}]',9,1),(3,'2023-11-11 01:08:57.040521','1','Ing. en Software',1,'[{\"added\": {}}]',8,1),(4,'2023-11-11 01:09:01.594557','2','Ing. Ambiental',1,'[{\"added\": {}}]',8,1),(5,'2023-11-11 01:09:06.059971','3','Ing. Industrial',1,'[{\"added\": {}}]',8,1),(6,'2023-11-11 01:09:17.165875','4','Licenciatura en Lenguaje',1,'[{\"added\": {}}]',8,1),(7,'2023-11-11 01:09:28.635414','5','Educación Inicial',1,'[{\"added\": {}}]',8,1),(8,'2023-11-11 01:09:45.225723','1','Duarte Freddy',1,'[{\"added\": {}}]',10,1),(9,'2023-11-11 01:09:52.059457','2','Rodas Jorge',1,'[{\"added\": {}}]',10,1),(10,'2023-11-11 01:09:57.026203','3','Vera Daniel',1,'[{\"added\": {}}]',10,1),(11,'2023-11-11 01:10:21.591555','4','Ortiz Jhonny',1,'[{\"added\": {}}]',10,1),(12,'2023-11-11 01:10:36.215880','1','4 Semestre',1,'[{\"added\": {}}]',11,1),(13,'2023-11-11 01:10:44.917074','2','5 Semestre',1,'[{\"added\": {}}]',11,1),(14,'2023-11-11 01:10:58.594206','1','Base de Datos',1,'[{\"added\": {}}]',7,1),(15,'2023-11-11 01:11:01.377905','2','Programación Orientada a Objetos',1,'[{\"added\": {}}]',7,1),(16,'2023-11-11 01:11:04.087687','3','Ecuaciones Diferenciales',1,'[{\"added\": {}}]',7,1),(17,'2023-11-11 01:11:06.676067','4','Cálculo',1,'[{\"added\": {}}]',7,1),(18,'2023-11-11 01:11:09.115258','5','Estructura de Datos',1,'[{\"added\": {}}]',7,1),(19,'2023-11-11 01:11:11.455147','6','Redes de Datos',1,'[{\"added\": {}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'notas','asignatura'),(8,'notas','carrera'),(9,'notas','facultad'),(13,'notas','nota'),(10,'notas','profesor'),(11,'notas','semestre'),(12,'notas','student'),(6,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-11-11 01:00:28.199077'),(2,'auth','0001_initial','2023-11-11 01:00:59.540769'),(3,'admin','0001_initial','2023-11-11 01:01:06.820525'),(4,'admin','0002_logentry_remove_auto_add','2023-11-11 01:01:06.961578'),(5,'admin','0003_logentry_add_action_flag_choices','2023-11-11 01:01:07.039674'),(6,'contenttypes','0002_remove_content_type_name','2023-11-11 01:01:10.492381'),(7,'auth','0002_alter_permission_name_max_length','2023-11-11 01:01:12.929060'),(8,'auth','0003_alter_user_email_max_length','2023-11-11 01:01:13.319569'),(9,'auth','0004_alter_user_username_opts','2023-11-11 01:01:13.444528'),(10,'auth','0005_alter_user_last_login_null','2023-11-11 01:01:14.975502'),(11,'auth','0006_require_contenttypes_0002','2023-11-11 01:01:15.053601'),(12,'auth','0007_alter_validators_add_error_messages','2023-11-11 01:01:15.287687'),(13,'auth','0008_alter_user_username_max_length','2023-11-11 01:01:16.740374'),(14,'auth','0009_alter_user_last_name_max_length','2023-11-11 01:01:17.318279'),(15,'auth','0010_alter_group_name_max_length','2023-11-11 01:01:18.240349'),(16,'auth','0011_update_proxy_permissions','2023-11-11 01:01:18.318446'),(17,'auth','0012_alter_user_first_name_max_length','2023-11-11 01:01:18.818289'),(18,'notas','0001_initial','2023-11-11 01:02:08.844699'),(19,'sessions','0001_initial','2023-11-11 01:02:10.501138');
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
INSERT INTO `django_session` VALUES ('yl4rhex53zq4neks4cpemrw7q09ff56i','.eJxVzL0OAiEQBOB3oTaEH2HF0t5nILC7yqmB5LirjO_ukVyh7cw38xYxrUuJa-c5TiTOQovDb5YTPrmOgh6p3pvEVpd5ynIQubddXhvx67Lbv4OSehlr9ho8BXTMRqPTBrJFD0e-kXZkEdTJJQZvvAUIShlF3oTEbuObFZ8v3Sc3RA:1r1ccs:CjtUmsef0gdqI_tyPTdWi_1TWGn9m0IFoJB_eBobrTM','2023-11-25 01:17:30.718841');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_asignatura`
--

DROP TABLE IF EXISTS `notas_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_asignatura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_asignatura`
--

LOCK TABLES `notas_asignatura` WRITE;
/*!40000 ALTER TABLE `notas_asignatura` DISABLE KEYS */;
INSERT INTO `notas_asignatura` VALUES (1,'Base de Datos',1),(2,'Programación Orientada a Objetos',1),(3,'Ecuaciones Diferenciales',1),(4,'Cálculo',1),(5,'Estructura de Datos',1),(6,'Redes de Datos',1);
/*!40000 ALTER TABLE `notas_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_carrera`
--

DROP TABLE IF EXISTS `notas_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_carrera` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `facultad_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_carrera_facultad_id_9b3b8d6e_fk_notas_facultad_id` (`facultad_id`),
  CONSTRAINT `notas_carrera_facultad_id_9b3b8d6e_fk_notas_facultad_id` FOREIGN KEY (`facultad_id`) REFERENCES `notas_facultad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_carrera`
--

LOCK TABLES `notas_carrera` WRITE;
/*!40000 ALTER TABLE `notas_carrera` DISABLE KEYS */;
INSERT INTO `notas_carrera` VALUES (1,'Ing. en Software',1,1),(2,'Ing. Ambiental',1,1),(3,'Ing. Industrial',1,1),(4,'Licenciatura en Lenguaje',1,2),(5,'Educación Inicial',1,2);
/*!40000 ALTER TABLE `notas_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_facultad`
--

DROP TABLE IF EXISTS `notas_facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_facultad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_facultad`
--

LOCK TABLES `notas_facultad` WRITE;
/*!40000 ALTER TABLE `notas_facultad` DISABLE KEYS */;
INSERT INTO `notas_facultad` VALUES (1,'Facultad de Ciencias e Ingeniería',1),(2,'Facultad de Educación',1);
/*!40000 ALTER TABLE `notas_facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_nota`
--

DROP TABLE IF EXISTS `notas_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_nota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nota1` decimal(5,2) NOT NULL,
  `nota2` decimal(5,2) NOT NULL,
  `notarecuperacion` decimal(5,2) NOT NULL,
  `promedio` decimal(5,2) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `asignatura_id` bigint(20) NOT NULL,
  `carrera_id` bigint(20) NOT NULL,
  `facultad_id` bigint(20) NOT NULL,
  `profesor_id` bigint(20) NOT NULL,
  `semestre_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_nota_asignatura_id_490e1004_fk_notas_asignatura_id` (`asignatura_id`),
  KEY `notas_nota_carrera_id_6526c358_fk_notas_carrera_id` (`carrera_id`),
  KEY `notas_nota_facultad_id_4dbeb5c6_fk_notas_facultad_id` (`facultad_id`),
  KEY `notas_nota_profesor_id_1455e8bd_fk_notas_profesor_id` (`profesor_id`),
  KEY `notas_nota_semestre_id_9924f855_fk_notas_semestre_id` (`semestre_id`),
  KEY `notas_nota_student_id_5fe17d8b_fk_notas_student_id` (`student_id`),
  KEY `notas_nota_user_id_97f34858_fk_auth_user_id` (`user_id`),
  CONSTRAINT `notas_nota_asignatura_id_490e1004_fk_notas_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `notas_asignatura` (`id`),
  CONSTRAINT `notas_nota_carrera_id_6526c358_fk_notas_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `notas_carrera` (`id`),
  CONSTRAINT `notas_nota_facultad_id_4dbeb5c6_fk_notas_facultad_id` FOREIGN KEY (`facultad_id`) REFERENCES `notas_facultad` (`id`),
  CONSTRAINT `notas_nota_profesor_id_1455e8bd_fk_notas_profesor_id` FOREIGN KEY (`profesor_id`) REFERENCES `notas_profesor` (`id`),
  CONSTRAINT `notas_nota_semestre_id_9924f855_fk_notas_semestre_id` FOREIGN KEY (`semestre_id`) REFERENCES `notas_semestre` (`id`),
  CONSTRAINT `notas_nota_student_id_5fe17d8b_fk_notas_student_id` FOREIGN KEY (`student_id`) REFERENCES `notas_student` (`id`),
  CONSTRAINT `notas_nota_user_id_97f34858_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_nota`
--

LOCK TABLES `notas_nota` WRITE;
/*!40000 ALTER TABLE `notas_nota` DISABLE KEYS */;
INSERT INTO `notas_nota` VALUES (1,15.00,15.00,60.00,90.00,1,1,1,1,2,1,1,1),(2,15.00,15.00,70.00,100.00,1,6,1,1,1,2,2,1);
/*!40000 ALTER TABLE `notas_nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_profesor`
--

DROP TABLE IF EXISTS `notas_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_profesor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_profesor`
--

LOCK TABLES `notas_profesor` WRITE;
/*!40000 ALTER TABLE `notas_profesor` DISABLE KEYS */;
INSERT INTO `notas_profesor` VALUES (1,'Freddy','Duarte',1),(2,'Jorge','Rodas',1),(3,'Daniel','Vera',1),(4,'Jhonny','Ortiz',1);
/*!40000 ALTER TABLE `notas_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_semestre`
--

DROP TABLE IF EXISTS `notas_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_semestre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `dateBegin` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_semestre`
--

LOCK TABLES `notas_semestre` WRITE;
/*!40000 ALTER TABLE `notas_semestre` DISABLE KEYS */;
INSERT INTO `notas_semestre` VALUES (1,'4 Semestre','2023-09-11','2024-01-11',1),(2,'5 Semestre','2023-09-11','2024-01-11',1);
/*!40000 ALTER TABLE `notas_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_student`
--

DROP TABLE IF EXISTS `notas_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `dategraduate` datetime(6) DEFAULT NULL,
  `graduate` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_student_user_id_0bbbd307_fk_auth_user_id` (`user_id`),
  CONSTRAINT `notas_student_user_id_0bbbd307_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_student`
--

LOCK TABLES `notas_student` WRITE;
/*!40000 ALTER TABLE `notas_student` DISABLE KEYS */;
INSERT INTO `notas_student` VALUES (1,'Kadir','Barquet','2023-11-11 01:11:26.491847',NULL,0,1),(2,'Melanie','García','2023-11-11 01:11:33.022195',NULL,0,1),(3,'Ruben','Andrade','2023-11-11 01:11:44.165754',NULL,0,1),(4,'Lissette','Catuto','2023-11-11 01:11:53.362094',NULL,0,1);
/*!40000 ALTER TABLE `notas_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-10 20:25:26
