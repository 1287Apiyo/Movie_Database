/*
SQLyog Trial v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - movies
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movies` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `movies`;

/*Table structure for table `audittrail` */

DROP TABLE IF EXISTS `audittrail`;

CREATE TABLE `audittrail` (
  `auditid` int(11) DEFAULT NULL,
  `tablename` varchar(50) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `timestamp` time DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `recordid` int(11) DEFAULT NULL,
  `olddata` varchar(50) DEFAULT NULL,
  `newdata` varchar(50) DEFAULT NULL,
  KEY `userid` (`userid`),
  CONSTRAINT `audittrail_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `audittrail` */

/*Table structure for table `directors` */

DROP TABLE IF EXISTS `directors`;

CREATE TABLE `directors` (
  `directorid` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `passportphoto` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`directorid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `directors_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `directors` */

/*Table structure for table `genres` */

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `genreid` int(11) NOT NULL,
  `genrename` varchar(50) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`genreid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `genres_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `genres_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `genres` */

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `languageid` int(11) NOT NULL AUTO_INCREMENT,
  `languagename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`languageid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `languages` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `mediaid` int(11) NOT NULL AUTO_INCREMENT,
  `medianame` varchar(50) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`mediaid`),
  KEY `userid` (`userid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `media_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `media` */

/*Table structure for table `moviecast` */

DROP TABLE IF EXISTS `moviecast`;

CREATE TABLE `moviecast` (
  `castid` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `starid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `roledescription` varchar(1000) NOT NULL,
  `castname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  PRIMARY KEY (`castid`),
  KEY `movieid` (`movieid`),
  KEY `starid` (`starid`),
  KEY `roleid` (`roleid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `moviecast_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `moviecast_ibfk_2` FOREIGN KEY (`starid`) REFERENCES `stars` (`starid`),
  CONSTRAINT `moviecast_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `roles` (`addedby`),
  CONSTRAINT `moviecast_ibfk_4` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `moviecast_ibfk_5` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviecast` */

/*Table structure for table `moviegenres` */

DROP TABLE IF EXISTS `moviegenres`;

CREATE TABLE `moviegenres` (
  `movieid` int(11) DEFAULT NULL,
  `genreid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  KEY `movieid` (`movieid`),
  KEY `genreid` (`genreid`),
  KEY `userid` (`userid`),
  CONSTRAINT `moviegenres_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `moviegenres_ibfk_2` FOREIGN KEY (`genreid`) REFERENCES `genres` (`genreid`),
  CONSTRAINT `moviegenres_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviegenres` */

/*Table structure for table `movielanguages` */

DROP TABLE IF EXISTS `movielanguages`;

CREATE TABLE `movielanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movieid` (`movieid`),
  KEY `languageid` (`languageid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movielanguages_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movielanguages_ibfk_2` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  CONSTRAINT `movielanguages_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movielanguages_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movielanguages` */

/*Table structure for table `moviemedia` */

DROP TABLE IF EXISTS `moviemedia`;

CREATE TABLE `moviemedia` (
  `movieid` int(11) DEFAULT NULL,
  `mediaid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  KEY `movieid` (`movieid`),
  KEY `mediaid` (`mediaid`),
  KEY `userid` (`userid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `moviemedia_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `moviemedia_ibfk_2` FOREIGN KEY (`mediaid`) REFERENCES `media` (`mediaid`),
  CONSTRAINT `moviemedia_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `moviemedia_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `moviemedia_ibfk_5` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviemedia` */

/*Table structure for table `movieproductioncompanies` */

DROP TABLE IF EXISTS `movieproductioncompanies`;

CREATE TABLE `movieproductioncompanies` (
  `movieid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  KEY `movieid` (`movieid`),
  KEY `companyid` (`companyid`),
  KEY `userid` (`userid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `movieproductioncompanies_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movieproductioncompanies_ibfk_2` FOREIGN KEY (`companyid`) REFERENCES `productioncompanies` (`companyid`),
  CONSTRAINT `movieproductioncompanies_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `movieproductioncompanies_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movieproductioncompanies_ibfk_5` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieproductioncompanies` */

/*Table structure for table `movieratings` */

DROP TABLE IF EXISTS `movieratings`;

CREATE TABLE `movieratings` (
  `movieid` int(11) DEFAULT NULL,
  `ratingid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  KEY `movieid` (`movieid`),
  KEY `ratingid` (`ratingid`),
  KEY `userid` (`userid`),
  CONSTRAINT `movieratings_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movieratings_ibfk_2` FOREIGN KEY (`ratingid`) REFERENCES `ratings` (`ratingid`),
  CONSTRAINT `movieratings_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieratings` */

/*Table structure for table `movieresolution` */

DROP TABLE IF EXISTS `movieresolution`;

CREATE TABLE `movieresolution` (
  `movieid` int(11) DEFAULT NULL,
  `resolutionid` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  KEY `movieid` (`movieid`),
  KEY `resolutionid` (`resolutionid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movieresolution_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movieresolution_ibfk_2` FOREIGN KEY (`resolutionid`) REFERENCES `resolution` (`resolutionid`),
  CONSTRAINT `movieresolution_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieresolution` */

/*Table structure for table `movies` */

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `releasedate` date NOT NULL,
  `runningtime` time NOT NULL,
  `synopsis` varchar(1000) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `movies_ibfk_1` (`addedby`),
  KEY `movies_ibfk_2` (`deletedby`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movies` */

/*Table structure for table `nationalities` */

DROP TABLE IF EXISTS `nationalities`;

CREATE TABLE `nationalities` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `nationalities` */

/*Table structure for table `object` */

DROP TABLE IF EXISTS `object`;

CREATE TABLE `object` (
  `objectid` int(11) NOT NULL AUTO_INCREMENT,
  `objectname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `object` */

/*Table structure for table `priviledges` */

DROP TABLE IF EXISTS `priviledges`;

CREATE TABLE `priviledges` (
  `userid` int(11) DEFAULT NULL,
  `objectid` int(11) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  KEY `userid` (`userid`),
  KEY `objectid` (`objectid`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `priviledges_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `priviledges_ibfk_2` FOREIGN KEY (`objectid`) REFERENCES `object` (`objectid`),
  CONSTRAINT `priviledges_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `priviledges` */

/*Table structure for table `productioncompanies` */

DROP TABLE IF EXISTS `productioncompanies`;

CREATE TABLE `productioncompanies` (
  `companyid` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(50) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`companyid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `productioncompanies_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productioncompanies` */

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `ratingid` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ratingid`),
  KEY `userid` (`userid`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ratings` */

/*Table structure for table `resolution` */

DROP TABLE IF EXISTS `resolution`;

CREATE TABLE `resolution` (
  `resolutionid` int(11) NOT NULL,
  `resolutionname` varchar(100) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`resolutionid`),
  KEY `userid` (`userid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `resolution_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `resolution_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resolution` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `addedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  KEY `roles_ibfk_1` (`addedby`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

/*Table structure for table `stars` */

DROP TABLE IF EXISTS `stars`;

CREATE TABLE `stars` (
  `starid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `nationalityid` int(11) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `alist` tinyint(1) NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`starid`),
  KEY `nationalityid` (`nationalityid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`nationalityid`) REFERENCES `nationalities` (`countryid`),
  CONSTRAINT `stars_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `stars_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stars` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `systemadmin` tinyint(1) NOT NULL,
  `accountactive` tinyint(1) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
