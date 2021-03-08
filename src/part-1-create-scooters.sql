-- MySQL Script generated by MySQL Workbench
-- Wed Nov 11 02:50:44 2020
-- Model: Sakila Full    Version: 2.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sakila
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NULL,
  `is_borrowing` TINYINT(1) NULL,
  `problematic` TINYINT(1) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_info` (
  `contact_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `home_address` VARCHAR(45) NULL,
  `customer_customer_id` VARCHAR(20) NOT NULL,
  `date_recorded` DATETIME NULL,
  PRIMARY KEY (`contact_id`, `customer_customer_id`),
  INDEX `fk_contact_info_customer1_idx` (`customer_customer_id` ASC),
  CONSTRAINT `fk_contact_info_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`manufacturer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scooter_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scooter_info` (
  `scooter_id` INT NOT NULL AUTO_INCREMENT,
  `scooter_condition` VARCHAR(45) NULL,
  `manufacturer_manufacturer_id` INT NOT NULL,
  `scooter_range` DOUBLE NULL,
  `scooter_weight` INT NULL,
  `model_number` VARCHAR(45) NULL,
  PRIMARY KEY (`scooter_id`, `manufacturer_manufacturer_id`),
  INDEX `fk_scooter_info_manufacturer1_idx` (`manufacturer_manufacturer_id` ASC),
  CONSTRAINT `fk_scooter_info_manufacturer1`
    FOREIGN KEY (`manufacturer_manufacturer_id`)
    REFERENCES `manufacturer` (`manufacturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transaction` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `date_returned` DATETIME NULL,
  `returned_late` TINYINT(1) NULL,
  `return_date` DATETIME NULL,
  `borrow_date` DATETIME NULL,
  `return_damages` VARCHAR(45) NULL,
  `customer_customer_id` VARCHAR(20) NOT NULL,
  `completed` TINYINT(1) NULL,
  `scooter_info_scooter_id` INT NOT NULL,
  `scooter_info_manufacturer_manufacturer_id` INT NOT NULL,
  PRIMARY KEY (`transaction_id`, `customer_customer_id`, `scooter_info_scooter_id`, `scooter_info_manufacturer_manufacturer_id`),
  INDEX `fk_transaction_customer1_idx` (`customer_customer_id` ASC),
  INDEX `fk_transaction_scooter_info1_idx` (`scooter_info_scooter_id` ASC, `scooter_info_manufacturer_manufacturer_id` ASC),
  CONSTRAINT `fk_transaction_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_scooter_info1`
    FOREIGN KEY (`scooter_info_scooter_id` , `scooter_info_manufacturer_manufacturer_id`)
    REFERENCES `scooter_info` (`scooter_id` , `manufacturer_manufacturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `referral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `referral` (
  `referral_id` INT NOT NULL AUTO_INCREMENT,
  `customer_customer_id` VARCHAR(20) NOT NULL,
  `customer_customer_id_referred` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`referral_id`),
  INDEX `fk_referral_customer1_idx` (`customer_customer_id` ASC),
  INDEX `fk_referral_customer2_idx` (`customer_customer_id_referred` ASC),
  CONSTRAINT `fk_referral_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_referral_customer2`
    FOREIGN KEY (`customer_customer_id_referred`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notes` (
  `notes_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_transaction_id` INT NOT NULL,
  `transaction_customer_customer_id` VARCHAR(20) NOT NULL,
  `transaction_scooter_info_scooter_id` INT NOT NULL,
  `transaction_scooter_info_manufacturer_manufacturer_id` INT NOT NULL,
  `category` VARCHAR(45) NULL,
  `note` VARCHAR(45) NULL,
  PRIMARY KEY (`notes_id`),
  INDEX `fk_notes_transaction1_idx` (`transaction_transaction_id` ASC, `transaction_customer_customer_id` ASC, `transaction_scooter_info_scooter_id` ASC, `transaction_scooter_info_manufacturer_manufacturer_id` ASC),
  CONSTRAINT `fk_notes_transaction1`
    FOREIGN KEY (`transaction_transaction_id` , `transaction_customer_customer_id` , `transaction_scooter_info_scooter_id` , `transaction_scooter_info_manufacturer_manufacturer_id`)
    REFERENCES `transaction` (`transaction_id` , `customer_customer_id` , `scooter_info_scooter_id` , `scooter_info_manufacturer_manufacturer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;