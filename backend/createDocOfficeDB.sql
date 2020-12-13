-- MySQL Administrator dump 1.4
-- Copyright: Kanika Sood
-- Redistribution of sql dump/assignment not allowed without above author's consent
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,MYSQL323' */;
-- 

CREATE DATABASE IF NOT EXISTS DocOffice;
USE DocOffice;

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctor_id` varchar(50) NOT NULL,
  `doctor_name` varchar(50) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  `doctor_phone_number` varchar(50) NOT NULL,
  PRIMARY KEY  (`doctor_id`)
) ENGINE=InnoDB;

INSERT INTO doctor
VALUES("1234567890", "Doctor Robert Stevens", "Family Medicine", "123-345-1234"),
    ("2345678901", "Doctor Matt Pat", "Internal Medicine", "123-124-4233"),
    ("3456789012", "Doctor Tere Ma", "Emergency Medicine", "123-123-4231"),
    ("4567890123", "Doctor Me Lo", "Anethesiology", "123-455-2213"),
    ("5678901234", "Doctor John At", "Pediatrics", "123-223-0031");

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patient_id` varchar(50) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `patient_address` varchar(50) NOT NULL,
  `DOB` varchar(50) NOT NULL,
  `primary_phone_number` varchar(50) NOT NULL,
  `doctor_patient` varchar(50) NOT NULL,
  PRIMARY KEY  (`patient_id`),
  FOREIGN KEY (`doctor_patient`) REFERENCES doctor(`doctor_id`)
) ENGINE=InnoDB;

INSERT INTO patient
VALUES("23451", "Ryan A", "2345 Ae Ave", "1-23-21", "522-213-4455", "1234567890"),
		("51431", "Juan Ae", "2245 Aet Ave", "1-23-21", "522-213-4455", "2345678901"),
        ("42151", "Brian At", "2301 Aem Ave", "1-23-21", "522-213-4455", "1234567890"),
        ("02151", "Oi Ab", "2111 Aeu Ave", "1-23-21", "522-213-4455", "1234567890"),
        ("23551", "Ean Aty", "2015 Aew Ave", "1-23-21", "522-213-4455", "1234567890"),
        ("20032", "Pon Aew", "2035 Aeot Ave", "1-23-21", "522-213-4455", "2345678901"),
        ("25321", "Wyan Anb", "2415 Aep Ave", "1-23-21", "522-213-4455", "3456789012"),
        ("20023", "Ano Ayo", "2000 Aee Ave", "1-23-21", "522-213-4455", "4567890123"),
        ("23441", "Pet A", "2014 Aeo Ave", "1-23-21", "522-213-4455", "4567890123"),
        ("23449", "Mea An", "2052 Aepe Ave", "1-23-21", "522-213-4455", "5678901234");


DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `appointment_id` varchar(50) NOT NULL,
  `appointment_date` varchar(50) NOT NULL,
  `doctor_id` varchar(50) NOT NULL,
  `patient_id` varchar(50) NOT NULL,
  PRIMARY KEY  (`appointment_id`),
  FOREIGN KEY (`doctor_id`) REFERENCES doctor(`doctor_id`),
  FOREIGN KEY (`patient_id`) REFERENCES patient(`patient_id`)
) ENGINE=InnoDB;

INSERT INTO appointment
VALUES("4501", "12/3/2000", "1234567890", "23451"),
	("4001", "2/3/2000", "2345678901", "51431"),
    ("4502", "1/3/2000", "2345678901", "51431"),
    ("4503", "5/3/2000", "1234567890", "23451"),
    ("4505", "9/3/2000", "4567890123", "20023"),
    ("4506", "11/3/2000", "5678901234", "23449"),
    ("4507", "3/3/2000", "5678901234", "23449");

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
  `prescription_name` varchar(50) NOT NULL,
  `prescription_id` varchar(50) NOT NULL,
  `prescription_date` varchar(50) NOT NULL,
  `doctor_id` varchar(50) NOT NULL,
  `patient_id` varchar(50) NOT NULL,
  PRIMARY KEY  (`prescription_id`),
  FOREIGN KEY (`doctor_id`) REFERENCES doctor(`doctor_id`),
  FOREIGN KEY (`patient_id`) REFERENCES patient(`patient_id`)
) ENGINE=InnoDB;

INSERT INTO prescription
VALUES("Vicodin", "120", "12/3/2000", "2345678901", "51431"),
	("Pain killers", "1211", "2/3/2000", "2345678901", "51431"),
    ("Vicodin", "1201", "1/3/2000", "1234567890", "23451"),
    ("Levoxyl", "1202", "5/3/2000", "1234567890", "23451"),
    ("Vicodin", "1203", "9/3/2000", "4567890123", "20023"),
    ("Amoxil", "1231", "11/3/2000", "5678901234", "23449"),
    ("Delasone", "1241", "3/3/2000", "5678901234", "23449");

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test_name` varchar(50) NOT NULL,
  `test_date` varchar(50) NOT NULL,
  `test_id` varchar(50) NOT NULL,
  `doctor_id` varchar(50) NOT NULL,
  `patient_id` varchar(10) default NULL,
  PRIMARY KEY  (`test_id`),
  FOREIGN KEY (`doctor_id`) REFERENCES doctor(`doctor_id`),
  FOREIGN KEY (`patient_id`) REFERENCES patient(`patient_id`)
) ENGINE=InnoDB;

INSERT INTO test
VALUES("Blood Test", "12/2/2000", "135", "2345678901", "51431"),
	("Cholesterol Test", "2/2/2000", "214", "2345678901", "51431"),
    ("Blood Sugar Test", "1/2/2000", "123", "1234567890", "23451"),
    ("Skin Check", "5/2/2000", "311", "1234567890", "23451"),
    ("Bone Density Check", "9/2/2000", "193", "4567890123", "20023"),
    ("Mammogram", "11/2/2000", "531", "5678901234", "23449"),
    ("Cervical Cancer Screening", "3/2/2000", "611", "5678901234", "23449");



