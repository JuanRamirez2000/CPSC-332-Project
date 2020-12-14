/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

CREATE DATABASE IF NOT EXISTS DocOffice;
USE DocOffice;

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctor_id` varchar(50) NOT NULL,
  `doctor_first_name` varchar(50) NOT NULL,
  `doctor_last_name` varchar(50) NOT NULL,
  `doctor_phone_number` varchar(50) NOT NULL,
  PRIMARY KEY  (`doctor_id`)
) ENGINE=InnoDB;

INSERT INTO doctor
VALUES("1234567890", "Robert", "Stevens", "123-345-1234"),
    ("2345678901", "Matt", "Pat", "123-124-4233"),
    ("3456789012", "Tere", "Ma", "123-123-4231"),
    ("4567890123", "Me", "Lo", "123-455-2213"),
    ("5678901234", "John", "At", "123-223-0031");
    
DROP TABLE IF EXISTS `doctor_specialty`;
CREATE TABLE `doctor_specialty` (
	`doctor_first_name` varchar(50) NOT NULL,
    `doctor_last_name` varchar(50) NOT NULL,
    `specialty` varchar(50) NOT NULL
    ) ENGINE = InnoDB;
    
DROP TABLE IF EXISTS `doctor_specialty_audit_table`;
CREATE TABLE `doctor_specialty_audit_table` (
	`doctor_first_name` varchar(50) NOT NULL,
	`action` varchar(50) NOT NULL,
    `specialty` varchar(50) NOT NULL,
    `date_of_modification` varchar(50) NOT NULL
    ) ENGINE = InnoDB;
    
CREATE TRIGGER Doctor_Specialty_Added
BEFORE INSERT
ON doctor_specialty
FOR EACH ROW
INSERT INTO doctor_specialty_audit_table VALUES (NEW.doctor_first_name, "added", NEW.specialty, CURRENT_DATE);

CREATE TRIGGER Doctor_Specialty_Updated
BEFORE UPDATE
ON doctor_specialty
FOR EACH ROW
INSERT INTO doctor_specialty_audit_table VALUES (NEW.doctor_first_name, "updated", NEW.specialty, CURRENT_DATE);

INSERT INTO doctor_specialty
VALUES("Robert", "Stevens", "Family Medicine"),
	("Matt", "Pat", "Urology"),
    ("Tere", "Ma", "Emergency Medicine"),
    ("Me", "Lo", "Internal Medicine"),
    ("John", "At", "Pediatrics");

UPDATE doctor_specialty SET specialty = "Family Medicine" WHERE doctor_first_name = "Matt";
UPDATE doctor_specialty SET specialty = "Urology" WHERE doctor_first_name = "Robert";
UPDATE doctor_specialty SET specialty = "Internal Medicine" WHERE doctor_first_name = "John";



DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patient_id` varchar(50) NOT NULL,
  `patient_first_name` varchar(50) NOT NULL,
  `patient_last_name` varchar(50) NOT NULL,
  `patient_address` varchar(50) NOT NULL,
  `DOB` varchar(50) NOT NULL,
  `primary_phone_number` varchar(50) NOT NULL,
  `doctor_patient` varchar(50) NOT NULL,
  PRIMARY KEY  (`patient_id`),
  FOREIGN KEY (`doctor_patient`) REFERENCES doctor(`doctor_id`)
) ENGINE=InnoDB;

INSERT INTO patient
VALUES("23451", "Ryan", "A", "2345 Ae Ave", "1-23-21", "522-213-4455", "1234567890"),
		("51431", "Juan", "Ae", "2245 Aet Ave", "1-23-21", "512-203-5555", "2345678901"),
        ("42151", "Brian", "At", "2301 Aem Ave", "1-23-21", "502-213-4255", "1234567890"),
        ("02151", "Oi", "Ab","2111 Aeu Ave", "1-23-21", "522-013-0555", "1234567890"),
        ("23551", "Ean", "Aty", "2015 Aew Ave", "1-23-21", "002-203-0955", "1234567890"),
        ("20032", "Pon", "Aew", "2035 Aeot Ave", "1-23-21", "520-213-9555", "2345678901"),
        ("25321", "Wyan", "Anb", "2415 Aep Ave", "1-23-21", "512-213-3455", "3456789012"),
        ("20023", "Ano", "Ayo", "2000 Aee Ave", "1-23-21", "322-213-3455", "4567890123"),
        ("23441", "Pet", "Apm", "2014 Aeo Ave", "1-23-21", "512-213-0051", "4567890123"),
        ("23449", "Mea", "An", "2052 Aepe Ave", "1-23-21", "112-213-1155", "5678901234");


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

