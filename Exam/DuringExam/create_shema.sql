-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Shop_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Shop_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Shop_1` DEFAULT CHARACTER SET utf8 ;
USE `Shop_1` ;

-- -----------------------------------------------------
-- Table `Shop_1`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_1`.`Categories` (
  `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_1`.`Stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_1`.`Stores` (
  `store_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_name` VARCHAR(255) NOT NULL,
  `city` VARCHAR(50) NULL,
  `street_address` VARCHAR(255) NULL,
  `zip_code` VARCHAR(45) NULL,
  `store_phone` VARCHAR(45) NULL,
  `store_email` VARCHAR(310) NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE INDEX `store_id_UNIQUE` (`store_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_1`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_1`.`Products` (
  `product_id` INT UNSIGNED NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `price` BIGINT NOT NULL,
  `store_id` INT UNSIGNED NOT NULL,
  `quantity` INT NOT NULL DEFAULT 0,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) ,
  INDEX `products_categories_fk_idx` (`category_id` ASC) ,
  INDEX `products_stores_fk_idx` (`store_id` ASC) ,
  CONSTRAINT `products_categories_fk`
    FOREIGN KEY (`category_id`)
    REFERENCES `Shop_1`.`Categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `products_stores_fk`
    FOREIGN KEY (`store_id`)
    REFERENCES `Shop_1`.`Stores` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_1`.`OderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_1`.`OderDetails` (
  `order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) ,
  INDEX `OrderDetails_Products_fk_idx` (`product_id` ASC) ,
  CONSTRAINT `OrderDetails_Products_fk`
    FOREIGN KEY (`product_id`)
    REFERENCES `Shop_1`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_1`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_1`.`Orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `pickup_date` DATETIME NULL,
  `order_date` DATETIME NULL DEFAULT NOW(),
  `is_confirmed` TINYINT NOT NULL DEFAULT 0,
  `Orderscol` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) ,
  CONSTRAINT `orders_order_details`
    FOREIGN KEY (`order_id`)
    REFERENCES `Shop_1`.`OderDetails` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_1`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_1`.`Customers` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `contact_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) ,
  CONSTRAINT `customers_orders_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Shop_1`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_1`.`Contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_1`.`Contacts` (
  `contact_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(20) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `email` VARCHAR(310) NOT NULL,
  `street_address` VARCHAR(255) NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE INDEX `contact_id_UNIQUE` (`contact_id` ASC) ,
  CONSTRAINT `customers_contacts_fk`
    FOREIGN KEY (`contact_id`)
    REFERENCES `Shop_1`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
