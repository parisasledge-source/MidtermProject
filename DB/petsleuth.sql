-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema petsleuthdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `petsleuthdb` ;

-- -----------------------------------------------------
-- Schema petsleuthdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petsleuthdb` DEFAULT CHARACTER SET utf8 ;
USE `petsleuthdb` ;

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT(11) NOT NULL,
  `street` VARCHAR(200) NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(10) NULL DEFAULT NULL,
  `active` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `location_id` INT(11) NOT NULL,
  `active` TINYINT(4) NOT NULL,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `biography` VARCHAR(45) NULL DEFAULT NULL,
  `photo_url` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_user_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_preference` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `contact_info` VARCHAR(200) NULL DEFAULT NULL,
  `active` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contact_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_contact_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet` ;

CREATE TABLE IF NOT EXISTS `pet` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `species` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `breed` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `chip` TINYINT(4) NULL DEFAULT NULL,
  `color` VARCHAR(250) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `neutered` TINYINT(4) NULL DEFAULT NULL,
  `age` VARCHAR(50) NULL DEFAULT NULL,
  `active` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_pet_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pet_photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet_photo` ;

CREATE TABLE IF NOT EXISTS `pet_photo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `photo_url` VARCHAR(2000) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `date_added` DATETIME NULL DEFAULT NULL,
  `pet_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_photo_pet1_idx` (`pet_id` ASC),
  CONSTRAINT `fk_pet_photo_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `posting_date` DATETIME NOT NULL,
  `last_seen` DATETIME NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `active` TINYINT(4) NOT NULL,
  `reward` VARCHAR(100) NULL DEFAULT NULL,
  `pet_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `contact_id` INT(11) NOT NULL,
  `location_id` INT(11) NULL DEFAULT NULL,
  `finder_id` INT(11) NULL DEFAULT NULL,
  `date_found` DATETIME NULL DEFAULT NULL,
  `rating` INT(11) NULL DEFAULT NULL,
  `rating_comment` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_pet1_idx` (`pet_id` ASC),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  INDEX `fk_post_contact1_idx` (`contact_id` ASC),
  INDEX `fk_post_location1_idx` (`location_id` ASC),
  INDEX `fk_post_user2_idx` (`finder_id` ASC),
  CONSTRAINT `fk_post_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_user2`
    FOREIGN KEY (`finder_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_comment` ;

CREATE TABLE IF NOT EXISTS `post_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `post_id` INT(11) NOT NULL,
  `comment_date` DATETIME NULL DEFAULT NULL,
  `in_reply_to_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_comment1_idx` (`in_reply_to_id` ASC),
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `post_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE = '';
DROP USER IF EXISTS petsleuth@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'petsleuth'@'localhost' IDENTIFIED BY 'petsleuth';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'petsleuth'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
