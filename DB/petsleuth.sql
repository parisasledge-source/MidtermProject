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
  `id` INT NOT NULL,
  `street` VARCHAR(200) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(10) NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `location_id` INT NOT NULL,
  `active` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `biography` VARCHAR(45) NULL,
  `photo_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_user_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet` ;

CREATE TABLE IF NOT EXISTS `pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `species` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `breed` VARCHAR(45) NULL,
  `description` VARCHAR(500) NULL,
  `user_id` INT NOT NULL,
  `chip` TINYINT NULL,
  `color` VARCHAR(250) NULL,
  `gender` VARCHAR(45) NULL,
  `neutered` TINYINT NULL,
  `age` VARCHAR(50) NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_pet_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT NOT NULL,
  `contact_preference` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `contact_info` VARCHAR(200) NULL,
  `active` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contact_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_contact_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `posting_date` DATETIME NOT NULL,
  `last_seen` DATETIME NULL,
  `description` TEXT NULL,
  `active` TINYINT NOT NULL,
  `reward` VARCHAR(100) NULL,
  `pet_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `contact_id` INT NOT NULL,
  `location_id` INT NULL,
  `finder_id` INT NULL,
  `date_found` DATETIME NULL,
  `rating` INT NULL,
  `rating_comment` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_pet1_idx` (`pet_id` ASC),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  INDEX `fk_post_contact1_idx` (`contact_id` ASC),
  INDEX `fk_post_location1_idx` (`location_id` ASC),
  INDEX `fk_post_user2_idx` (`finder_id` ASC),
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
  CONSTRAINT `fk_post_user2`
    FOREIGN KEY (`finder_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_comment` ;

CREATE TABLE IF NOT EXISTS `post_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  `comment_date` DATETIME NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_comment1_idx` (`in_reply_to_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `post_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet_photo` ;

