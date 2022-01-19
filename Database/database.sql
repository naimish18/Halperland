
-- user table

CREATE TABLE `helperland_db`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_type` CHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`));

-- customer table

CREATE TABLE `helperland_db`.`customer` (
  `c_id` INT NOT NULL,
  `c_fname` CHAR(45) NOT NULL,
  `c_lname` CHAR(45) NOT NULL,
  `d_o_b` DATE NOT NULL,
  `mobile_number` INT NOT NULL,
  PRIMARY KEY (`c_id`));

-- service provider table

CREATE TABLE `helperland_db`.`service_provideer` (
  `sp_id` INT NOT NULL,
  `sp_fname` CHAR(45) NOT NULL,
  `sp_lname` CHAR(45) NOT NULL,
  `phone_number` INT NOT NULL,
  `d_o_b` DATE NOT NULL,
  `gender` CHAR(20) NOT NULL,
  `profile` BLOB NULL,
  `rating` FLOAT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`sp_id`));

-- address table

CREATE TABLE `helperland_db`.`address` (
  `a_id` INT NOT NULL AUTO_INCREMENT,
  `u_id` INT NOT NULL,
  `street_name` VARCHAR(45) NOT NULL,
  `house_number` INT NOT NULL,
  `postal_code` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `phone_number` INT NOT NULL,
  PRIMARY KEY (`a_id`));

-- service table

CREATE TABLE `helperland_db`.`service` (
  `service_id` INT NOT NULL AUTO_INCREMENT,
  `service_date` DATE NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `extra_services` VARCHAR(45) NULL,
  `status` CHAR(20) NOT NULL,
  `amount` FLOAT NOT NULL,
  `payment_status` CHAR(20) NOT NULL,
  `c_id` INT NOT NULL,
  `sp_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `pet_status` TINYINT NOT NULL,
  `comments` VARCHAR(8000) NULL,
  `promo_code` VARCHAR(45) NULL,
  PRIMARY KEY (`service_id`));

-- ratings table

CREATE TABLE `helperland_db`.`ratings` (
  `c_id` INT NOT NULL,
  `sp_id` INT NOT NULL,
  `service_id` INT NOT NULL,
  `ratings` FLOAT NULL,
  `feedback` VARCHAR(8000) NULL);

-- block customer table

CREATE TABLE `helperland_db`.`block_customer` (
  `sp_id` INT NOT NULL,
  `c_id` INT NOT NULL);
