-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cofc2ajf
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `SectID` char(6) NOT NULL,
  `StudentID` char(8) NOT NULL,
  `Grade` char(2) DEFAULT NULL,
  PRIMARY KEY (`SectID`,`StudentID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`SectID`) REFERENCES `section` (`SectID`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`STID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CID` char(8) NOT NULL,
  `Title` varchar(80) DEFAULT NULL,
  `DeptOffering` char(4) NOT NULL,
  `CreditHours` int(11) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `DeptOffering` (`DeptOffering`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`DeptOffering`) REFERENCES `department` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `FID` char(4) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `FacRank` char(4) DEFAULT NULL,
  `Tenured` char(1) DEFAULT NULL,
  `DeptID` char(4) DEFAULT NULL,
  PRIMARY KEY (`FID`),
  KEY `DeptID` (`DeptID`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `SectID` char(6) NOT NULL,
  `CourseID` char(8) NOT NULL,
  `SectionNumber` char(3) NOT NULL,
  `Semester` char(4) NOT NULL,
  `Year` char(4) NOT NULL,
  `InstructorID` char(8) DEFAULT NULL,
  PRIMARY KEY (`SectID`),
  KEY `CourseID` (`CourseID`),
  KEY `InstructorID` (`InstructorID`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CID`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `faculty` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `STID` char(8) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Major` char(4) DEFAULT NULL,
  `Level` char(2) DEFAULT NULL,
  `GPA` decimal(4,3) DEFAULT NULL,
  `AdvisorID` char(8) DEFAULT NULL,
  PRIMARY KEY (`STID`),
  KEY `AdvisorID` (`AdvisorID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`AdvisorID`) REFERENCES `faculty` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-21 21:01:56
