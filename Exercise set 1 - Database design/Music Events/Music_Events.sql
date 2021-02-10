-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Music_Events
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Music_Events
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Music_Events` DEFAULT CHARACTER SET utf8 ;
USE `Music_Events` ;

-- -----------------------------------------------------
-- Table `Music_Events`.`Organizers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Organizers` (
  `organizer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(320) NOT NULL,
  `organizer_name` VARCHAR(45) NOT NULL,
  `web_url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`organizer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_Events`.`Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Artists` (
  `artist_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(320) NOT NULL,
  `price` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_Events`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Addresses` (
  `address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address_1` VARCHAR(45) NOT NULL,
  `address_2` VARCHAR(45) NULL,
  `area` VARCHAR(45) NOT NULL,
  `zip_code` CHAR(10) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_Events`.`Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Events` (
  `event_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `organizer_id` INT UNSIGNED NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  `event_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_Events_Address_idx` (`address_id` ASC) ,
  CONSTRAINT `fk_Events_Address`
    FOREIGN KEY (`address_id`)
    REFERENCES `Music_Events`.`Addresses` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_Events`.`Events_has_Organizers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Events_has_Organizers` (
  `Events_event_id` INT UNSIGNED NOT NULL,
  `Organizers_organizer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Events_event_id`, `Organizers_organizer_id`),
  INDEX `fk_Events_has_Organizers_Organizers1_idx` (`Organizers_organizer_id` ASC) ,
  INDEX `fk_Events_has_Organizers_Events1_idx` (`Events_event_id` ASC) ,
  CONSTRAINT `fk_Events_has_Organizers_Events1`
    FOREIGN KEY (`Events_event_id`)
    REFERENCES `Music_Events`.`Events` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Events_has_Organizers_Organizers1`
    FOREIGN KEY (`Organizers_organizer_id`)
    REFERENCES `Music_Events`.`Organizers` (`organizer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_Events`.`Events_has_Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Events_has_Artists` (
  `Events_event_id` INT UNSIGNED NOT NULL,
  `Artists_artist_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Events_event_id`, `Artists_artist_id`),
  INDEX `fk_Events_has_Artists_Artists1_idx` (`Artists_artist_id` ASC) ,
  INDEX `fk_Events_has_Artists_Events1_idx` (`Events_event_id` ASC) ,
  CONSTRAINT `fk_Events_has_Artists_Events1`
    FOREIGN KEY (`Events_event_id`)
    REFERENCES `Music_Events`.`Events` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Events_has_Artists_Artists1`
    FOREIGN KEY (`Artists_artist_id`)
    REFERENCES `Music_Events`.`Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_Events`.`Ticket_Types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Ticket_Types` (
  `ticket_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `price` BIGINT UNSIGNED NOT NULL,
  `details` TEXT NULL,
  PRIMARY KEY (`ticket_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_Events`.`Tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_Events`.`Tickets` (
  `ticket_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_type_id` INT UNSIGNED NOT NULL,
  `event_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_Tickets_Ticket_Types_idx` (`ticket_type_id` ASC) ,
  INDEX `fk_Tickets_Events_idx` (`event_id` ASC) ,
  CONSTRAINT `fk_Tickets_Ticket_Types`
    FOREIGN KEY (`ticket_type_id`)
    REFERENCES `Music_Events`.`Ticket_Types` (`ticket_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tickets_Events`
    FOREIGN KEY (`event_id`)
    REFERENCES `Music_Events`.`Events` (`event_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
