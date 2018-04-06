-- MySQL Script generated by MySQL Workbench
-- Fri Apr  6 19:51:00 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema d08
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema d08
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `d08` DEFAULT CHARACTER SET latin1 ;
USE `d08` ;

-- -----------------------------------------------------
-- Table `d08`.`maps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d08`.`maps` ;

CREATE TABLE IF NOT EXISTS `d08`.`maps` (
  `x` INT(10) UNSIGNED NOT NULL,
  `y` INT(10) UNSIGNED NOT NULL,
  `object` VARCHAR(20) NOT NULL,
  `object_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`x`, `y`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `d08`.`peoples`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d08`.`peoples` ;

CREATE TABLE IF NOT EXISTS `d08`.`peoples` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `player_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `d08`.`ships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d08`.`ships` ;

CREATE TABLE IF NOT EXISTS `d08`.`ships` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `sizeX` INT(10) UNSIGNED NOT NULL,
  `sizeY` INT(11) NOT NULL,
  `sprit` VARCHAR(45) NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `life` INT(11) NOT NULL,
  `pp` INT(11) NOT NULL,
  `speed` INT(11) NOT NULL,
  `maneuverability` INT(11) NOT NULL,
  `shield` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `d08`.`peoples_has_ships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d08`.`peoples_has_ships` ;

CREATE TABLE IF NOT EXISTS `d08`.`peoples_has_ships` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `peoples_id` INT(10) UNSIGNED NOT NULL,
  `ships_id` INT(10) UNSIGNED NOT NULL,
  `x` INT(11) NOT NULL,
  `y` INT(11) NOT NULL,
  `current_pp` INT(11) NOT NULL,
  `current_life` INT(11) NOT NULL,
  `current_shield` INT(11) NOT NULL,
  `current_rotation` INT(11) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '0',
  `current_active` TINYINT(1) NOT NULL DEFAULT '0',
  `firstturn` TINYINT(1) NOT NULL DEFAULT '0',
  `current_speed` INT(11) NULL DEFAULT NULL,
  `current_maneuverability` INT(11) NULL DEFAULT NULL,
  `step` INT NOT NULL DEFAULT 0,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_peoples_has_ships_ships1_idx` (`ships_id` ASC),
  INDEX `fk_peoples_has_ships_peoples_idx` (`peoples_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_peoples_has_ships_peoples`
    FOREIGN KEY (`peoples_id`)
    REFERENCES `d08`.`peoples` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peoples_has_ships_ships1`
    FOREIGN KEY (`ships_id`)
    REFERENCES `d08`.`ships` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `d08`.`weapons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d08`.`weapons` ;

CREATE TABLE IF NOT EXISTS `d08`.`weapons` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `charge` INT UNSIGNED NOT NULL DEFAULT 0,
  `scope_small` INT UNSIGNED NOT NULL,
  `scope_medium` INT UNSIGNED NOT NULL,
  `scope_big` INT UNSIGNED NOT NULL,
  `motionless` TINYINT(1) NOT NULL,
  `success_small` INT NOT NULL,
  `success_medium` INT NOT NULL,
  `success_big` INT NOT NULL,
  `width_small` DOUBLE NOT NULL,
  `width_medium` DOUBLE NOT NULL,
  `width_big` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `d08`.`peoples_has_ships_has_weapons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `d08`.`peoples_has_ships_has_weapons` ;

CREATE TABLE IF NOT EXISTS `d08`.`peoples_has_ships_has_weapons` (
  `id` INT NOT NULL,
  `peoples_has_ships_id` INT(10) UNSIGNED NOT NULL,
  `weapons_id` INT UNSIGNED NOT NULL,
  `active` TINYINT(1) NOT NULL,
  `current_charge` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_peoples_has_ships_has_weapons_weapons1_idx` (`weapons_id` ASC),
  INDEX `fk_peoples_has_ships_has_weapons_peoples_has_ships1_idx` (`peoples_has_ships_id` ASC),
  CONSTRAINT `fk_peoples_has_ships_has_weapons_peoples_has_ships1`
    FOREIGN KEY (`peoples_has_ships_id`)
    REFERENCES `d08`.`peoples_has_ships` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peoples_has_ships_has_weapons_weapons1`
    FOREIGN KEY (`weapons_id`)
    REFERENCES `d08`.`weapons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
