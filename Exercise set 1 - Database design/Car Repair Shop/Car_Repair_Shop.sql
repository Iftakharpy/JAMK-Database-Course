-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Car_Repair_Shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Car_Repair_Shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Car_Repair_Shop` DEFAULT CHARACTER SET utf8 ;
USE `Car_Repair_Shop` ;

-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Genders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Genders` (
  `gender_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Persons` (
  `person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NULL,
  `age` TINYINT UNSIGNED NOT NULL,
  `gender_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `fk_persons_gender_id`
    FOREIGN KEY (`gender_id`)
    REFERENCES `Car_Repair_Shop`.`Genders` (`gender_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_persons_gender_id_idx` ON `Car_Repair_Shop`.`Persons` (`gender_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Addresses` (
  `address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address_as_text` TEXT NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  `country` VARCHAR(20) NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Contacts` (
  `contact_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(320) NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Persons_has_Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Persons_has_Addresses` (
  `Persons_person_id` INT UNSIGNED NOT NULL,
  `Addresses_address_id` INT UNSIGNED NOT NULL,
  CONSTRAINT `fk_Persons_has_Addresses_Persons1`
    FOREIGN KEY (`Persons_person_id`)
    REFERENCES `Car_Repair_Shop`.`Persons` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Persons_has_Addresses_Addresses1`
    FOREIGN KEY (`Addresses_address_id`)
    REFERENCES `Car_Repair_Shop`.`Addresses` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Persons_has_Addresses_Addresses1_idx` ON `Car_Repair_Shop`.`Persons_has_Addresses` (`Addresses_address_id` ASC) ;

CREATE INDEX `fk_Persons_has_Addresses_Persons1_idx` ON `Car_Repair_Shop`.`Persons_has_Addresses` (`Persons_person_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Persons_has_Contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Persons_has_Contacts` (
  `Persons_person_id` INT UNSIGNED NOT NULL,
  `Contacts_contact_id` INT UNSIGNED NOT NULL,
  CONSTRAINT `fk_Persons_has_Contacts_Persons1`
    FOREIGN KEY (`Persons_person_id`)
    REFERENCES `Car_Repair_Shop`.`Persons` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Persons_has_Contacts_Contacts1`
    FOREIGN KEY (`Contacts_contact_id`)
    REFERENCES `Car_Repair_Shop`.`Contacts` (`contact_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Persons_has_Contacts_Contacts1_idx` ON `Car_Repair_Shop`.`Persons_has_Contacts` (`Contacts_contact_id` ASC) ;

CREATE INDEX `fk_Persons_has_Contacts_Persons1_idx` ON `Car_Repair_Shop`.`Persons_has_Contacts` (`Persons_person_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Roles` (
  `role_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Offices` (
  `office_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `office_name` VARCHAR(45) NULL,
  `manager` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`office_id`, `manager`),
  CONSTRAINT `fk_Offices_Employees1`
    FOREIGN KEY (`manager`)
    REFERENCES `Car_Repair_Shop`.`Employees` (`employee_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Offices_Employees1_idx` ON `Car_Repair_Shop`.`Offices` (`manager` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Employees` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` INT UNSIGNED NOT NULL,
  `salary` INT UNSIGNED NOT NULL,
  `role_id` TINYINT UNSIGNED NOT NULL,
  `office_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_Employees_Persons1`
    FOREIGN KEY (`person_id`)
    REFERENCES `Car_Repair_Shop`.`Persons` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employees_Roles1`
    FOREIGN KEY (`role_id`)
    REFERENCES `Car_Repair_Shop`.`Roles` (`role_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Employees_Offices1`
    FOREIGN KEY (`office_id`)
    REFERENCES `Car_Repair_Shop`.`Offices` (`office_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Employees_Roles1_idx` ON `Car_Repair_Shop`.`Employees` (`role_id` ASC) ;

CREATE INDEX `fk_Employees_Offices1_idx` ON `Car_Repair_Shop`.`Employees` (`office_id` ASC) ;

CREATE INDEX `fk_Employees_Persons1_idx` ON `Car_Repair_Shop`.`Employees` (`person_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Offices_has_Contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Offices_has_Contacts` (
  `Offices_office_id` INT UNSIGNED NOT NULL,
  `Contacts_contact_id` INT UNSIGNED NOT NULL,
  CONSTRAINT `fk_Offices_has_Contacts_Offices1`
    FOREIGN KEY (`Offices_office_id`)
    REFERENCES `Car_Repair_Shop`.`Offices` (`office_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Offices_has_Contacts_Contacts1`
    FOREIGN KEY (`Contacts_contact_id`)
    REFERENCES `Car_Repair_Shop`.`Contacts` (`contact_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Offices_has_Contacts_Contacts1_idx` ON `Car_Repair_Shop`.`Offices_has_Contacts` (`Contacts_contact_id` ASC) ;

CREATE INDEX `fk_Offices_has_Contacts_Offices1_idx` ON `Car_Repair_Shop`.`Offices_has_Contacts` (`Offices_office_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Offices_has_Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Offices_has_Addresses` (
  `Offices_office_id` INT UNSIGNED NOT NULL,
  `Addresses_address_id` INT UNSIGNED NOT NULL,
  CONSTRAINT `fk_Offices_has_Addresses_Offices1`
    FOREIGN KEY (`Offices_office_id`)
    REFERENCES `Car_Repair_Shop`.`Offices` (`office_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Offices_has_Addresses_Addresses1`
    FOREIGN KEY (`Addresses_address_id`)
    REFERENCES `Car_Repair_Shop`.`Addresses` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Offices_has_Addresses_Addresses1_idx` ON `Car_Repair_Shop`.`Offices_has_Addresses` (`Addresses_address_id` ASC) ;

CREATE INDEX `fk_Offices_has_Addresses_Offices1_idx` ON `Car_Repair_Shop`.`Offices_has_Addresses` (`Offices_office_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Customers` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` INT UNSIGNED NOT NULL,
  `customer_type` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`, `person_id`),
  CONSTRAINT `fk_Customers_Persons1`
    FOREIGN KEY (`person_id`)
    REFERENCES `Car_Repair_Shop`.`Persons` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Customers_Persons1_idx` ON `Car_Repair_Shop`.`Customers` (`person_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Services` (
  `service_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `details` TEXT NULL,
  `price` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Item_Types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Item_Types` (
  `type_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Items` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  `type_id` TINYINT UNSIGNED NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  `available_quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `fk_Items_Item_Types1`
    FOREIGN KEY (`type_id`)
    REFERENCES `Car_Repair_Shop`.`Item_Types` (`type_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Items_Item_Types1_idx` ON `Car_Repair_Shop`.`Items` (`type_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Services_Requires_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Services_Requires_Items` (
  `Services_service_id` INT UNSIGNED NOT NULL,
  `Items_item_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Services_service_id`, `Items_item_id`),
  CONSTRAINT `fk_Services_has_Items_Services1`
    FOREIGN KEY (`Services_service_id`)
    REFERENCES `Car_Repair_Shop`.`Services` (`service_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Services_has_Items_Items1`
    FOREIGN KEY (`Items_item_id`)
    REFERENCES `Car_Repair_Shop`.`Items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Services_has_Items_Items1_idx` ON `Car_Repair_Shop`.`Services_Requires_Items` (`Items_item_id` ASC) ;

CREATE INDEX `fk_Services_has_Items_Services1_idx` ON `Car_Repair_Shop`.`Services_Requires_Items` (`Services_service_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Appointments` (
  `appointment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `service_id` INT UNSIGNED NULL,
  PRIMARY KEY (`appointment_id`),
  CONSTRAINT `fk_Appointments_Services1`
    FOREIGN KEY (`service_id`)
    REFERENCES `Car_Repair_Shop`.`Services` (`service_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Appointments_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Car_Repair_Shop`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Appointments_Services1_idx` ON `Car_Repair_Shop`.`Appointments` (`service_id` ASC) ;

CREATE INDEX `fk_Appointments_Customer1_idx` ON `Car_Repair_Shop`.`Appointments` (`customer_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Operations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Operations` (
  `operation_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `car_registration_number` VARCHAR(45) NOT NULL,
  `employee_id` INT UNSIGNED NOT NULL,
  `problems` TEXT NULL,
  `service_description` TEXT NULL,
  `notes` TEXT NULL,
  `receive_datetime` DATETIME NOT NULL DEFAULT NOW(),
  `estimated_delivery_date` DATE NULL,
  PRIMARY KEY (`operation_id`),
  CONSTRAINT `fk_Operations_Customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Car_Repair_Shop`.`Customers` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Operations_Employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Car_Repair_Shop`.`Employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Operations_Customers1_idx` ON `Car_Repair_Shop`.`Operations` (`customer_id` ASC) ;

CREATE INDEX `fk_Operations_Employees1_idx` ON `Car_Repair_Shop`.`Operations` (`employee_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Operations_Needed_Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Operations_Needed_Services` (
  `Operations_operation_id` INT UNSIGNED NOT NULL,
  `Services_service_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Services_service_id`, `Operations_operation_id`),
  CONSTRAINT `fk_Operations_has_Services_Operations1`
    FOREIGN KEY (`Operations_operation_id`)
    REFERENCES `Car_Repair_Shop`.`Operations` (`operation_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Operations_has_Services_Services1`
    FOREIGN KEY (`Services_service_id`)
    REFERENCES `Car_Repair_Shop`.`Services` (`service_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Operations_has_Services_Services1_idx` ON `Car_Repair_Shop`.`Operations_Needed_Services` (`Services_service_id` ASC) ;

CREATE INDEX `fk_Operations_has_Services_Operations1_idx` ON `Car_Repair_Shop`.`Operations_Needed_Services` (`Operations_operation_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Operations_Needed_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Operations_Needed_Items` (
  `Operations_operation_id` INT UNSIGNED NOT NULL,
  `Items_item_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Operations_operation_id`, `Items_item_id`),
  CONSTRAINT `fk_Operations_has_Items_Operations1`
    FOREIGN KEY (`Operations_operation_id`)
    REFERENCES `Car_Repair_Shop`.`Operations` (`operation_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Operations_has_Items_Items1`
    FOREIGN KEY (`Items_item_id`)
    REFERENCES `Car_Repair_Shop`.`Items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Operations_has_Items_Items1_idx` ON `Car_Repair_Shop`.`Operations_Needed_Items` (`Items_item_id` ASC) ;

CREATE INDEX `fk_Operations_has_Items_Operations1_idx` ON `Car_Repair_Shop`.`Operations_Needed_Items` (`Operations_operation_id` ASC) ;


-- -----------------------------------------------------
-- Table `Car_Repair_Shop`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Car_Repair_Shop`.`Invoices` (
  `invoice_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `operation_id` INT UNSIGNED NOT NULL,
  `total_price` BIGINT UNSIGNED NOT NULL,
  `delivery_datetime` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`invoice_id`, `operation_id`),
  CONSTRAINT `fk_Invoices_Operations1`
    FOREIGN KEY (`operation_id`)
    REFERENCES `Car_Repair_Shop`.`Operations` (`operation_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Invoices_Operations1_idx` ON `Car_Repair_Shop`.`Invoices` (`operation_id` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