DROP TABLE IF EXISTS `doctor_backup`;
DROP TABLE IF EXISTS `doctor_specialty_backup`;
DROP TABLE IF EXISTS `doctor_specialty_audit_table_backup`;
DROP TABLE IF EXISTS `patient_backup`;
DROP TABLE IF EXISTS `appointment_backup`;
DROP TABLE IF EXISTS `prescription_backup`;
DROP TABLE IF EXISTS `test_backup`;

CREATE TABLE `doctor_backup`(
  `doctor_id` varchar(50) NOT NULL,
  `doctor_first_name` varchar(50) NOT NULL,
  `doctor_last_name` varchar(50) NOT NULL,
  `doctor_phone_number` varchar(50) NOT NULL,
  PRIMARY KEY  (`doctor_id`)
) ENGINE=InnoDB;
CREATE TABLE `doctor_specialty_backup` (
	`doctor_first_name` varchar(50) NOT NULL,
    `doctor_last_name` varchar(50) NOT NULL,
    `specialty` varchar(50) NOT NULL
    ) ENGINE = InnoDB;
CREATE TABLE `doctor_specialty_audit_table_backup` (
	`doctor_first_name` varchar(50) NOT NULL,
	`action` varchar(50) NOT NULL,
    `specialty` varchar(50) NOT NULL,
    `date_of_modification` varchar(50) NOT NULL
    ) ENGINE = InnoDB;
CREATE TABLE `patient_backup` (
  `patient_id` varchar(50) NOT NULL,
  `patient_first_name` varchar(50) NOT NULL,
  `patient_last_name` varchar(50) NOT NULL,
  `patient_address` varchar(50) NOT NULL,
  `DOB` varchar(50) NOT NULL,
  `primary_phone_number` varchar(50) NOT NULL,
  `doctor_patient` varchar(50) NOT NULL,
  PRIMARY KEY  (`patient_id`),
  FOREIGN KEY (`doctor_patient`) REFERENCES doctor(`doctor_id`)
) ENGINE=InnoDB;
CREATE TABLE `appointment_backup` (
  `appointment_id` varchar(50) NOT NULL,
  `appointment_date` varchar(50) NOT NULL,
  `doctor_id` varchar(50) NOT NULL,
  `patient_id` varchar(50) NOT NULL,
  PRIMARY KEY  (`appointment_id`),
  FOREIGN KEY (`doctor_id`) REFERENCES doctor(`doctor_id`),
  FOREIGN KEY (`patient_id`) REFERENCES patient(`patient_id`)
) ENGINE=InnoDB;
CREATE TABLE `prescription_backup` (
  `prescription_name` varchar(50) NOT NULL,
  `prescription_id` varchar(50) NOT NULL,
  `prescription_date` varchar(50) NOT NULL,
  `doctor_id` varchar(50) NOT NULL,
  `patient_id` varchar(50) NOT NULL,
  PRIMARY KEY  (`prescription_id`),
  FOREIGN KEY (`doctor_id`) REFERENCES doctor(`doctor_id`),
  FOREIGN KEY (`patient_id`) REFERENCES patient(`patient_id`)
) ENGINE=InnoDB;
CREATE TABLE `test_backup` (
  `test_name` varchar(50) NOT NULL,
  `test_date` varchar(50) NOT NULL,
  `test_id` varchar(50) NOT NULL,
  `doctor_id` varchar(50) NOT NULL,
  `patient_id` varchar(10) default NULL,
  PRIMARY KEY  (`test_id`),
  FOREIGN KEY (`doctor_id`) REFERENCES doctor(`doctor_id`),
  FOREIGN KEY (`patient_id`) REFERENCES patient(`patient_id`)
) ENGINE=InnoDB;


INSERT INTO doctor_backup SELECT * FROM doctor;
INSERT INTO doctor_specialty_backup SELECT * FROM doctor_specialty;
INSERT INTO doctor_specialty_audit_table_backup SELECT * FROM doctor_specialty_audit_table;
INSERT INTO patient_backup SELECT * FROM patient;
INSERT INTO appointment_backup SELECT * FROM appointment;
INSERT INTO prescription_backup SELECT * FROM prescription;
INSERT INTO test_backup SELECT * FROM test;