CREATE TABLE IF NOT EXISTS `pet_photo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photo_url` VARCHAR(2000) NOT NULL,
  `description` VARCHAR(200) NULL,
  `date_added` DATETIME NULL,
  `pet_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_photo_pet1_idx` (`pet_id` ASC),
  CONSTRAINT `fk_pet_photo_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS petsleuth@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'petsleuth'@'localhost' IDENTIFIED BY 'petsleuth';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'petsleuth'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `petsleuthdb`;
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `active`) VALUES (1, 'Skylark Holt', 'Denver', 'CO', '80219', 1);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `active`) VALUES (2, 'Regent Edge', 'Denver', 'CO', '80123', 1);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `active`) VALUES (3, 'Twyford', 'Seattle', 'WA', '98101', 1);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `active`) VALUES (4, 'Ibberson Ave', 'Seattle', 'WA', '98105', 1);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `active`) VALUES (5, 'Hinxworth Road', 'Austin', 'TX', '73301', 1);
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip_code`, `active`) VALUES (6, 'Bacton Road', 'Austin', 'TX', '78660', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `petsleuthdb`;
INSERT INTO `user` (`id`, `username`, `password`, `location_id`, `active`, `role`, `first_name`, `last_name`, `biography`, `photo_url`) VALUES (1, 'admin', 'admin', 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `location_id`, `active`, `role`, `first_name`, `last_name`, `biography`, `photo_url`) VALUES (2, 'jiles', 'jiles', 2, 1, NULL, 'Jae', 'Iles', 'Like to go on walks with my dog.', 'https://images.unsplash.com/photo-1582610285985-a42d9193f2fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fHdvbWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80');
INSERT INTO `user` (`id`, `username`, `password`, `location_id`, `active`, `role`, `first_name`, `last_name`, `biography`, `photo_url`) VALUES (3, 'ccordova', 'ccordova', 3, 1, NULL, 'Coen', 'Cordova', 'Workout junkie', 'https://i.pinimg.com/originals/5c/a8/e7/5ca8e7f5d3ecbe64fe1fb15ce2ee4cc4.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `location_id`, `active`, `role`, `first_name`, `last_name`, `biography`, `photo_url`) VALUES (4, 'csloan', 'csloan', 4, 1, NULL, 'Chester', 'Sloan', 'Young at heart', 'https://i.pinimg.com/564x/a2/65/88/a265880495df7ada87895e004089fd4e--italian-man-tall-man.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `location_id`, `active`, `role`, `first_name`, `last_name`, `biography`, `photo_url`) VALUES (5, 'sstubbs', 'sstubbs', 5, 1, NULL, 'Selina', 'Stubbs', 'Crazy cat lady.', 'http://img.thedailybeast.com/image/upload/v1492791632/articles/2013/01/04/kansas-s-new-cat-law-and-the-craziest-crazy-cat-lady-stories/cat-ladies-fallon-tease_s0gkcp.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `location_id`, `active`, `role`, `first_name`, `last_name`, `biography`, `photo_url`) VALUES (6, 'lshaw', 'lshaw', 6, 1, NULL, 'Lacy', 'Shaw', 'Love my dog.', 'https://i.pinimg.com/originals/67/01/79/670179bf2f640c22b01556a0af74a97a.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `petsleuthdb`;
INSERT INTO `pet` (`id`, `species`, `name`, `breed`, `description`, `user_id`, `chip`, `color`, `gender`, `neutered`, `age`, `active`) VALUES (1, 'Dog', 'Max', 'Beagel', 'Dog likes to bark alot', 2, 1, 'brown/white/black', 'male', 1, 'mid age', 1);
INSERT INTO `pet` (`id`, `species`, `name`, `breed`, `description`, `user_id`, `chip`, `color`, `gender`, `neutered`, `age`, `active`) VALUES (2, 'Cat', 'Atika', 'Sphinx ', 'Thinks its god', 3, 0, 'hairless', 'female', 0, 'elderly ', 1);
INSERT INTO `pet` (`id`, `species`, `name`, `breed`, `description`, `user_id`, `chip`, `color`, `gender`, `neutered`, `age`, `active`) VALUES (3, 'Dog', 'Xeries', 'German Shepard', 'Loves to chase squirrels ', 6, 1, 'black/gold', 'female', 0, 'puppy ', 1);
INSERT INTO `pet` (`id`, `species`, `name`, `breed`, `description`, `user_id`, `chip`, `color`, `gender`, `neutered`, `age`, `active`) VALUES (4, 'Cat', 'Rosalie', 'Siamese', 'Loves to make biscuits ', 5, 1, 'ligh brown/black', 'male', 1, 'kitten ', 1);
INSERT INTO `pet` (`id`, `species`, `name`, `breed`, `description`, `user_id`, `chip`, `color`, `gender`, `neutered`, `age`, `active`) VALUES (5, 'Lizard', 'Gex', 'Iguana', 'Sleeps all day in the sunlight', 4, 0, 'green', '?', 0, '5', 1);
INSERT INTO `pet` (`id`, `species`, `name`, `breed`, `description`, `user_id`, `chip`, `color`, `gender`, `neutered`, `age`, `active`) VALUES (6, 'Fish', 'Tot', 'Goldfish', 'Its a goldfish, whats there to know.', 1, 0, 'orange', '?', 0, '1', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `petsleuthdb`;
INSERT INTO `contact` (`id`, `contact_preference`, `email`, `phone_number`, `user_id`, `contact_info`, `active`) VALUES (2, 'phone', 'jiles@fakemail.com', '303-555-5467', 2, NULL, '1');
INSERT INTO `contact` (`id`, `contact_preference`, `email`, `phone_number`, `user_id`, `contact_info`, `active`) VALUES (3, 'email', 'ccordova@fakemail.com', '206-555-7539', 3, NULL, '1');
INSERT INTO `contact` (`id`, `contact_preference`, `email`, `phone_number`, `user_id`, `contact_info`, `active`) VALUES (4, 'phone', 'csloan@fakemail.com', '206-555-4239', 4, NULL, '1');
INSERT INTO `contact` (`id`, `contact_preference`, `email`, `phone_number`, `user_id`, `contact_info`, `active`) VALUES (1, 'email', 'admin@fakemail.com', '303-555-3278', 1, NULL, '1');
INSERT INTO `contact` (`id`, `contact_preference`, `email`, `phone_number`, `user_id`, `contact_info`, `active`) VALUES (5, 'phone', 'sstubbs@fakemail.com', '512-555-4467', 5, NULL, '1');
INSERT INTO `contact` (`id`, `contact_preference`, `email`, `phone_number`, `user_id`, `contact_info`, `active`) VALUES (6, 'email', 'lshaw@fakemail.com', '512-555-5623', 6, NULL, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `petsleuthdb`;
INSERT INTO `post` (`id`, `posting_date`, `last_seen`, `description`, `active`, `reward`, `pet_id`, `user_id`, `contact_id`, `location_id`, `finder_id`, `date_found`, `rating`, `rating_comment`) VALUES (1, '2022-04-20', '2022-03-30', 'My dog got out of the house and hasn\'t returned', 1, '100', 1, 2, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `post` (`id`, `posting_date`, `last_seen`, `description`, `active`, `reward`, `pet_id`, `user_id`, `contact_id`, `location_id`, `finder_id`, `date_found`, `rating`, `rating_comment`) VALUES (2, '2022-04-15', '2022-03-27', 'Left my screen door open and my cat was no where to be seen', 1, '75', 2, 3, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `post` (`id`, `posting_date`, `last_seen`, `description`, `active`, `reward`, `pet_id`, `user_id`, `contact_id`, `location_id`, `finder_id`, `date_found`, `rating`, `rating_comment`) VALUES (3, '2022-04-10', '2022-03-21', 'Kids were playing outside and left the gate open', 1, '250', 3, 6, 3, 2, NULL, '2022-04-23', NULL, NULL);
INSERT INTO `post` (`id`, `posting_date`, `last_seen`, `description`, `active`, `reward`, `pet_id`, `user_id`, `contact_id`, `location_id`, `finder_id`, `date_found`, `rating`, `rating_comment`) VALUES (4, '2022-04-08', '2022-03-17', 'Usually my cat comes back but hasn\'t. If anyone is holding on to him. He has a home. ', 1, '100', 4, 5, 4, 2, NULL, NULL, NULL, NULL);
INSERT INTO `post` (`id`, `posting_date`, `last_seen`, `description`, `active`, `reward`, `pet_id`, `user_id`, `contact_id`, `location_id`, `finder_id`, `date_found`, `rating`, `rating_comment`) VALUES (5, '2022-04-01', '2022-03-11', 'Lizard broke out of his cage', 1, '25', 5, 4, 5, 3, NULL, '2022-04-21', NULL, NULL);
INSERT INTO `post` (`id`, `posting_date`, `last_seen`, `description`, `active`, `reward`, `pet_id`, `user_id`, `contact_id`, `location_id`, `finder_id`, `date_found`, `rating`, `rating_comment`) VALUES (6, '2022-03-30', '2022-03-07', 'Fish jumped out of his bowl so he couldn\'t of gotten far.', 1, 'high five', 6, 1, 6, 3, NULL, '2022-04-20', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `petsleuthdb`;
INSERT INTO `post_comment` (`id`, `content`, `user_id`, `post_id`, `comment_date`, `in_reply_to_id`) VALUES (1, 'Think I saw you dog down the road', 2, 1, '2022-04-22', NULL);
INSERT INTO `post_comment` (`id`, `content`, `user_id`, `post_id`, `comment_date`, `in_reply_to_id`) VALUES (2, 'I saw Atika hanging out on someones patio.', 4, 2, '2022-04-17', NULL);
INSERT INTO `post_comment` (`id`, `content`, `user_id`, `post_id`, `comment_date`, `in_reply_to_id`) VALUES (3, 'Saw Rosalie making biscuits thorugh your neighbors window', 6, 4, '2022-04-10', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_photo`
-- -----------------------------------------------------
START TRANSACTION;
USE `petsleuthdb`;
INSERT INTO `pet_photo` (`id`, `photo_url`, `description`, `date_added`, `pet_id`) VALUES (1, 'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2016/06/24151048/Beagle-standing-in-a-frosty-field-on-a-cold-morning.jpg', 'beagel', '2022-04-20', 1);
INSERT INTO `pet_photo` (`id`, `photo_url`, `description`, `date_added`, `pet_id`) VALUES (2, 'https://images.immediate.co.uk/production/volatile/sites/4/2020/05/GettyImages-696252463-c-034e516.jpg?quality=90&resize=768,574', 'sphinx', '2022-03-17', 2);
INSERT INTO `pet_photo` (`id`, `photo_url`, `description`, `date_added`, `pet_id`) VALUES (3, 'https://www.google.com/search?q=german+shepherd+puppy&tbm=isch&ved=2ahUKEwiNrtLzsqv3AhWLX80KHbPqAAIQ2-cCegQIABAA&oq=german+shepherd+puppy&gs_lcp=CgNpbWcQAzIHCAAQsQMQQzIHCAAQsQMQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEOgcIIxDvAxAnOggIABCABBCxAzoECAAQQzoKCAAQsQMQgwEQQzoLCAAQgAQQsQMQgwFQtA9YxxxghR9oAHAAeACAAT2IAekCkgEBN5gBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=rpNkYo2fK4u_tQaz1YMQ&bih=1103&biw=1087&rlz=1C5CHFA_enUS990US990#imgrc=j-gOsn5bbfqT-M', 'german shepard', '2022-04-02', 3);
INSERT INTO `pet_photo` (`id`, `photo_url`, `description`, `date_added`, `pet_id`) VALUES (4, 'https://nationaltoday.com/wp-content/uploads/2019/04/national-siamese-cat-day-640x514.jpg', 'siamese ', '2022-02-14', 4);
INSERT INTO `pet_photo` (`id`, `photo_url`, `description`, `date_added`, `pet_id`) VALUES (5, 'https://www.thoughtco.com/thmb/jJcmtfmXfZcpYdQ61upD8WdHa0c=/1000x1000/smart/filters:no_upscale()/iguana2-b554e81fc1834989a715b69d1eb18695.jpg', 'iguana', '2022-03-23', 5);
INSERT INTO `pet_photo` (`id`, `photo_url`, `description`, `date_added`, `pet_id`) VALUES (6, 'https://www.petmd.com/sites/default/files/styles/article_image/public/goldfish-swimmingtoward_285011336_0.jpg?itok=ZZaLxiFQ', 'goldfish', '2022-04-01', 6);

COMMIT;

