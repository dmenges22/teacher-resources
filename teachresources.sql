-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema TeacherDatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TeacherDatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `TeacherDatabase` ;

-- -----------------------------------------------------
-- Table `TeacherDatabase`.`ResourceInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeacherDatabase`.`ResourceInfo` (
  `resourceInfoID` INT NOT NULL AUTO_INCREMENT,
  `nameOfSite` VARCHAR(70) NOT NULL,
  `linkToSite` VARCHAR(100) NULL,
  `pricingModel` VARCHAR(45) NULL,
  `instructionalFramework` VARCHAR(45) NULL,
  `topic` VARCHAR(45) NULL,
  `image` BLOB NULL,
  `altimageurl` VARCHAR(50) NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`resourceInfoID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeacherDatabase`.`SubjectInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeacherDatabase`.`SubjectInfo` (
  `subjectInfoID` INT NULL,
  `gradeLevel` INT NOT NULL,
  `teachingEnvironment` VARCHAR(45) NULL,
  `contentArea` VARCHAR(45) NULL,
  INDEX `subjectInfoID_idx` (`subjectInfoId` ASC),
  CONSTRAINT `subjectInfoID`
    FOREIGN KEY (`subjectInfoId`)
    REFERENCES `TeacherDatabase`.`ResourceInfo` (`resourceInfoID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeacherDatabase`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeacherDatabase`.`Rating` (
  `ratingID` INT NOT NULL,
  `rating` DECIMAL(2,1) NOT NULL,
  `totalScore` INT(10) NULL,
  `divisor` INT(10) NULL,
  INDEX `ratingID_idx` (`ratingID` ASC),
  CONSTRAINT `ratingID`
    FOREIGN KEY (`ratingID`)
    REFERENCES `TeacherDatabase`.`ResourceInfo` (`resourceInfoID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeacherDatabase`.`TeacherComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeacherDatabase`.`TeacherComments` (
  `teacherCommentsID` INT NOT NULL,
  `comment` VARCHAR(100) NULL,
  `teacherName` VARCHAR(45) NULL,
  `teacherGrade` VARCHAR(4) NULL,
  `teacherSubject` VARCHAR(10) NULL,
  INDEX `teacherCommentsID_idx` (`teacherCommentsID` ASC),
  CONSTRAINT `teacherCommentsID`
    FOREIGN KEY (`teacherCommentsID`)
    REFERENCES `TeacherDatabase`.`ResourceInfo` (`resourceInfoID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeacherDatabase`.`Keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TeacherDatabase`.`Keyword` (
  `keywordID` INT NOT NULL,
  `keyword` VARCHAR(45) NULL,
  INDEX `keywordID_idx` (`keywordID` ASC),
  CONSTRAINT `keywordID`
    FOREIGN KEY (`keywordID`)
    REFERENCES `TeacherDatabase`.`ResourceInfo` (`resourceInfoID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
